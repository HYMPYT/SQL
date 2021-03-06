create database TravelAgency
go
use TravelAgency
go
CREATE TABLE [Tours] (
	ID int NOT NULL identity(1,1),
	Name nvarchar(100) NOT NULL,
	Price money NOT NULL,
	Country_id int NOT NULL,
	City_id int NOT NULL,
	Resort_id int NOT NULL,
	Hotel_id int NOT NULL,
	RestCategory_id int NOT NULL,
  CONSTRAINT [PK_TOURS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Countries] (
	ID int NOT NULL identity(1,1),
	Name nvarchar(50) NOT NULL UNIQUE,
  CONSTRAINT [PK_COUNTRIES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Hotels] (
	ID int NOT NULL identity(1,1),
	Name nvarchar(100) NOT NULL,
	RoomType nvarchar(30) NOT NULL,
	NutritionConditions nvarchar(50) NOT NULL,
	Status nvarchar(5) NOT NULL,
  CONSTRAINT [PK_HOTELS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Cities] (
	ID int NOT NULL identity(1,1),
	Name nvarchar(50) NOT NULL UNIQUE,
  CONSTRAINT [PK_CITIES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Resorts] (
	ID int NOT NULL identity(1,1),
	Name nvarchar(100) NOT NULL,
  CONSTRAINT [PK_RESORTS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [RestCategories] (
	ID int NOT NULL identity(1,1),
	Name nvarchar(100) NOT NULL,
  CONSTRAINT [PK_RESTCATEGORIES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Clients] (
	ID int NOT NULL identity(1,1),
	FirstName nvarchar(100) NOT NULL,
	SecondName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Birthday date NOT NULL,
  CONSTRAINT [PK_CLIENTS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [SoldTours] (
	ID int NOT NULL identity(1,1),
	Client_id int NOT NULL,
	Tour_id int NOT NULL,
  CONSTRAINT [PK_SOLDTOURS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Tours] WITH CHECK ADD CONSTRAINT [Tours_fk0] FOREIGN KEY ([Country_id]) REFERENCES [Countries]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tours] CHECK CONSTRAINT [Tours_fk0]
GO
ALTER TABLE [Tours] WITH CHECK ADD CONSTRAINT [Tours_fk1] FOREIGN KEY ([City_id]) REFERENCES [Cities]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tours] CHECK CONSTRAINT [Tours_fk1]
GO
ALTER TABLE [Tours] WITH CHECK ADD CONSTRAINT [Tours_fk2] FOREIGN KEY ([Resort_id]) REFERENCES [Resorts]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tours] CHECK CONSTRAINT [Tours_fk2]
GO
ALTER TABLE [Tours] WITH CHECK ADD CONSTRAINT [Tours_fk3] FOREIGN KEY ([Hotel_id]) REFERENCES [Hotels]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tours] CHECK CONSTRAINT [Tours_fk3]
GO
ALTER TABLE [Tours] WITH CHECK ADD CONSTRAINT [Tours_fk4] FOREIGN KEY ([RestCategory_id]) REFERENCES [RestCategories]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tours] CHECK CONSTRAINT [Tours_fk4]
GO







ALTER TABLE [SoldTours] WITH CHECK ADD CONSTRAINT [SoldTours_fk0] FOREIGN KEY ([Client_id]) REFERENCES [Clients]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [SoldTours] CHECK CONSTRAINT [SoldTours_fk0]
GO
ALTER TABLE [SoldTours] WITH CHECK ADD CONSTRAINT [SoldTours_fk1] FOREIGN KEY ([Tour_id]) REFERENCES [Tours]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [SoldTours] CHECK CONSTRAINT [SoldTours_fk1]
GO

