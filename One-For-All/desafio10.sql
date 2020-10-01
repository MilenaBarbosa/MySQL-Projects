-- Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de músicas que estão presentes atualmente no 
-- histórico de reprodução de uma pessoa usuária. Ao receber o código identificador da pessoa, exiba a quantidade de canções em seu 
-- histórico de reprodução.

USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (user_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quant INT;
SELECT COUNT(song_id)
FROM reproduction_history
WHERE reproduction_history.user_id = user_id INTO quant;
RETURN quant;
END $$

DELIMITER ;
