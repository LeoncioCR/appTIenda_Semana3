
/* CREACION DE BASE DE DATOS */ -- Ejecutar primero

CREATE DATABASE TiendaBD;

/* SELECCIONAR LA BASE DE DATOS CREADA */ -- Ejecutar segundo, despues de crear la base de datos
 
Use TiendaBD;

/* CREACION DE TABLAS */ -- Ejecutar todo (↓↓↓)

-----------CATEGORIA------------ 

CREATE TABLE Categoria(
CategoriaId int NOT NULL IDENTITY,
NomCategoria nvarchar(120) NOT NULL,
FechCreacion datetime2 NOT NULL
);

-----------PRODUCTO------------

CREATE TABLE Producto(
ProductoId int NOT NULL IDENTITY,
NomProducto nvarchar(150) NOT NULL,
DesProducto nvarchar(200) NOT NULL,
StockProducto int NOT NULL,
Precio numeric(9,2),
FechProducto datetime2 NOT  NULL,
ImagenUrl nvarchar(200),
CategoriaId int NOT NULL
);

-----------ROL------------

CREATE TABLE Rol(
RolId int NOT NULL IDENTITY,
NombreRol nvarchar(20) NOT NULL,
EstadoRol nvarchar(8) NOT NULL
);

-----------USUARIO------------

CREATE TABLE Usuario(
UsuarioId int NOT NULL IDENTITY,
NombreUsuario nvarchar(100) NOT NULL,
TipoDocumento nvarchar(3) NOT NULL,
NumDocumento int NOT NULL,
Telefono int NOT NULL,
Clave nvarchar(50) NOT NULL,
EstadoUsuario nvarchar(8) NOT NULL,
RolId int NOT NULL
);

-----------INGRESO------------

CREATE TABLE Ingreso(
IngresoId int NOT NULL IDENTITY,
FechaIngreso datetime2 NOT NULL,
EstadoIngreso nvarchar(8) NOT NULL,
UsuarioId int NOT NULL
);

-----------DETALLE_INGRESO------------

CREATE TABLE Detalle_Ingreso(
DetalleIngresoId int NOT NULL IDENTITY,
CantidadDetaIngreso int NOT NULL,
PrecioDetaIngreso numeric(9,2) NOT NULL,
ProductoId int NOT NULL,
IngresoId int NOT NULL
);

/* CLAVES PRIMARIAS, FORANEAS Y UNIQUE */

-----------CATEGORIA------------

ALTER TABLE Categoria
ADD CONSTRAINT PK_Categoria PRIMARY KEY (CategoriaId)

-----------PRODUCTO------------

ALTER TABLE Producto
ADD CONSTRAINT PK_Producto PRIMARY KEY (ProductoId);

ALTER TABLE Producto
ADD CONSTRAINT FK_Producto_Categoria_CategoriaId FOREIGN KEY (CategoriaId)
REFERENCES Categoria (CategoriaId) ON DELETE CASCADE;

-----------ROL------------

ALTER TABLE Rol
ADD CONSTRAINT PK_Rol PRIMARY KEY (RolId);

-----------USUARIO------------

ALTER TABLE Usuario
ADD CONSTRAINT PK_Usuario PRIMARY KEY (UsuarioId);

ALTER TABLE Usuario
ADD CONSTRAINT FK_Usuario_Rol_RolId FOREIGN KEY (RolId)
REFERENCES Rol (RolId) ON DELETE CASCADE

-----------INGRESO------------

ALTER TABLE Ingreso
ADD CONSTRAINT PK_Ingreso PRIMARY KEY (IngresoId);

ALTER TABLE Ingreso
ADD CONSTRAINT PK_Ingreso_UsuarioId FOREIGN KEY (UsuarioId)
REFERENCES Usuario (UsuarioId) ON DELETE CASCADE;

-----------DETALLE_INGRESO------------

ALTER TABLE Detalle_Ingreso
ADD CONSTRAINT PK_DetalleIngreso PRIMARY KEY (DetalleIngresoId);

ALTER TABLE Detalle_Ingreso
ADD CONSTRAINT UC_DetalleIngreso_ProductoId_IngresoId UNIQUE (ProductoId, IngresoId)

ALTER TABLE Detalle_Ingreso
ADD CONSTRAINT FK_DetalleIngreso_Producto_ProductoId FOREIGN KEY (ProductoId)
REFERENCES Producto (ProductoId) ON DELETE CASCADE

ALTER TABLE Detalle_Ingreso
ADD CONSTRAINT FK_DetalleIngreso_Ingreso_IngresoId FOREIGN KEY (IngresoId)
REFERENCES Ingreso (IngresoId) ON DELETE CASCADE

/* REGISTRAMOS DATOS EN LAS TABLAS */

-----------CATEGORIA------------

INSERT INTO Categoria(NomCategoria, FechCreacion)
VALUES ('Limpieza','01-08-2023');

INSERT INTO Categoria(NomCategoria, FechCreacion)
VALUES ('Licores','02-08-2023');

INSERT INTO Categoria(NomCategoria, FechCreacion)
VALUES ('Abarrotes','03-08-2023');

-----------PRODUCTO------------

INSERT INTO Producto (NomProducto, DesProducto, StockProducto, Precio, FechProducto, CategoriaId)
VALUES ('Pisco', 'Whisky BLACK WHISKEY Botella 700ml', 20, 15.5, '02-08-2023', 2);

