-- -------------------------------------------------------
-- View que retorna a qtde de chamados abertos por usuário
-- -------------------------------------------------------
CREATE OR REPLACE VIEW avaliacao1.qtde_chamados_abertos
AS
(SELECT telegramid id, name nome, COUNT(*)qtde_chamados
 FROM avaliacao1.usuarios INNER JOIN avaliacao1.chamados
   ON telegramid = abertopor
GROUP BY telegramid, name);


SELECT * FROM avaliacao1.qtde_chamados_abertos;
