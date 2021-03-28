CREATE OR REPLACE VIEW visao1
AS
(
SELECT abertoPor, indice, designacao, iniciochamado FROM chamados
WHERE (abertoPor = '582049501')
ORDER BY designacao
);
SELECT * FROM visao1;



listar todos os clientes titulares de RJ e SP, ordenados por nome

CREATE OR REPLACE VIEW visao1
AS
(
SELECT abertoPor FROM chamados
WHERE (abertoPor = 582049501)
ORDER BY designacao
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