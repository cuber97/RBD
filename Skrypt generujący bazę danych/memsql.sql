/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     31.05.2020 18:48:21                          */
/*==============================================================*/


drop table if exists Game;

drop table if exists Player;

drop table if exists Position;

drop table if exists Stadium;

drop table if exists Team;

/*==============================================================*/
/* Table: Game                                                  */
/*==============================================================*/
create table Game
(
   GameID               int not null,
   StadiumID            int not null,
   TeamID               int not null,
   Tea_TeamID           int not null,
   MeetingDate          date not null,
   HostGoals            int not null,
   GuestGoals           int not null,
   primary key (GameID)
);

/*==============================================================*/
/* Table: Player                                                */
/*==============================================================*/
create table Player
(
   PlayerID             int not null,
   TeamID               int not null,
   PositionID           int not null,
   FirstName            varchar(100) not null,
   LastName             varchar(200) not null,
   DateOfBirth          date not null,
   HeightInCentimeters  int not null,
   Number               int not null,
   primary key (PlayerID)
);

/*==============================================================*/
/* Table: Position                                              */
/*==============================================================*/
create table Position
(
   PositionID           int not null,
   Name                 varchar(200) not null,
   primary key (PositionID)
);

/*==============================================================*/
/* Table: Stadium                                               */
/*==============================================================*/
create table Stadium
(
   StadiumID            int not null,
   Name                 varchar(200) not null,
   Country              varchar(200) not null,
   City                 varchar(200) not null,
   Capacity             int not null,
   primary key (StadiumID)
);

/*==============================================================*/
/* Table: Team                                                  */
/*==============================================================*/
create table Team
(
   TeamID               int not null,
   Name                 varchar(200) not null,
   Country              varchar(200) not null,
   primary key (TeamID)
);

alter table Game add constraint FK_FK_Game_GuestTeam foreign key (TeamID)
      references Team (TeamID);

alter table Game add constraint FK_FK_Game_HostTeam foreign key (Tea_TeamID)
      references Team (TeamID);

alter table Game add constraint FK_FK_Game_Stadium foreign key (StadiumID)
      references Stadium (StadiumID);

alter table Player add constraint FK_FK_Player_Position foreign key (PositionID)
      references Position (PositionID);

alter table Player add constraint FK_FK_Player_Team foreign key (TeamID)
      references Team (TeamID);

