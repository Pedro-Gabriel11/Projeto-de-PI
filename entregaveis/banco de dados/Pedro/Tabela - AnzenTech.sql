CREATE DATABASE tabelaGLP;

USE tabelaGLP;

CREATE TABLE cliente (
idCliente INT PRIMARY KEY auto_increment,
nome VARCHAR(50),
telefone CHAR(11), 
email VARCHAR(60),
cpf CHAR(11),
dtNasc DATE,
situacaoMonitoramento VARCHAR(30) CHECK 
(situacaoMonitoramento IN ('Ativo', 'Inativo', 'Em andamento'))
)AUTO_INCREMENT = 1;

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
modeloSensor VARCHAR(10),
preco DECIMAL(6,2),
statusSensor BOOLEAN NOT NULL
) auto_increment = 1;

CREATE TABLE leitura (
idLeitura INT PRIMARY KEY auto_increment,
idSensor INT UNIQUE, 
ppm DECIMAL (6,2),
data_horario DATETIME,
situacao VARCHAR(20) CHECK 
(situacao IN ('Normal', 'Atenção', 'Perigo'))
) auto_increment = 1;

INSERT INTO cliente VALUES
(default, 'Pedro','11941557774', 
'pedro.ssilva@sptech.school', '52826046802','2004-06-11', 'Inativo'),
(default, 'Thiago','11957292013', 
'thiago.prado@sptech.school', '41736402801', '2003-03-17', 'Ativo'),
(default, 'Kaua','11986720284',
'kaua.hideaki@sptech.school', '29472901274','2005-05-09', 'Ativo'),
(default, 'Wilson','11920171391',
'wilson.nishi@sptech.school', '39817409523','2025-08-28', 'Em andamento');

INSERT INTO sensor VALUES
(default, 'Pedro','GLP A1', 
250,TRUE),
(default, 'Thiago', 'GLP A1', 
250, FALSE),
(default, 'Kaua','GLP B2',
350, FALSE),
(default,  'Wilson', 'GLP B2', 
350, TRUE);

INSERT INTO leitura VALUES
(default, 1, 670.00, '2026-09-02 09:00:00', 'Atenção'),
(default, 2, 315.00, '2026-09-03 10:00:00', 'Normal'),
(default, 3, 1050.00, '2026-09-04 11:00:00', 'Perigo'),
(default, 4, 220.00, '2026-09-05 12:00:00', 'Normal'),
(default, 5, 780.00, '2026-09-06 13:00:00', 'Atenção');

SELECT * FROM cliente;

SELECT * FROM sensor;

SELECT * FROM leitura;
