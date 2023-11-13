USE faculdade;
SELECT
nome, tipo_aluno
FROM
aluno;

SELECT
num_curso, num_pr
FROM
pre_requisitos
ORDER BY
num_curso ASC;

SELECT
id_turma,
professor
FROM
turma
WHERE
ano = 8;

SELECT
DISTINCT professor
id_turma
FROM
turma

SELECT
professor,
num_curso
FROM
turma
WHERE
ano = 8 AND professor = 'Santos';

SELECT
professor,
num_curso,
ano
FROM
turma
WHERE
ano = 7 OR professor = 'Santos';

SELECT
professor,
num_curso,
ano
FROM
turma
WHERE
num_curso IN ('MATH2410' , 'CC1310');

SELECT
professor,
num_curso,
ano
FROM
turma
WHERE
num_curso NOT IN ('MATH2410' , 'CC1310');

SELECT 
    num_aluno
FROM
    historico_escolar
WHERE
    nota BETWEEN "A" AND "B";

SELECT
    professor
FROM
    turma
WHERE
    professor LIKE '%ber'

SELECT
    ano,
    COUNT(ano) AS 'Quantidade de turmas'
FROM
    turma
GROUP BY
    ano

SELECT 
    num_aluno,
    nota
FROM
    historico_escolar
WHERE
    id_turma IN (SELECT
                    id_turma
                FROM
                    turma
                WHERE
                    professor = 'Santos');

SELECT * 
FROM (
    SELECT id_turma 
    FROM turma 
    WHERE professor = 'Santos'
) AS derived_table
INNER JOIN historico_escolar 
ON historico_escolar.id_turma = derived_table.id_turma;

SELECT * 
FROM historico_escolar
WHERE EXISTS (
    SELECT 1 
    FROM turma 
    WHERE turma.id_turma = historico_escolar.id_turma 
    AND turma.professor = 'Santos'
);

WITH cte AS (
    SELECT id_turma 
    FROM turma 
    WHERE professor = 'Santos'
)
SELECT * 
FROM historico_escolar
INNER JOIN cte 
ON historico_escolar.id_turma = cte.id_turma;

WITH RECURSIVE cte (n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 
    FROM cte 
    WHERE n < 10
)
SELECT * FROM cte;

SELECT id_turma 
FROM historico_escolar
WHERE nota = 'A'
UNION
SELECT id_turma
FROM turma
WHERE professor = 'Santos';

SELECT id_turma 
FROM historico_escolar
WHERE nota = 'A'
EXCEPT
SELECT id_turma
FROM turma
WHERE professor = 'Santos';

SELECT id_turma 
FROM historico_escolar
WHERE nota = 'A'
INTERSECT
SELECT id_turma
FROM turma
WHERE professor = 'Santos';