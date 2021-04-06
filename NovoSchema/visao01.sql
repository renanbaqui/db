-- -------------------------------------------
-- View que retorna os chamados com status 0
-- -------------------------------------------
CREATE OR REPLACE VIEW avaliacao1.v_status
AS
(SELECT chamado, status FROM avaliacao1.chamados
WHERE status = '0'
ORDER BY chamado);

SELECT * FROM avaliacao1.v_status;