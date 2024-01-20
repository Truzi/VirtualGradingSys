-- Parents --
SET IDENTITY_INSERT [dbo].[Parents] ON
INSERT INTO [dbo].[Parents] ([Id], [FirstName], [LastName]) VALUES (1, N'Rodzic', N'A')
INSERT INTO [dbo].[Parents] ([Id], [FirstName], [LastName]) VALUES (2, N'Rodzic', N'B')
INSERT INTO [dbo].[Parents] ([Id], [FirstName], [LastName]) VALUES (3, N'Rodzic', N'C')
INSERT INTO [dbo].[Parents] ([Id], [FirstName], [LastName]) VALUES (4, N'Rodzic', N'D')
SET IDENTITY_INSERT [dbo].[Parents] OFF

-- Teachers --
SET IDENTITY_INSERT [dbo].[Teachers] ON
INSERT INTO [dbo].[Teachers] ([Id], [FirstName], [LastName]) VALUES (1, N'Nauczyciel', N'A')
INSERT INTO [dbo].[Teachers] ([Id], [FirstName], [LastName]) VALUES (2, N'Nauczyciel', N'B')
INSERT INTO [dbo].[Teachers] ([Id], [FirstName], [LastName]) VALUES (3, N'Nauczyciel', N'C')
INSERT INTO [dbo].[Teachers] ([Id], [FirstName], [LastName]) VALUES (4, N'Nauczyciel', N'D')
SET IDENTITY_INSERT [dbo].[Teachers] OFF

-- Classes --
SET IDENTITY_INSERT [dbo].[Classes] ON
INSERT INTO [dbo].[Classes] ([Id], [Year], [Letter], [TeacherId]) VALUES (1, N'I', N'A', 1)
INSERT INTO [dbo].[Classes] ([Id], [Year], [Letter], [TeacherId]) VALUES (2, N'II', N'A', 2)
INSERT INTO [dbo].[Classes] ([Id], [Year], [Letter], [TeacherId]) VALUES (3, N'I', N'B', 3)
INSERT INTO [dbo].[Classes] ([Id], [Year], [Letter], [TeacherId]) VALUES (4, N'III', N'A', 4)
SET IDENTITY_INSERT [dbo].[Classes] OFF

