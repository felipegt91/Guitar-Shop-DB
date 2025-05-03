-- Criação do banco de dados
CREATE DATABASE guitar_shop_db;
USE guitar_shop_db;

-- Tabela de produtos (guitarras)
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- elétrica, acústica, clássica, etc
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
    cliente_nome VARCHAR(100) NOT NULL,
    cliente_email VARCHAR(100),
    cliente_telefone VARCHAR(20),
    data_pedido DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pendente',
    total DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(30)
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

-- Inserção de dados na tabela produtos (guitarras)
INSERT INTO produtos (modelo, marca, tipo, madeira_corpo, madeira_braco, num_cordas, preco, estoque, data_cadastro) VALUES
('Stratocaster', 'Fender', 'elétrica', 'Alder', 'Maple', 6, 4500.00, 5, '2025-01-15'),
('Les Paul', 'Gibson', 'elétrica', 'Mahogany', 'Mahogany', 6, 8500.00, 3, '2025-02-10'),
('D-28', 'Martin', 'acústica', 'Rosewood', 'Mahogany', 6, 12000.00, 2, '2025-01-20');

-- Inserção de dados na tabela pedidos
INSERT INTO pedidos (cliente_nome, cliente_email, cliente_telefone, data_pedido, status, total, forma_pagamento) VALUES
('Pedro Santos', 'pedro@email.com', '(11) 9999-8888', '2025-05-01 14:30:00', 'entregue', 4500.00, 'cartão crédito'),
('Ana Costa', 'ana@email.com', '(21) 7777-6666', '2025-05-02 16:45:00', 'processando', 17000.00, 'boleto'),
('Lucas Oliveira', NULL, '(31) 8888-9999', '2025-05-03 10:20:00', 'pendente', 12000.00, 'pix');

-- Inserção de dados na tabela itens_pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 4500.00),
(2, 2, 2, 8500.00),
(3, 3, 1, 12000.00);