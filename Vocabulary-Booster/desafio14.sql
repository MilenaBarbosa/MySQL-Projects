-- Sabemos que tanto as pessoas consumidoras quanto as empresas fornecedoras de produtos possuem países cadastrados. Logo, considerando o 
-- conjunto formado por essas pessoas e empresas, queremos saber quais são os cinco primeiros países distintos, em ordem alfabética, 
-- presentes nesse conjunto. Usando o banco w3schools como referência, monte uma query que exiba uma coluna, com o alias "País", que deve 
-- mostrar o nome do país.

SELECT Country AS `País` FROM customers
UNION
SELECT Country AS `País` FROM suppliers
ORDER BY `País` LIMIT 5;
