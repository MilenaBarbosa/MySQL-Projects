-- Exibe todas as pessoas consumidoras cujos pedidos já foram enviados pelas empresas "Speedy Express" ou "United Package". Para isso, usando o banco w3schools como referência, monte uma query que exiba três colunas:
--    A primeira coluna deve possuir o alias "Nome de contato" e exibir o nome de contato da pessoa consumidora.
--    A segunda coluna deve possuir o alias "Empresa que fez o envio" e exibir o nome da empresa que efetuou o envio do pedido.
--    A terceira coluna deve possuir o alias "Data do pedido" e exibir a data que o pedido foi feito.
-- Seus resultados devem estar ordenados pelo nome de contato da pessoa consumidora em ordem alfabética. Em caso de empate no nome de contato, ordene os resultados pelo nome da empresa que fez o envio do produto em ordem alfabética e caso há empresas com o mesmo nome, ordene os resultados pela data do pedido em ordem crescente.

SELECT customers.contactname AS 'Nome de contato',
shippers.shippername AS 'Empresa que fez o envio',
orders.orderdate AS 'Data do pedido'
FROM w3schools.orders
INNER JOIN w3schools.shippers
ON orders.shipperid = shippers.shipperid
INNER JOIN w3schools.customers
ON orders.CustomerID = customers.CustomerID
WHERE shippers.shippername IN ('Speedy Express', 'United Package')
ORDER BY customers.contactname, shippers.shippername, orders.orderdate;
