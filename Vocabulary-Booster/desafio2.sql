-- Com base em todos os cargos presentes, queremos categorizar o nível de remuneração de cada cargo. Utilizando o banco hr como referência, seu relatório deve possuir as seguintes colunas:
-- A primeira coluna deve possuir o alias "Cargo" e exibir o nome do cargo.
-- A segunda coluna deve possuir o alias "Nível" e exibir o nível de remuneração do cargo com base no seu salário máximo, categorizando os níveis de remuneração da seguinte forma:
--    Salário máximo entre 5000 e 10000 -> Baixo
--    Salário máximo entre 10001 e 20000 -> Médio
--    Salário máximo entre 20001 e 30000 -> Alto
--    Salário máximo acima de 30000 -> Altíssimo
-- Os resultados devem estar ordenados pelo nome do cargo em ordem alfabética.

SELECT job_title AS 'Cargo',
CASE
WHEN max_salary BETWEEN 5000 AND 10000 THEN 'Baixo'
WHEN max_salary BETWEEN 10001 AND 20000 THEN 'Médio'
WHEN max_salary BETWEEN 20001 AND 30000 THEN 'Alto'
WHEN max_salary > 30000 THEN 'Altíssimo'
END AS 'Nível'
FROM hr.jobs
ORDER BY job_title;
