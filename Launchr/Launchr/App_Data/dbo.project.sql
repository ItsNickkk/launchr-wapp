CREATE TABLE [dbo].[project] (
    [id]           INT           IDENTITY (300001, 1) NOT NULL,
    [creator_id]   INT           NOT NULL,
    [title]        VARCHAR (50)  NOT NULL,
    [time_created] DATETIME      NOT NULL,
    [time_end]     DATETIME      NOT NULL,
    [description]  VARCHAR (250) NOT NULL,
	[target]       INT           NOT NULL,
    [status]       INT           NOT NULL,
    [topic]        VARCHAR (20)  NOT NULL,
    [content]      TEXT          NOT NULL,
    [imagePath]    VARCHAR (250) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_creator_id_project] FOREIGN KEY ([creator_id]) REFERENCES [dbo].[creator] ([id])
);

