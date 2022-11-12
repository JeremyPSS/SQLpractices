select *
from PRODUCTO
where IdCategoria=3

select IdProducto, IdCategoria, Nombre,PrecioVenta,StockActual,PrecioVenta*StockActual as totalRecibir
from PRODUCTO

//mostrar columa de idcategoria mostrando el nombre de la categoria y no la id
select PRODUCTO.IdProducto,CATEGORIA.Categoria, PRODUCTO.Nombre,PRODUCTO.PrecioProveedor,PRODUCTO.StockActual,PRODUCTO.StockMinimo,PRODUCTO.PrecioVenta
from PRODUCTO inner join  CATEGORIA on PRODUCTO.IdCategoria = CATEGORIA.IdCategoria

//ganancia de prudctos
select IdProducto,Nombre,PrecioProveedor,PrecioVenta,StockActual,(PrecioVenta-PrecioProveedor)*StockActual as Ganancia
from PRODUCTO

//cantidad de filas
select COUNT(IdProducto) as Cantidaddeelementos
from PRODUCTO

//contar productor que sean de las categoria 3
select count(IdProducto) as NumeroDeCategoria3
from PRODUCTO where IdCategoria=3


//cuanto le he pagado al proveedor
select SUM(PrecioProveedor) as ValorPagadoProveedor
from PRODUCTO

//Calcular la ganacia y sumar todas esas ganancias en una sola fila
select SUM((PrecioVenta-PrecioProveedor)*StockActual) as GanaciaTotalDeVentas
from PRODUCTO


//insertar un valor donde la idcategoria se genera sola por eso no se la pone
insert into CATEGORIA(Categoria,Descripcion) values ('Bebidas','Corresponde a todas las bebidas')

------------------------
UPDATE nombre_tabla
SET columna1 = valor1, columna2 = valor2
WHERE columna3 = valor3
http://sql.11sql.com/sql-delete.htm

//editar un elemento de la fila
update CATEGORIA set Descripcion = 'nose' where IdCategoria=10
-----------------
DELETE FROM nombre_tabla
WHERE nombre_columna = valor


delete from CATEGORIA where IdCategoria=10
----------------
//mostrando una vista
select * 
from [dbo].[VProductoCategoria]
