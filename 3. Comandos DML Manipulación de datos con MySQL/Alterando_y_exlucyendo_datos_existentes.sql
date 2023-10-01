-- ALTERANDO Y EXCLUYENDO DATOS EXISTENTES

SELECT * FROM tb_producto;

UPDATE tb_producto SET PRECIO_LISTA= 5 WHERE CODIGO = '1000889';

UPDATE tb_producto SET DESCRIPCION= 'Sabor de la Montaña',
TAMANO= '1 Litro', ENVASE = 'Botella PET' WHERE 
CODIGO = '1000889';

SELECT * FROM tb_cliente;
UPDATE tb_cliente SET VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;

USE ventas_jugos;

UPDATE tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3)
SET A.DE_VACACIONES = B.VACACIONES;

INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA) 
VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);
         
         
DELETE FROM tb_producto WHERE CODIGO = '1001000';

DELETE FROM tb_producto WHERE TAMANO = '1 Litro';

/* Lo que aprendimos
PRÓXIMA ACTIVIDAD

Lo que aprendimos en esta aula:

A alterar y a excluir datos de una tabla, a través de comando o en lotes;
Vimos que podemos alterar o excluir todos los datos de una tabla;
Lo que es una transacción y como podemos deshacer modificaciones efectuadas anteriormente en la base de datos. */



