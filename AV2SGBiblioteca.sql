CREATE SCHEMA IF NOT EXISTS `AV2SGBIBLIOTECA`;
USE `AV2SGBIBLIOTECA` ;

-- Tabela pessoa
CREATE TABLE IF NOT EXISTS `AV2SGBIBLIOTECA`.`pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `email` VARCHAR(100) NULL,
  `telefone` VARCHAR(15) NULL,
  `nacionalidade` VARCHAR(50) NULL,
  `endereco` TEXT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Tabela autores
CREATE TABLE IF NOT EXISTS `AV2SGBIBLIOTECA`.`autores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_escrita` VARCHAR(50) NOT NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_autores_pessoa_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_autores_pessoa`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `AV2SGBIBLIOTECA`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela livro
CREATE TABLE IF NOT EXISTS `AV2SGBIBLIOTECA`.`livro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_livro` VARCHAR(200) NOT NULL,
  `genero_livro` VARCHAR(100) NOT NULL,
  `autores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_livro_autores1_idx` (`autores_id` ASC) VISIBLE,
  CONSTRAINT `fk_livro_autores1`
    FOREIGN KEY (`autores_id`)
    REFERENCES `AV2SGBIBLIOTECA`.`autores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela usuarios
CREATE TABLE IF NOT EXISTS `AV2SGBIBLIOTECA`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_cadastro` DATETIME NOT NULL,
  `aciduidade` VARCHAR(100) NOT NULL DEFAULT 'SEM REGISTRO',
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_pessoa1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `AV2SGBIBLIOTECA`.`pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table reservas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AV2SGBIBLIOTECA`.`reservas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_reserva` VARCHAR(100) NULL DEFAULT 'Nenhum Registro',
  `status_reserva` VARCHAR(100) NULL,
  `disponibilidade` VARCHAR(100) NULL DEFAULT 'Disponível',
  `livro_id` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reservas_livro1_idx` (`livro_id` ASC) VISIBLE,
  INDEX `fk_reservas_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_livro1`
    FOREIGN KEY (`livro_id`)
    REFERENCES `AV2SGBIBLIOTECA`.`livro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `AV2SGBIBLIOTECA`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Tabela emprestimo
CREATE TABLE IF NOT EXISTS `AV2SGBIBLIOTECA`.`emprestimo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_emprestimo` VARCHAR(100) NULL,
  `data_devolucao_prevista` VARCHAR(100) NULL,
  `data_devolucao_real` VARCHAR(100) NULL,
  `staus` VARCHAR(100) NULL,
  `livro_id` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_emprestimo_livro1_idx` (`livro_id` ASC) VISIBLE,
  INDEX `fk_emprestimo_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_emprestimo_livro1`
    FOREIGN KEY (`livro_id`)
    REFERENCES `AV2SGBIBLIOTECA`.`livro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `AV2SGBIBLIOTECA`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

ALTER TABLE AV2SGBIBLIOTECA.pessoa MODIFY COLUMN telefone VARCHAR(15) NULL;

-- INSERSÕES --

