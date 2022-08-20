CREATE DATABASE VacunasAntiCovid;
GO

USE VacunasAntiCovid;

CREATE TABLE Rol
(
    Id INT NOT NULL,
    Descripcion NVARCHAR(50) NOT NULL,
    Activo BIT NOT NULL,
    UsuarioAgregaId INT NOT NULL,
    FechaAgrega DATETIME NOT NULL,
    FechaModifica DATETIME NULL,
    UsuarioModificaId INT NULL,
    CONSTRAINT PK_Rol PRIMARY KEY(Id),
    CONSTRAINT CK_Rol_Descripcion CHECK(Descripcion IS NOT NULL AND TRIM(Descripcion) <> ''),
    CONSTRAINT CK_Rol_UsuarioAgregaId CHECK(UsuarioAgregaId IS NOT NULL AND UsuarioAgregaId > 0)
);
GO

CREATE TABLE Usuario
(
    Id INT NOT NULL IDENTITY(1,1),
    Usuario NVARCHAR(50) NOT NULL,
    Clave BINARY(64) NOT NULL,
    Correo NVARCHAR(50) NOT NULL,
    Activo BIT NOT NULL,
    RolId INT NULL,
    UsuarioAgregaId INT NOT NULL,
    FechaAgrega DATETIME NOT NULL,
    FechaModifica DATETIME NULL,
    UsuarioModificaId INT NULL,
    CONSTRAINT PK_Usuario PRIMARY KEY (Id),
    CONSTRAINT CK_Usuario_Correo CHECK(Correo LIKE '%___@___%'),
    CONSTRAINT CK_Usuario_Usuario CHECK(Usuario IS NOT NULL AND TRIM(Usuario) <> ''),
    CONSTRAINT CK_Usuario_UsuarioAgregaId CHECK(UsuarioAgregaId IS NOT NULL AND UsuarioAgregaId > 0),
    CONSTRAINT FK_Usuario_Rol FOREIGN KEY (RolId) REFERENCES Rol (Id)
);
GO

-- Agregando relación de la tabla usuarios a los roles
ALTER TABLE Rol ADD CONSTRAINT FK_Rol_UsuarioAgregaId FOREIGN KEY (UsuarioAgregaId) REFERENCES Usuario (Id);
ALTER TABLE Rol ADD CONSTRAINT FK_Rol_UsuarioModificaId FOREIGN KEY (UsuarioModificaId) REFERENCES Usuario (Id);

GO

-- Insertando el primer usuario, administrador
INSERT INTO Usuario
    (
    [Usuario],
    [Clave],
    [Correo],
    [Activo],
    [RolId],
    [UsuarioAgregaId],
    [FechaAgrega]
    )
VALUES
    (
        'administrator',
        HASHBYTES('SHA2_512', 'alfaomega'),
        'selvinmedina0016@gmail.com',
        1,
        NULL,
        1,
        GETDATE()
);

GO

-- Validando Usuario por clave
SELECT *
FROM Usuario
WHERE 
    Usuario = 'administrator'
    AND Clave = HASHBYTES('SHA2_512', 'alfaomega');

GO

-- Insertar Rol

INSERT INTO Rol
    (
    [Id],
    [Descripcion],
    [Activo],
    [UsuarioAgregaId],
    [FechaAgrega]
    )
VALUES
    (
        1,
        'Administrador',
        1,
        1,
        GETDATE()
),
    (
        2,
        'Oficiales médicos',
        1,
        1,
        GETDATE()
),
    (
        3,
        'Encargado de digitación',
        1,
        1,
        GETDATE()
);

GO

-- Seleccionando los Roles
SELECT *
FROM Rol;

SELECT r.*,
    UsuarioAgrega = u.Usuario
FROM Rol r
    INNER JOIN Usuario u ON u.Id = r.UsuarioAgregaId;

GO

