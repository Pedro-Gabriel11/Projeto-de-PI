USE sprint1;

CREATE TABLE cadastro_usuario(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
data_nasc DATE NOT NULL,
sexo VARCHAR(1) NULL,
email VARCHAR(30), 
CONSTRAINT chkS CHECK(sexo IN('M','F','N'))
);

INSERT INTO cadastro_usuario VALUES
(DEFAULT,'Lucas Sato','2004-01-09','M','luca.sato@gmail.com'),
(DEFAULT,'Valesca da Silva de Oliveira','1999-12-11','F','valescasilva@hotmail.com'),
(DEFAULT,'Wesley Rodrigues','2000-08-19',NULL,'wesley.rodri@gmail.com'),
(DEFAULT,'Natalino Eidi','1994-12-25','M','natal.dezembro@gmail.com'),
(DEFAULT,'Fernando do Santos','1991-10-17','M','fernando.santos@hotmail.com');

SELECT * FROM cadastro_usuario;

SELECT nome, 
TIMESTAMPDIFF(YEAR,data_nasc, CURDATE()) AS Idade 
FROM cadastro_usuario;


USE sprint1;

CREATE TABLE sensor_medicao(
id_sensor INT UNIQUE AUTO_INCREMENT,
valor_leitura INT,
statuss VARCHAR(20), 
CONSTRAINT chkStatuss CHECK(statuss IN('Seguro','Alerta','Perigo')),
horario_medicao DATETIME DEFAULT CURRENT_TIMESTAMP
)AUTO_INCREMENT = 1000;

INSERT INTO sensor_medicao VALUES
(DEFAULT,650,'Alerta',DEFAULT),
(DEFAULT,200,'Seguro',DEFAULT),
(DEFAULT,450,'Alerta',DEFAULT),
(DEFAULT,800,'Perigo',DEFAULT),
(DEFAULT,900,'Perigo',DEFAULT),
(DEFAULT,100,'Seguro',DEFAULT);

SELECT * FROM sensor_medicao;

USE sprint1;

CREATE TABLE custos(
id INT PRIMARY KEY AUTO_INCREMENT,
consumo_kwh DECIMAL(10,2),
valor_kwh DECIMAL(8,2),
periodo VARCHAR(15)
CONSTRAINT chkPeriodo CHECK(periodo IN('Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Setembro','Outubro','Novembro','Dezembro'))
);

INSERT INTO custos VALUES
(DEFAULT,2.40,28.80,'Abril'),
(DEFAULT,3,60,'Dezembro'),
(DEFAULT,1.76,26.40,'Maio'),
(DEFAULT,1.32,19.80,'Julho'),
(DEFAULT,2.40,31.20,'Novembro'),
(DEFAULT,3,54,'Outubro');

SELECT * FROM custos;





