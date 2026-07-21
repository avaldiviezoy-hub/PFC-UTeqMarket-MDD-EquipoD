CREATE DATABASE UTeqMarket_Modelo_UML

USE UTeqMarket_Modelo_UML
GO 

/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     20/7/2026 0:11:32                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Calificacion') and o.name = 'FK_CALIFICA_CALIFICA_USU
ARIO')
alter table Calificacion
   drop constraint FK_CALIFICA_CALIFICA_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Calificacion') and o.name = 'FK_CALIFICA_RECIBE_CA_PUBLICAC')
alter table Calificacion
   drop constraint FK_CALIFICA_RECIBE_CA_PUBLICAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Contacto') and o.name = 'FK_CONTACTO_CONTACTA_USUARIO')
alter table Contacto
   drop constraint FK_CONTACTO_CONTACTA_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Contacto') and o.name = 'FK_CONTACTO_RECIBE_CO_PUBLICAC')
alter table Contacto
   drop constraint FK_CONTACTO_RECIBE_CO_PUBLICAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Favorito') and o.name = 'FK_FAVORITO_MARCA_USUARIO')
alter table Favorito
   drop constraint FK_FAVORITO_MARCA_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ImagenPublicacion') and o.name = 'FK_IMAGENPU_CONTIENE_PUBLICAC')
alter table ImagenPublicacion
   drop constraint FK_IMAGENPU_CONTIENE_PUBLICAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Publicacion') and o.name = 'FK_PUBLICAC_CLASIFICA_CATEGORI')
alter table Publicacion
   drop constraint FK_PUBLICAC_CLASIFICA_CATEGORI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Publicacion') and o.name = 'FK_PUBLICAC_PUBLICA_USUARIO')
alter table Publicacion
   drop constraint FK_PUBLICAC_PUBLICA_USUARIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Reporte') and o.name = 'FK_REPORTE_ES_REPORT_PUBLICAC')
alter table Reporte
   drop constraint FK_REPORTE_ES_REPORT_PUBLICAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Reporte') and o.name = 'FK_REPORTE_REPORTA_USUARIO')
alter table Reporte
   drop constraint FK_REPORTE_REPORTA_USUARIO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Calificacion')
            and   name  = 'CALIFICA_FK'
            and   indid > 0
            and   indid < 255)
   drop index Calificacion.CALIFICA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Calificacion')
            and   type = 'U')
   drop table Calificacion
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Categoria')
            and   type = 'U')
   drop table Categoria
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Contacto')
            and   name  = 'CONTACTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index Contacto.CONTACTA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Contacto')
            and   type = 'U')
   drop table Contacto
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EstadoPublicacion')
            and   type = 'U')
   drop table EstadoPublicacion
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Favorito')
            and   name  = 'MARCA_FK'
            and   indid > 0
            and   indid < 255)
   drop index Favorito.MARCA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Favorito')
            and   type = 'U')
   drop table Favorito
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ImagenPublicacion')
            and   name  = 'CONTIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index ImagenPublicacion.CONTIENE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ImagenPublicacion')
            and   type = 'U')
   drop table ImagenPublicacion
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MotivoReporte')
            and   type = 'U')
   drop table MotivoReporte
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Publicacion')
            and   name  = 'PUBLICA_FK'
            and   indid > 0
            and   indid < 255)
   drop index Publicacion.PUBLICA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Publicacion')
            and   type = 'U')
   drop table Publicacion
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Reporte')
            and   name  = 'REPORTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index Reporte.REPORTA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Reporte')
            and   type = 'U')
   drop table Reporte
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RolUsuario')
            and   type = 'U')
   drop table RolUsuario
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Usuario')
            and   type = 'U')
   drop table Usuario
go

/*==============================================================*/
/* Table: Calificacion                                          */
/*==============================================================*/
create table Calificacion (
   idUsuario            bigint               not null,
   Pub_idUsuario        bigint               null,
   Attribute_idCalificacion1 bigint               null,
   puntuacionCalificacion int                  null,
   comentarioCalificacion varchar(254)         null,
   fechaCalificacion    DateTime             null,
   constraint PK_CALIFICACION primary key (idUsuario)
)
go

/*==============================================================*/
/* Index: CALIFICA_FK                                           */
/*==============================================================*/
create index CALIFICA_FK on Calificacion (
idUsuario ASC
)
go

/*==============================================================*/
/* Table: Categoria                                             */
/*==============================================================*/
create table Categoria (
   idCategoria          int                  not null,
   nombreCategoria      varchar(254)         null,
   slugCategoria        varchar(254)         null,
   iconoCategoria       varchar(254)         null,
   constraint PK_CATEGORIA primary key (idCategoria)
)
go

/*==============================================================*/
/* Table: Contacto                                              */
/*==============================================================*/
create table Contacto (
   idUsuario            bigint               not null,
   Pub_idUsuario        bigint               null,
   idContacto           bigint               null,
   fechaContacto        DateTime             null,
   constraint PK_CONTACTO primary key (idUsuario)
)
go

/*==============================================================*/
/* Index: CONTACTA_FK                                           */
/*==============================================================*/
create index CONTACTA_FK on Contacto (
idUsuario ASC
)
go

/*==============================================================*/
/* Table: EstadoPublicacion                                     */
/*==============================================================*/
create table EstadoPublicacion (
   ACTIVA               int                  null,
   PAUSADA              int                  null,
   VENDIDA              int                  null
)
go

