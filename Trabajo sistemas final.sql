Create database EMPRESA 
USE EMPRESA
Create table Cliente(
Cedula varchar (9) primary key not null,
Nombre varchar (30) not null,
 Dirreccion varchar(200) not null
)

Create table Factura (
Id_factura int not null,
Id_producto int primary key identity (1,1) not null,
Cedula varchar (9) not null,
Fecha datetime,
Descuento varchar (5), 
Impuesto varchar (5) not null
)
Create Table Producto(
Id_producto int primary key identity (1,1) not null,
Color text not null,
Tamaño text not null,
Nombre text not null,
Id_global int not null,
Id_subcategoria int not null
)
Create Table Sub_categoria(
Id_subcategoria int primary key identity (1,1) not null,
Nombre text not null,
Id_categoria int 
)

Create Table Categoria(
Id_categoria int primary key identity (1,1) not null,
Nombre text not null,
)
Create Table Proveedor(
Cedula varchar (9) not null,
Nombre text not null,
Correo text not null,
Telefono text not null
)
Create Table Territorio (
Id_territorio int primary key identity (1,1) not null,
Provincia text not null,
Cantón text not null,
Distrito text not null 
)
ALTER TABLE Factura
ADD CONSTRAINT FK_Factura_Cliente FOREIGN KEY (Cedula) REFERENCES Cliente(Cedula);

ALTER TABLE Factura
ADD CONSTRAINT FK_Factura_Producto FOREIGN KEY (Id_producto) REFERENCES Producto(Id_producto);

ALTER TABLE Sub_categoria
ADD CONSTRAINT FK_Subcategoria_Categoria FOREIGN KEY (Id_categoria) REFERENCES Categoria(Id_categoria);

-- Agregar una columna de clave foránea en la tabla Proveedor
ALTER TABLE Proveedor
ADD Id_territorio INT;

-- Establecer la restricción de clave foránea
ALTER TABLE Proveedor
ADD CONSTRAINT FK_Proveedor_Territorio FOREIGN KEY (Id_territorio) REFERENCES Territorio(Id_territorio);

-- Agregar una columna de clave foránea en la tabla Cliente
ALTER TABLE Cliente
ADD Id_territorio INT;

-- Establecer la restricción de clave foránea
ALTER TABLE Cliente
ADD CONSTRAINT FK_Cliente_Territorio FOREIGN KEY (Id_territorio) REFERENCES Territorio(Id_territorio);

INSERT INTO Territorio (Provincia, Cantón, Distrito)
VALUES 
    ('San José', 'San José', 'Carmen'),
    ('Alajuela', 'Alajuela', 'Alajuela'),
	('Guanacaste', 'Bagaces', 'Bagaces'),
	('Heredia', 'San Rafael', 'San Josecito'),
	('Limon', 'Pococi', 'Rita'),
	('San José', 'Desamparados', 'Frailes'),
	('Heredia', 'San Pablo', 'San Pablo'),
	('Cartago', 'Alvarado', 'Pacayas'),
	('Alajuela', 'San Mateo', 'Desmonte'),
	('Alajuela', 'Alajuela', 'Alajuela'),
	('Guanacaste', 'Santa Cruz', 'Tempate'),
	('Limon', 'Matina', 'Matina'),
	('Puntarenas', 'Puntarenas','Chomes'),
	('Puntarenas', 'Esparza','Macacona');


INSERT INTO Cliente (Cedula, Nombre, Dirreccion, Id_territorio)
VALUES ('123456789', 'Juan Pérez', 'Calle 123', 1),
       ('287654321', 'María López', 'Avenida 456', 2),
	   ('541729390', 'Ian Gonzalez', 'Calle la torre', 5),
	   ('461800912', 'Sofia Avila', 'Condomnio las Rosas', 4),
	   ('789000123', 'Taylor Swift', 'Avenida eras', 7);

	   

INSERT INTO Categoria (Nombre) VALUES ('Electrónica'), ('Computadores'), ('Celulares'), ('Linea Blanca'),
('Accesorios');

INSERT INTO Sub_categoria (Nombre) VALUES ('Play'),  ('Apple'),('LG'),
 ('Audifinos');

INSERT INTO Proveedor (Cedula, Nombre, Correo, Telefono)
VALUES
    ('123456789', 'Proveedor 1', 'proveedor1@email.com', '6345-6789'),
    ('387654321', 'Proveedor 2', 'proveedor2@email.com', '8765-3210'),
	('279210012', 'Proveedor 3', 'proveedor3@email.com', '8890-2313'), 
	('452109230','Proveedor 4', 'proveedor4@email.com', '8890-2313'), 
	( '680128021','Proveedor 5', 'proveedor5@email.com', '8890-2313');

INSERT INTO Factura (Cedula, Fecha, Descuento, Impuesto)
VALUES ('123456789', '2023-09-10', '10%', '13%'),
    ('887654321', '2023-09-11', '0%', '13%'),
	('234098765', '2023-09-13','20%', '13%' ),
	('345001987', '2023-08-03', '0%', '13%'),
	('461287091', '2023-08-17', '50%','13%');