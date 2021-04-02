-- criei a coluna chamado_tempo na tabela chamados e coloquei valores
-- fazer cursor com duas colunas ao mesmo tempo é problemático
-- -------------------------------------------------------------------------
-- Funcao utilizando cursor que soma os tempos de duracao de chamados
-- -------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION avaliacao1.soma()
RETURNS numeric AS $$
DECLARE
	cursor_soma CURSOR FOR
		SELECT chamado_tempo FROM avaliacao1.chamados;
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
SELECT avaliacao1.soma();
SELECT * FROM avaliacao1.soma();