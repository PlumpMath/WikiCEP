CREATE DATABASE WikiCEPDB;
GO
USE WikiCEPDB;

CREATE TABLE Definiciones
(
	IDDefinicion INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR(100),
	IDAutor nvarchar(128),
	FechaCreacion DATETIME,
	Texto TEXT
);

ALTER TABLE Definiciones ADD FOREIGN KEY(IDAutor) REFERENCES AspNetUsers(Id);

CREATE TABLE Temas
(
	IDTema INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(50) UNIQUE
);

CREATE TABLE Tema_Definicion
(
	IDTema INT FOREIGN KEY REFERENCES Temas(IDTema),
	IDDefinicion INT FOREIGN KEY REFERENCES Definiciones(IDDefinicion),
	PRIMARY KEY(IDTema, IDDefinicion)
);

CREATE TABLE TutorialesYouTube
(
	IDTutorial INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR(100),
	LinkYouTube VARCHAR(11)
);

CREATE TABLE Tutorial_Definicion
(
	IDTutorial INT FOREIGN KEY REFERENCES TutorialesYouTube(IDTutorial),
	IDDefinicion INT FOREIGN KEY REFERENCES Definiciones(IDDefinicion),
	PRIMARY KEY(IDTutorial, IDDefinicion)
);

CREATE TABLE Ejemplos
(
	IDEjemplo INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR(100),
	Texto TEXT,
	FechaCreacion DATETIME,
	IDAutor nvarchar(128),
);

ALTER TABLE Ejemplos ADD FOREIGN KEY(IDAutor) REFERENCES AspNetUsers(Id);

CREATE TABLE Ejemplo_Definicion
(
	IDEjemplo INT FOREIGN KEY REFERENCES Ejemplos(IDEjemplo),
	IDDefinicion INT FOREIGN KEY REFERENCES Definiciones(IDDefinicion),
	PRIMARY KEY(IDEjemplo, IDDefinicion)
);

CREATE TABLE Imagenes
(
	IDImagen INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR(100),
	FechaCreacion DATETIME,
	IDAutor nvarchar(128)
);

ALTER TABLE Imagenes ADD FOREIGN KEY(IDAutor) REFERENCES AspNetUsers(Id);

CREATE TABLE Imagen_Definicion
(
	IDImagen INT FOREIGN KEY REFERENCES Imagenes(IDImagen),
	IDDefinicion INT FOREIGN KEY REFERENCES Definiciones(IDDefinicion),
	PRIMARY KEY(IDImagen, IDDefinicion)
);