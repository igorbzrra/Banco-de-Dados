use cemiterio;

CREATE TABLE Quadra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
    nome VARCHAR(255),
    metragem DECIMAL(10, 2)
);

CREATE TABLE Proprietario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    pagamento_completo BOOLEAN
);

CREATE TABLE Lote (
    id INT PRIMARY KEY AUTO_INCREMENT,
    proprietario_id INT,
    quadra_id INT,
    data_compra DATE,
    pagamento_completo BOOLEAN,
    FOREIGN KEY (proprietario_id) REFERENCES Proprietario(id),
    FOREIGN KEY (quadra_id) REFERENCES Quadra(id)
);

CREATE TABLE PessoaEnterrada (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    data_obito DATE,
    data_enterro DATE,
    data_nascimento DATE,
    grau_parentesco VARCHAR(255),
    proprietario_id INT,
    FOREIGN KEY (proprietario_id) REFERENCES Proprietario(id)
);

CREATE TABLE Jazigo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    lote_id INT,
    ocupado BOOLEAN,
    pessoa_enterrada_id INT,
    FOREIGN KEY (lote_id) REFERENCES Lote(id),
    FOREIGN KEY (pessoa_enterrada_id) REFERENCES PessoaEnterrada(id)
);

CREATE INDEX idx_proprietario_nome ON Proprietario(nome);
CREATE INDEX idx_lote_proprietario_id ON Lote(proprietario_id);
CREATE INDEX idx_jazigo_lote_id ON Jazigo(lote_id);

INSERT INTO Quadra (numero, nome, metragem) VALUES (1, 'Quadra A', 100.5);
INSERT INTO Proprietario (nome, pagamento_completo) VALUES ('João Silva', TRUE);

UPDATE Quadra SET nome = 'Quadra A1' WHERE id = 1;

DELETE FROM Quadra WHERE id = 1;
