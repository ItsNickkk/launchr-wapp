CREATE TABLE [dbo].[tier] (
    [id]          INT          NOT NULL IDENTITY(400001, 1),
    [value]       INT          NOT NULL,
    [description] TEXT         NOT NULL,
    [project_id]  INT          NOT NULL,
    [max_amount]  INT          NOT NULL,
    [title]       VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_project_id_tier] FOREIGN KEY ([project_id]) REFERENCES [dbo].[project] ([id])
);

