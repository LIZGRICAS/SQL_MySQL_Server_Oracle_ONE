

CALL edad_clientes('50534475787');

DELIMITER $$
CREATE PROCEDURE `precio_producto`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos 
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
IF vprecio >=12 
THEN SET vresultado = 'Producto costoso.';
ELSEIF
vprecio >= 7 AND vprecio < 12
THEN SET vresultado = 'Producto asequible.';
ELSE
SET vresultado = 'Producto barato.';
END IF;
SELECT vresultado;
END$$
DELIMITER ;

CALL precio_producto('1000801');

DELIMITER $$
CREATE PROCEDURE `define_sabor`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE vsabor
WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
WHEN 'Limón' THEN SELECT 'Muy Rico';
WHEN 'Frutilla' THEN SELECT 'Muy Rico';
WHEN 'Uva' THEN SELECT 'Muy Rico';
WHEN 'Sandía' THEN SELECT 'Normal';
WHEN 'Mango' THEN SELECT 'Normal';
ELSE SELECT 'Jugos comunes';
END CASE;
END$$
DELIMITER ;

CALL define_sabor('1096818');

DELIMITER $$
CREATE PROCEDURE `define_sabor_con_error`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE vsabor
WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
WHEN 'Limón' THEN SELECT 'Muy Rico';
WHEN 'Frutilla' THEN SELECT 'Muy Rico';
WHEN 'Uva' THEN SELECT 'Muy Rico';
WHEN 'Sandía' THEN SELECT 'Normal';
WHEN 'Mango' THEN SELECT 'Normal';
END CASE;
END$$
DELIMITER ;

CALL define_sabor_con_error('1002334');

DELIMITER $$
CREATE PROCEDURE `precio_producto_case`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos 
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE 
WHEN vprecio >=12 THEN SET vresultado = 'Producto costoso.';
WHEN vprecio >= 7 AND vprecio < 12 THEN SET vresultado = 'Producto asequible.';
WHEN vprecio < 7 THEN SET vresultado = 'Producto barato.';
END CASE;
SELECT vresultado;
END $$
DELIMITER ;

CALL precio_producto_case('1000801');

CREATE TABLE tb_looping (ID INT);

SELECT * FROM tb_looping;

DELIMITER $$
CREATE PROCEDURE `looping`(vinicial INT, vfinal INT)
BEGIN
DECLARE vcontador INT;
DELETE FROM tb_looping;
SET vcontador = vinicial;
WHILE vcontador <= vfinal
DO
INSERT INTO tb_looping VALUES(vcontador);
SET vcontador = vcontador+1;
END WHILE;
SELECT * FROM tb_looping;
END$$
DELIMITER ;


SET SQL_SAFE_UPDATES = 0;
