-- Usando o banco hr como referência, queremos extrair informações a respeito dos salários das pessoas empregadas. Para isso, crie uma query que exiba três colunas:
--    A primeira coluna deve possuir o alias "Cargo" e exibir o nome do cargo.
--    A segunda coluna deve possuir o alias "Média salarial" e exibir a média dos salários das pessoas empregadas que possuem o cargo em questão.
--    A terceira coluna deve possuir o alias "Senioridade" e categorizar o nível de senioridade do cargo com base na média salarial, da seguinte forma:
--      Média salarial entre 2000 - 5800 -> Júnior
--      Média salarial entre 5801 - 7500 -> Pleno
--      Média salarial entre 7501 - 10500 -> Sênior
--      Média salarial acima de 10500 -> CEO
--  Devido ao fato de a média salarial ser um valor monetário, sempre que for fazer uso da média salarial, é preciso arredondá-la usando apenas duas casas decimais.
-- Os resultados devem estar ordenados pela média salarial em ordem crescente. Em caso de empate na média, os resultados devem ser ordenados pelo nome do cargo em ordem alfabética.

SELECT jobs.job_title AS 'Cargo', ROUND(AVG(employees.salary), 2) AS 'Média salarial',
CASE
WHEN ROUND(AVG(employees.salary), 2) BETWEEN 2000 AND 5800 THEN 'Júnior'
WHEN ROUND(AVG(employees.salary), 2) BETWEEN 5801 AND 7500 THEN 'Pleno'
WHEN ROUND(AVG(employees.salary), 2) BETWEEN 7501 AND 10500 THEN 'Sênior'
WHEN ROUND(AVG(employees.salary), 2) > 10500 THEN 'CEO'
END AS 'Senioridade'
FROM hr.jobs
INNER JOIN hr.employees
ON jobs.job_id = employees.job_id
GROUP BY jobs.job_title
ORDER BY ROUND(AVG(employees.salary), 2), jobs.job_title;
