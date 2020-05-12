CREATE TABLE [dbo].[comment] (
    [id]         INT      IDENTITY (600001, 1) NOT NULL,
    [author_id]  INT    NOT NULL,
    [project_id] INT      NOT NULL,
    [parent_id]  INT      NULL,
    [content]    TEXT     NOT NULL,
    [datetime]   DATETIME NOT NULL,
    [status]     INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_comment] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id]),
    CONSTRAINT [FK_parent_id_comment] FOREIGN KEY ([parent_id]) REFERENCES [dbo].[comment] ([id])
);

