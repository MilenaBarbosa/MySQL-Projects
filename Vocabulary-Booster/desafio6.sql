-- Faça um relatório que mostra o histórico de cargos das pessoas empregadas. Para isso, usando o banco hr como referência, monte uma query que exiba quatro colunas:
--    A primeira coluna deve possuir o alias "Nome completo" e exibir o nome completo da pessoa empregada (não se esqueça do espaço entre o nome e o sobrenome).
--    A segunda coluna deve possuir o alias "Cargo" e exibir o nome do cargo da pessoa.
--    A terceira coluna deve possuir o alias "Data de início do cargo" e exibir a data que a pessoa iniciou o cargo.
--    A quarta coluna deve possuir o alias "Departamento" e mostrar o nome do departamento em que a pessoa exerceu seu cargo.
-- Os resultados devem estar ordenados pelo nome completo das pessoas empregadas em ordem decrescente. Em caso de empate no nome completo, ordene os resultados pelo nome do cargo em ordem alfabética.

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Nome completo',
jobs.job_title AS 'Cargo',
job_history.start_date AS 'Data de início do cargo',
departments.department_name AS 'Departamento'
FROM hr.employees
INNER JOIN hr.job_history
ON employees.employee_id = job_history.employee_id
INNER JOIN hr.jobs
ON job_history.job_id = jobs.job_id
INNER JOIN hr.departments
ON job_history.department_id = departments.department_id
ORDER BY CONCAT(employees.first_name, ' ', employees.last_name) DESC, jobs.job_title;
