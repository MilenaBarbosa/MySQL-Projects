-- Exibe todos os produtos que já foram pedidos, que possuem uma média de quantidade nos pedidos registrados acima de 20.00. Usando o banco w3schools como referência, monte uma query que exiba quatro colunas:
--    A primeira coluna deve possuir o alias "Produto" e exibir o nome do produto.
--    A segunda coluna deve possuir o alias "Mínima" e exibir a quantidade mínima que já foi pedida desse produto.
--    A segunda coluna deve possuir o alias "Máxima" e exibir a quantidade máxima que já foi pedida desse produto.
--    A quarta coluna deve deve possuir o alias "Média" e exibir a média de quantidade nos pedidos deste produto, arredondada para duas casas decimais.
-- Os resultados devem estar ordenados pela média de quantidade nos pedidos em ordem crescente. Em caso de empate na média, os resultados devem ser ordenados pelo nome do produto em ordem alfabética.

SELECT ProductName AS `Produto`, (
SELECT MIN(Quantity)
FROM w3schools.order_details
WHERE products.ProductID = order_details.ProductID
) AS `Mínima`, (
SELECT MAX(Quantity)
FROM w3schools.order_details
WHERE products.ProductID = order_details.ProductID
) AS `Máxima`, (
SELECT ROUND(AVG(Quantity), 2)
FROM w3schools.order_details
WHERE products.ProductID = order_details.ProductID
) AS `Média`
FROM w3schools.products
GROUP BY ProductID
HAVING `Média` > 20
ORDER BY `Média`, `Produto`;

-- SELECT p.ProductName AS `Produto`,
-- MIN(od.Quantity) AS `Mínima`,
-- MAX(od.Quantity) AS `Máxima`,
-- ROUND(AVG(od.Quantity), 2) AS `Média`
-- FROM w3schools.products AS p
-- INNER JOIN w3schools.order_details AS od
-- ON p.ProductID = od.ProductID
-- GROUP BY od.ProductID
-- HAVING `Média` > 20
-- ORDER BY `Média`, `Produto`;
