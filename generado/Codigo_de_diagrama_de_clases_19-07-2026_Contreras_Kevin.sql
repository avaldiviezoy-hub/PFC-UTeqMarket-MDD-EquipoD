/* ============================================================
   UTeqMarket - Modelo físico final para Microsoft SQL Server
   El modelo contiene únicamente ocho tablas principales.
   ============================================================ */

USE master;
GO

/* Crear la base de datos solamente si todavía no existe */
IF DB_ID(N'UTeqMarket_Modelo_UML') IS NULL
BEGIN
    CREATE DATABASE UTeqMarket_Modelo_UML;
END;
GO

USE UTeqMarket_Modelo_UML;
GO

/* ============================================================
   Eliminar las tablas anteriores en orden de dependencia
   ============================================================ */

IF OBJECT_ID(N'dbo.Reporte', N'U') IS NOT NULL
    DROP TABLE dbo.Reporte;
GO

IF OBJECT_ID(N'dbo.Calificacion', N'U') IS NOT NULL
    DROP TABLE dbo.Calificacion;
GO

IF OBJECT_ID(N'dbo.Contacto', N'U') IS NOT NULL
    DROP TABLE dbo.Contacto;
GO

IF OBJECT_ID(N'dbo.Favorito', N'U') IS NOT NULL
    DROP TABLE dbo.Favorito;
GO

IF OBJECT_ID(N'dbo.ImagenPublicacion', N'U') IS NOT NULL
    DROP TABLE dbo.ImagenPublicacion;
GO

IF OBJECT_ID(N'dbo.Publicacion', N'U') IS NOT NULL
    DROP TABLE dbo.Publicacion;
GO

IF OBJECT_ID(N'dbo.Categoria', N'U') IS NOT NULL
    DROP TABLE dbo.Categoria;
GO

IF OBJECT_ID(N'dbo.Usuario', N'U') IS NOT NULL
    DROP TABLE dbo.Usuario;
GO

/* ============================================================
   Tabla: Usuario
   ============================================================ */

CREATE TABLE dbo.Usuario
(
    idUsuario                  BIGINT NOT NULL,
    nombreUsuario              VARCHAR(254) NULL,
    correoUsuario              VARCHAR(254) NULL,
    contrasenaHashUsuario      VARCHAR(254) NULL,
    rolUsuario                 VARCHAR(20) NULL,
    activoUsuario              BIT NULL,
    telefonoUsuario            VARCHAR(254) NULL,
    correoConfirmacion         BIT NULL,
    tokenVerificacionUsuario   VARCHAR(254) NULL,
    expiracionTokenUsuario     DATETIME NULL,
    fechaRegistroUsuario       DATETIME NULL,

    CONSTRAINT PK_Usuario
        PRIMARY KEY (idUsuario),

    CONSTRAINT CK_Usuario_Rol
        CHECK
        (
            rolUsuario IS NULL
            OR rolUsuario IN
            (
                'COMPRADOR',
                'VENDEDOR',
                'ADMINISTRADOR'
            )
        )
);
GO

/* ============================================================
   Tabla: Categoria
   ============================================================ */

CREATE TABLE dbo.Categoria
(
    idCategoria       INT NOT NULL,
    nombreCategoria   VARCHAR(254) NULL,
    slugCategoria     VARCHAR(254) NULL,
    iconoCategoria    VARCHAR(254) NULL,

    CONSTRAINT PK_Categoria
        PRIMARY KEY (idCategoria)
);
GO

/* ============================================================
   Tabla: Publicacion
   ============================================================ */

CREATE TABLE dbo.Publicacion
(
    idPublicacion                BIGINT NOT NULL,
    tituloPublicacion            VARCHAR(254) NULL,
    descripcionPublicacion       VARCHAR(254) NULL,
    precioPublicacion            DECIMAL(10,2) NULL,
    ubicacionPublicacion         VARCHAR(254) NULL,
    telefonoPublicacion          VARCHAR(254) NULL,
    estadoPublicacion            VARCHAR(20) NULL,
    fechaRegistroPublicacion     DATETIME NULL,

    idUsuarioPublicacion         BIGINT NOT NULL,
    idCategoriaPublicacion       INT NOT NULL,

    CONSTRAINT PK_Publicacion
        PRIMARY KEY (idPublicacion),

    CONSTRAINT CK_Publicacion_Estado
        CHECK
        (
            estadoPublicacion IS NULL
            OR estadoPublicacion IN
            (
                'ACTIVA',
                'PAUSADA',
                'VENDIDA'
            )
        ),

    CONSTRAINT FK_Publicacion_Usuario
        FOREIGN KEY (idUsuarioPublicacion)
        REFERENCES dbo.Usuario (idUsuario),

    CONSTRAINT FK_Publicacion_Categoria
        FOREIGN KEY (idCategoriaPublicacion)
        REFERENCES dbo.Categoria (idCategoria)
);
GO

/* ============================================================
   Tabla: ImagenPublicacion
   ============================================================ */

