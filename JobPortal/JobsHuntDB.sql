USE [JobFind]
GO

/****** Object:  Table [dbo].[AccountStatusTable]    Script Date: 9/9/2023 1:19:16 PM ******/

--AccountStatus Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AccountStatusTable](
	[AccountStatusID] [int] IDENTITY(1,1) NOT NULL,
	[AccountStatus] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--Certicate Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CertificateTable](
	[CertificateID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[CertificateName] [nvarchar](500) NOT NULL,
	[CertificateAuthority] [nvarchar](1000) NOT NULL,
	[LevelCertification] [nvarchar](150) NOT NULL,
	[FromYear] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Company Table
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

--Country Table 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CountryTable](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--Current Job Status Table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CurrentJobStatusTable](
	[CurrentJobStatusID] [int] NOT NULL,
	[CurrentJobStatus] [nvarchar](450) NULL,
 CONSTRAINT [PK__CurrentJ__3152C6759175DD61] PRIMARY KEY CLUSTERED 
(
	[CurrentJobStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Education Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EducationTable](
	[EducationID] [int] IDENTITY(1,1) NOT NULL,
	[InstitudeName] [nvarchar](500) NOT NULL,
	[TitileOfEducation] [nvarchar](550) NOT NULL,
	[Degree] [nvarchar](350) NOT NULL,
	[FromYear] [date] NOT NULL,
	[ToYear] [date] NOT NULL,
	[City] [nvarchar](150) NOT NULL,
	[CountryID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- EmployeeTable
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeTable](
	[EmployeeID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[JobCategoryID] [int] NOT NULL,
	[EmployeeName] [nvarchar](150) NOT NULL,
	[DOB] [date] NOT NULL,
	[CNIC] [varchar](20) NOT NULL,
	[FNIC ] [varchar](20) NOT NULL,
	[FatherName] [nvarchar](150) NOT NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[Gender] [nvarchar](150) NOT NULL,
	[Photo] [nvarchar](max) NOT NULL,
	[Qualification] [nvarchar](150) NOT NULL,
	[PermanentAddress] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](3000) NULL,
	[JobReferences] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- Job Apply Status Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobApplyStatusTable](
	[JobApplyStatusID] [int] IDENTITY(1,1) NOT NULL,
	[JobApplyStatus] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobApplyStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Job Apply Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobApplyTable](
	[JobApplyID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[JobApplyDateTime] [datetime] NOT NULL,
	[JobApplyStatusID] [int] NOT NULL,
	[JobApplyStatusUpdateDate] [datetime] NOT NULL,
	[JobApplyStatusUpdateReason] [nvarchar](1000) NOT NULL,
	[PostJobId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobApplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Job Category Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JobCategoryTable](
	[JobCategoryID] [int] NOT NULL,
	[JobCategory] [nvarchar](350) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[JobCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--Job Nature Table
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


-- Job Requirement Detail Table
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

-- Job Requirement Table
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


-- Job Status Table
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

-- Language Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LanguageTable](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](150) NOT NULL,
	[Proficiency] [nvarchar](50) NOT NULL,
	[EmployeeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
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
 CONSTRAINT [PK__PostJobT__48761C05A6D7A690] PRIMARY KEY CLUSTERED 
(
	[PostJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Skill Table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SkillTable](
	[SkillID] [int] NOT NULL,
	[SkillName] [nvarchar](1000) NOT NULL,
	[EmployeeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- USer Table
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
	[AccountStatusID] [int] NOT NULL,
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

-- Work Experience Table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WorkExpericenTable](
	[WorkExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](550) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[CountryID] [int] NOT NULL,
	[FromYear] [date] NOT NULL,
	[ToYear] [date] NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[EmployeeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



-- FOREIGN KEY CERTIFICATE 


ALTER TABLE [dbo].[CertificateTable]  WITH CHECK ADD  CONSTRAINT [FK_CertificateTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO

ALTER TABLE [dbo].[CertificateTable] CHECK CONSTRAINT [FK_CertificateTable_EmployeeTable]
GO

-- FOREIGN KEY COMPANY 
ALTER TABLE [dbo].[CompanyTable]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UsersID])
GO

ALTER TABLE [dbo].[CompanyTable] CHECK CONSTRAINT [FK_CompanyTable_UserTable]
GO


-- FOREIGN KEY EMPLOYEE 
ALTER TABLE [dbo].[EmployeeTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTable_CountryTable] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryTable] ([CountryID])
GO

ALTER TABLE [dbo].[EmployeeTable] CHECK CONSTRAINT [FK_EmployeeTable_CountryTable]
GO

ALTER TABLE [dbo].[EmployeeTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTable_JobCategoryTable] FOREIGN KEY([JobCategoryID])
REFERENCES [dbo].[JobCategoryTable] ([JobCategoryID])
GO

ALTER TABLE [dbo].[EmployeeTable] CHECK CONSTRAINT [FK_EmployeeTable_JobCategoryTable]
GO

ALTER TABLE [dbo].[EmployeeTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UsersID])
GO

ALTER TABLE [dbo].[EmployeeTable] CHECK CONSTRAINT [FK_EmployeeTable_UserTable]
GO


-- FOREIGN KEY JOB APPLY
ALTER TABLE [dbo].[JobApplyTable]  WITH CHECK ADD  CONSTRAINT [FK_JobApplyTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO

ALTER TABLE [dbo].[JobApplyTable] CHECK CONSTRAINT [FK_JobApplyTable_EmployeeTable]
GO

ALTER TABLE [dbo].[JobApplyTable]  WITH CHECK ADD  CONSTRAINT [FK_JobApplyTable_JobApplyStatusTable] FOREIGN KEY([JobApplyStatusID])
REFERENCES [dbo].[JobApplyStatusTable] ([JobApplyStatusID])
GO

ALTER TABLE [dbo].[JobApplyTable] CHECK CONSTRAINT [FK_JobApplyTable_JobApplyStatusTable]
GO

ALTER TABLE [dbo].[JobApplyTable]  WITH CHECK ADD  CONSTRAINT [FK_JobApplyTable_PostJobTable] FOREIGN KEY([PostJobId])
REFERENCES [dbo].[PostJobTable] ([PostJobID])
GO

ALTER TABLE [dbo].[JobApplyTable] CHECK CONSTRAINT [FK_JobApplyTable_PostJobTable]
GO

-- FOREIGN KEY JOB REQUIREMENT DETAIL 
ALTER TABLE [dbo].[JobRequirementDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementsTable] FOREIGN KEY([JobRequirementID])
REFERENCES [dbo].[JobRequirementsTable] ([JobRequirementID])
GO

ALTER TABLE [dbo].[JobRequirementDetailTable] CHECK CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementsTable]
GO
-- FOREIGN KEY LANGUAGE 
ALTER TABLE [dbo].[LanguageTable]  WITH CHECK ADD  CONSTRAINT [FK_LanguageTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO

ALTER TABLE [dbo].[LanguageTable] CHECK CONSTRAINT [FK_LanguageTable_EmployeeTable]
GO
-- FOREIGN KEY POST JOB
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

-- FOREIGN KEY SKILL 
ALTER TABLE [dbo].[SkillTable]  WITH CHECK ADD  CONSTRAINT [FK_SkillTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO

ALTER TABLE [dbo].[SkillTable] CHECK CONSTRAINT [FK_SkillTable_EmployeeTable]
GO
-- FOREIGN KEY USER 

ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_AccountStatusTable] FOREIGN KEY([AccountStatusID])
REFERENCES [dbo].[AccountStatusTable] ([AccountStatusID])
GO

ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_AccountStatusTable]
GO

ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeTable_UserTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeId])
GO

ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTypeTable_UserTable]
GO

-- FOREIGN KEY WORK EXPERIENCE
ALTER TABLE [dbo].[WorkExpericenTable]  WITH CHECK ADD  CONSTRAINT [FK_WorkExpericenTable_CountryTable] FOREIGN KEY([CountryID])
REFERENCES [dbo].[CountryTable] ([CountryID])
GO

ALTER TABLE [dbo].[WorkExpericenTable] CHECK CONSTRAINT [FK_WorkExpericenTable_CountryTable]
GO


