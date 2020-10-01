-- Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes que cada canção foi tocada por pessoas usuárias do plano familiar ou universitário, de acordo com os detalhes a seguir:
--    A primeira coluna deve exibir o nome da canção, com o alias "nome";
--    A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.

CREATE VIEW cancoes_premium AS
SELECT s.title AS `nome`, COUNT(rh.song_id) AS `reproducoes`
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.reproduction_history AS rh
ON s.id = rh.song_id
INNER JOIN SpotifyClone.users
ON users.id = rh.user_id AND users.plan_id IN (2, 3)
GROUP BY s.title
ORDER BY `nome`;
