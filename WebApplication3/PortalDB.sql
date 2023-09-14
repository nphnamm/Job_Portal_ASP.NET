CREATE DATABASE JobshuntDb;
 
use JobshuntDb;
--Company Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompanyTable](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CompanyName] [nvarchar](500) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[PhoneNo] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](500) NOT NULL,
	[Logo] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
-- Job Category Table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobCategoryTable](
	[JobCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[JobCategory] [nvarchar](350) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK__JobCateg__302BAECD892F9690] PRIMARY KEY CLUSTERED 
(
	[JobCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Job Nature Table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobNatureTable](
	[JobNatureID] [int] IDENTITY(1,1) NOT NULL,
	[JobNature] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_JobNatureTable] PRIMARY KEY CLUSTERED 
(
	[JobNatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Job Requirement Deital Table 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobRequirementDetailTable](
	[JobRequirementDetailID] [int] IDENTITY(1,1) NOT NULL,
	[JobRequirementID] [int] NOT NULL,
	[JobRequirementDetails] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_JobRequirementDetailTable] PRIMARY KEY CLUSTERED 
(
	[JobRequirementDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Job Requirements Table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobRequirementsTable](
	[JobRequirementID] [int] IDENTITY(1,1) NOT NULL,
	[JobRequirementTitle] [nvarchar](100) NOT NULL,
	[PostJobID] [int] NOT NULL,
 CONSTRAINT [PK_JobRequirementTable] PRIMARY KEY CLUSTERED 
(
	[JobRequirementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Job Status Tables
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobStatusTable](
	[JobStatusID] [int] IDENTITY(1,1) NOT NULL,
	[JobStatus] [nvarchar](150) NOT NULL,
	[StatusMessage] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[JobStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Post Job Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PostJobTable](
	[PostJobID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[JobCategoryID] [int] NOT NULL,
	[JobTitle] [nvarchar](500) NOT NULL,
	[JobDescription] [nvarchar](2000) NOT NULL,
	[MinSalary] [int] NOT NULL,
	[MixSalary] [int] NOT NULL,
	[Location] [nvarchar](500) NOT NULL,
	[Vacancey] [int] NOT NULL,
	[JobNatureID] [int] NOT NULL,
	[PostDate] [date] NOT NULL,
	[ApplicationLastDate] [date] NOT NULL,
	[LastDate] [date] NOT NULL,
	[JobRequirementID] [int] NOT NULL,
	[JobStatusID] [int] NOT NULL,
	[WebUrl] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK__PostJobT__48761C05A6D7A690] PRIMARY KEY CLUSTERED 
(
	[PostJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- User Table 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserTable](
	[UsersID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[ContactNO] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- User Type Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO









--COMPANY FOREIGN KEY

ALTER TABLE [dbo].[CompanyTable]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UsersID])
GO

ALTER TABLE [dbo].[CompanyTable] CHECK CONSTRAINT [FK_CompanyTable_UserTable]
GO


--JOB REQUIREMENT DETAIL FOREIGN KEY
ALTER TABLE [dbo].[JobRequirementDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementsTable] FOREIGN KEY([JobRequirementID])
REFERENCES [dbo].[JobRequirementsTable] ([JobRequirementID])
GO

ALTER TABLE [dbo].[JobRequirementDetailTable] CHECK CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementsTable]
GO



--POST JOB FOREIGN KEY
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_CompanyTable] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[CompanyTable] ([CompanyID])
GO

ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_CompanyTable]
GO

ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobCategoryTable] FOREIGN KEY([JobCategoryID])
REFERENCES [dbo].[JobCategoryTable] ([JobCategoryID])
GO

ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobCategoryTable]
GO

ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobNatureTable] FOREIGN KEY([JobNatureID])
REFERENCES [dbo].[JobNatureTable] ([JobNatureID])
GO

ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobNatureTable]
GO

ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobRequirementsTable] FOREIGN KEY([JobRequirementID])
REFERENCES [dbo].[JobRequirementsTable] ([JobRequirementID])
GO

ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobRequirementsTable]
GO

ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobStatusTable] FOREIGN KEY([JobStatusID])
REFERENCES [dbo].[JobStatusTable] ([JobStatusID])
GO

ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobStatusTable]
GO

ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UsersID])
GO

ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_UserTable]
GO



--USER TABLE KEY
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeTable_UserTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeId])
GO

ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTypeTable_UserTable]
GO

