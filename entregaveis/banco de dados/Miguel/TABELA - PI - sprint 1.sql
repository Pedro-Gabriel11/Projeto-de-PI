USE sprint1;

SELECT * FROM usuarios;

CREATE TABLE sensor2(
id INT PRIMARY KEY auto_increment,
num_sensor INT UNIQUE,
cozinha_id INT UNIQUE,
valor_ppm DECIMAL(8,2) NOT NULL,
tipo_alerta VARCHAR(10) NOT NULL,
CONSTRAINT chktipal CHECK (tipo_alerta IN('normal', 'atencao', 'perigoso'))
);

CREATE TABLE usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
nome_completo VARCHAR(80),
email VARCHAR(50) NOT NULL UNIQUE,
senha VARCHAR(50) NOT NULL,
telefone CHAR(11),
cat_usuario VARCHAR(20),
CONSTRAINT chkcat CHECK (cat_usuario IN ('admin', 'gestor', 'operador', 'visualizador'))
) auto_increment = 1;

CREATE TABLE manutencao(
id INT PRIMARY KEY auto_increment,
sensor_id INT NOT NULL, 
tipo_manutencao VARCHAR(20) CHECK (tipo_manutencao IN ('calibracao', 'limpeza', 'troca', 'inspecao')),
data_agendada DATE,
data_realizada DATE,
observacoes VARCHAR(150)
);


INSERT INTO usuarios VALUES
(default, 'Ricardo Silveira', 'ricardo.sil@mail.com', 'cir5638483@', '21463882544', 'gestor'),
(default, 'Beatriz Alves', 'bea.alves@mail.com', 'verber4657&', '23984876224', 'operador'),
(default, 'Victoria Justino', 'vi.justice@mail.com', 'jusjus485854&', '23984876224', 'visualizador'),
(default, 'Jucinei Silva', 'jucinei.silva@mail.com', 'hipocondrio7459@', '21983245114', 'admin'),
(default, 'Maria Conceição', 'maria.aline@mail.com', 'matrix7864$', '21983245114', 'gestor');

INSERT INTO sensor2 VALUES
(default, '5589', '3745', '400', 'atencao'),
(default, '5578', '3756', '350', 'normal'),
(default, '5541', '3710', '270', 'normal'),
(default, '5536', '3786', '600', 'atencao'),
(default, '5539', '3740', '1100', 'perigoso');

INSERT INTO manutencao VALUES
(default, '1', 'inspecao', '2026-10-12', null, 'A realizar'),
(default, '2', 'inspecao', '2026-07-25', '2026-7-31', null),
(default, '3', 'troca', '2026-07-28', '2026-07-28', 'troca de pinos'),
(default, '4', 'calibracao', '2026-09-25', null, 'Leitura incorreta de ppm'),
(default, '5', 'limpeza', '2026-08-14', '2026-08-14', 'Muita sujeira');

SELECT * FROM manutencao;

SELECT * FROM sensor2;

SELECT * FROM usuarios;

