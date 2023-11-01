-- Cria o Schema
CREATE SCHEMA faculdade;

-- Entra no banco de dados
USE faculdade;

-- Cria a tabela `aluno`
CREATE TABLE aluno (
  num_aluno INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  tipo_aluno VARCHAR(255) NOT NULL,
  departamento VARCHAR(255) NOT NULL,
  PRIMARY KEY (num_aluno)
);

-- Cria a tabela `disciplina`
CREATE TABLE disciplina (
  num_curso VARCHAR(11) NOT NULL,
  nome_curso VARCHAR(255) NOT NULL,
  creditos INT NOT NULL,
  departamento VARCHAR(255) NOT NULL,
  PRIMARY KEY (num_curso),
  UNIQUE KEY (nome_curso)
);

-- Cria a tabela `turma`
CREATE TABLE turma (
  id_turma INT NOT NULL,
  ano INT NOT NULL,
  semestre INT NOT NULL,
  num_curso VARCHAR(11) NOT NULL,
  professor VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_turma),
  FOREIGN KEY (num_curso) REFERENCES disciplina (num_curso) ON DELETE CASCADE
);

-- Cria a tabela `historico_escolar`
CREATE TABLE historico_escolar (
  num_aluno INT NOT NULL,
  id_turma INT NOT NULL,
  nota VARCHAR(1) NOT NULL,
  PRIMARY KEY (num_aluno, id_turma),
  FOREIGN KEY (num_aluno) REFERENCES aluno (num_aluno) ON DELETE CASCADE,
  FOREIGN KEY (id_turma) REFERENCES turma (id_turma) ON DELETE CASCADE
);

-- Cria a tabela `pre_requisitos`
CREATE TABLE pre_requisitos (
  num_curso VARCHAR (11) NOT NULL,
  num_pr VARCHAR (11) NOT NULL,
  PRIMARY KEY (num_curso, num_pr),
  FOREIGN KEY (num_curso) REFERENCES disciplina (num_curso) ON DELETE CASCADE,
  FOREIGN KEY (num_pr) REFERENCES disciplina (num_curso) ON DELETE CASCADE
);


# Inserir dados na tabela ALUNO

INSERT INTO ALUNO (nome, num_aluno, tipo_aluno, departamento)
VALUES
('Silva', 17, 1, 'CC'),
('Braga', 8, 2, 'CC');

# Inserir dados na tabela DISCIPLINA

INSERT INTO DISCIPLINA (nome_curso, num_curso, creditos, departamento)
VALUES
('Introdução a Ciência da Computação', 'CC1310', 4, 'CC'),
('Estrutura de Dados', 'CC3320', 4, 'CC'),
('Matemática Discreta', 'MATH2410', 3, 'MATH'),
('Banco de Dados', 'CC3380', 3, 'CC');

# Inserir dados na tabela TURMA

# Inserir dados na tabela TURMA
INSERT INTO TURMA (id_turma, num_curso, semestre, ano, professor)
VALUES
(85, 'MATH2410', 2, 7, 'Kleber'),
(92, 'CC1310', 2, 7, 'Anderson'),
(102, 'CC3320', 1, 8, 'Carlos'),
(112, 'MATH2410', 2, 8, 'Chang'),
(119, 'CC1310', 2, 8, 'Anderson'),
(135, 'CC3380', 2, 8, 'Santos');




# Inserir dados na tabela HISTÓRICO_ESCOLAR

INSERT INTO HISTORICO_ESCOLAR (num_aluno, id_turma, nota)
VALUES
(17, 112, 'B'),
(17, 119, 'C'),
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'A');

# Inserir dados na tabela PRÉ-REQUISITOS

-- Inserir dados na tabela PRE-REQUISITOS
INSERT INTO pre_requisitos (num_curso, num_pr)
VALUES
('CC3380', 'CC3320'),
('CC3380', 'MATH2410'),
('CC3320', 'CC1310');