-- Inserções na tabela pessoa
INSERT INTO pessoa (nome, email, telefone, nacionalidade, endereco) VALUES
('Amancio Joaquim Chacon', 'amancio.chacon@email.com', '11987654321', 'Brasileiro', 'Rua das Flores, 123, São Paulo, SP'),
('Terezinha Alves Chacon', 'terezinha.chacon@email.com', '21987654321', 'Brasileira', 'Av. Brasil, 456, Rio de Janeiro, RJ'),
('Eraldo Alves Chacon', 'eraldo.chacon@email.com', '31987654321', 'Brasileiro', 'Rua do Sol, 789, Belo Horizonte, MG'),
('Ana Silva', 'ana.silva@email.com', '41987654321', 'Brasileira', 'Rua da Paz, 101, Curitiba, PR'),
('Bruno Costa', 'bruno.costa@email.com', '51987654321', 'Brasileiro', 'Av. Central, 202, Porto Alegre, RS'),
('Carla Mendes', 'carla.mendes@email.com', '61987654321', 'Brasileira', 'Rua das Acácias, 303, Salvador, BA'),
('Daniel Ferreira', 'daniel.ferreira@email.com', '71987654321', 'Brasileiro', 'Rua do Mar, 404, Recife, PE'),
('Elisa Oliveira', 'elisa.oliveira@email.com', '81987654321', 'Brasileira', 'Av. do Forte, 505, Fortaleza, CE'),
('Felipe Almeida', 'felipe.almeida@email.com', '91987654321', 'Brasileiro', 'Rua da Esperança, 606, Manaus, AM'),
('Gabriela Santos', 'gabriela.santos@email.com', '11976543210', 'Brasileira', 'Rua das Palmeiras, 707, São Paulo, SP'),
('Hugo Pereira', 'hugo.pereira@email.com', '21976543210', 'Brasileiro', 'Av. Atlântica, 808, Rio de Janeiro, RJ'),
('Isabela Lima', 'isabela.lima@email.com', '31976543210', 'Brasileira', 'Rua da Liberdade, 909, Belo Horizonte, MG'),
('João Souza', 'joao.souza@email.com', '41976543210', 'Brasileiro', 'Av. das Nações, 1010, Curitiba, PR'),
('Kelly Ribeiro', 'kelly.ribeiro@email.com', '51976543210', 'Brasileira', 'Rua do Campo, 1111, Porto Alegre, RS'),
('Lucas Martins', 'lucas.martins@email.com', '61976543210', 'Brasileiro', 'Rua das Estrelas, 1212, Salvador, BA'),
('Marina Gomes', 'marina.gomes@email.com', '71976543210', 'Brasileira', 'Rua do Horizonte, 1313, Recife, PE'),
('Nelson Rocha', 'nelson.rocha@email.com', '81976543210', 'Brasileiro', 'Av. do Sol, 1414, Fortaleza, CE'),
('Olga Duarte', 'olga.duarte@email.com', '91976543210', 'Brasileira', 'Rua da Aurora, 1515, Manaus, AM'),
('Pedro Santos', 'pedro.santos@email.com', '11965432109', 'Brasileiro', 'Rua da Praia, 1616, São Paulo, SP'),
('Renata Lima', 'renata.lima@email.com', '21965432109', 'Brasileira', 'Av. do Parque, 1717, Rio de Janeiro, RJ'),
('Sofia Almeida', 'sofia.almeida@email.com', '31965432109', 'Brasileira', 'Rua da Colina, 1818, Belo Horizonte, MG'),
('Tiago Ferreira', 'tiago.ferreira@email.com', '41965432109', 'Brasileiro', 'Av. da Serra, 1919, Curitiba, PR'),
('Vanessa Costa', 'vanessa.costa@email.com', '51965432109', 'Brasileira', 'Rua do Vale, 2020, Porto Alegre, RS'),
('Wagner Oliveira', 'wagner.oliveira@email.com', '61965432109', 'Brasileiro', 'Rua do Bosque, 2121, Salvador, BA'),
('Yasmin Ribeiro', 'yasmin.ribeiro@email.com', '71965432109', 'Brasileira', 'Av. do Rio, 2222, Recife, PE'),
('Zé Carlos', 'ze.carlos@email.com', '81965432109', 'Brasileiro', 'Rua do Lago, 2323, Fortaleza, CE'),
('Alice Mendes', 'alice.mendes@email.com', '91965432109', 'Brasileira', 'Rua do Céu, 2424, Manaus, AM'),
('Bernardo Souza', 'bernardo.souza@email.com', '11954321098', 'Brasileiro', 'Av. da Lua, 2525, São Paulo, SP'),
('Clara Pereira', 'clara.pereira@email.com', '21954321098', 'Brasileira', 'Rua do Arco, 2626, Rio de Janeiro, RJ'),
('Diego Martins', 'diego.martins@email.com', '31954321098', 'Brasileiro', 'Rua da Ponte, 2727, Belo Horizonte, MG'),
('Eduarda Lima', 'eduarda.lima@email.com', '41954321098', 'Brasileira', 'Av. do Campo, 2828, Curitiba, PR'),
('Fábio Rocha', 'fabio.rocha@email.com', '51954321098', 'Brasileiro', 'Rua da Floresta, 2929, Porto Alegre, RS'),
('Giselle Duarte', 'giselle.duarte@email.com', '61954321098', 'Brasileira', 'Rua do Jardim, 3030, Salvador, BA'),
('Henrique Gomes', 'henrique.gomes@email.com', '71954321098', 'Brasileiro', 'Av. do Mar, 3131, Recife, PE'),
('Inês Santos', 'ines.santos@email.com', '81954321098', 'Brasileira', 'Rua da Prainha, 3232, Fortaleza, CE'),
('Júlia Almeida', 'julia.almeida@email.com', '91954321098', 'Brasileira', 'Rua do Porto, 3333, Manaus, AM'),
('Kauã Ferreira', 'kaua.ferreira@email.com', '11943210987', 'Brasileiro', 'Av. da Estrela, 3434, São Paulo, SP'),
('Lara Costa', 'lara.costa@email.com', '21943210987', 'Brasileira', 'Rua do Farol, 3535, Rio de Janeiro, RJ'),
('Mateus Oliveira', 'mateus.oliveira@email.com', '31943210987', 'Brasileiro', 'Av. da Cidade, 3636, Belo Horizonte, MG'),
('Natália Ribeiro', 'natalia.ribeiro@email.com', '41943210987', 'Brasileira', 'Rua do Rio, 3737, Curitiba, PR');

