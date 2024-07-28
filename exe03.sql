CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;
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
('Medicamentos', 'Produtos utilizados para tratar doenças'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais'),
('Suplementos', 'Produtos para suplementação alimentar'),
('Higiene', 'Produtos para higiene pessoal'),
('Ortopedia', 'Produtos ortopédicos');
INSERT INTO tb_produtos (nome, descricao, preco, id_categoria) VALUES
('Paracetamol', 'Medicamento para alívio da dor e febre', 25.00, 1),
('Shampoo', 'Produto para limpeza e cuidado dos cabelos', 15.00, 2),
('Vitaminas', 'Suplemento alimentar com vitaminas essenciais', 35.00, 3),
('Sabonete', 'Produto para higiene pessoal', 5.00, 4),
('Muletas', 'Apoio ortopédico para locomoção', 120.00, 5),
('Ibuprofeno', 'Medicamento anti-inflamatório e analgésico', 40.00, 1),
('Creme Hidratante', 'Produto para hidratação da pele', 50.00, 2),
('Whey Protein', 'Suplemento alimentar para ganho de massa muscular', 90.00, 3);
SELECT * FROM tb_produtos WHERE preco > 50.00;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
SELECT p.id, p.nome, p.descricao, p.preco, c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;
SELECT p.id, p.nome, p.descricao, p.preco, c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Cosméticos';
