-- -------------------------------------------------------------------------
-- Índice para a coluna "abertoPor" da tabela "chamados", que utiliza a
-- técnica hash.
-- -------------------------------------------------------------------------

CREATE INDEX indiceChamados on avaliacao1.chamados USING hash (abertoPor)


-- -------------------------------------------------------------------------
-- Visão para verificação e testes do índice
-- -------------------------------------------------------------------------

CREATE OR REPLACE VIEW visao
AS
(
SELECT abertoPor, indice, designacao, iniciochamado FROM avaliacao1.chamados
	WHERE (abertoPor = '582049501')
ORDER BY designacao
);
SELECT * FROM visao;