-- Students --
SET IDENTITY_INSERT [dbo].[Students] ON
INSERT INTO [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [ParentId]) VALUES (1, N'Uczen', N'A', 1, 1)
INSERT INTO [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [ParentId]) VALUES (2, N'Uczen', N'B', 1, 3)
INSERT INTO [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [ParentId]) VALUES (3, N'Uczen', N'C', 3, 2)
INSERT INTO [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [ParentId]) VALUES (4, N'Uczen', N'D', 3, 4)
INSERT INTO [dbo].[Students] ([Id], [FirstName], [LastName], [ClassId], [ParentId]) VALUES (5, N'Uczen', N'E', 2, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF

-- Subjects --
SET IDENTITY_INSERT [dbo].[Subjects] ON
INSERT INTO [dbo].[Subjects] ([Id], [Name], [TeacherId]) VALUES (1, N'Biology', 1)
INSERT INTO [dbo].[Subjects] ([Id], [Name], [TeacherId]) VALUES (2, N'Math', 2)
INSERT INTO [dbo].[Subjects] ([Id], [Name], [TeacherId]) VALUES (3, N'English', 3)
INSERT INTO [dbo].[Subjects] ([Id], [Name], [TeacherId]) VALUES (4, N'New Subject', 3)
SET IDENTITY_INSERT [dbo].[Subjects] OFF

-- ClassSubjects --
SET IDENTITY_INSERT [dbo].[ClassSubjects] ON
INSERT INTO [dbo].[ClassSubjects] ([Id], [SubjectId], [ClassId]) VALUES (1, 1, 1)
INSERT INTO [dbo].[ClassSubjects] ([Id], [SubjectId], [ClassId]) VALUES (2, 2, 1)
INSERT INTO [dbo].[ClassSubjects] ([Id], [SubjectId], [ClassId]) VALUES (3, 1, 2)
INSERT INTO [dbo].[ClassSubjects] ([Id], [SubjectId], [ClassId]) VALUES (4, 3, 2)
INSERT INTO [dbo].[ClassSubjects] ([Id], [SubjectId], [ClassId]) VALUES (5, 3, 3)
INSERT INTO [dbo].[ClassSubjects] ([Id], [SubjectId], [ClassId]) VALUES (6, 4, 2)
SET IDENTITY_INSERT [dbo].[ClassSubjects] OFF

-- Grades --
SET IDENTITY_INSERT [dbo].[Grades] ON
INSERT INTO [dbo].[Grades] ([Id], [Value], [Type], [Date], [StudentId], [SubjectId]) VALUES (1, 4, N'Exam', N'2024-01-17', 1, 1)
INSERT INTO [dbo].[Grades] ([Id], [Value], [Type], [Date], [StudentId], [SubjectId]) VALUES (2, 5, N'Activity', N'2024-01-16', 2, 1)
INSERT INTO [dbo].[Grades] ([Id], [Value], [Type], [Date], [StudentId], [SubjectId]) VALUES (3, 4, N'Quiz', N'2024-01-04', 4, 3)
INSERT INTO [dbo].[Grades] ([Id], [Value], [Type], [Date], [StudentId], [SubjectId]) VALUES (4, 1, N'Exam', N'2024-01-01', 5, 1)
INSERT INTO [dbo].[Grades] ([Id], [Value], [Type], [Date], [StudentId], [SubjectId]) VALUES (5, 6, N'Activity', N'2024-01-17', 1, 2)
SET IDENTITY_INSERT [dbo].[Grades] OFF

-- Events --
SET IDENTITY_INSERT [dbo].[Events] ON
INSERT INTO [dbo].[Events] ([Id], [Title], [Description]) VALUES (1, N'Event 1', N'Totally legit event sadasd')
INSERT INTO [dbo].[Events] ([Id], [Title], [Description]) VALUES (4, N'evencik', N'opis')
SET IDENTITY_INSERT [dbo].[Events] OFF

-- AspNetRoles --
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', NULL)
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'305920e7-5d75-4770-858a-c3cb255ed375', N'Teacher', N'TEACHER', NULL)
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'62203bef-efc7-4fe1-a3bb-dff95daead74', N'Parent', N'PARENT', NULL)
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c95873e7-d9ec-4ec3-86de-100f78f68a6a', N'Student', N'STUDENT', NULL)

