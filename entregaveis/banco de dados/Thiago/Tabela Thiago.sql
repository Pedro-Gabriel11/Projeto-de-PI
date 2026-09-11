CREATE DATABASE monitoramento_glp;

USE monitoramento_glp;

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    empresa VARCHAR(100)
);

CREATE TABLE equipamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT,
    modeloSensor VARCHAR(50),
    localizacao VARCHAR(100),
    dataInstalacao DATE
);

CREATE TABLE monitoramento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(100),
    modeloSensor VARCHAR(50),
    nivelGas DECIMAL(5,2),
    dataHora DATETIME,
    status VARCHAR(20)
);

INSERT INTO cliente
(nome, email, telefone, empresa)
VALUES
('Carlos Silva', 'carlos@email.com', '11999999999', 'Restaurante Sabor Caseiro'),
('Mariana Souza', 'mariana@email.com', '11988888888', 'Cozinha Industrial Bom Tempero'),
('João Santos', 'joao@email.com', '11977777777', 'Restaurante Delícia');

INSERT INTO equipamento
(idCliente, modeloSensor, localizacao, dataInstalacao)
VALUES
(1, 'MQ-6', 'Cozinha 1', '2026-09-01'),
(1, 'MQ-6', 'Cozinha 2', '2026-09-01'),
(2, 'MQ-6', 'Cozinha 1', '2026-09-03'),
(3, 'MQ-6', 'Cozinha 1', '2026-09-05');

INSERT INTO monitoramento
(localizacao, modeloSensor, nivelGas, dataHora, status)
VALUES
('Cozinha 1', 'MQ-6', 25.50, '2026-09-07 10:00:00', 'Normal'),
('Cozinha 1', 'MQ-6', 30.20, '2026-09-07 10:05:00', 'Normal'),
('Cozinha 1', 'MQ-6', 85.70, '2026-09-07 10:10:00', 'Alerta'),

('Cozinha 2', 'MQ-6', 20.10, '2026-09-07 10:00:00', 'Normal'),
('Cozinha 2', 'MQ-6', 28.40, '2026-09-07 10:05:00', 'Normal'),
('Cozinha 2', 'MQ-6', 75.30, '2026-09-07 10:10:00', 'Alerta'),

('Cozinha 3', 'MQ-6', 18.50, '2026-09-07 10:00:00', 'Normal'),
('Cozinha 3', 'MQ-6', 22.80, '2026-09-07 10:05:00', 'Normal'),
('Cozinha 3', 'MQ-6', 90.20, '2026-09-07 10:10:00', 'Alerta');

SELECT * FROM cliente;

SELECT * FROM equipamento;

SELECT * FROM monitoramento;

SELECT * FROM monitoramento WHERE status = 'Alerta';