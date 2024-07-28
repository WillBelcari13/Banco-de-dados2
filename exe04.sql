CREATE DATABASE db_Will_das_carnes;
USE db_will_das_carnes;
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);
CREATE TABLE tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);
INSERT INTO tb_categorias (nome, descricao) VALUES
('Carnes Bovinas', 'Carnes de bovinos'),
('Carnes Suínas', 'Carnes de suínos'),
('Aves', 'Carnes de aves'),
('Peixes e Frutos do Mar', 'Peixes e frutos do mar'),
('Embutidos', 'Salsichas, linguiças e outros embutidos');
INSERT INTO tb_produtos (nome, descricao, preco, id_categoria) VALUES
('Picanha', 'Corte nobre de carne bovina', 90.00, 1),
('Costela Suína', 'Costela de porco temperada', 45.00, 2),
('Frango', 'Frango inteiro', 25.00, 3),
('Salmão', 'Filé de salmão', 75.00, 4),
('Linguiça', 'Linguiça calabresa', 30.00, 5),
('Contrafilé', 'Corte de carne bovina', 80.00, 1),
('Bacon', 'Fatias de bacon defumado', 35.00, 2),
('Peito de Peru', 'Peito de peru defumado', 55.00, 3);
SELECT * FROM tb_produtos WHERE preco > 50.00;
SELECT * FROM tb_produtos WHERE preco BETWEEN 30.00 AND 80.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
SELECT p.id, p.nome, p.descricao, p.preco, c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;
SELECT p.id, p.nome, p.descricao, p.preco, c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Carnes Bovinas';