/*==============================================================*/
/* Table: Favorito                                              */
/*==============================================================*/
create table Favorito (
   idUsuario            bigint               not null,
   idFavorito           int                  null,
   fechaFavorito        DateTime             null,
   constraint PK_FAVORITO primary key (idUsuario)
)
go

/*==============================================================*/
/* Index: MARCA_FK                                              */
/*==============================================================*/
create index MARCA_FK on Favorito (
idUsuario ASC
)
go

/*==============================================================*/
/* Table: ImagenPublicacion                                     */
/*==============================================================*/
create table ImagenPublicacion (
   idUsuario            bigint               not null,
   idImagen             bigint               null,
   urlImagen            varchar(254)         null,
   ordenImagen          int                  null,
   portadaImagen        bit                  null,
   constraint PK_IMAGENPUBLICACION primary key (idUsuario)
)
go

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create index CONTIENE_FK on ImagenPublicacion (
idUsuario ASC
)
go

/*==============================================================*/
/* Table: MotivoReporte                                         */
/*==============================================================*/
create table MotivoReporte (
   PUBLICACION_FALSA    int                  null,
   CONTENIDO_INAPROPIADO int                  null,
   PRECIO_ENGANOSO      int                  null,
   POSIBLE_ESTAFA       int                  null,
   OTRO                 int                  null
)
go

/*==============================================================*/
/* Table: Publicacion                                           */
/*==============================================================*/
create table Publicacion (
   idUsuario            bigint               not null,
   idCategoria          int                  null,
   idPublicacion        bigint               null,
   tituloPublicacion    varchar(254)         null,
   descripcionPublicacion varchar(254)         null,
   precioPublicacion    decimal              null,
   ubicacionPublicacion varchar(254)         null,
   telefonoPublicacion  varchar(254)         null,
   estadoPublicacion    varchar(20)          null,
   fechaRegistroPublicacion DateTime             null,
   constraint PK_PUBLICACION primary key (idUsuario)
)
go

/*==============================================================*/
/* Index: PUBLICA_FK                                            */
/*==============================================================*/
create index PUBLICA_FK on Publicacion (
idUsuario ASC
)
go

/*==============================================================*/
/* Table: Reporte                                               */
/*==============================================================*/
create table Reporte (
   idUsuario            bigint               not null,
   Pub_idUsuario        bigint               null,
   idReporte            bigint               null,
   motivoReporte        varchar(30)          null,
   descripcionReporte   varchar(254)         null,
   estadoReporte        varchar(20)          null,
   fechaReporte         DateTime             null,
   constraint PK_REPORTE primary key (idUsuario)
)
go

/*==============================================================*/
/* Index: REPORTA_FK                                            */
/*==============================================================*/
create index REPORTA_FK on Reporte (
idUsuario ASC
)
go

/*==============================================================*/
/* Table: RolUsuario                                            */
/*==============================================================*/
create table RolUsuario (
   COMPRADOR            int                  null,
   VENDEDOR             int                  null,
   ADMINISTRADOR        int                  null
)
go

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario (
   idUsuario            bigint               not null,
   nombreUsuario        varchar(254)         null,
   correoUsuario        varchar(254)         null,
   contrasenaHashUsuario varchar(254)         null,
   rolUsuario           varchar(20)          null,
   activoUsuario        bit                  null,
   telefonoUsuario      varchar(254)         null,
   correoConfirmacion   bit                  null,
   tokenVerificacionUsuario varchar(254)         null,
   expiracionTokenUsuario DateTime             null,
   fechaRegistroUsuario DateTime             null,
   constraint PK_USUARIO primary key (idUsuario)
)
go

alter table Calificacion
   add constraint FK_CALIFICA_CALIFICA_USUARIO foreign key (idUsuario)
      references Usuario (idUsuario)
go

alter table Calificacion
   add constraint FK_CALIFICA_RECIBE_CA_PUBLICAC foreign key (Pub_idUsuario)
      references Publicacion (idUsuario)
go

alter table Contacto
   add constraint FK_CONTACTO_CONTACTA_USUARIO foreign key (idUsuario)
      references Usuario (idUsuario)
go

alter table Contacto
   add constraint FK_CONTACTO_RECIBE_CO_PUBLICAC foreign key (Pub_idUsuario)
      references Publicacion (idUsuario)
go

alter table Favorito
   add constraint FK_FAVORITO_MARCA_USUARIO foreign key (idUsuario)
      references Usuario (idUsuario)
go

alter table ImagenPublicacion
   add constraint FK_IMAGENPU_CONTIENE_PUBLICAC foreign key (idUsuario)
      references Publicacion (idUsuario)
go

alter table Publicacion
   add constraint FK_PUBLICAC_CLASIFICA_CATEGORI foreign key (idCategoria)
      references Categoria (idCategoria)
go

alter table Publicacion
   add constraint FK_PUBLICAC_PUBLICA_USUARIO foreign key (idUsuario)
      references Usuario (idUsuario)
go

alter table Reporte
   add constraint FK_REPORTE_ES_REPORT_PUBLICAC foreign key (Pub_idUsuario)
      references Publicacion (idUsuario)
go

alter table Reporte
   add constraint FK_REPORTE_REPORTA_USUARIO foreign key (idUsuario)
      references Usuario (idUsuario)
go

