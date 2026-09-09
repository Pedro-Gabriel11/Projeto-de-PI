/*
Grupo 2 - AnzenTech
Gabriel Figueiredo
Kauã Hideaki
Miguel Vargas
Patrick Scaglia
Paulo Henrique
Pedro Gabriel
Thiago Prado
*/
-- TABELA 1
CREATE DATABASE tabelasGLP;

USE tabelasGLP;

CREATE TABLE cadastro (
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
estabelecimento VARCHAR(50),
responsavel VARCHAR(40),
telefone VARCHAR(20),
cidade VARCHAR(40),
dataCadastro DATE,
situacaoMonitoramento VARCHAR(20) CHECK
(situacaoMonitoramento IN ('Ativo', 'Inativo', 'Em instalacao'))
) AUTO_INCREMENT = 1;


INSERT INTO cadastro VALUES
(default, 'Temprerani Cucina','Davi Temperani', 
'11987654321', 'Sao Paulo','2026-09-06', 'Ativo'),
(default, 'Macaxeira','Vitor Fraga', 
'11976378364', 'Sao Paulo', '2026-08-15', 'Ativo'),
(default, 'Hotel Capriccio','Leticia Souza', '11962936159', 
'Sao Caetano do Sul','2026-05-17', 'Em instalacao'),
(default, 'Figo','Nelson Lima', '11954621875', 
'Sao Bernardo','2026-08-25', 'Ativo');

SELECT * FROM cadastro;

select concat('O estabelecimento ', estabelecimento, ' do representante ', responsavel, ', residido na cidade de ', cidade, ', está com a situação dos senores ', situacaoMonitoramento) as 'Situação cadastral' from cadastro;

-- TABELA 2

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
clienteEmpresa VARCHAR(50),
modeloSensor VARCHAR(30),
localInstalacao VARCHAR(50),
dataInstalacao DATE,
limiteAlerta DECIMAL(5,2) CHECK (limiteAlerta BETWEEN 0 AND 100),
statusSensor VARCHAR(20) CHECK
(statusSensor IN ('Ativo', 'Manutencao', 'Inativo')),
ultimaManutencao DATE
) AUTO_INCREMENT = 1;


INSERT INTO sensor VALUES
(default, 'Temprerani Cucina','Sensor GLP A1', 
'Area de coccao','2026-08-21', 60.00, 'Ativo', '2026-08-21'),
(default, 'Macaxeira', 'Sensor GLP A1', 'Area de preparação',
'2026-06-07', 60.00, 'Ativo', '2026-08-02'),
(default, 'Hotel Capriccio','Sensor GLP B2',
 'Área de Grelhados', '2026-07-14', 65.00, 'Ativo', '2026-07-14'),
(default,  'Figo', 'Sensor GLP B2', 'Área de Fornos',
'2026-08-21', 65.00, 'Manutencao', '2026-09-06');

SELECT * FROM sensor;

select concat('O sensor ', idsensor, ' do modelo', modelosensor, ', está instalado em ', localinstalacao, ', desde o dia ', datainstalacao, ', tendo sido feita a última manutenção no dia ', ultimaManutencao, ', e seu status atual é ', statussensor) as 'Informações do sensor' from sensor;

-- TABELA 3

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

SELECT * FROM leituraSensor;

select concat('O sensor ', idsensor, ' captou um ppm de ', ppm, ', na data de', dataHora, ', e sua situação atual é ', situacao) as Leitura from leiturasensor;