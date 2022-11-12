-------------------------------------------------INSERTAR
CREATE PROCEDURA DP_InsertarProveedor
	@IdProveedor int,
	@Cedula
	....
AS
BEGIN
	insert into PROVEEDOR(IdProveedor,CedProveedor....."LosNombresdelasColumnasexactos")
	values(@IdProveedor,@Cedula,...)
END
GO //Used for saved the storesprocedure in the database, if you don't put this in the insert, sqlserver won't generate the file
----------------------------------------
exec [Nombre del procediimiento] [Valor],[Valor].....
-------------------------------------------------EDITAR
CREATE PROCEDURA DP_ActualizarProveedor
	@IdProveedor int,
	@Cedula varchar(20)
	....
AS
BEGIN
	update [tabla] set [nombredecolumna]=@IdProveedor , CedProveedor=@Cedula
	where IdProveedor=@IdProveedor
END
GO
---------------------ELIMINIAR
CREATE PROCEDURA DP_ElimIMINARProveedor
	@IdProveedor int,
AS
BEGIN
	delete PROVEEDOR where IdProveedor = @IdProveedor
END
GO
-----------------------------------------

exec [Nombre del procediimiento] [Valor],[Valor].....
select * from PROVEEDOR

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////CODE V2
ALTER PROCEDURE [dbo].[SP_ActualizarCategoria]
	@IdCategoria int,
	@Categoria varchar(30),
	@Descripcion varchar(40)
AS
BEGIN
	update dbo.CATEGORIA set Categoria=@Categoria,Descripcion=@Descripcion
	where IdCategoria=@IdCategoria

END

----------------------------------
ALTER PROCEDURE [dbo].[SP_InsertarCategoria]
	
	@Categoria varchar(20),
	@Descripcion varchar(40)
AS
BEGIN
	insert into CATEGORIA(Categoria,Descripcion)
	values(@Categoria,@Descripcion)
END
----------------------
ALTER PROCEDURE [dbo].[SP_EliminarCategoria]
	@IdCategoria int
AS
BEGIN
	delete CATEGORIA where IdCategoria=@IdCategoria
END
//////////////////////////////////////////////////////////////////////////////////////////////////////////////CODE BY TEACHER
ALTER PROCEDURE [dbo].[cp_ListarCategoria_Filtro] 
(
@Valor varchar(40)
)
AS
BEGIN
SELECT @valor = rtrim(@valor) +'%';
SELECT * FROM dbo.CATEGORIA where Categoria like @Valor OR Descripcion like @Valor	
	
END


ALTER PROCEDURE [dbo].[cp_InsertarCategoria]
(
@Cat varchar(30),
@Descp varchar(40)
)
AS
BEGIN
INSERT INTO dbo.CATEGORIA (Categoria,Descripcion) VALUES (@Cat,@Descp)
END


ALTER PROCEDURE [dbo].[cp_EliminarCategoria]
(
@Ide int
)
AS
BEGIN
DELETE dbo.CATEGORIA WHERE IdCategoria=@Ide
END


ALTER PROCEDURE [dbo].[cp_ActualizarCategoria]
(
@Ide int,
@Cat varchar(30),
@Descp varchar(40)
)
AS
BEGIN
UPDATE dbo.CATEGORIA SET Categoria=@Cat,Descripcion=@Descp
WHERE IdCategoria=@Ide
END

---------------------------
CREATE PROCEDURE SP_ListarProveedoresFiltro
(
@Valor varchar(40)
)	
AS
BEGIN
	Select @valor=RTRIM(@valor)+'%'
	select*from PROVEEDOR
	where Nombre like @Valor OR Representa like @Valor
END
GO

////////////////////////////////LISTAR UN VISTA
CREATE PROCEDURE SP_ListarProductoCateoriaFiltro
(
	@Valor varchar(40)
)	
AS
BEGIN
	Select @valor=RTRIM(@valor)+'%'
	select*from VprodCat
	where Nombre like @Valor OR Categoria like @Valor
END
GO
