-- BANCO DE DADOS DA ANZEN_TECH

CREATE DATABASE anzen_tech;

USE anzen_tech;


-- TABELA DE USUÁRIOS
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
senha VARCHAR(30),
tipoUsuario VARCHAR(20)
) AUTO_INCREMENT = 1;


INSERT INTO usuario VALUES
(default, 'Wilson Nishi', 'nishi@gmail.com', '123456', 'administrador'),
(default, 'Mariana Santos', 'mariana@gmail.com', '654321', 'cliente'),
(default, 'Kauã Hideaki', 'hide@gmail.com', '987654', 'cliente'),
(default, 'David Costa', 'david@gmail.com', '456789', 'administrador'),
(default, 'Pedro Souza', 'pedro@gmail.com', '321654', 'cliente');


-- TABELA DOS SENSORES
CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR(50),
fabricante VARCHAR(50),
preco DECIMAL(7,2),
localInstalacao VARCHAR(50),
statusSensor BOOLEAN NOT NULL
) AUTO_INCREMENT = 1;


INSERT INTO sensor VALUES
(default, 'MQ-2', 'Fabricante', 223.00, 'Cozinha Principal', TRUE),
(default, 'MQ-2', 'Fabricante', 260.00, 'Área dos Fornos', TRUE),
(default, 'MQ-2', 'Fabricante', 288.00, 'Cozinha Secundária', FALSE),
(default, 'MQ-2', 'Fabricante', 300.00, 'Chapa Industrial', TRUE),
(default, 'MQ-2', 'Fabricante', 250.00, 'Área de Estoque', FALSE);


-- TABELA DAS LEITURAS REALIZADAS PELOS SENSORES
CREATE TABLE leituraSensor (
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
idSensor INT,
ppm DECIMAL(6,2),
dataHora DATETIME,
situacao VARCHAR(20),
CONSTRAINT chkPpm CHECK (ppm >= 0),
CONSTRAINT chkSituacao CHECK (situacao IN ('normal', 'atenção', 'perigoso'))
) AUTO_INCREMENT = 1;


INSERT INTO leituraSensor VALUES
(default, 1, 200.00, '2026-09-07 08:00:00', 'normal'),
(default, 1, 250.00, '2026-09-07 09:00:00', 'normal'),
(default, 2, 400.00, '2026-09-07 09:30:00', 'atenção'),
(default, 2, 750.00, '2026-09-07 10:00:00', 'atenção'),
(default, 2, 1000.00, '2026-09-07 10:30:00', 'atenção'),
(default, 4, 1200.00, '2026-09-07 11:00:00', 'perigoso'),
(default, 4, 1500.00, '2026-09-07 11:30:00', 'perigoso'),
(default, 5, 300.00, '2026-09-07 12:00:00', 'normal');


-- EXIBE TODOS OS USUÁRIOS
SELECT * FROM usuario;


SELECT * FROM sensor;


-- EXIBE AS LEITURAS
SELECT * FROM leituraSensor;

-- EXIBE A ESTRUTURA DA TABELA
DESCRIBE sensor;


-- EXIBE SENSORES ATIVOS
SELECT * FROM sensor WHERE statusSensor = TRUE;


-- EXIBE LEITURAS EM SITUAÇÃO PERIGOSA
SELECT * FROM leituraSensor WHERE situacao = 'perigoso';


-- ALTERA A TABELA PARA ADICIONAR A COLUNA OBSERVACAO
ALTER TABLE leituraSensor ADD COLUMN observacao VARCHAR(100);


-- ATUALIZA A OBSERVAÇÃO DE UMA LEITURA PERIGOSA
UPDATE leituraSensor SET observacao = 'Verificar o ambiente imediatamente' WHERE idLeitura = 6;


-- EXIBE LEITURAS COM CONCENTRAÇÃO ACIMA DE 1000 PPM
SELECT * FROM leituraSensor WHERE ppm > 1000;


-- EXIBE LEITURAS REALIZADAS A PARTIR DAS 10 HORAS
SELECT * FROM leituraSensor WHERE dataHora >= '2026-09-07 10:00:00';


-- ATUALIZA O STATUS DO SENSOR 3 PARA ATIVO
UPDATE sensor SET statusSensor = TRUE WHERE idSensor = 3;


-- EXIBE SENSORES INSTALADOS EM LOCAIS QUE POSSUEM A PALAVRA 'COZINHA'
SELECT * FROM sensor WHERE localInstalacao LIKE '%Cozinha%';


-- EXIBE O PREÇO DOS SENSORES EM ORDEM CRESCENTE
SELECT * FROM sensor ORDER BY preco ASC;


-- ALTERA O TAMANHO DA COLUNA LOCALINSTALACAO
ALTER TABLE sensor MODIFY localInstalacao VARCHAR(100);

-- DELETA O USUARIO 5 DA TABELA DE USUARIOS
DELETE FROM usuario WHERE idUsuario = 5;


SELECT * FROM leituraSensor;


-- REMOVE TODOS OS REGISTROS DA TABELA DE LEITURAS
TRUNCATE TABLE leituraSensor;