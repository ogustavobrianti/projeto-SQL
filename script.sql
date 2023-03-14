CREATE DATABASE Loja1;

-- Usando o banco de dados
USE Loja1;

drop TABLE ItensPedido;

CREATE TABLE Clientes (
    CodCliente INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    TelefoneCelular VARCHAR(11) NOT NULL UNIQUE,
    Cidade VARCHAR(50) DEFAULT 'Itapira'
);

-- Criando a tabela Pedidos
CREATE TABLE Pedidos (
    CodPedido INT PRIMARY KEY,
    DataPedido DATE NOT NULL,
    CodCliente INT NOT NULL,
    CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (CodCliente) REFERENCES Clientes(CodCliente)
);

-- Criando a tabela Produtos
CREATE TABLE Produtos (
    CodProduto INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL
);

-- Criando a tabela ItensPedido
CREATE TABLE ItensPedido (
    CodPedido INT NOT NULL,
    CodProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    CONSTRAINT PK_ItensPedido PRIMARY KEY (CodPedido, CodProduto),
    CONSTRAINT FK_ItensPedido_Pedidos FOREIGN KEY (CodPedido) REFERENCES Pedidos(CodPedido),
    CONSTRAINT FK_ItensPedido_Produtos FOREIGN KEY (CodProduto) REFERENCES Produtos(CodProduto)
);