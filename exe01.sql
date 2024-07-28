CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;
CREATE TABLE tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);
CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);
INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Forte e resistente, especializado em combate corpo a corpo'),
('Mago', 'Usa magia para atacar e se defender'),
('Arqueiro', 'Especialista em ataques à distância'),
('Ladino', 'Ágil e furtivo, especialista em ataques rápidos'),
('Paladino', 'Combina habilidades de combate corpo a corpo e magia de cura');
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, id_classe) VALUES
('Arthas', 10, 2500, 1500, 1),
('Jaina', 15, 3000, 1200, 2),
('Sylvanas', 12, 2000, 1000, 3),
('Valeera', 14, 2200, 800, 4),
('Uther', 18, 2700, 2000, 5),
('Thrall', 20, 3200, 1800, 1),
('Gul\'dan', 22, 3300, 1100, 2),
('Tyrande', 16, 2100, 1300, 3);
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';
SELECT p.id, p.nome, p.nivel, p.poder_ataque, p.poder_defesa, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id;
SELECT p.id, p.nome, p.nivel, p.poder_ataque, p.poder_defesa, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id
WHERE c.nome = 'Mago';
