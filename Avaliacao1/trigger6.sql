-- -------------------------------------------------------------------------
-- Trigger que é ativado quando é inserida uma tupla ou atualizada a tabela 
-- localidades: cria uma nova tupla em circuitos, que vem pré-preenchida
-- -------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION avaliacao1.fc_adiciona_circuito2()

RETURNS trigger AS $$
BEGIN
	INSERT INTO avaliacao1.circuitos (operadora, designacao, nome, mnemonico, 
		ponta_a, ponta_b)
	VALUES ('Adicionar Operadora', 'XXXXXXXXX00000', 'Adicionar Novo Nome', 
		'XXX0', 99, 99);
	RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nova_localidade AFTER INSERT OR UPDATE
ON avaliacao1.localidades
	FOR EACH ROW EXECUTE PROCEDURE avaliacao1.fc_adiciona_circuito2();	
