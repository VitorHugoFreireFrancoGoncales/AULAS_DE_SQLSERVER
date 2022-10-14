create database TESTE;
GO
USE TESTE;
GO
CREATE TABLE PESSOA(
COD INT IDENTITY PRIMARY KEY,
NOME VARCHAR(30),
TELEFONE VARCHAR(15),
SEXO CHAR(1),
NACIONALIDADE VARCHAR(15) DEFAULT('BRASILEIRO')
);

select * from PESSOA

INSERT INTO PESSOA (NOME,TELEFONE,SEXO) VALUES ('MARIA', '123456','F')

DELETE FROM PESSOA WHERE COD = 1

select telefone, NACIONALIDADE from pessoa

INSERT INTO PESSOA (NOME,TELEFONE,SEXO)
VALUES('MAYARA','22222','F'),
('PEDRO','444444','M'),
('JOAO','333333','M'),
('CARLOS','555555','M'),
('FELIPE','666666','M'),
('MARCIA','777777','F');


SELECT NOME,SEXO FROM PESSOA 

SELECT 'OLA' AS 'SAUDAÇÃO'
-- PRA QUE SERVE ?? SERVE PARA "REOMEAR(APELIDAR)" A COLUNA

SELECT NOME AS 'TESTE',SEXO AS 'TESTE2' FROM PESSOA 

CREATE TABLE VENDAS (
ID_VENDA INT IDENTITY PRIMARY KEY,
PRECO FLOAT,
QUANTIDADE INT
)

INSERT INTO VENDAS VALUES(10.90, 7),
(15.00,2),
(20.50,3)

SELECT * FROM VENDAS

SELECT ID_VENDA, PRECO, QUANTIDADE,(PRECO*QUANTIDADE) AS TOTAL FROM VENDAS

--FILTROS--
SELECT * FROM VENDAS WHERE QUANTIDADE < 5


CREATE TABLE PESSOA (
ID INT IDENTITY PRIMARY KEY,
NOME VARCHAR(30) NOT NULL,
SEXO CHAR(1),
ESTADO CHAR(2),
DATANASC DATE,
QFILHOS INT,
TELEFONE VARCHAR(15),
EMAIL VARCHAR(40)
)

INSERT INTO PESSOA VALUES('Joao Paulo','M','SP','02/05/1969',2,NULL,'JoaoPaulo@gamil.com'),
('Ana Maria','F','BA','07/04/1990',0,'32321212','elem@gmail.com'),
('Felipe','M','SP','31/12/1992',1,'55554444',NULL),
('Pedro Rodrigues','M','RJ','04/08/1992',4,'88889999','pedro@gmail.com'),
('Carla','F','AM','21/04/1997',2,'77774432','silvia@hotmail.com'),
('Ana Carla','F','SP','25/09/2000',0,'158585854',NULL),
('Thiago','M','RJ','30/03/1982',2,'111111111','thiago@outlook.com'),
('Alice','F','AM','2/03/1989',3,'222222222','aline123@hotmail.com'),
('André','M','RS','15/05/1990',2,'333333333',NULL),
('David','M','RS','7/01/1993',1,'44444485','David25@hotmail.com'),
('Sabrina','F','SP','22/12/1975',3,'65656565',NULL),
('Raquel','F','SP','14/11/1995',0,NULL,'Raquel@hotmail.com'),
('Marcos','M','RJ','12/11/1993',1,'36363636',NULL),
('Pablo','M','RJ','01/03/1996',0,NULL,NULL)

SELECT * FROM PESSOA

--------------------- EXERCICIOS ----------------------------
-- Todas as pessoas com mais de 2 filhos(>)
SELECT * FROM PESSOA WHERE QFILHOS > 2

-- Todas as pessoas sem filhos(=)
SELECT * FROM PESSOA WHERE QFILHOS = 0

-- Todos os homens(=)
SELECT * FROM PESSOA WHERE SEXO = 'M'

-- todos os homens com ate 1 filho (in())
SELECT * FROM PESSOA WHERE SEXO = 'M' AND QFILHOS IN(0,1)

-- Todas as mulheres com primeiro nome igual a carla (LIKE)
SELECT * FROM PESSOA WHERE SEXO = 'F' AND NOME LIKE 'CARLA'

		-- % Qualquer caracter ou nenhum
		SELECT * FROM PESSOA WHERE NOME LIKE '%CARLA%'

		-- _ Unico caracter
		SELECT * FROM PESSOA WHERE NOME LIKE '__CARLA'

		-- [] Qualquer caractere no intervalo especificado
		SELECT * FROM PESSOA WHERE NOME LIKE '%[F,S]%'

		-- [^]Qualquer caractere que nao esta intervalo especifico
		SELECT * FROM PESSOA WHERE NOME LIKE '[^F]%'

-- Todas as pessoas com 30 anos ou mais(<=)
SELECT * FROM PESSOA WHERE DATANASC <= '31/12/1988'

-- Todas as pessoas que não possuem email(is null/is not null)
SELECT * FROM PESSOA WHERE EMAIL IS NOT NULL -- SELECT * FROM PESSOA WHERE EMAIL IS NULL

-- Todas as pessoas de 20 a 30 anos(between)
SELECT * FROM PESSOA WHERE DATANASC BETWEEN '01/01/1988' AND '12/12/1998'

-- Relatório com todas as mulheres em ordem alfabética(order by/desc)
SELECT * FROM PESSOA WHERE SEXO = 'F' ORDER BY NOME

-- Quantidade de pessoas registradas no banco(count(*))
SELECT COUNT(*) AS 'quatidade de pessoas' FROM PESSOA 

-- Todas as mulheres com filhos e com telefone (and)
SELECT * FROM PESSOA WHERE SEXO = 'F' AND QFILHOS <> 0 AND TELEFONE IS NOT NULL

-- Todas as mulheres que moram em sp e nao tem email (and)
SELECT * FROM PESSOA WHERE SEXO = 'F' AND ESTADO = 'SP' AND EMAIL IS NULL

-- Mulheres solteiras ou homens sem filhos (or)
SELECT * FROM PESSOA WHERE SEXO = 'F' AND QFILHOS = 0 OR SEXO = 'M' AND QFILHOS = 0

-- Todas as mulheres com mais de 30 anos de sp ou homens do rs(and e)
SELECT * FROM PESSOA WHERE (SEXO = 'F' AND DATANASC < '31/12/1988' AND ESTADO = 'SP') OR (SEXO = 'M' AND ESTADO = 'RS')