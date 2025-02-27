USE [TestSchemaDB20150227]
GO
/****** Object:  Schema [Communications]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE SCHEMA [Communications]
GO
/****** Object:  Schema [MemberManagement]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE SCHEMA [MemberManagement]
GO
/****** Object:  Schema [Resources]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE SCHEMA [Resources]
GO
/****** Object:  Table [Communications].[Message]    Script Date: 1/16/2015 3:49:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Communications].[Message](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Uid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[FromAddress] [varchar](255) NOT NULL,
	[Subject] [varchar](255) NOT NULL,
	[AuditDeletedDate] [datetime] NULL,
	[AuditVersionDate] [datetime] NOT NULL,
	[AuditMemberUid] [bigint] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BogusCode]    Script Date: 1/16/2015 3:49:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BogusCode](
	[Code] [char](1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BogusCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BogusIdentifier]    Script Date: 1/16/2015 3:49:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BogusIdentifier](
	[Uid] [uniqueidentifier] NOT NULL,
	[Value] [varchar](255) NOT NULL,
 CONSTRAINT [PK_BogusIdentifier] PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MemberManagement].[Member]    Script Date: 1/16/2015 3:49:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MemberManagement].[Member](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Uid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[PassHash] [varchar](50) NOT NULL,
	[PassSalt] [varchar](50) NOT NULL,
	[AuditVersionDate] [datetime] NOT NULL,
	[AuditDeletedDate] [datetime] NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [MemberManagement].[MemberSignupRequest]    Script Date: 1/16/2015 3:49:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MemberManagement].[MemberSignupRequest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Uid] [uniqueidentifier] NOT NULL,
	[SignupRequestId] [bigint] NOT NULL,
	[MemberId] [bigint] NOT NULL,
 CONSTRAINT [PK_MemberSignupRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [MemberManagement].[SignupRequest]    Script Date: 1/16/2015 3:49:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [MemberManagement].[SignupRequest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [varchar](255) NOT NULL,
	[ConfirmationCode] [char](6) NOT NULL,
	[AuditDeletedDate] [datetime] NULL,
 CONSTRAINT [PK_SignupRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_Message]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message] ON [Communications].[Message]
(
	[AuditDeletedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Message_1]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message_1] ON [Communications].[Message]
(
	[FromAddress] ASC,
	[AuditDeletedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Member]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Member] ON [MemberManagement].[Member]
(
	[UserName] ASC,
	[AuditDeletedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MemberSignupRequest]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MemberSignupRequest] ON [MemberManagement].[MemberSignupRequest]
(
	[SignupRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MemberSignupRequest_1]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MemberSignupRequest_1] ON [MemberManagement].[MemberSignupRequest]
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MemberSignupRequest_2]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MemberSignupRequest_2] ON [MemberManagement].[MemberSignupRequest]
(
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SignupRequest]    Script Date: 1/16/2015 3:49:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SignupRequest] ON [MemberManagement].[SignupRequest]
(
	[EmailAddress] ASC,
	[AuditDeletedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Communications].[Message] ADD  CONSTRAINT [DF_Message_Uid]  DEFAULT (newid()) FOR [Uid]
GO
ALTER TABLE [MemberManagement].[Member] ADD  CONSTRAINT [DF_Member_Uid]  DEFAULT (newid()) FOR [Uid]
GO
ALTER TABLE [Communications].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Member] FOREIGN KEY([AuditMemberUid])
REFERENCES [MemberManagement].[Member] ([Id])
GO
ALTER TABLE [Communications].[Message] CHECK CONSTRAINT [FK_Message_Member]
GO
ALTER TABLE [MemberManagement].[MemberSignupRequest]  WITH CHECK ADD  CONSTRAINT [FK_MemberSignupRequest_Member] FOREIGN KEY([MemberId])
REFERENCES [MemberManagement].[Member] ([Id])
GO
ALTER TABLE [MemberManagement].[MemberSignupRequest] CHECK CONSTRAINT [FK_MemberSignupRequest_Member]
GO
ALTER TABLE [MemberManagement].[MemberSignupRequest]  WITH CHECK ADD  CONSTRAINT [FK_MemberSignupRequest_SignupRequest] FOREIGN KEY([SignupRequestId])
REFERENCES [MemberManagement].[SignupRequest] ([Id])
GO
ALTER TABLE [MemberManagement].[MemberSignupRequest] CHECK CONSTRAINT [FK_MemberSignupRequest_SignupRequest]
GO
