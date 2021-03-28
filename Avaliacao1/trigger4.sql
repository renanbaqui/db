-- -------------------------------------------------------------------------
-- Trigger que é ativado quando é inserida uma tupla ou atualizada a tabela 
-- operadoras: cria uma nova tupla em circuitos, que vem pré-preenchida
-- -------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fc_adiciona_circuito()

RETURNS trigger AS $$
BEGIN
	INSERT INTO circuitos (operadora, designacao, nome, mnemonico, 
		ponta_a, ponta_b)
	VALUES ('Adicionar Nova Operadora', 'XXXXXXXXX00000', 'Adicionar Novo Nome', 
		'XXX0', 99, 99);
	RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nova_operadora AFTER INSERT OR UPDATE
ON operadoras
	FOR EACH ROW EXECUTE PROCEDURE fc_adiciona_circuito();
	
	
	
	