CREATE TABLE CentroDeAsistencia
(
    Id INT NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Capacidad INT NOT NULL,
    NumeroMedicos INT NOT NULL,
    NumeroEnfermeras INT NOT NULL,
    NumeroPacientesAtendidos INT NOT NULL,
    Activo BIT NOT NULL,
    UsuarioAgregaId INT NOT NULL,
    FechaAgrega DATETIME NOT NULL,
    FechaModifica DATETIME NULL,
    UsuarioModificaId INT NULL,
    CONSTRAINT PK_CentroDeAsistencia PRIMARY KEY (Id),
    CONSTRAINT CK_CentroDeAsistencia_Descripcion CHECK(Descripcion IS NOT NULL AND TRIM(Descripcion) <> ''),
    CONSTRAINT FK_CentroDeAsistencia_UsuarioAgregaId FOREIGN KEY (UsuarioAgregaId) REFERENCES Usuario (Id),
    CONSTRAINT FK_CentroDeAsistencia_UsuarioModificaId FOREIGN KEY (UsuarioModificaId) REFERENCES Usuario (Id)
);

GO

CREATE TABLE CentroDeAsistencia
(
    Id INT NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Capacidad INT NOT NULL,
    NumeroMedicos INT NOT NULL,
    NumeroEnfermeras INT NOT NULL,
    NumeroPacientesAtendidos INT NOT NULL,
    Activo BIT NOT NULL,
    UsuarioAgregaId INT NOT NULL,
    FechaAgrega DATETIME NOT NULL,
    FechaModifica DATETIME NULL,
    UsuarioModificaId INT NULL,
    CONSTRAINT PK_CentroDeAsistencia PRIMARY KEY (Id),
    CONSTRAINT CK_CentroDeAsistencia_Descripcion CHECK(Descripcion IS NOT NULL AND TRIM(Descripcion) <> ''),
    CONSTRAINT FK_CentroDeAsistencia_UsuarioAgregaId FOREIGN KEY (UsuarioAgregaId) REFERENCES Usuario (Id),
    CONSTRAINT FK_CentroDeAsistencia_UsuarioModificaId FOREIGN KEY (UsuarioModificaId) REFERENCES Usuario (Id)
);

GO

CREATE TABLE Vacuna
(
    Id INT NOT NULL,
    Identidad NVARCHAR(50) NOT NULL,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Activo BIT NOT NULL,
    UsuarioAgregaId INT NOT NULL,
    FechaAgrega DATETIME NOT NULL,
    FechaModifica DATETIME NULL,
    UsuarioModificaId INT NULL,
    CONSTRAINT PK_Vacuna PRIMARY KEY (Id),
    CONSTRAINT CK_Vacuna_Identidad CHECK(Identidad IS NOT NULL AND TRIM(Identidad) <> ''),
    CONSTRAINT CK_Vacuna_Nombre CHECK(Nombre IS NOT NULL AND TRIM(Nombre) <> ''),
    CONSTRAINT CK_Vacuna_Apellido CHECK(Apellido IS NOT NULL AND TRIM(Apellido) <> ''),
    CONSTRAINT CK_Vacuna_FechaNacimiento CHECK(FechaNacimiento >= '1970-01-01'),
    CONSTRAINT FK_Vacuna_UsuarioAgregaId FOREIGN KEY (UsuarioAgregaId) REFERENCES Usuario (Id),
    CONSTRAINT FK_Vacuna_UsuarioModificaId FOREIGN KEY (UsuarioModificaId) REFERENCES Usuario (Id)
);

GO

