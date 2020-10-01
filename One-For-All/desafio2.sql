-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".

CREATE VIEW estatisticas_musicais AS
SELECT COUNT(s.id) AS `cancoes`, COUNT(DISTINCT ar.id) AS `artistas`, COUNT(DISTINCT ab.id) AS `albuns`
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.albuns AS ab
ON ab.id = s.album_id
INNER JOIN SpotifyClone.artists AS ar
ON ar.id = ab.artist_id;
