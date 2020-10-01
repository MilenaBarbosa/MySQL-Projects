-- Crie uma função chamada buscar_quantidade_de_empregos_por_funcionario no banco de dados hr que, ao receber o email de uma pessoa 
-- funcionária, retorne a quantidade de empregos presentes em seu histórico. Confirme que sua função retorna o valor 2 ao ser chamada 
-- passando uma pessoa funcionária cujo email é "NKOCHHAR".

USE hr;

DELIMITER $$

CREATE FUNCTION buscar_quantidade_de_empregos_por_funcionario(func_email varchar(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE id int;
DECLARE quant int;

SELECT EMPLOYEE_ID
FROM hr.employees
WHERE EMAIL = func_email INTO id;

SELECT COUNT(*)
FROM hr.job_history
WHERE EMPLOYEE_ID = id INTO quant;

RETURN quant;
END $$

DELIMITER ;
