Build started...
Build succeeded.
IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Addresses] (
    [AddressId] int NOT NULL IDENTITY,
    [Cep] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Addresses] PRIMARY KEY ([AddressId])
);
GO

CREATE TABLE [Services] (
    [ServiceId] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Description] nvarchar(max) NOT NULL,
    [PathFoto] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Services] PRIMARY KEY ([ServiceId])
);
GO

CREATE TABLE [Users] (
    [UserId] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [Phone] nvarchar(max) NOT NULL,
    [Birthday] nvarchar(max) NOT NULL,
    [Password] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [Gender] bit NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([UserId])
);
GO

CREATE TABLE [UserServices] (
    [UserServiceId] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [ServiceId] int NOT NULL,
    [Budget] real NOT NULL,
    [DateTime] datetime2 NOT NULL,
    [Status] int NOT NULL,
    [Description] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_UserServices] PRIMARY KEY ([UserServiceId])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241004134730_InitialCreate', N'8.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'Gender');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Users] ALTER COLUMN [Gender] nvarchar(max) NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241005170858_Update', N'8.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241005171110_InitialCreation', N'8.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DROP TABLE [Addresses];
GO

EXEC sp_rename N'[Users].[Birthday]', N'Street', N'COLUMN';
GO

ALTER TABLE [Users] ADD [Cep] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [Users] ADD [City] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [Users] ADD [Complement] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [Users] ADD [DateOfBirth] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [Users] ADD [District] nvarchar(max) NOT NULL DEFAULT N'';
GO

ALTER TABLE [Users] ADD [Number] int NOT NULL DEFAULT 0;
GO

ALTER TABLE [Users] ADD [State] nvarchar(max) NOT NULL DEFAULT N'';
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241006204533_Initial', N'8.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241006210240_ComplementNull', N'8.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'Complement');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Users] ALTER COLUMN [Complement] nvarchar(max) NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241007230637_NullComplement', N'8.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [Services] ADD [Duration] int NOT NULL DEFAULT 0;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241008205817_AddDuration', N'8.0.8');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Services]') AND [c].[name] = N'Duration');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Services] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [Services] ALTER COLUMN [Duration] nvarchar(max) NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241008210217_AddDuration2', N'8.0.8');
GO

COMMIT;
GO


