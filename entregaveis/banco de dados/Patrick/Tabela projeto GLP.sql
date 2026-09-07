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

-- TABELA 2

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
cliente VARCHAR(50),
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

ALTER TABLE sensor RENAME COLUMN cliente TO clienteEmpresa;

SELECT * FROM sensor;

-- TABELA 3 - COZINHA

CREATE TABLE cozinha (
idCozinha INT PRIMARY KEY AUTO_INCREMENT,
cliente VARCHAR(50),
areaCozinha VARCHAR(40),
tamanhoCozinha DECIMAL(6,2),
qtdEquipamentosGas INT,
tipoAbastecimento VARCHAR(20) CHECK
(tipoAbastecimento IN ('Botijao', 'Central GLP')),
quantidadeSensores INT,
ventilacao VARCHAR(20) CHECK
(ventilacao IN ('Adequada', 'Necessita avaliacao')),
situacao VARCHAR(20) CHECK
(situacao IN ('Monitorada', 'Em instalacao', 'Inativa'))
) AUTO_INCREMENT = 1;


INSERT INTO cozinha VALUES
(default, 'Temprerani Cucina','Cozinha principal',
 85.50, 8,'Central GLP', 2, 'Adequada', 'Monitorada'),
(default, 'Macaxeira','Área cocção', 45.00, 
4, 'Central GLP', 1, 'Adequada', 'Monitorada'),
(default, 'Hotel Capriccio','Cozinha do restaurante', 120.80,
 10,'Central GLP', 3, 'Necessita avaliacao', 'Em instalacao'),
(default, 'Figo','Cozinha principal', 65.00, 
5, 'Central GLP', 2, 'Adequada', 'Monitorada');

ALTER TABLE cozinha RENAME COLUMN cliente TO clienteEmpresa;

SELECT * FROM cozinha;

