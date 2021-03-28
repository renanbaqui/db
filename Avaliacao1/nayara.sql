
-- -------------------------------------------------------------------------
-- Funcao que calcula o tempo total de duracao de um chamado
-- -------------------------------------------------------------------------

CREATE FUNCTION calcula_tempo(x TIMESTAMP, y TIMESTAMP, OUT diferenca TEXT)
AS $$
BEGIN
diferenca := x - y;
END;
$$ LANGUAGE plpgsql;


select chamado, calcula_tempo(finalchamado, iniciochamado) from chamados;

-- -------------------------------------------------------------------------
-- View que retorna os chamados com status 0
-- -------------------------------------------------------------------------

CREATE OR REPLACE VIEW v_status
AS
(SELECT chamado, status FROM chamados
WHERE status = '0'
ORDER BY chamado);


SELECT * FROM v_status;

-- -------------------------------------------------------------------------
-- View que retorna a qtde de chamados abertos por usuário
-- -------------------------------------------------------------------------

CREATE OR REPLACE VIEW qtde_chamados_abertos
AS
(SELECT telegramid id, name nome, COUNT(*)qtde_chamados
 FROM usuarios INNER JOIN chamados
   ON telegramid = abertopor
GROUP BY telegramid, name);


SELECT * FROM qtde_chamados_abertos;

-- -------------------------------------------------------------------------
-- View que retorna a qtde de chamados fechados por usuário
-- -------------------------------------------------------------------------

CREATE OR REPLACE VIEW qtde_chamados_fechados
AS
(SELECT telegramid id, name nome, COUNT(*)qtde_fechados
 FROM usuarios INNER JOIN chamados
   ON telegramid = fechadopor
GROUP BY telegramid, name);


SELECT * FROM qtde_chamados_fechados;


-- -------------------------------------------------------------------------
-- Listar o nome da operadora, telefone, função (nome) e email com todas as 
-- designações dos contatos da operadora TIM
-- -------------------------------------------------------------------------
CREATE OR REPLACE VIEW listarTIM
AS
(
SELECT 
  contato.operadora, 
  contato.telefone, 
  contato.nome, 
  contato.email, 
  circuitos.designacao 
FROM 
  contato

INNER JOIN 
  circuitos 
  ON contato.operadora = 'TIM'
ORDER BY email
);
SELECT * FROM listarTIM;





(problema com a procedure...)
-- -------------------------------------------------------------------------------
-- PROCEDURE QUE ATUALIZA A TABELA aux_chamados COM A QTDE DE CHAMADOS POR REGIÃO
-- -------------------------------------------------------------------------------

--CREATE TABLE aux_chamados(regiao VARCHAR(3), total VARCHAR(10));
DROP FUNCTION qtde_chamados;

CREATE OR REPLACE FUNCTION qtde_chamados(TEXT, INT)
RETURNS VOID AS $$
DECLARE regiao TEXT; total INT;
BEGIN

DELETE FROM aux_chamados;

INSERT INTO aux_chamados(
SELECT SUBSTRING(designacao,1,3), COUNT(*)
FROM chamados
GROUP BY SUBSTRING(designacao,1,3)
ORDER BY 2 DESC);

END;
$$ LANGUAGE plpgsql;

--SELECT * FROM aux_chamados; --não está inserindo na tabela.




-- -------------------------------------------------------------------------
-- Funcao que, utilizando cursor, soma os tempos (em minutos) de duracao de 
-- todos os chamados disponíveis
-- -------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION soma()
RETURNS numeric AS $$
DECLARE
	cursor_soma CURSOR FOR
		SELECT chamado_tempo FROM chamados;
	tempo NUMERIC;
	resultado NUMERIC;	
BEGIN
	resultado := 0;
	OPEN cursor_soma;
	LOOP
		FETCH NEXT FROM cursor_soma
			INTO tempo;
		EXIT WHEN NOT FOUND;
		resultado := resultado + tempo;
	END LOOP;
	CLOSE cursor_soma;
	RETURN resultado;
END;
$$ LANGUAGE plpgsql;
SELECT soma();
SELECT * FROM soma();