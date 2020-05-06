﻿CREATE TABLE [dbo].[user] (
    [id]           INT          IDENTITY (100001, 1) NOT NULL,
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

CREATE TABLE [dbo].[creator] (
    [id]           INT          IDENTITY (200001, 1) NOT NULL,
    [name]         VARCHAR (50) NOT NULL,
    [address]      VARCHAR (75) NOT NULL,
    [phone_number] VARCHAR (25) NOT NULL,
    [email]        VARCHAR (25) NOT NULL,
    [country]      VARCHAR (25) NOT NULL,
    [status]       INT          NOT NULL,
    [document]     VARCHAR (50) NOT NULL,
    [type]         VARCHAR (50) NOT NULL,
    [username]     VARCHAR (25) NOT NULL,
    [password]     VARCHAR (25) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[project] (
    [id]           INT           NOT NULL IDENTITY(300001, 1),
    [creator_id]   INT           NOT NULL,
    [title]        VARCHAR (50)  NOT NULL,
    [time_created] DATETIME      NOT NULL,
    [time_end]     DATETIME      NOT NULL,
    [description]  VARCHAR (250) NOT NULL,
    [status]       INT           NOT NULL,
    [target]       INT           NOT NULL,
    [topic]        VARCHAR (20)  NOT NULL,
    [content]      TEXT          NOT NULL,
    [imagePath]    VARCHAR (250) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_creator_id_project] FOREIGN KEY ([creator_id]) REFERENCES [dbo].[creator] ([id])
);

CREATE TABLE [dbo].[tier] (
    [id]          INT          IDENTITY (400001, 1) NOT NULL,
    [value]       INT          NOT NULL,
    [description] TEXT         NOT NULL,
    [project_id]  INT          NOT NULL,
    [max_amount]  INT          NOT NULL,
    [title]       VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_tier] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id])
);

CREATE TABLE [dbo].[transaction] (
    [id]         INT      IDENTITY (500001, 1) NOT NULL,
    [tier_id]    INT      NOT NULL,
    [user_id]    INT      NOT NULL,
    [project_id] INT      NOT NULL,
    [datetime]   DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_transaction] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id]),
    CONSTRAINT [FK_tier_id_transaction] FOREIGN KEY ([tier_id]) REFERENCES [dbo].[tier] ([id]),
    CONSTRAINT [FK_user_id_transaction] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([id])
);

CREATE TABLE [dbo].[comment] (
    [id]         INT      IDENTITY (600001, 1) NOT NULL,
    [user_id]    INT      NOT NULL,
    [project_id] INT      NULL,
    [parent_id]  INT      NULL,
    [content]    TEXT     NOT NULL,
    [datetime]   DATETIME NOT NULL,
    [status]     INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_comment] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id]),
    CONSTRAINT [FK_user_id_comment] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([id]),
    CONSTRAINT [FK_parent_id_comment] FOREIGN KEY ([parent_id]) REFERENCES [dbo].[comment] ([id])
);

