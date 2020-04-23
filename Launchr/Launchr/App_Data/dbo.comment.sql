CREATE TABLE [dbo].[comment] (
    [id]         INT      NOT NULL IDENTITY(600001, 1),
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

