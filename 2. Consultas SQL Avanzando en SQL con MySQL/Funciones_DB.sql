SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE PROCEDURE `cursor_1`()
BEGIN
DECLARE vnombre VARCHAR(50);
DECLARE c CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes LIMIT 4;
OPEN c;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
FETCH c INTO vnombre;
SELECT vnombre;
CLOSE c;
END$$
DELIMITER ;

CALL cursor_1;

DELIMITER $$
CREATE PROCEDURE `cursor_looping`()
BEGIN
DECLARE fin_c INT DEFAULT 0;
DECLARE vnombre VARCHAR(50);
DECLARE c CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET fin_c = 1;
OPEN c;
WHILE fin_c = 0
DO
FETCH c INTO vnombre;
IF fin_c = 0 
THEN SELECT vnombre;
END IF;
END WHILE;
CLOSE c;
END$$
DELIMITER ;

CALL cursor_looping;

DELIMITER $$
CREATE PROCEDURE `cursor_looping_varios_campos`()
BEGIN
DECLARE fin_c INT DEFAULT 0;
DECLARE vbarrio, vciudad, vestado, vcp VARCHAR(50);
DECLARE vnombre, vdireccion VARCHAR(150);
DECLARE c CURSOR FOR SELECT NOMBRE, DIRECCION_1, BARRIO, CIUDAD, ESTADO, CP FROM tabla_de_clientes;
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET fin_c = 1;
OPEN c;
WHILE fin_c = 0
DO
FETCH c INTO vnombre, vdireccion, vbarrio, vciudad, vestado, vcp;
IF fin_c = 0 
THEN SELECT CONCAT(vnombre, ' Dirección: ', vdireccion, " - ", vbarrio, ' - ', vciudad, ' - ', vestado, ' - ',vcp) AS RESULTADO;
END IF;
END WHILE;
CLOSE c;
END$$
DELIMITER ;

CALL cursor_looping_varios_campos;

DELIMITER $$
CREATE FUNCTION `f_define_sabor`(vsabor VARCHAR(40)) RETURNS varchar(40) CHARSET utf8mb4
BEGIN
DECLARE vretorno VARCHAR(40) DEFAULT "";
CASE vsabor
WHEN 'Maracuyá' THEN SET vretorno = 'Muy Rico';
WHEN 'Limón' THEN SET vretorno = 'Muy Rico';
WHEN 'Frutilla' THEN SET vretorno = 'Muy Rico';
WHEN 'Uva' THEN SET vretorno = 'Muy Rico';
WHEN 'Sandía' THEN SET vretorno = 'Normal';
WHEN 'Mango' THEN SET vretorno = 'Normal';
ELSE SET vretorno = 'Jugos comunes';
END CASE;
RETURN vretorno;
END$$
DELIMITER ;

SELECT f_define_sabor('Maracuyá');

SELECT NOMBRE_DEL_PRODUCTO, SABOR, f_define_sabor(SABOR) AS TIPO
FROM tabla_de_productos;