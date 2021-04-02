-- SQLINES DEMO *** ------------------------------------
-- Table `avaliacao1.usuarios`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS avaliacao1.usuarios ;

CREATE TABLE IF NOT EXISTS avaliacao1.usuarios (
  telegramId VARCHAR(45) NOT NULL,
  name VARCHAR(45) NOT NULL,
  telegram_user VARCHAR(45) NOT NULL,
  password VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (telegramId),
  CONSTRAINT telegramId_UNIQUE UNIQUE (telegramId));


-- SQLINES DEMO *** ------------------------------------
-- Table `avaliacao1.localidades`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS avaliacao1.localidades ;

CREATE SEQUENCE avaliacao1.localidades_seq;

CREATE TABLE IF NOT EXISTS avaliacao1.localidades (
  id INT NOT NULL DEFAULT NEXTVAL ('avaliacao1.localidades_seq'),
  praca VARCHAR(10) NOT NULL,
  endereco VARCHAR(140) NOT NULL,
  apelido VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE (id),
  UNIQUE (endereco));

ALTER SEQUENCE avaliacao1.localidades_seq RESTART WITH 33;


-- SQLINES DEMO *** ------------------------------------
-- Table `avaliacao1.operadoras`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS avaliacao1.operadoras ;

CREATE TABLE IF NOT EXISTS avaliacao1.operadoras (
  operadora VARCHAR(45) NOT NULL,
  tempoN1 INT NULL DEFAULT NULL,
  tempoN2 INT NULL DEFAULT NULL,
  tempoN3 INT NULL DEFAULT NULL,
  tempoN4 INT NULL DEFAULT NULL,
  tempoN5 INT NULL DEFAULT NULL,
  PRIMARY KEY (operadora));
--CONSTRAINT operadora_UNIQUE UNIQUE (operadora));

-- SQLINES DEMO *** ------------------------------------
-- Table `avaliacao1.circuitos`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS avaliacao1.circuitos ;

CREATE TABLE IF NOT EXISTS avaliacao1.circuitos (
  operadora VARCHAR(45) NOT NULL,
  designacao VARCHAR(45) NOT NULL,
  nome VARCHAR(100) NULL DEFAULT NULL,
  mnemonico VARCHAR(45) NULL DEFAULT NULL,
  ponta_A INT NULL DEFAULT NULL,
  ponta_B INT NULL DEFAULT NULL,
  PRIMARY KEY (designacao));
  --UNIQUE (designacao));
--CONSTRAINT links_ibfk_1
--  FOREIGN KEY (operadora)
--  REFERENCES avaliacao1.operadoras (operadora)
--    ON DELETE CASCADE
--    ON UPDATE CASCADE,
--  CONSTRAINT links_ibfk_2
--    FOREIGN KEY (ponta_A)
--   REFERENCES avaliacao1.localidades (id)
--    ON UPDATE CASCADE,
--  CONSTRAINT links_ibfk_3
--    FOREIGN KEY (ponta_B)
--    REFERENCES avaliacao1.localidades (id)
--    ON DELETE RESTRICT
--    ON UPDATE CASCADE)

-- SQLINES DEMO *** ------------------------------------
-- Table `avaliacao1.chamados`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS avaliacao1.chamados ;

CREATE SEQUENCE avaliacao1.chamados_seq;

CREATE TABLE IF NOT EXISTS avaliacao1.chamados (
  indice INT NOT NULL DEFAULT NEXTVAL ('avaliacao1.chamados_seq'),
  abertoPor VARCHAR(45) NOT NULL,
  fechadoPor VARCHAR(45) NULL DEFAULT NULL,
  designacao VARCHAR(45) NOT NULL,
  numINC VARCHAR(45) NULL DEFAULT NULL,
  inicioChamado TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  finalChamado TIMESTAMP(0) NULL DEFAULT NULL,
  chamado VARCHAR(45) NOT NULL,
  nivelEscalonamento INT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0',
  chamado_tempo INT NOT NULL DEFAULT '0',
  PRIMARY KEY (indice),
  CONSTRAINT abertoPor
    FOREIGN KEY (abertoPor)
    REFERENCES avaliacao1.usuarios (telegramId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fechadoPor
    FOREIGN KEY (fechadoPor)
    REFERENCES avaliacao1.usuarios (telegramId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
--  CONSTRAINT designacaoCircuito
--    FOREIGN KEY (designacao)
--    REFERENCES avaliacao1.circuitos (designacao)
--    ON DELETE NO ACTION
--    ON UPDATE NO ACTION)


ALTER SEQUENCE avaliacao1.chamados_seq RESTART WITH 122;


-- SQLINES DEMO *** ------------------------------------
-- Table `avaliacao1.contato`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS avaliacao1.contato ;

CREATE SEQUENCE avaliacao1.contato_seq;

CREATE TABLE IF NOT EXISTS avaliacao1.contato (
    id INT NOT NULL DEFAULT NEXTVAL ('avaliacao1.contato_seq'),
  operadora VARCHAR(45) NOT NULL,
  telefone INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) NULL,
  nivel INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (id));
--  CONSTRAINT operadora
--    FOREIGN KEY (operadora)
--    REFERENCES avaliacao1.operadoras (operadora)
--    ON DELETE CASCADE
--    ON UPDATE CASCADE)


