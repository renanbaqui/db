listar todos os clientes titulares de RJ e SP, ordenados por nome

CREATE OR REPLACE VIEW visao1
AS
(
SELECT nome FROM cliente
WHERE (uf = 'SP')
OR (uf = 'RJ')
OR (usuario_titular = NULL)
ORDER BY nome
);
SELECT * FROM visao1;

listar todos os emails dos contatos nivel 1, ordenados por operadora

CREATE OR REPLACE VIEW visao2
AS
(
SELECT operadora, telefone, nome, email, nivel FROM contato
WHERE (nivel = '1')
ORDER BY operadora
);
SELECT * FROM visao2;

listar todos os nomes, endereços e cidades dos clientes de MG, ordenados por nome

CREATE OR REPLACE VIEW visao3
AS
(
SELECT nome, endereco, cidade FROM cliente
WHERE (uf = 'MG')
ORDER BY cidade
);
SELECT * FROM visao3;

listar a operadora, telefone, função (nome) e email com todas as designações da operadora TIM
CREATE OR REPLACE VIEW visao4
AS
(
SELECT 
  contato.operadora, 
  contato.telefone, 
  contato.nome, 
  contato.email, 
  circuitos.designacao 
FROM 
  contato

INNER JOIN 
  circuitos 
  ON contato.operadora = 'TIM'
--WHERE contato.nome IS NULL;
ORDER BY email
);
SELECT * FROM visao4;


-- -------------------------------------------------------------------------
-- Listar o nome da operadora, telefone, função (nome) e email com todas as 
-- designações dos contatos da operadora TIM
-- -------------------------------------------------------------------------
CREATE OR REPLACE VIEW listarTIM
AS
(
SELECT 
  contato.operadora, 
  contato.telefone, 
  contato.nome, 
  contato.email, 
  circuitos.designacao 
FROM 
  contato

INNER JOIN 
  circuitos 
  ON contato.operadora = 'TIM'
ORDER BY email
);
SELECT * FROM listarTIM;