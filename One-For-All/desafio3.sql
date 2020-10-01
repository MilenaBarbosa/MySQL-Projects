-- Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa com base no seu histórico de reprodução.
-- Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética e em caso de empate no nome os resultados devem ser ordenados pelo nome da canção em ordem alfabética.

CREATE VIEW historico_reproducao_usuarios AS
SELECT u.name AS `usuario`, s.title AS `nome`
FROM SpotifyClone.users AS u
INNER JOIN reproduction_history AS rh
ON rh.user_id = u.id
INNER JOIN SpotifyClone.songs AS s
ON s.id = rh.song_id
ORDER BY `usuario`, `nome`;
