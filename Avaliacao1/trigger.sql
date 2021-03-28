CREATE OR REPLACE FUNCTION fc_adiciona_operadora()
RETURNS trigger AS $$
BEGIN
	INSERT INTO circuitos (operadora, designacao, nome, mnemonico, ponta_a, ponta_b)
	VALUES ('Adicionar Nova Operadora', 'XXXXXXXXX00000', 'Adicionar Novo Nome', 'XXX0', 99, 99);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nova_operadora AFTER INSERT OR UPDATE
ON operadoras
	FOR EACH ROW EXECUTE PROCEDURE fc_adiciona_operadora();