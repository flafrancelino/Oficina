-- Criando o banco
CREATE DATABASE PROJETO_OFICINA;

-- Habilitando para uso
USE PROJETO_OFICINA;

-- Criando as tabelas
CREATE TABLE Clientes (
Nome_Cliente VARCHAR(30),
Telefone_Cliente VARCHAR(10),
Id_Cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
Endereco_Cliente VARCHAR(15)
);

CREATE TABLE Mecanicos (
Endereco_Mecanico VARCHAR(30),
Nome_Mecanico VARCHAR(30),
Especialidade_Mecanico VARCHAR(10),
Id_Mecanico INTEGER PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Veiculos (
Marca VARCHAR(10),
Modelo VARCHAR(10),
Cor VARCHAR(10),
Placa VARCHAR(10),
Id_Veiculo INTEGER PRIMARY KEY AUTO_INCREMENT,
Id_Cliente INTEGER,
Id_Mecanico INTEGER,
FOREIGN KEY(Id_Cliente) REFERENCES Clientes (Id_Cliente)
);

CREATE TABLE Mao_Obra (
Id_Mao_Obra INTEGER PRIMARY KEY AUTO_INCREMENT,
Descricao_Servico VARCHAR(10),
Valor_Mao_Obra DECIMAL(10)
);

CREATE TABLE Pecas (
Id_Pecas INTEGER PRIMARY KEY AUTO_INCREMENT,
Descricao_Pecas VARCHAR(10),
Valor_Peca DECIMAL(10)
);


CREATE TABLE Ordem_Servico (
Data_Entrega DATETIME,
Numero_OS INTEGER,
Data_Emissao DATETIME,
Status_Servico VARCHAR(10),
Data_Conclusao DATETIME,
Id_Ordem_Servico INTEGER PRIMARY KEY AUTO_INCREMENT,
Valor_Total INTEGER,
Tipo_Manutencao VARCHAR(10),
Autorizacao_cliente VARCHAR(10),
Id_Mecanico INTEGER,
FOREIGN KEY(Id_Mecanico) REFERENCES Mecanicos (Id_Mecanico)
);



CREATE TABLE Requer (
Id_Mao_Obra INTEGER,
Id_Ordem_Servico INTEGER,
FOREIGN KEY(Id_Mao_Obra) REFERENCES Mao_Obra (Id_Mao_Obra),
FOREIGN KEY(Id_Ordem_Servico) REFERENCES Ordem_Servico (Id_Ordem_Servico)
);

CREATE TABLE Necessita (
Id_Ordem_Servico INTEGER,
Id_Pecas INTEGER,
FOREIGN KEY(Id_Ordem_Servico) REFERENCES Ordem_Servico (Id_Ordem_Servico),
FOREIGN KEY(Id_Pecas) REFERENCES Pecas (Id_Pecas)
);

ALTER TABLE Veiculos ADD FOREIGN KEY(Id_Mecanico) REFERENCES Mecanicos (Id_Mecanico);

-- Inserindo dados na tabela clientes
DESC CLIENTES;
INSERT INTO CLIENTES VALUES ('Flavia Leite', 619236844, NULL, 'GUARÁ - Casa 10');
INSERT INTO CLIENTES VALUES ('Alex Martins', 629857425, NULL, 'GUARÁ - Casa 10');
INSERT INTO CLIENTES VALUES ('Carlos Jose', 6198496478, NULL, 'RIACHO - Casa 3');
INSERT INTO CLIENTES VALUES ('Beatriz Souza', 619958459, NULL, 'SIA - Casa 4');
INSERT INTO CLIENTES VALUES ('Italo Amorim', 618536428, NULL, 'ASA SUL');

-- Inserindo dados na tabela mecânicos
DESC MECANICOS;
INSERT INTO MECANICOS VALUES ('CIDADE DO AUTOMOVEL', 'ANDRE FERNANDES', 'PINTOR', NULL),
                             ('SIA', 'CAIO DAVI', 'PNEUS', NULL),
                             ('SAAN', 'PEDRO PAULO', 'VIDRO', NULL),
                             ('ASA SUL', 'ANA AMELIA', 'ELETRICA', NULL),
                             ('SOBRADINHO', 'MARCELO MAIA', 'VENTILACAO', NULL);

-- Inserindo dados na tabela veículos
DESC VEICULOS;
INSERT INTO VEICULOS VALUES ('FIAT', 'UNO', 'BRANCO', 'PBD-2047', NULL, 1, 10),
                            ('CHEVROLET', 'CORSA', 'PRETO', 'PAQ-6667', NULL, 2, 9),
                            ('VOLKSWAGEN', 'GOL', 'VERDE', 'HHJ-6547', NULL, 3, 8),
                            ('HONDA', 'CIVIC', 'PRATA', 'DFD-2045', NULL, 4, 7),
                            ('HYNDAI', 'HB20', 'PRETO', 'PQA-4766', NULL, 5, 6);

-- Inserindo dados na tabela Mao_obra
DESC MAO_OBRA;
INSERT INTO MAO_OBRA VALUES (NULL, 'REVISAO', 800),
                            (NULL, 'CONSERTO', 2500);

-- Inserindo dados na tabela pecas
DESC PECAS;
INSERT INTO PECAS VALUES (NULL, 'INJECAO', 120),
                         (NULL, 'PNEU', 450),
                         (NULL, 'PARABRISA', 897),
                         (NULL, 'PASTILHA', 3320),
                         (NULL, 'BANCO', 1230);

-- Inserindo dados na tabela Ordem_Servico
DESC ORDEM_SERVICO;
INSERT INTO ORDEM_SERVICO VALUES ('2022-09-27 12:23:00', 202201, '2022-09-25 18:23:00', 'Pendente', '2022-09-28 23:23:00', NULL, 800, 'REVISAO', 'AUTORIZADO', 7);
INSERT INTO ORDEM_SERVICO VALUES ('2022-05-27 08:00:00', 202202, '2022-09-25 12:00:05', 'Pendente', '2022-09-28 20:00:20', NULL, 800, 'REVISAO', 'PENDENTE', 8);
INSERT INTO ORDEM_SERVICO VALUES ('2022-06-23 17:00:00', 202203, '2022-09-25 00:03:00', 'ANDAMENTO', '2022-09-28 19:00:00', NULL, 2500, 'CONSERTO', 'AUTORIZADO', 9);
INSERT INTO ORDEM_SERVICO VALUES ('2022-07-21 06:30:00', 202204, '2022-09-25 13:09:23', 'REALIZADO', '2022-09-28 09:00:00', NULL, 800, 'REVISAO', 'AUTORIZADO', 10);

-- SELECT:

SELECT Nome_Cliente, Telefone_Cliente, Id_Cliente, Endereco_Cliente 
FROM CLIENTES; 

-- SELECT com WHERE:
SELECT MARCA, MODELO, PLACA, Id_Cliente 
FROM VEICULOS
WHERE COR = 'PRETO';

-- ORDER BY:
SELECT Nome_Cliente, Telefone_Cliente, Id_Cliente, Endereco_Cliente 
FROM CLIENTES
ORDER BY Nome_Cliente;

-- JUNÇÃO: 
SELECT Clientes.Nome_Cliente, Clientes.Id_Cliente, Clientes.Endereco_Cliente, Veiculos.Modelo, Veiculos.Marca, Veiculos.Cor, Veiculos.Placa
FROM CLIENTES
INNER JOIN VEICULOS
ON Clientes.Id_cliente = Veiculos.Id_Cliente;