-- Inserções na tabela autores
INSERT INTO autores (tipo_escrita, pessoa_id) VALUES
('Romance', 1), ('Ficção Científica', 2), ('Fantasia', 3), ('Suspense', 4), ('Poesia', 5),
('História', 6), ('Biografia', 7), ('Autoajuda', 8), ('Terror', 9), ('Infantil', 10),
('Aventura', 11), ('Mistério', 12), ('Drama', 13), ('Crônica', 14), ('Ensaios', 15),
('Romance', 16), ('Ficção Científica', 17), ('Fantasia', 18), ('Suspense', 19), ('Poesia', 20),
('História', 21), ('Biografia', 22), ('Autoajuda', 23), ('Terror', 24), ('Infantil', 25),
('Aventura', 26), ('Mistério', 27), ('Drama', 28), ('Crônica', 29), ('Ensaios', 30),
('Romance', 31), ('Ficção Científica', 32), ('Fantasia', 33), ('Suspense', 34), ('Poesia', 35),
('História', 36), ('Biografia', 37), ('Autoajuda', 38), ('Terror', 39), ('Infantil', 40);

-- Inserções na tabela livro
INSERT INTO livro (nome_livro, genero_livro, autores_id) VALUES
('O Sol Desvelado', 'Romance', 1), ('Viagem ao Centro da Terra', 'Ficção Científica', 2),
('O Senhor dos Anéis', 'Fantasia', 3), ('O Silêncio dos Inocentes', 'Suspense', 4),
('Versos de Inverno', 'Poesia', 5), ('História do Brasil', 'História', 6),
('Vida de Gandhi', 'Biografia', 7), ('O Poder do Agora', 'Autoajuda', 8),
('Drácula', 'Terror', 9), ('O Pequeno Príncipe', 'Infantil', 10),
('As Aventuras de Tom Sawyer', 'Aventura', 11), ('Assassinato no Expresso Oriente', 'Mistério', 12),
('Dom Casmurro', 'Drama', 13), ('Crônicas do Cotidiano', 'Crônica', 14),
('Ensaios sobre a Modernidade', 'Ensaios', 15), ('Amor nos Tempos de Cólera', 'Romance', 16),
('Duna', 'Ficção Científica', 17), ('Harry Potter', 'Fantasia', 18),
('Psicose', 'Suspense', 19), ('Poemas do Alvorecer', 'Poesia', 20),
('História da Humanidade', 'História', 21), ('Eu, Robô', 'Biografia', 22),
('A Arte da Felicidade', 'Autoajuda', 23), ('Frankenstein', 'Terror', 24),
('A Ilha do Tesouro', 'Infantil', 25), ('Viagem ao Fim da Noite', 'Aventura', 26),
('O Caso dos Dez Negrinhos', 'Mistério', 27), ('Memórias Póstumas', 'Drama', 28),
('Crônicas de Nárnia', 'Crônica', 29), ('Ensaios Filosóficos', 'Ensaios', 30),
('Cem Anos de Solidão', 'Romance', 31), ('1984', 'Ficção Científica', 32),
('O Hobbit', 'Fantasia', 33), ('O Código Da Vinci', 'Suspense', 34),
('Cantos do Amanhã', 'Poesia', 35), ('História do Século XX', 'História', 36),
('Vida de Einstein', 'Biografia', 37), ('Pense e Enriqueça', 'Autoajuda', 38),
('It: A Coisa', 'Terror', 39), ('Peter Pan', 'Infantil', 40);

