USE master;
GO

CREATE DATABASE POKEDEX_DB;
GO

USE POKEDEX_DB;
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[ELEMENTOS](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Descripcion] [varchar](50) NULL,
    CONSTRAINT [PK_ELEMENTOS] PRIMARY KEY CLUSTERED
    (
        [Id] ASC
    )
);
GO

CREATE TABLE [dbo].[POKEMONS](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Numero] [int] NULL,
    [Nombre] [varchar](50) NULL,
    [Descripcion] [varchar](50) NULL,
    [UrlImagen] [varchar](300) NULL,
    [IdTipo] [int] NULL,
    [IdDebilidad] [int] NULL,
    [IdEvolucion] [int] NULL,
    [Activo] [bit] NULL,
    CONSTRAINT [PK_POKEMONS] PRIMARY KEY CLUSTERED
    (
        [Id] ASC
    )
);
GO

ALTER TABLE [dbo].[POKEMONS]
ADD CONSTRAINT [FK_POKEMONS_ELEMENTOS]
FOREIGN KEY([IdTipo])
REFERENCES [dbo].[ELEMENTOS] ([Id]);
GO

ALTER TABLE [dbo].[POKEMONS]
ADD CONSTRAINT [FK_POKEMONS_ELEMENTOS1]
FOREIGN KEY([IdDebilidad])
REFERENCES [dbo].[ELEMENTOS] ([Id]);
GO

ALTER TABLE [dbo].[POKEMONS]
ADD CONSTRAINT [FK_POKEMONS_POKEMONS]
FOREIGN KEY([IdEvolucion])
REFERENCES [dbo].[POKEMONS] ([Id]);
GO

INSERT INTO ELEMENTOS VALUES ('Planta');
INSERT INTO ELEMENTOS VALUES ('Fuego');
INSERT INTO ELEMENTOS VALUES ('Agua');
GO

INSERT INTO POKEMONS
VALUES
(1, 'Bulbasaur', 'Este Pokémon nace con una semilla en el lomo.',
'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png',
1, 2, NULL, 1);

INSERT INTO POKEMONS
VALUES
(4, 'Charmander', 'Pokemon de fuego',
'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png',
2, 3, NULL, 1);

INSERT INTO POKEMONS
VALUES
(11, 'Butterfree', 'mariposa',
'https://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png',
1, 1, NULL, 1);

INSERT INTO POKEMONS
VALUES
(15, 'Pidgey', 'Voladorrrrr',
'https://assets.pokemon.com/assets/cms2/img/pokedex/full/016.png',
2, 1, NULL, 1);
GO

SELECT * FROM ELEMENTOS;
SELECT * FROM POKEMONS;


Select Numero,Nombre,P.Descripcion,UrlImagen,E.Descripcion  Tipo, D.Descripcion Debilidad from POKEMONS P,ELEMENTOS E, ELEMENTOS D where E.Id = P.IdTipo and D.Id = P.IdDebilidad;

