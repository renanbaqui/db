-- -------------------------------------------------------------------------
-- Trigger que é ativado quando é inserida uma tupla ou atualizada a tabela 
-- operadoras: cria uma nova tupla em contato, que vem pré-preenchida
-- -------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fc_adiciona_contato()

RETURNS trigger AS $$
BEGIN
	INSERT INTO contato (id, operadora, telefone, nome, email, nivel)
	VALUES (99, 'Adicionar Nova Operadora', 99999999, 'Adicionar Nome', 
	'email@dominio.com', 1);
	RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nova_operadora2 AFTER INSERT OR UPDATE
ON operadoras
	FOR EACH ROW EXECUTE PROCEDURE fc_adiciona_contato();
	
	