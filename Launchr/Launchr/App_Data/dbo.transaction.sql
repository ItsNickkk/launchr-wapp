CREATE TABLE [dbo].[transaction] (
    [id]         VARCHAR (6) NOT NULL,
    [tier_id]    VARCHAR (6) NOT NULL,
    [user_id]    VARCHAR (6) NOT NULL,
    [project_id] VARCHAR (6) NOT NULL,
    [datetime]   DATETIME    NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_transaction] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id]),
    CONSTRAINT [FK_tier_id_transaction] FOREIGN KEY ([tier_id]) REFERENCES [dbo].[tier] ([id]),
    CONSTRAINT [FK_user_id_transaction] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([id])
);

