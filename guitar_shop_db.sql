-- Criação do banco de dados
CREATE DATABASE guitar_shop_db;
USE guitar_shop_db;

-- Clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    endereco TEXT,
    data_cadastro DATE NOT NULL

-- Tabela de produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    madeira_corpo VARCHAR(50),
    madeira_braco VARCHAR(50),
    num_cordas INT NOT NULL DEFAULT 6,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    data_cadastro DATE NOT NULL
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pendente',
    total DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(30),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de itens do pedido
CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Clientes exemplo
INSERT INTO clientes (nome, email, telefone, endereco, data_cadastro) VALUES
('Pedro Santos', 'pedro@email.com', '(11) 9999-8888', 'Rua das Guitarras, 123 - SP', '2023-01-15'),
('Ana Costa', 'ana@email.com', '(21) 7777-6666', 'Av. das Cordas, 456 - RJ', '2023-02-10'),
('Lucas Oliveira', 'lucas@email.com', '(31) 8888-9999', 'Beco dos Amplificadores, 789 - MG', '2023-03-05');

-- Inserção de dados na tabela produtos
INSERT INTO produtos (modelo, marca, tipo, madeira_corpo, madeira_braco, num_cordas, preco, estoque, data_cadastro) VALUES
('Stratocaster', 'Fender', 'elétrica', 'Alder', 'Maple', 6, 4500.00, 5, '2025-01-15'),
('Les Paul', 'Gibson', 'elétrica', 'Mahogany', 'Mahogany', 6, 8500.00, 3, '2025-02-10'),
('D-28', 'Martin', 'acústica', 'Rosewood', 'Mahogany', 6, 12000.00, 2, '2025-01-20');

-- Inserção de dados na tabela pedidos
INSERT INTO pedidos (cliente_id, data_pedido, status, total, forma_pagamento) VALUES
(1, '2023-05-01 14:30:00', 'entregue', 4500.00, 'cartão crédito'),
(2, '2023-05-02 16:45:00', 'processando', 17000.00, 'boleto'),
(3, '2023-05-03 10:20:00', 'pendente', 12000.00, 'pix');

-- Inserção de dados na tabela itens_pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 4500.00),
(2, 2, 2, 8500.00),
(3, 3, 1, 12000.00);