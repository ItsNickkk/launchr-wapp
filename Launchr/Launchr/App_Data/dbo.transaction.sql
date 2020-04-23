﻿CREATE TABLE [dbo].[transaction] (
    [id]         INT      NOT NULL IDENTITY(500001, 1),
    [tier_id]    INT      NOT NULL,
    [user_id]    INT      NOT NULL,
    [project_id] INT      NOT NULL,
    [datetime]   DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_transaction] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id]),
    CONSTRAINT [FK_tier_id_transaction] FOREIGN KEY ([tier_id]) REFERENCES [dbo].[tier] ([id]),
    CONSTRAINT [FK_user_id_transaction] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([id])
);

