-- Crie uma procedure chamada albuns_do_artista que recebe como parâmetro o nome de uma pessoa artista e em retorno deve exibir as seguintes colunas:
--    O nome da pessoa artista, com o alias "artista".
--    O nome do álbum, com o alias "album".
-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.

USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(50))
BEGIN
SELECT artists.name AS `artista`, albuns.title AS `album`
FROM albuns
INNER JOIN artists
ON artists.id = albuns.artist_id AND artists.name = artist_name;
END $$

DELIMITER ;
