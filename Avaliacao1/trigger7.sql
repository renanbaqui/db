-- ------------------------------------------------------------------------------------------------
-- TRIGGER QUE SALVA EM UMA TABELA AUXILIAR, CADA REGISTRO EXCLUIDO DA TABELA LOCALIDADES
-- ------------------------------------------------------------------------------------------------

--DROP TABLE bk_localidades;
CREATE TABLE bk_localidades (id INT, praca VARCHAR(10), endereco VARCHAR(140), apelido VARCHAR(45));

-- -------------------------
-- CRIACAO DA FUNCAO
-- -------------------------

CREATE OR REPLACE FUNCTION salvainsert()
RETURNS TRIGGER AS $$

BEGIN

INSERT INTO bk_localidades VALUES (OLD.id, OLD.praca, OLD.endereco, OLD.apelido);
RETURN OLD;

END; 
$$ LANGUAGE plpgsql;

-- -------------------------
-- CRIACAO DA TRIGGER
-- -------------------------

--DROP TRIGGER insert_cliente ON localidades;

CREATE TRIGGER insert_cliente
BEFORE DELETE
ON localidades
FOR EACH ROW
EXECUTE PROCEDURE salvainsert();

-- ----------------------------
-- INSERT NA TABELA LOCALIDADES
-- ----------------------------

INSERT INTO localidades (praca, endereco, apelido) VALUES ('SPO','Rua Sao Francisco, 600','SF600');

-- -------------------------
-- VERIFICACAO
-- -------------------------

SELECT * FROM bk_localidades;
SELECT * FROM localidades;



