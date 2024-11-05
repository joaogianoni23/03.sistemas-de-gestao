/*Realizei pelo bloco de notas, porém transferi para o vscode*/

CREATE DATABASE clinica_medica;

CREATE TABLE pacientes (
id_paciente SERIAL PRIMARY KEY,
nome VARCHAR(100),
idade INT,
email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE medicos (
id_medico SERIAL PRIMARY KEY,
nome VARCHAR (100),
especialidade VARCHAR(100)
);

SELECT * FROM medicos;

INSERT INTO pacientes (nome, idade, email) VALUES
('Matheus Couto', 39, 'mateuscouto@gmail.com'),
('João Vitor', 17, 'joaogianoni@gmail.com'),
('Bruno Quintino', 7, 'bruninhopro@gmail.com'),
('Giovanni Gonçalves', 31, 'rayssalagem@gmail.com'),
('Caio Larcerda', 56, 'caiolacerda@gmail.com'),
('Vitor Sampaio', 10, 'vitrusampas@gmail.com'),
('Rafael Sampaio', 98, 'rafinhasampaulo@gmail.com'),
('Giovanna Fortes', 19, 'gigizinhalinda@gmail.com'),
('Roger Guedes', 27, 'rogerguedes@gmail.com');

INSERT INTO medicos (nome, especialidade) VALUES
('Marcelo Gianoni', 'Pediatra'),
('Thiago Ferreira', 'Neurologista'),
('Felipe Santos', 'Ortopedista'),
('Vinicius Valverde', 'Dermatologista'),
('Miguel Sarti', 'Endocrinologista'),
('Talles Gonçalves', 'Cirurgião'),
('Talles Magno', 'Radiologista'),
('Yuri Alberto', 'Urologista'),
('Hugo Souza', 'Psiquiatra'),
('Memphis Depay', 'Oftamologista');

CREATE TABLE consultas (
id_consulta SERIAL PRIMARY KEY,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
data_consulta DATE,
CONSTRAINT fk_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (1, 1, '2024-07-21');
INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (2, 2, '2024-05-22');
INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (3, 3, '2023-12-12');
INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (4, 4, '2024-01-07');
INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (5, 5, '2024-04-13');
INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (6, 6, '2024-09-22');
INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (7, 7, '2024-09-14');
INSERT INTO consultas (id_paciente, id_medico, data_consulta) VALUES (8, 8, '2024-12-25');

/*Mostra todas as consultas*/
SELECT 
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    c.data_consulta,
    m.especialidade
FROM 
    consultas c
JOIN 
    pacientes p ON c.id_paciente = p.id_paciente
JOIN 
    medicos m ON c.id_medico = m.id_medico;

/*Mostra pacientes sem consultas*/
SELECT 
    p.nome, 
    p.idade, 
    p.email
FROM 
    pacientes p
LEFT JOIN 
    consultas c ON p.id_paciente = c.id_paciente
WHERE 
    c.id_consulta IS NULL;

/*Mostra médicos sem consultas*/
SELECT 
    m.nome, 
    m.especialidade
FROM 
    medicos m
LEFT JOIN 
    consultas c ON m.id_medico = c.id_medico
WHERE 
    c.id_consulta IS NULL;