CREATE TABLE dbo.ImagenPublicacion
(
    idImagen                  BIGINT NOT NULL,
    urlImagen                 VARCHAR(254) NULL,
    ordenImagen               INT NULL,
    portadaImagen             BIT NULL,

    idPublicacionImagen       BIGINT NOT NULL,

    CONSTRAINT PK_ImagenPublicacion
        PRIMARY KEY (idImagen),

    CONSTRAINT FK_ImagenPublicacion_Publicacion
        FOREIGN KEY (idPublicacionImagen)
        REFERENCES dbo.Publicacion (idPublicacion)
);
GO

/* ============================================================
   Tabla: Favorito
   ============================================================ */

CREATE TABLE dbo.Favorito
(
    idFavorito                  INT NOT NULL,
    fechaFavorito               DATETIME NULL,

    idUsuarioFavorito           BIGINT NOT NULL,
    idPublicacionFavorito       BIGINT NOT NULL,

    CONSTRAINT PK_Favorito
        PRIMARY KEY (idFavorito),

    CONSTRAINT FK_Favorito_Usuario
        FOREIGN KEY (idUsuarioFavorito)
        REFERENCES dbo.Usuario (idUsuario),

    CONSTRAINT FK_Favorito_Publicacion
        FOREIGN KEY (idPublicacionFavorito)
        REFERENCES dbo.Publicacion (idPublicacion)
);
GO

/* ============================================================
   Tabla: Contacto
   ============================================================ */

CREATE TABLE dbo.Contacto
(
    idContacto                  BIGINT NOT NULL,
    fechaContacto               DATETIME NULL,

    idUsuarioContacto           BIGINT NOT NULL,
    idPublicacionContacto       BIGINT NOT NULL,

    CONSTRAINT PK_Contacto
        PRIMARY KEY (idContacto),

    CONSTRAINT FK_Contacto_Usuario
        FOREIGN KEY (idUsuarioContacto)
        REFERENCES dbo.Usuario (idUsuario),

    CONSTRAINT FK_Contacto_Publicacion
        FOREIGN KEY (idPublicacionContacto)
        REFERENCES dbo.Publicacion (idPublicacion)
);
GO

/* ============================================================
   Tabla: Calificacion
   ============================================================ */

CREATE TABLE dbo.Calificacion
(
    idCalificacion                  BIGINT NOT NULL,
    puntuacionCalificacion          INT NULL,
    comentarioCalificacion          VARCHAR(254) NULL,
    fechaCalificacion               DATETIME NULL,

    idUsuarioCalificacion           BIGINT NOT NULL,
    idPublicacionCalificacion       BIGINT NOT NULL,

    CONSTRAINT PK_Calificacion
        PRIMARY KEY (idCalificacion),

    CONSTRAINT FK_Calificacion_Usuario
        FOREIGN KEY (idUsuarioCalificacion)
        REFERENCES dbo.Usuario (idUsuario),

    CONSTRAINT FK_Calificacion_Publicacion
        FOREIGN KEY (idPublicacionCalificacion)
        REFERENCES dbo.Publicacion (idPublicacion)
);
GO

/* ============================================================
   Tabla: Reporte
   ============================================================ */

CREATE TABLE dbo.Reporte
(
    idReporte                  BIGINT NOT NULL,
    motivoReporte              VARCHAR(30) NULL,
    descripcionReporte         VARCHAR(254) NULL,
    estadoReporte              VARCHAR(20) NULL,
    fechaReporte               DATETIME NULL,

    idUsuarioReporte           BIGINT NOT NULL,
    idPublicacionReporte       BIGINT NOT NULL,

    CONSTRAINT PK_Reporte
        PRIMARY KEY (idReporte),

    CONSTRAINT CK_Reporte_Motivo
        CHECK
        (
            motivoReporte IS NULL
            OR motivoReporte IN
            (
                'PUBLICACION_FALSA',
                'CONTENIDO_INAPROPIADO',
                'PRECIO_ENGANOSO',
                'POSIBLE_ESTAFA',
                'OTRO'
            )
        ),

    CONSTRAINT CK_Reporte_Estado
        CHECK
        (
            estadoReporte IS NULL
            OR estadoReporte IN
            (
                'PENDIENTE',
                'REVISADO',
                'DESESTIMADO'
            )
        ),

    CONSTRAINT FK_Reporte_Usuario
        FOREIGN KEY (idUsuarioReporte)
        REFERENCES dbo.Usuario (idUsuario),

    CONSTRAINT FK_Reporte_Publicacion
        FOREIGN KEY (idPublicacionReporte)
        REFERENCES dbo.Publicacion (idPublicacion)
);
GO

PRINT 'La base de datos UTeqMarket_Modelo_UML fue creada correctamente.';
PRINT 'Tablas creadas: Usuario, Categoria, Publicacion, ImagenPublicacion, Favorito, Contacto, Calificacion y Reporte.';
GO