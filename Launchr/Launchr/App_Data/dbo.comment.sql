CREATE TABLE [dbo].[comment] (
    [id]         VARCHAR (6) NOT NULL,
    [user_id]    VARCHAR (6) NOT NULL,
    [project_id] VARCHAR (6) NULL,
    [parent_id]  VARCHAR (6) NULL,
    [content]    TEXT        NOT NULL,
    [datetime]   DATETIME    NOT NULL,
    [status]     INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_comment] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id]),
    CONSTRAINT [FK_user_id_comment] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([id]),
    CONSTRAINT [FK_parent_id_comment] FOREIGN KEY ([parent_id]) REFERENCES [dbo].[comment] ([id])
);

