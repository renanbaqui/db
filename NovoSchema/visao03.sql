-- --------------------------------------------------------
-- View que retorna a qtde de chamados fechados por usuário
-- --------------------------------------------------------

CREATE OR REPLACE VIEW avaliacao1.qtde_chamados_fechados
AS
(SELECT telegramid id, name nome, COUNT(*)qtde_fechados
 FROM avaliacao1.usuarios INNER JOIN avaliacao1.chamados
   ON telegramid = fechadopor
GROUP BY telegramid, name);


SELECT * FROM avaliacao1.qtde_chamados_fechados;