-- AspNetUsers --
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'09d5783d-234f-4e59-b9b7-e9559b5a2ddb', N'rodzic.b@p.com', N'RODZIC.B@P.COM', N'rodzic.b@p.com', N'RODZIC.B@P.COM', 0, N'AQAAAAIAAYagAAAAEDKZTTwj/VmyVZsPBAHps+vwQWSghj8P01HCENt+S2MhOX4DIKyRQjO7lUD+GM3PxQ==', N'XJAUVGTAZ5WZEZKRYPVXAMRUHMAYQINZ', N'090de8bc-3ab9-4e3b-a278-a16c08aeac26', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'15da40cd-2420-4db6-94b1-c2daa03fc960', N'uczen.e@s.com', N'UCZEN.E@S.COM', N'uczen.e@s.com', N'UCZEN.E@S.COM', 0, N'AQAAAAIAAYagAAAAEESpeZgvKNrkB6va1s/ez2PcV2mttBd1WZm6ENpwd9YmR0VkIJ4e59c46SyZY8/09Q==', N'V2BOSTLWIMBQ23JAIS4XP5JAB3KZRQXQ', N'5adcd785-6249-4218-8b5e-01c078ad4d19', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'32b79b33-921b-4547-953f-ea3a21d678f4', N'uczen.c@s.com', N'UCZEN.C@S.COM', N'uczen.c@s.com', N'UCZEN.C@S.COM', 0, N'AQAAAAIAAYagAAAAEGbeuXX43ltYt2S0Tf3SUhb7uSMi3N2XqAL+XDlcW+tcahXmVy6ZuvuWUO7MlHTeHQ==', N'62T7X4UMCN7NITIMDV3BCIKGZIV7S4CH', N'32163436-b27c-4da3-ba21-b76b007681af', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'45a003f7-5405-428d-b14f-e68e57552c3b', N'uczen.a@s.com', N'UCZEN.A@S.COM', N'uczen.a@s.com', N'UCZEN.A@S.COM', 0, N'AQAAAAIAAYagAAAAECUXM7T8q9d8zqq3iQfhevcGd3YuHP9uNj9ghiW+lQnp4UKIC/Nm8no4ctuGB/GwoA==', N'ZIJUL3UZCG67ZQUTJ3L3KFC7SSB6YWTV', N'66639e34-937d-4cec-b8b9-7f95c4d6f93a', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6735a9b7-b273-4c3d-b7b8-6091a105db56', N'nauczyciel.b@t.com', N'NAUCZYCIEL.B@T.COM', N'nauczyciel.b@t.com', N'NAUCZYCIEL.B@T.COM', 0, N'AQAAAAIAAYagAAAAEOGLBjaTyHiPoJ7cMbI/i34W07mMh1uBbB0hWbr8c6q4+VP0xo3it1TCgnVZCBqayg==', N'334GGF3KCUMDCO4Y5ONCPJFKLOSXG2AP', N'28557b0c-2e77-4cb7-a5a3-1e71344ec593', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'68c1f7da-7e80-4919-9512-655f6b657a93', N'rodzic.d@p.com', N'RODZIC.D@P.COM', N'rodzic.d@p.com', N'RODZIC.D@P.COM', 0, N'AQAAAAIAAYagAAAAEIS/vOVRtxrih4fetUbrH4wFXYkT9HIePtFF2/Dqm5epFTUB4qB1zKKBNETEYXG2+Q==', N'FK3W4IFK7WAO4HIXU4KDINHO6PE3E7CU', N'afcabdca-2dcd-439c-9fef-3ad823779438', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7d4876b6-d2da-41f9-928a-170206c55f7f', N'admin@admin.com', N'ADMIN@ADMIN.COM', N'admin@admin.com', N'ADMIN@ADMIN.COM', 0, N'AQAAAAIAAYagAAAAEHniVg0Jj96BsGBJl8PCilJ0VDOoA675Aqqi3aYadFVEzPPBRy3AabIvWlg8+3J32g==', N'5CFDQH7JTJSYS3FOVN2JSWVECMO3ERTZ', N'd9800041-313e-4fa6-b2df-b62d6f2ead39', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8c47bce2-ffa9-4ee0-befe-50cd2878d977', N'nauczyciel.a@t.com', N'NAUCZYCIEL.A@T.COM', N'nauczyciel.a@t.com', N'NAUCZYCIEL.A@T.COM', 0, N'AQAAAAIAAYagAAAAEEIGbRdCiI+zm9ChHEwoi/SUo6jDLOJVke/ekcq0EZPZuELUlGFg+1Rrq7u1tnnJ6A==', N'NP6HOPL7PGLFZU4U75EWZ5QCSOCLPOVE', N'30a89298-424b-4aea-a559-c99e66bb15ed', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8dedba0f-4354-443e-a6aa-5686ed4c8ffd', N'nauczyciel.d@t.com', N'NAUCZYCIEL.D@T.COM', N'nauczyciel.d@t.com', N'NAUCZYCIEL.D@T.COM', 0, N'AQAAAAIAAYagAAAAEE3orQKwGSwLJJCL0in77UjVV9mDr+AxVkejP+i26o2iDdwUKuCtlxtJiojArCI5WA==', N'IJUCAYLW7OPLTDKW5S7DSXG6A62U4K4B', N'7ca9af39-11b7-4b36-b7af-133627434818', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a140e234-44d4-4f17-80f5-f37f6d784171', N'rodzic.c@p.com', N'RODZIC.C@P.COM', N'rodzic.c@p.com', N'RODZIC.C@P.COM', 0, N'AQAAAAIAAYagAAAAEGsMHdq/UrIFoI0TG/5PBHn/YEefpHlDV/6Py2PZenJy37k9RukapB1XOsK3w65juQ==', N'WW2MKQP27XTM3R5BTHJMTCEMJEAOCSVX', N'185b08a0-672c-4fbd-8628-98ab2cac4302', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a22537fe-8ac1-43ba-ab10-ae84e1aaaba1', N'nauczyciel.c@t.com', N'NAUCZYCIEL.C@T.COM', N'nauczyciel.c@t.com', N'NAUCZYCIEL.C@T.COM', 0, N'AQAAAAIAAYagAAAAEK2e3XAdFditoTIP17uxgIi1ClPMUJIxRGySZhv/04vVzTDovWluqGVzIZMxaRXbeg==', N'ADQEXRCHDXVGSQWJKSQ44JWMBNANT46F', N'ea0aaf9e-a9bb-4dc0-8b1a-3f1e376c864f', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b9b08902-eb37-43d0-aaaa-3cc2f6c1b8c8', N'uczen.d@s.com', N'UCZEN.D@S.COM', N'uczen.d@s.com', N'UCZEN.D@S.COM', 0, N'AQAAAAIAAYagAAAAEC5FDW5pM439kUi7VLpg92lzFuCPOrrYs5fUB8xkHsiBvoewsCSEaG4LaU47aTRdIQ==', N'7QLMO544LIIBIVRMZQPRKUCHDHZT7EDE', N'b6f7462e-7970-4569-abcc-87fcdac0060a', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ba17d6a0-7640-4ccb-9c91-5ac790574714', N'uczen.b@s.com', N'UCZEN.B@S.COM', N'uczen.b@s.com', N'UCZEN.B@S.COM', 0, N'AQAAAAIAAYagAAAAEK7P7++PyDzYdWAASGn8ZLPtxS2CcAI5aj7WblELawWNfhsZ6c7C2i8iKNm5j8J42A==', N'XXPFM6WFNWSQSNNGXLGVJ5UFYLACI75U', N'998fed40-64cf-471d-8869-a2c60976fd42', NULL, 0, 0, NULL, 1, 0)
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd587220a-cf0c-4f36-97a3-29cf40533576', N'rodzic.a@p.com', N'RODZIC.A@P.COM', N'rodzic.a@p.com', N'RODZIC.A@P.COM', 0, N'AQAAAAIAAYagAAAAEMhJdstZ/Mjw/sqHlHjJEQ8itdZlGfWBgot4Lmr/U1UdMRTcYRUGPW0eVup1ze+/gw==', N'OJPQNBWW6QODZR2X6PZNTOX53ADF6RB3', N'21a5d37e-f6b7-43b1-b2ba-edc972841546', NULL, 0, 0, NULL, 1, 0)

