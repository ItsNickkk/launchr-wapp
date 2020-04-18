CREATE TABLE [dbo].[member]
(
	[member_id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [member_name] NVARCHAR(255) NULL, 
    [member_address] NVARCHAR(255) NULL, 
	[member_country] NCHAR(50) NULL,
    [member_email] NVARCHAR(50) NULL, 
    [member_password] NCHAR(255) NULL, 
    [member_phone] NCHAR(30) NULL, 
)
