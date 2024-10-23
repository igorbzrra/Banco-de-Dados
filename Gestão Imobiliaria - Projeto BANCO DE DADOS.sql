CREATE DATABASE GestaoImobiliaria;
USE GestaoImobiliaria;

CREATE TABLE Proprietario (
    id_proprietario INT PRIMARY KEY AUTO_INCREMENT,
    nome_propietario VARCHAR(100) NOT NULL,
    cpf_propietario VARCHAR(11) NOT NULL UNIQUE,
    telefone_propietario VARCHAR(15)
);

CREATE TABLE Imovel (
    id_imovel INT PRIMARY KEY AUTO_INCREMENT,
    endereco_imovel VARCHAR(100) NOT NULL,
    tipo_imovel VARCHAR(100) NOT NULL,
    valor_imovel DECIMAL(10, 2) NOT NULL,
    status_imovel varchar(100) NOT NULL,
    id_proprietario INT,
    FOREIGN KEY (id_proprietario) REFERENCES Proprietario(id_proprietario)
);

CREATE TABLE Inquilino (
    id_inquilino INT PRIMARY KEY AUTO_INCREMENT,
    nome_inquilino VARCHAR(100) NOT NULL,
    cpf_inquilino VARCHAR(11) NOT NULL UNIQUE,
    telefone_inquilino VARCHAR(15)
);

CREATE TABLE ContratoLocacao (
    id_contrato INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio VARCHAR(45) NOT NULL,
    data_fim VARCHAR(45) NOT NULL,
    valor_aluguel DECIMAL(10, 2) NOT NULL,
    id_imovel INT,
    id_inquilino INT,
    FOREIGN KEY (id_imovel) REFERENCES Imovel(id_imovel),
    FOREIGN KEY (id_inquilino) REFERENCES Inquilino(id_inquilino)
);

CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    data_pagamento VARCHAR(45) NOT NULL,
    valor_pagamento DECIMAL(10, 2) NOT NULL,
    id_contrato INT,
    FOREIGN KEY (id_contrato) REFERENCES ContratoLocacao(id_contrato)
);

INSERT INTO Proprietario (nome_propietario, cpf_propietario, telefone_propietario) VALUES
('Carlos Silva', '12345678901', '(71) 99999-0001'),
('Ana Souza', '23456789012', '(71) 99999-0002'),
('João Almeida', '34567890123', '(71) 99999-0003'),
('Mariana Costa', '45678901234', '(71) 99999-0004'),
('Fernanda Lima', '56789012345', '(71) 99999-0005');

INSERT INTO Imovel (endereco_imovel, tipo_imovel, valor_imovel, status_imovel, id_proprietario) VALUES
('Rua A, 123', 'Apartamento', 300000.00, 'disponível', 1),
('Rua B, 456', 'Casa', 500000.00, 'alugado', 2),
('Rua C, 789', 'Comercial', 750000.00, 'disponível', 3),
('Rua D, 101', 'Apartamento', 250000.00, 'vendido', 4),
('Rua E, 102', 'Casa', 600000.00, 'disponível', 5);

INSERT INTO Inquilino (nome_inquilino, cpf_inquilino, telefone_inquilino) VALUES
('Pedro Oliveira', '67890123456', '(71) 99999-0006'),
('Maria Fernandes', '78901234567', '(71) 99999-0007'),
('José Santos', '89012345678', '(71) 99999-0008'),
('Luana Nunes', '90123456789', '(71) 99999-0009'),
('Rafael Mendes', '01234567890', '(71) 99999-0010');

INSERT INTO ContratoLocacao (data_inicio, data_fim, valor_aluguel, id_imovel, id_inquilino) VALUES
('01/04/2024', '01/04/2026', 2000.00, 2, 1),
('15/07/2023', '15/07/2024', 1500.00, 1, 2),
('10/09/2022', '10/09/2024', 3000.00, 3, 3),
('23/10/2024', '23/10/2025', 1800.00, 4, 4),
('02/03/2021', '02/03/2025', 2500.00, 5, 5);

INSERT INTO Pagamentos (data_pagamento, valor_pagamento, id_contrato) VALUES
('01/04/2024', 2000.00, 1),
('15/07/2023', 1500.00, 2),
('10/09/2022', 3000.00, 3),
('23/10/2024', 1800.00, 4),
('02/03/2021', 2500.00, 5);