CREATE DATABASE db_pizzaria_will;
USE db_pizzaria_legal;
CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);
CREATE TABLE tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ingredientes TEXT NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    tamanho VARCHAR(10) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);
INSERT INTO tb_categorias (nome, descricao) VALUES
('Tradicional', 'Pizzas com sabores tradicionais'),
('Especial', 'Pizzas com ingredientes especiais'),
('Doce', 'Pizzas doces'),
('Vegana', 'Pizzas sem ingredientes de origem animal'),
('Light', 'Pizzas com ingredientes leves e saudáveis');
INSERT INTO tb_pizzas (nome, ingredientes, valor, tamanho, id_categoria) VALUES
('Margherita', 'Tomate, Mussarela, Manjericão', 40.00, 'Média', 1),
('Calabresa', 'Calabresa, Cebola, Azeitona', 45.00, 'Grande', 1),
('Frango com Catupiry', 'Frango, Catupiry, Milho', 50.00, 'Grande', 2),
('Chocolate', 'Chocolate, Morango', 35.00, 'Média', 3),
('Vegetariana', 'Abobrinha, Berinjela, Tomate', 42.00, 'Média', 4),
('Quatro Queijos', 'Mussarela, Parmesão, Gorgonzola, Catupiry', 55.00, 'Grande', 2),
('Palmito', 'Palmito, Azeitona, Cebola', 48.00, 'Média', 4),
('Peito de Peru', 'Peito de Peru, Cream Cheese, Rúcula', 52.00, 'Grande', 5);
SELECT * FROM tb_pizzas WHERE valor > 45.00;
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';
SELECT p.id, p.nome, p.ingredientes, p.valor, p.tamanho, c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;
SELECT p.id, p.nome, p.ingredientes, p.valor, p.tamanho, c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Doce';
