-- -------------------------------------------------------------------------
-- Índice para a coluna "abertoPor" da tabela "chamados", que utiliza a
-- ténica hash.
-- -------------------------------------------------------------------------

CREATE INDEX indiceChamados on chamados USING hash (abertoPor)


-- -------------------------------------------------------------------------
-- Índice para a coluna "operadora" da tabela "circuitos", que utiliza a
-- ténica hash.
-- -------------------------------------------------------------------------

CREATE INDEX indiceCircuitos on circuitos USING hash (operadora)



CREATE OR REPLACE VIEW visao1
AS
(
SELECT abertoPor, indice, designacao, iniciochamado FROM chamados
	WHERE (abertoPor = '582049501')
ORDER BY designacao
);
SELECT * FROM visao1;

