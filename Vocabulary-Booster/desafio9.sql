-- Exibe todos as pessoas funcionárias que já realizaram algum pedido, mostrando também seu total de pedidos feitos. Usando o banco w3schools como referência, monte uma query que exiba duas colunas:
--    A primeira coluna deve possuir o alias "Nome completo" e exibir o nome completo da pessoa funcionária (não se esqueça do espaço entre o nome e o sobrenome).
--    A segundo coluna deve possuir o alias "Total de pedidos" e exibir a quantidade total de pedidos feitos pela pessoa.
-- Ordene seus resultados pelo total de pedidos em ordem crescente.
SELECT CONCAT(employees.firstname, ' ', employees.lastname) AS 'Nome completo', 
COUNT(orders.employeeid) AS 'Total de pedidos'
FROM w3schools.employees
INNER JOIN w3schools.orders
ON orders.employeeid = employees.employeeid
GROUP BY orders.employeeid
ORDER BY COUNT(orders.employeeid);
