CREATE TABLE [dbo].[user] (
    [id]           VARCHAR (6)  NOT NULL,
    [name]         VARCHAR (50) NOT NULL,
    [address]      VARCHAR (75) NOT NULL,
    [phone_number] VARCHAR (15) NOT NULL,
    [email]        VARCHAR (25) NOT NULL,
    [country]      VARCHAR (25) NOT NULL,
    [status]       INT          NOT NULL,
    [is_admin]     INT          NOT NULL,
    [username]     VARCHAR (25) NOT NULL,
    [password]     VARCHAR (25) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

