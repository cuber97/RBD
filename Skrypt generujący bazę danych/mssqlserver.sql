/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     31.05.2020 18:47:20                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Game') and o.name = 'FK_GAME_FK_GAME_G_TEAM')
alter table Game
   drop constraint FK_GAME_FK_GAME_G_TEAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Game') and o.name = 'FK_GAME_FK_GAME_H_TEAM')
alter table Game
   drop constraint FK_GAME_FK_GAME_H_TEAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Game') and o.name = 'FK_GAME_FK_GAME_S_STADIUM')
alter table Game
   drop constraint FK_GAME_FK_GAME_S_STADIUM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Player') and o.name = 'FK_PLAYER_FK_PLAYER_POSITION')
alter table Player
   drop constraint FK_PLAYER_FK_PLAYER_POSITION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Player') and o.name = 'FK_PLAYER_FK_PLAYER_TEAM')
alter table Player
   drop constraint FK_PLAYER_FK_PLAYER_TEAM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Game')
            and   name  = 'FK_Game_Stadium_FK'
            and   indid > 0
            and   indid < 255)
   drop index Game.FK_Game_Stadium_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Game')
            and   name  = 'FK_Game_GuestTeam_FK'
            and   indid > 0
            and   indid < 255)
   drop index Game.FK_Game_GuestTeam_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Game')
            and   name  = 'FK_Game_HostTeam_FK'
            and   indid > 0
            and   indid < 255)
   drop index Game.FK_Game_HostTeam_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Game')
            and   type = 'U')
   drop table Game
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Player')
            and   name  = 'FK_Player_Position_FK'
            and   indid > 0
            and   indid < 255)
   drop index Player.FK_Player_Position_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Player')
            and   name  = 'FK_Player_Team_FK'
            and   indid > 0
            and   indid < 255)
   drop index Player.FK_Player_Team_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Player')
            and   type = 'U')
   drop table Player
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Position')
            and   type = 'U')
   drop table Position
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Stadium')
            and   type = 'U')
   drop table Stadium
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Team')
            and   type = 'U')
   drop table Team
go

/*==============================================================*/
/* Table: Game                                                  */
/*==============================================================*/
create table Game (
   GameID               int                  identity(1,1),
   StadiumID            int                  not null,
   HostTeamID           int                  not null,
   GuestTeamID          int                  not null,
   MeetingDate          date                 not null,
   HostGoals            int                  not null,
   GuestGoals           int                  not null,
   constraint PK_GAME primary key nonclustered (GameID)
)
go

/*==============================================================*/
/* Index: FK_Game_HostTeam_FK                                   */
/*==============================================================*/
create index FK_Game_HostTeam_FK on Game (
GuestTeamID ASC
)
go

/*==============================================================*/
/* Index: FK_Game_GuestTeam_FK                                  */
/*==============================================================*/
create index FK_Game_GuestTeam_FK on Game (
HostTeamID ASC
)
go

/*==============================================================*/
/* Index: FK_Game_Stadium_FK                                    */
/*==============================================================*/
create index FK_Game_Stadium_FK on Game (
StadiumID ASC
)
go

/*==============================================================*/
/* Table: Player                                                */
/*==============================================================*/
create table Player (
   PlayerID             int                  identity(1,1),
   TeamID               int                  not null,
   PositionID           int                  not null,
   FirstName            varchar(100)         not null,
   LastName             varchar(200)         not null,
   DateOfBirth          date                 not null,
   HeightInCentimeters  int                  not null,
   Number               int                  not null,
   constraint PK_PLAYER primary key nonclustered (PlayerID)
)
go

/*==============================================================*/
/* Index: FK_Player_Team_FK                                     */
/*==============================================================*/
create index FK_Player_Team_FK on Player (
TeamID ASC
)
go

/*==============================================================*/
/* Index: FK_Player_Position_FK                                 */
/*==============================================================*/
create index FK_Player_Position_FK on Player (
PositionID ASC
)
go

/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
create table Position (
   PositionID           int                  identity(1,1),
   Name                 varchar(200)         not null,
   constraint PK_POSITION primary key nonclustered (PositionID)
)
go

/*==============================================================*/
/* Table: Stadium                                               */
/*==============================================================*/
create table Stadium (
   StadiumID            int                  identity(1,1),
   Name                 varchar(200)         not null,
   Country              varchar(200)         not null,
   City                 varchar(200)         not null,
   Capacity             int                  not null,
   constraint PK_STADIUM primary key nonclustered (StadiumID)
)
go

/*==============================================================*/
/* Table: Team                                                  */
/*==============================================================*/
create table Team (
   TeamID               int                  identity(1,1),
   Name                 varchar(200)         not null,
   Country              varchar(200)         not null,
   constraint PK_TEAM primary key nonclustered (TeamID)
)
go

alter table Game
   add constraint FK_GAME_FK_GAME_G_TEAM foreign key (HostTeamID)
      references Team (TeamID)
go

alter table Game
   add constraint FK_GAME_FK_GAME_H_TEAM foreign key (GuestTeamID)
      references Team (TeamID)
go

alter table Game
   add constraint FK_GAME_FK_GAME_S_STADIUM foreign key (StadiumID)
      references Stadium (StadiumID)
go

alter table Player
   add constraint FK_PLAYER_FK_PLAYER_POSITION foreign key (PositionID)
      references Position (PositionID)
go

alter table Player
   add constraint FK_PLAYER_FK_PLAYER_TEAM foreign key (TeamID)
      references Team (TeamID)
go

