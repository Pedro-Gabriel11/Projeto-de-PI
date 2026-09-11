create database anzen;
use anzen;

-- Criando tabela de usuários
create table usuario (
id int primary key auto_increment,
nomeRepresentante varchar(60),
nomeEmpresa varchar(80),
cnpj varchar(20),
logradouro varchar(60),
telefone varchar(15)
);
desc usuario;

-- Inserindo dados na tabela de usuários
insert into usuario (nomeRepresentante, nomeEmpresa, cnpj, logradouro, telefone) VALUES
('Carlos Eduardo Silva', 'TechLog Soluções LTDA', '12.345.678/0001-90', 'Av. Paulista, 1000', '(11) 98765-4321'),
('Mariana Souza', 'GasProtect Inovações SA', '98.765.432/0001-10', 'Rua das Flores, 250', '(11) 91234-5678'),
('Fernando Alves', 'SmartLog Logística Integrada', '45.678.912/0001-34', 'Rua Augusta, 500', '(21) 97654-3210'),
('Beatriz Lima', 'EcoGás Sistemas de Segurança', '33.222.111/0001-55', 'Av. Brigadeiro Faria Lima, 1500', '(31) 99876-5432');

-- Select na tabela usuarios
select * from usuario;

-- Criando tabela do sensor
create table sensor (
id int primary key auto_increment,
tipo varchar(10),
areaInstalacao varchar(40),
statuss varchar(10),
constraint chk_status check (statuss in ('ativo', 'inativo', 'manutenção')),
dtManutencao datetime
);

-- Inserindo dados na tabela sensor
insert into sensor (tipo, areaInstalacao, statuss, dtManutencao) values
('MQ-2', 'Cozinha Industrial', 'ativo', '2026-08-10 09:00:00'),
('MQ-2', 'Depósito de Botijões', 'manutenção', '2026-09-01 14:30:00'),
('MQ-5', 'Área de Produção', 'ativo', '2026-07-15 11:00:00'),
('MQ-7', 'Galpão Principal', 'inativo', '2026-04-20 16:45:00');

-- Select na tabela sensor
select * from sensor;

-- Criando tabela da leitura do sensor
CREATE TABLE leituraSensor (
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
idSensor INT,
ppm DECIMAL(6,2),
dataHora DATETIME,
situacao VARCHAR(20),
CONSTRAINT chkPpm CHECK (ppm >= 0),
CONSTRAINT chkSituacao CHECK (situacao IN ('normal', 'atenção', 'perigoso'))
);
DESC leituraSensor;

-- Inserindo dados na tabela leitoras do sensor
INSERT INTO leituraSensor (idSensor, ppm, dataHora, situacao) VALUES
(1, 200.00, '2026-09-07 08:00:00', 'normal'),
(1, 250.00, '2026-09-07 09:00:00', 'normal'),
(2, 400.00, '2026-09-07 09:30:00', 'atenção'),
(2, 750.00, '2026-09-07 10:00:00', 'atenção'),
(2, 1000.00, '2026-09-07 10:30:00', 'atenção'),
(4, 1200.00, '2026-09-07 11:00:00', 'perigoso'),
(4, 1500.00, '2026-09-07 11:30:00', 'perigoso');

-- Selects na tabela das leituras do sensor
select * from leituraSensor;