INSERT INTO Producto (NomProducto, DesProducto, StockProducto, Precio, FechProducto, CategoriaId)
VALUES ('Arroz', 'Arroz Extra COSTEÑO Bolsa 5Kg', 10, 5.5, '03-08-2023', 3);

INSERT INTO Producto (NomProducto, DesProducto, StockProducto, Precio, FechProducto, CategoriaId)
VALUES ('Suavitel', 'Suavizante SUAVITEL Fresca Primavera Botella 2.8L', 15, 10.5, '01-08-2023', 1);

INSERT INTO Producto (NomProducto, DesProducto, StockProducto, Precio, FechProducto, CategoriaId)
VALUES ('Suavitel', 'Suavizante SUAVITEL Fresca Primavera Botella 1L', 20, 5, '01-08-2023', 1);

-----------ROL------------

INSERT INTO Rol (NombreRol, EstadoRol)
VALUES ('Asistente Almacen','INACTIVO')

INSERT INTO Rol (NombreRol, EstadoRol)
VALUES ('Jefe Almacen','ACTIVO')

INSERT INTO Rol (NombreRol, EstadoRol)
VALUES ('Operador','ACTIVO')

-----------USUARIO------------

INSERT INTO Usuario (NombreUsuario, TipoDocumento, NumDocumento, Telefono, Clave, EstadoUsuario, RolId)
Values ('Leoncio', 'DNI', 12345678, 1234567, 12345, 'Activo', 2)

INSERT INTO Usuario (NombreUsuario, TipoDocumento, NumDocumento, Telefono, Clave, EstadoUsuario, RolId)
Values ('Jose', 'DNI', 98765432, 123456789, 54321, 'Inactivo', 1)

INSERT INTO Usuario (NombreUsuario, TipoDocumento, NumDocumento, Telefono, Clave, EstadoUsuario, RolId)
Values ('Raul', 'RUC', 123456789, 123456789, 78945, 'Activo', 2)

-----------INGRESO------------

INSERT INTO Ingreso (FechaIngreso, EstadoIngreso, UsuarioId)
VALUES ('02-08-2023', 'Activo', 1)

INSERT INTO Ingreso (FechaIngreso, EstadoIngreso, UsuarioId)
VALUES ('01-08-2023', 'Activo', 2)

INSERT INTO Ingreso (FechaIngreso, EstadoIngreso, UsuarioId)
VALUES ('03-08-2023', 'Activo', 3)

INSERT INTO Ingreso (FechaIngreso, EstadoIngreso, UsuarioId)
VALUES ('03-08-2023', 'Inactivo', 3)

-----------DETALLE_INGRESO------------

INSERT INTO Detalle_Ingreso (CantidadDetaIngreso, PrecioDetaIngreso, ProductoId, IngresoId)
vALUES (50, 5000.50, 2, 1)

INSERT INTO Detalle_Ingreso (CantidadDetaIngreso, PrecioDetaIngreso, ProductoId, IngresoId)
vALUES (20, 1000.50, 3, 4)

INSERT INTO Detalle_Ingreso (CantidadDetaIngreso, PrecioDetaIngreso, ProductoId, IngresoId)
vALUES (10, 5, 1, 2)

/* MOSTRAR LAS TABLAS */

-----------CATEGORIA------------

SELECT * FROM Categoria;

-----------PRODUCTO------------

SELECT * FROM Producto

-----------ROL------------

SELECT * FROM Rol

-----------USUARIO------------

SELECT * FROM Usuario

-----------INGRESO------------

SELECT * FROM Ingreso

-----------DETALLE_INGRESO------------

SELECT * FROM Detalle_Ingreso

/* FUNCIONES */

SELECT c.NomCategoria AS NombreCategoria, MIN(p.Precio) AS PrecioMinimo, MAX(p.Precio) AS PrecioMaximo 
FROM Producto P
INNER JOIN Categoria C ON p.CategoriaId = c.CategoriaId
GROUP BY c.NomCategoria

SELECT c.NomCategoria AS NombreCategoria, p.NomProducto AS NombreProducto, 
p.StockProducto AS CantidadProducto, SUM(di.PrecioDetaIngreso) AS MontoTotal 
FROM Detalle_Ingreso di
JOIN Producto p ON di.ProductoId = p.ProductoId
JOIN Categoria c ON p.CategoriaId = c.CategoriaId
WHERE p.StockProducto > 10
GROUP BY c.NomCategoria, p.NomProducto, p.StockProducto

SELECT u.TipoDocumento, COUNT(*) AS CantidadDocumento 
FROM Usuario u
JOIN Rol r ON u.RolId = r.RolId
WHERE u.EstadoUsuario = 'Activo'
GROUP BY u.TipoDocumento

/* STORE PROCEDURES */

CREATE PROCEDURE UsuarioEstado
@estadoUsuario nvarchar(8)
AS
SELECT u.NombreUsuario, u.TipoDocumento, u.NumDocumento, r.NombreRol, u.EstadoUsuario 
FROM Usuario u
JOIN Rol r ON u.RolId = r.RolId
WHERE u.EstadoUsuario = @estadoUsuario
GO

EXEC UsuarioEstado 'activo'