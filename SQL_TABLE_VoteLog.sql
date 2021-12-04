USE [website]
GO

/****** Object:  Table [dbo].[_VoteLog]    Script Date: 12/4/2021 8:32:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[_VoteLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](20) NOT NULL,
	[userIp] [varchar](50) NOT NULL,
	[lastVoteDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__VoteLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[_VoteLog] ADD  CONSTRAINT [DF__VoteLog_lastVoteDate]  DEFAULT (getdate()) FOR [lastVoteDate]
GO