-- Inserções na tabela usuarios
INSERT INTO usuarios (data_cadastro, aciduidade, pessoa_id) VALUES
('2025-01-01 10:00:00', 'Frequente', 1), ('2025-01-02 12:00:00', 'Esporádico', 2),
('2025-01-03 14:00:00', 'Frequente', 3), ('2025-01-04 16:00:00', 'Novo', 4),
('2025-01-05 18:00:00', 'Frequente', 5), ('2025-01-06 09:00:00', 'Esporádico', 6),
('2025-01-07 11:00:00', 'Frequente', 7), ('2025-01-08 13:00:00', 'Novo', 8),
('2025-01-09 15:00:00', 'Frequente', 9), ('2025-01-10 17:00:00', 'Esporádico', 10),
('2025-01-11 19:00:00', 'Frequente', 11), ('2025-01-12 08:00:00', 'Novo', 12),
('2025-01-13 10:00:00', 'Frequente', 13), ('2025-01-14 12:00:00', 'Esporádico', 14),
('2025-01-15 14:00:00', 'Frequente', 15), ('2025-01-16 16:00:00', 'Novo', 16),
('2025-01-17 18:00:00', 'Frequente', 17), ('2025-01-18 09:00:00', 'Esporádico', 18),
('2025-01-19 11:00:00', 'Frequente', 19), ('2025-01-20 13:00:00', 'Novo', 20),
('2025-01-21 15:00:00', 'Frequente', 21), ('2025-01-22 17:00:00', 'Esporádico', 22),
('2025-01-23 19:00:00', 'Frequente', 23), ('2025-01-24 08:00:00', 'Novo', 24),
('2025-01-25 10:00:00', 'Frequente', 25), ('2025-01-26 12:00:00', 'Esporádico', 26),
('2025-01-27 14:00:00', 'Frequente', 27), ('2025-01-28 16:00:00', 'Novo', 28),
('2025-01-29 18:00:00', 'Frequente', 29), ('2025-01-30 09:00:00', 'Esporádico', 30),
('2025-01-31 11:00:00', 'Frequente', 31), ('2025-02-01 13:00:00', 'Novo', 32),
('2025-02-02 15:00:00', 'Frequente', 33), ('2025-02-03 17:00:00', 'Esporádico', 34),
('2025-02-04 19:00:00', 'Frequente', 35), ('2025-02-05 08:00:00', 'Novo', 36),
('2025-02-06 10:00:00', 'Frequente', 37), ('2025-02-07 12:00:00', 'Esporádico', 38),
('2025-02-08 14:00:00', 'Frequente', 39), ('2025-02-09 16:00:00', 'Novo', 40);

-- Inserções na tabela reservas
INSERT INTO reservas (data_reserva, status_reserva, disponibilidade, livro_id, usuarios_id) VALUES
('2025-05-01', 'Ativa', 'Reservado', 1, 1), ('2025-05-02', 'Ativa', 'Reservado', 2, 2),
('2025-05-03', 'Pendente', 'Disponível', 3, 3), ('2025-05-04', 'Ativa', 'Reservado', 4, 4),
('2025-05-05', 'Cancelada', 'Disponível', 5, 5), ('2025-05-06', 'Ativa', 'Reservado', 6, 6),
('2025-05-07', 'Pendente', 'Disponível', 7, 7), ('2025-05-08', 'Ativa', 'Reservado', 8, 8),
('2025-05-09', 'Ativa', 'Reservado', 9, 9), ('2025-05-10', 'Pendente', 'Disponível', 10, 10),
('2025-05-11', 'Ativa', 'Reservado', 11, 11), ('2025-05-12', 'Cancelada', 'Disponível', 12, 12),
('2025-05-13', 'Ativa', 'Reservado', 13, 13), ('2025-05-14', 'Pendente', 'Disponível', 14, 14),
('2025-05-15', 'Ativa', 'Reservado', 15, 15), ('2025-05-16', 'Ativa', 'Reservado', 16, 16),
('2025-05-17', 'Pendente', 'Disponível', 17, 17), ('2025-05-18', 'Ativa', 'Reservado', 18, 18),
('2025-05-19', 'Cancelada', 'Disponível', 19, 19), ('2025-05-20', 'Ativa', 'Reservado', 20, 20),
('2025-05-21', 'Ativa', 'Reservado', 21, 21), ('2025-05-22', 'Pendente', 'Disponível', 22, 22),
('2025-05-23', 'Ativa', 'Reservado', 23, 23), ('2025-05-24', 'Cancelada', 'Disponível', 24, 24),
('2025-05-25', 'Ativa', 'Reservado', 25, 25), ('2025-05-26', 'Pendente', 'Disponível', 26, 26),
('2025-05-27', 'Ativa', 'Reservado', 27, 27), ('2025-05-28', 'Ativa', 'Reservado', 28, 28),
('2025-05-29', 'Pendente', 'Disponível', 29, 29), ('2025-05-30', 'Ativa', 'Reservado', 30, 30),
('2025-05-31', 'Cancelada', 'Disponível', 31, 31), ('2025-06-01', 'Ativa', 'Reservado', 32, 32),
('2025-06-02', 'Ativa', 'Reservado', 33, 33), ('2025-06-03', 'Pendente', 'Disponível', 34, 34),
('2025-06-04', 'Ativa', 'Reservado', 35, 35), ('2025-06-05', 'Cancelada', 'Disponível', 36, 36),
('2025-06-06', 'Ativa', 'Reservado', 37, 37), ('2025-06-07', 'Pendente', 'Disponível', 38, 38),
('2025-06-08', 'Ativa', 'Reservado', 39, 39), ('2025-06-09', 'Ativa', 'Reservado', 40, 40);