CREATE TABLE DestinoVacuna
(
    Id INT NOT NULL,
    Descripcion NVARCHAR(50) NOT NULL,
    Activo BIT NOT NULL,
    UsuarioAgregaId INT NOT NULL,
    FechaAgrega DATETIME NOT NULL,
    FechaModifica DATETIME NULL,
    UsuarioModificaId INT NULL,
    CONSTRAINT PK_DestinoVacuna PRIMARY KEY (Id),
    CONSTRAINT CK_DestinoVacuna_Descripcion CHECK(Descripcion IS NOT NULL AND TRIM(Descripcion) <> ''),
    CONSTRAINT FK_DestinoVacuna_UsuarioAgregaId FOREIGN KEY (UsuarioAgregaId) REFERENCES Usuario (Id),
    CONSTRAINT FK_DestinoVacuna_UsuarioModificaId FOREIGN KEY (UsuarioModificaId) REFERENCES Usuario (Id)
);

GO

CREATE TABLE [dbo].[Ciudadano]
(
    [Id] [int] NOT NULL,
    [Identidad] [nvarchar](50) NOT NULL,
    [Nombre] [nvarchar](50) NOT NULL,
    [Apellido] [nvarchar](50) NOT NULL,
    [FechaNacimiento] [date] NOT NULL,
    [Activo] [bit] NOT NULL,
    [UsuarioAgregaId] [int] NOT NULL,
    [FechaAgrega] [datetime] NOT NULL,
    [FechaModifica] [datetime] NULL,
    [UsuarioModificaId] [int] NULL,
    CONSTRAINT [PK_Ciudadano] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Ciudadano_UsuarioAgregaId] FOREIGN KEY([UsuarioAgregaId]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_Ciudadano_UsuarioModificaId] FOREIGN KEY([UsuarioModificaId]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [CK_Ciudadano_Apellido] CHECK  (([Apellido] IS NOT NULL AND Trim([Apellido])<>'')),
    CONSTRAINT [CK_Ciudadano_FechaNacimiento] CHECK  (([FechaNacimiento]>='1970-01-01')),
    CONSTRAINT [CK_Ciudadano_Identidad] CHECK  (([Identidad] IS NOT NULL AND Trim([Identidad])<>'')),
    CONSTRAINT [CK_Ciudadano_Nombre] CHECK  (([Nombre] IS NOT NULL AND Trim([Nombre])<>''))
) 
GO

CREATE TABLE [dbo].[HistoricoCiudadano]
(
    [Id] [int] NOT NULL,
    VacunaId INT NOT NULL,
    CiudadanoId INT NOT NULL,
    CentroDeAsistenciaId INT NOT NULL,
    FechaAplicacion DATETIME NOT NULL,
    [Activo] [bit] NOT NULL,
    [UsuarioAgregaId] [int] NOT NULL,
    [FechaAgrega] [datetime] NOT NULL,
    [FechaModifica] [datetime] NULL,
    [UsuarioModificaId] [int] NULL,
    CONSTRAINT [PK_HistoricoCiudadano] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_HistoricoCiudadano_UsuarioAgregaId] FOREIGN KEY([UsuarioAgregaId]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [FK_HistoricoCiudadano_UsuarioModificaId] FOREIGN KEY([UsuarioModificaId]) REFERENCES [dbo].[Usuario] ([Id]),
    CONSTRAINT [CK_HistoricoCiudadano_FechaAplicacion] CHECK  (([FechaAplicacion]>='1970-01-01')),
    CONSTRAINT [FK_HistoricoCiudadano_Vacuna] FOREIGN KEY([VacunaId]) REFERENCES [dbo].[Vacuna] ([Id]),
    CONSTRAINT [FK_HistoricoCiudadano_CentroDeAsistencia] FOREIGN KEY([CentroDeAsistenciaId]) REFERENCES [dbo].[CentroDeAsistencia] ([Id]),
    CONSTRAINT [FK_HistoricoCiudadano_Ciudadano] FOREIGN KEY([CiudadanoId]) REFERENCES [dbo].[Ciudadano] ([Id]),
) 
GO

-- Listar tablas
SELECT table_catalog [database], table_schema [schema], table_name [name], table_type [type]
FROM INFORMATION_SCHEMA.TABLES
GO