INSERT INTO avaliacao1.usuarios (telegramId, name, telegram_user,password, email) VALUES (582049501, 'Bruno', 'bcsouza', '123456', 'brunocozendey@gmail.com');
INSERT INTO avaliacao1.usuarios (telegramId, name, telegram_user,password, email) VALUES (915691883, 'Bruno', 'bcsouza', '123456', 'brunocozendey@gmail.com');
INSERT INTO avaliacao1.usuarios (telegramId, name, telegram_user,password, email) VALUES (999999999, 'Teste', 'teste', '123456', 'teste@gmail.com');

INSERT INTO avaliacao1.operadoras (operadora, tempoN1, tempoN2, tempoN3, tempoN4, tempoN5) VALUES ('teste', 60, 120, 180,240,300);
INSERT INTO avaliacao1.operadoras (operadora, tempoN1, tempoN2, tempoN3, tempoN4, tempoN5) VALUES ('Vogel', 0, 120,240, NULL, NULL);
INSERT INTO avaliacao1.operadoras (operadora, tempoN1, tempoN2, tempoN3, tempoN4, tempoN5) VALUES ('CenturyLink', 0, 45, 90, 120, NULL);
INSERT INTO avaliacao1.operadoras (operadora, tempoN1, tempoN2, tempoN3, tempoN4, tempoN5) VALUES ('BRDigital', 0, 240, 360, 480, 600);
INSERT INTO avaliacao1.operadoras (operadora, tempoN1, tempoN2, tempoN3, tempoN4, tempoN5) VALUES ('TIM', 0, 120, 240, 360, 480);

INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('Vogel',080009991, 'NOC', 'noc@vogel.com.br', 1);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('Vogel',080009992, 'Especialista', 'especialista@vogel.com.br', 2);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('Vogel',080009993, 'Gerente', 'gerente@vogel.com.br', 3);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('Vogel',08009994, 'Gerente Plantao', 'gerenteplantao@vogel.com.br', 3);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('CenturyLink', 080009991, 'NOC', 'noc@centurylink.com.br', 1);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('CenturyLink', 080009992, 'Analista', 'analista@centurylink.com.br', 2);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('CenturyLink', 080009993, 'Especialista', 'especialista@centurylink.com.br', 3);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('CenturyLink', 080009994, 'Gerente', 'gerente@centurylink.com.br', 4);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('BRDigital', 080009991, 'NOC', 'noc@brdigital.com.br', 1);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('BRDigital', 080009992, 'Analista', 'analista@brdigital.com.br', 2);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('BRDigital', 080009993, 'Especialista', 'especialista@brdigital.com.br', 3);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('BRDigital', 080009994, 'Gerente', 'gerente@brdigital.com.br', 4);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('BRDigital', 080009995, 'Diretor', 'diretor@brdigital.com.br', 5);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('TIM', 080009991, 'NOC', 'noc@tim.com.br', 1);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('TIM', 080009992, 'Analista', 'analista@tim.com.br',2);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('TIM', 080009993, 'Especialista', 'especialista@tim.com.br', 3);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('TIM', 080009994, 'Gerente','gerente@tim.com.br',4);
INSERT INTO avaliacao1.contato (operadora, telefone, nome, email, nivel) VALUES ('TIM', 08000999, 'Diretor', 'diretor@tim.com.br', 5);

INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua Von Martius, 22','VM22');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua Pacheco Leao, 70','PL70');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua Jardim Botanico, 695','JB695');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Estrada dos Bandeirantes, 6700','EG');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua Jardim Botanico, 746','JB746');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua Jardim Botanico, 266','JB266');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('SPO','Alameda Santos, 700','IPL');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('SPO','Av. Chucri Zaidan, 46','Berrini');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Av. Arroio Pavuna, 100','Datacenter G.Com');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RCE','Rua Aurora, 1027','Emissora RCE');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Av. Das Americas, 700 -  Bloco 2','G.Com');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('BSA','Setor de Radio e Televisao Norte, Quadra 7','Emissora BSA');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('BHE','Av. Americo Vespucio, 2045','Emissora BHE');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua Bartolomeu Mitre, 770','BM770');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Av. Das Americas, 1650, Bloco 5','Globosat - ION');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Av. Afonso Cavalcanti, 455 - Predio IPLAN,','IPLAN');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('LIS','Rua Cesina Adaes Bermudes, 3 Telheiras','Lisboa');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('MPLS','Gerencia MPLS RJO/IP/03747','MPLS');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('SPO','Rua Dr. Luiz Migliano, 1100, Conjunto 1005','Steno');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua Ulysses Guimaraes, 300','COR - Centro de Operações Rio');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('INTERNET','INTERNET','INTERNET');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('VTA','Rua Chafic Murad, 902','Vitória');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('NYC','Ave. of Americas, 32, 17 Floor','NYC');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('LDS','Oval Road, The Interchange 2nd Floor, Camd','Londres');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('RJO','Rua da America, 210','Supervia');
INSERT INTO avaliacao1.localidades (praca, endereco, apelido) VALUES ('SPO','Av. Pereira Barreto, 1395','STN');


INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','RJOSPOCPL032028','MetroLAN RJO-SPO Principal','TIM1',33,40);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','RJOSPOCPL077042','MetroLAN RJO-SPO Reserva','TIM2',33,40);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','BSARJOCPL034003','MetroLAN RJO-BSA Principal','TIM3',33,44);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','BSARJOCPL077068','MetroLAN RJO-BSA Reserva','TIM4',33,44);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','RJORCECPL143714','MetroLAN RJO-RCE Principal','TIM5',33,42);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','RJORCECPL143713','MetroLAN RJO-RCE Reserva','TIM6',33,42);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','SPORJOCPL140510','MetroLAN PROJAC-SPO Principal','TIM7',36,40);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','SPORJOCPL140511','MetroLAN PROJAC-SPO Reserva','TIM8',36,40);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','RJOSPOCPL032033','MetroLAN SPO-Cittá Principal','TIM9',40,43);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','RJOSPOCPL077056','MetroLAN SPO-Cittá Reserva','TIM10',40,43);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','SPOSPOCPL032103','MetroLAN SPO-IPL Principal','TIM11',40,39);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','SPOSPOCPL077120','MetroLAN SPO-IPL Reserva','TIM12',40,39);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('TIM','RJORJOCPL076814','Link Supervia','TIM13',33,57);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','RIO T 9088 1 BR AA 0 GP.0001','FO Projac-Emissora (Zona Sul)','CLK1',36,33);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','Sol. 09 - DIMM FIBER 80G 500','FO Projac-Emissora (Zona Norte)','CLK2',36,33);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','L22914 1BRAA0GP.0013','Internet Contingência PROJAC','CLK3',36,53);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','L26546 1BRAA0GP.0027','MetroLAN JB266 -  BHE','CLK4',38,45);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','L26430 1BRAA0GP.0026','LINK RCE1 - RJO1 (VIA JB266)','CLK5',38,42);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','P21159 1BRAA0GP.0012','LINK RIO x LISBOA','CLK6',33,49);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('BRDigital','RJO001508019A','LINK EMISSORA x IPLAN','BRD1',33,48);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','L26171 BRAAA0GP.0025','LINK RJO1-BSA2','CLK7',33,44);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('Vogel','STT-7852-1-3','LINK SPO1-BHE1','VOG1',40,45);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('Vogel','STT-7852-1-4','LINK SPO2-BHE1','VOG2',40,45);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','CID 2 500068027','MetroLAN RJO-SPO','CLK8',33,40);
INSERT INTO avaliacao1.circuitos (operadora,designacao, nome, mnemonico, ponta_A,ponta_B) VALUES ('CenturyLink','CID 1 500068022','LINK VM22-SPO-2','CLK9',33,40);


INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('582049501','582049501','RJORCECPL143713','2019100370031',0,0,38);
INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('915691883','915691883','RJORCECPL143713','2019100370033',0,0,51);
INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('999999999','999999999','CID 1 500068022',' 17496947/2019                ',0,0,12);
INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('582049501','582049501','RJORCECPL143713','2019100371066',0,0,23);
INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('915691883','915691883','RJORCECPL143714',' 2019100371066.2              ',0,0,56);
INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('999999999','999999999','SPORJOCPL140511','2219100371555',0,0,45);
INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('582049501','915691883','RJOSPOCPL032028','2019100371586',0,0,31);
INSERT INTO avaliacao1.chamados (abertoPor,fechadoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('915691883','999999999','RJOSPOCPL077042',' 2019100371586 (segundo link) ',0,0,19);
INSERT INTO avaliacao1.chamados (abertoPor, designacao, chamado, nivelEscalonamento, status, chamado_tempo) VALUES ('999999999','SPORJOCPL140510','2019100372549',0,0,14);   