-- Inserções na tabela emprestimo
INSERT INTO emprestimo (data_emprestimo, data_devolucao_prevista, data_devolucao_real, staus, livro_id, usuarios_id) VALUES
('2025-05-01', '2025-05-08', NULL, 'Emprestado', 1, 1),
('2025-05-02', '2025-05-09', '2025-05-07', 'Devolvido', 2, 2),
('2025-05-03', '2025-05-10', NULL, 'Emprestado', 3, 3),
('2025-05-04', '2025-05-11', NULL, 'Emprestado', 4, 4),
('2025-05-05', '2025-05-12', '2025-05-10', 'Devolvido', 5, 5),
('2025-05-06', '2025-05-13', NULL, 'Emprestado', 6, 6),
('2025-05-07', '2025-05-14', NULL, 'Emprestado', 7, 7),
('2025-05-08', '2025-05-15', '2025-05-13', 'Devolvido', 8, 8),
('2025-05-09', '2025-05-16', NULL, 'Emprestado', 9, 9),
('2025-05-10', '2025-05-17', NULL, 'Emprestado', 10, 10),
('2025-05-11', '2025-05-18', '2025-05-16', 'Devolvido', 11, 11),
('2025-05-12', '2025-05-19', NULL, 'Emprestado', 12, 12),
('2025-05-13', '2025-05-20', NULL, 'Emprestado', 13, 13),
('2025-05-14', '2025-05-21', '2025-05-19', 'Devolvido', 14, 14),
('2025-05-15', '2025-05-22', NULL, 'Emprestado', 15, 15),
('2025-05-16', '2025-05-23', NULL, 'Emprestado', 16, 16),
('2025-05-17', '2025-05-24', '2025-05-22', 'Devolvido', 17, 17),
('2025-05-18', '2025-05-25', NULL, 'Emprestado', 18, 18),
('2025-05-19', '2025-05-26', NULL, 'Emprestado', 19, 19),
('2025-05-20', '2025-05-27', '2025-05-25', 'Devolvido', 20, 20),
('2025-05-21', '2025-05-28', NULL, 'Emprestado', 21, 21),
('2025-05-22', '2025-05-29', NULL, 'Emprestado', 22, 22),
('2025-05-23', '2025-05-30', '2025-05-28', 'Devolvido', 23, 23),
('2025-05-24', '2025-05-31', NULL, 'Emprestado', 24, 24),
('2025-05-25', '2025-06-01', NULL, 'Emprestado', 25, 25),
('2025-05-26', '2025-06-02', '2025-05-31', 'Devolvido', 26, 26),
('2025-05-27', '2025-06-03', NULL, 'Emprestado', 27, 27),
('2025-05-28', '2025-06-04', NULL, 'Emprestado', 28, 28),
('2025-05-29', '2025-06-05', '2025-06-03', 'Devolvido', 29, 29),
('2025-05-30', '2025-06-06', NULL, 'Emprestado', 30, 30),
('2025-05-31', '2025-06-07', NULL, 'Emprestado', 31, 31),
('2025-06-01', '2025-06-08', '2025-06-06', 'Devolvido', 32, 32),
('2025-06-02', '2025-06-09', NULL, 'Emprestado', 33, 33),
('2025-06-03', '2025-06-10', NULL, 'Emprestado', 34, 34),
('2025-06-04', '2025-06-11', '2025-06-09', 'Devolvido', 35, 35),
('2025-06-05', '2025-06-12', NULL, 'Emprestado', 36, 36),
('2025-06-06', '2025-06-13', NULL, 'Emprestado', 37, 37),
('2025-06-07', '2025-06-14', '2025-06-12', 'Devolvido', 38, 38),
('2025-06-08', '2025-06-15', NULL, 'Emprestado', 39, 39),
('2025-06-09', '2025-06-16', NULL, 'Emprestado', 40, 40);

drop database av2sgbiblioteca