USE [master]
GO
DROP DATABASE [Photographer]
GO
CREATE DATABASE [Photographer]
GO
USE [Photographer]
GO

CREATE TABLE [dbo].[Gallery](
	[id] [int] NOT NULL PRIMARY KEY,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[feature_img] [nvarchar](255) NOT NULL,
)

CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[image_url] [nvarchar](255) NOT NULL,
	[gallery_id] [int] NOT NULL FOREIGN KEY REFERENCES [Gallery](id),
)

CREATE TABLE [dbo].[Count](
	[visit] int NOT NULL DEFAULT 0,
)

CREATE TABLE [dbo].[Contact](
	[telephone] [nvarchar](25) NULL,
	[email] [nvarchar](max) NULL,
	[face_url] [nvarchar](max) NULL,
	[twitter_url] [nvarchar](max) NULL,
	[google_url] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[map_url] [nvarchar](max) NULL,
	[image_main] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
)

INSERT [dbo].[Count] ([visit]) VALUES (0)

INSERT [dbo].[Contact] ([telephone], [email], [face_url], [twitter_url], [google_url], [address], [city], [country], [map_url], [image_main], [description])
	VALUES (N'0123456789', N'demo@mail.com', N'https://www.facebook.com/#', N'https://twitter.com/#', N'https://www.google.com/#', N'Khu công nghệ cao Hòa Lạc – Km29, ĐCT08, Thạch Hoà', N'Hà Nội 10000', N'Vietnam', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4429.210761626763!2d105.52715039154663!3d21.012372229332538!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2sFPT%20University!5e0!3m2!1sen!2s!4v1629021880276!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>', N'main.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna. Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci. Aenean nec lorem. In porttitor. Donec laoreet nonummy augue. Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy. Fusce aliquet pede non pede. Suspendisse dapibus lorem pellentesque magna. Integer nulla. Donec blandit feugiat ligula. Donec hendrerit, felis et imperdiet euismod, purus ipsum pretium metus, in lacinia nulla nisl eget sapien.
Donec ut est in lectus consequat consequat. Etiam eget dui. Aliquam erat volutpat. Sed at lorem in nunc porta tristique. Proin nec augue. Quisque aliquam tempor magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc ac magna. Maecenas odio dolor, vulputate vel, auctor ac, accumsan id, felis. Pellentesque cursus sagittis felis. Pellentesque porttitor, velit lacinia egestas auctor, diam eros tempus arcu, nec vulputate augue magna vel risus. Cras non magna vel ante adipiscing rhoncus. Vivamus a mi. Morbi neque. Aliquam erat volutpat. Integer ultrices lobortis eros. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin semper, ante vitae sollicitudin posuere, metus quam iaculis nibh, vitae scelerisque nunc massa eget pede. Sed velit urna, interdum vel, ultricies vel, faucibus at, quam. Donec elit est, consectetuer eget, consequat quis, tempus quis, wisi.')

INSERT [dbo].[Gallery] ([id], [title], [description], [feature_img]) VALUES (1, 'Game Gallery', 'Game Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ad temporibus adipisci! Omnis fugit architecto dolorem ipsa nam accusantium sed! Commodi in aliquid id maxime ratione velit aspernatur pariatur eveniet.', N'csgo.jpg')
INSERT [dbo].[Gallery] ([id], [title], [description], [feature_img]) VALUES (2, 'Tech Gallery', 'Tech Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ad temporibus adipisci! Omnis fugit architecto dolorem ipsa nam accusantium sed! Commodi in aliquid id maxime ratione velit aspernatur pariatur eveniet.', N'angular.jpg')
INSERT [dbo].[Gallery] ([id], [title], [description], [feature_img]) VALUES (3, 'Cake Gallery', 'Cake Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ad temporibus adipisci! Omnis fugit architecto dolorem ipsa nam accusantium sed! Commodi in aliquid id maxime ratione velit aspernatur pariatur eveniet.', N'cake1.jpg')
INSERT [dbo].[Gallery] ([id], [title], [description], [feature_img]) VALUES (4, 'DataStructure Gallery', 'DataStructure Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ad temporibus adipisci! Omnis fugit architecto dolorem ipsa nam accusantium sed! Commodi in aliquid id maxime ratione velit aspernatur pariatur eveniet.', N'datastrc.jpeg')
INSERT [dbo].[Gallery] ([id], [title], [description], [feature_img]) VALUES (5, 'People1 Gallery', 'People1 Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ad temporibus adipisci! Omnis fugit architecto dolorem ipsa nam accusantium sed! Commodi in aliquid id maxime ratione velit aspernatur pariatur eveniet.', N'i1.jpg')
INSERT [dbo].[Gallery] ([id], [title], [description], [feature_img]) VALUES (6, 'People2 Gallery', 'People2 Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ad temporibus adipisci! Omnis fugit architecto dolorem ipsa nam accusantium sed! Commodi in aliquid id maxime ratione velit aspernatur pariatur eveniet.', N'p1.jpg')

INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('cake1.jpg', 3)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('cake2.jpg', 3)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('cake3.jpg', 3)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('cake4.jpg', 3)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('cake5.jpg', 3)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('cake6.jpg', 3)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('cake7.jpg', 3)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('csgo.jpg', 1)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('pubg.jpg', 1)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('docker.jpg', 2)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('nodejs.jpg', 2)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('spring.jpg', 2)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('angular.jpg', 2)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('binarytree.jpg', 4)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('graph.jpg', 4)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('heap.jpg', 4)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('linkedlist.jpg', 4)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('queue.jpg', 4)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('stack.jpg', 4)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i1.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i2.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i3.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i4.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i5.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i6.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i7.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('i8.jpg', 5)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p1.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p2.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p3.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p4.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p5.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p6.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p7.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p8.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p9.jpg', 6)
INSERT [dbo].[Image] ([image_url], [gallery_id]) VALUES ('p10.jpg', 6)

SELECT * FROM [Gallery] g JOIN [Image] i ON g.id=i.gallery_id
WHERE g.id=3

SELECT TOP 3 * FROM [Gallery] ORDER BY [title] DESC


SELECT id,title,description,feature_img  FROM ( SELECT ROW_NUMBER() OVER (ORDER BY id ASC) AS rn , * FROM  gallery ) AS b
WHERE rn BETWEEN 1 AND 2

SELECT TOP 3 * FROM [Gallery]