-- AspNetUserRoles --
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7d4876b6-d2da-41f9-928a-170206c55f7f', N'1')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6735a9b7-b273-4c3d-b7b8-6091a105db56', N'305920e7-5d75-4770-858a-c3cb255ed375')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8c47bce2-ffa9-4ee0-befe-50cd2878d977', N'305920e7-5d75-4770-858a-c3cb255ed375')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8dedba0f-4354-443e-a6aa-5686ed4c8ffd', N'305920e7-5d75-4770-858a-c3cb255ed375')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a22537fe-8ac1-43ba-ab10-ae84e1aaaba1', N'305920e7-5d75-4770-858a-c3cb255ed375')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'09d5783d-234f-4e59-b9b7-e9559b5a2ddb', N'62203bef-efc7-4fe1-a3bb-dff95daead74')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'68c1f7da-7e80-4919-9512-655f6b657a93', N'62203bef-efc7-4fe1-a3bb-dff95daead74')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a140e234-44d4-4f17-80f5-f37f6d784171', N'62203bef-efc7-4fe1-a3bb-dff95daead74')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd587220a-cf0c-4f36-97a3-29cf40533576', N'62203bef-efc7-4fe1-a3bb-dff95daead74')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'15da40cd-2420-4db6-94b1-c2daa03fc960', N'c95873e7-d9ec-4ec3-86de-100f78f68a6a')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'32b79b33-921b-4547-953f-ea3a21d678f4', N'c95873e7-d9ec-4ec3-86de-100f78f68a6a')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'45a003f7-5405-428d-b14f-e68e57552c3b', N'c95873e7-d9ec-4ec3-86de-100f78f68a6a')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b9b08902-eb37-43d0-aaaa-3cc2f6c1b8c8', N'c95873e7-d9ec-4ec3-86de-100f78f68a6a')
INSERT INTO [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ba17d6a0-7640-4ccb-9c91-5ac790574714', N'c95873e7-d9ec-4ec3-86de-100f78f68a6a')