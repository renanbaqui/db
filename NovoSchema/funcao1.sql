-- -------------------------------------------------------------------------
-- Funcao que calcula o tempo total de duracao de um chamado
-- -------------------------------------------------------------------------

CREATE FUNCTION calcula_tempo(x TIMESTAMP, y TIMESTAMP, OUT diferenca TEXT)
AS $$
BEGIN
diferenca := x - y;
END;
$$ LANGUAGE plpgsql;


select chamado, calcula_tempo(finalchamado, iniciochamado) from avaliacao1.chamados;