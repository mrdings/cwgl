/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2012/5/14 16:42:01                           */
/*==============================================================*/


drop table if exists CWGL_GX_XFCYZ_USER;

drop table if exists CWGL_GX_XFXXZB_XFCYZ;

drop table if exists CWGL_GX_XFXXZB_XFXL;

drop table if exists CWGL_LOGIN;

drop table if exists CWGL_USER;

drop table if exists CWGL_XFCYZ;

drop table if exists CWGL_XFDL;

drop table if exists CWGL_XFXL;

drop table if exists CWGL_XFXX_ZB;

/*==============================================================*/
/* Table: CWGL_GX_XFCYZ_USER                                    */
/*==============================================================*/
create table CWGL_GX_XFCYZ_USER
(
   USERID               varchar(32) not null,
   UKEY                 varchar(32) not null,
   primary key (USERID, UKEY)
);

/*==============================================================*/
/* Table: CWGL_GX_XFXXZB_XFCYZ                                  */
/*==============================================================*/
create table CWGL_GX_XFXXZB_XFCYZ
(
   XFLSH                char(12) not null,
   UKEY                 varchar(32) not null,
   primary key (XFLSH, UKEY)
);

/*==============================================================*/
/* Table: CWGL_GX_XFXXZB_XFXL                                   */
/*==============================================================*/
create table CWGL_GX_XFXXZB_XFXL
(
   XLID                 varchar(32) not null,
   XFLSH                char(12) not null,
   primary key (XLID, XFLSH)
);

/*==============================================================*/
/* Table: CWGL_LOGIN                                            */
/*==============================================================*/
create table CWGL_LOGIN
(
   USERNAME             varchar(15) not null,
   USERID               varchar(32) not null,
   PASSWORD             varchar(20),
   DR                   bool not null,
   TS                   timestamp not null,
   SM                   text,
   FIELD2               char(10),
   FIELD3               char(10),
   FIELD4               char(10),
   FIELD5               varchar(10),
   primary key (USERNAME)
);

/*==============================================================*/
/* Table: CWGL_USER                                             */
/*==============================================================*/
create table CWGL_USER
(
   USERID               varchar(32) not null,
   USERNAME             varchar(15),
   NAME                 varchar(20) not null,
   AGE                  int,
   SEX                  bool,
   WORK                 varchar(20),
   EDUCATION            varchar(10),
   GRADUATE             varchar(20),
   ADDRESS              text,
   ADDRESS_NOW          text,
   TEL_MOBILE           char(11),
   TEL                  char(12),
   TS                   timestamp not null,
   DR                   bool not null,
   EMAIL                varchar(20),
   SM                   text,
   FIELD2               char(10),
   FIELD3               char(10),
   primary key (USERID)
);

/*==============================================================*/
/* Table: CWGL_XFCYZ                                            */
/*==============================================================*/
create table CWGL_XFCYZ
(
   JE                   float(8,0) not null,
   DR                   bool not null,
   TS                   timestamp not null,
   FIELD1               char(10),
   FIELD2               char(10),
   FIELD3               char(10),
   FIELD4               char(10),
   UKEY                 varchar(32) not null,
   primary key (UKEY)
);

/*==============================================================*/
/* Table: CWGL_XFDL                                             */
/*==============================================================*/
create table CWGL_XFDL
(
   DLMC                 varchar(20) not null,
   DLDM                 char(10) not null,
   TS                   timestamp not null,
   DR                   bool not null,
   DLID                 char(32) not null,
   primary key (DLID)
);

/*==============================================================*/
/* Table: CWGL_XFXL                                             */
/*==============================================================*/
create table CWGL_XFXL
(
   XLMC                 varchar(20) not null,
   XLDM                 char(10) not null,
   XLID                 varchar(32) not null,
   DLID                 char(32) not null,
   TS                   timestamp not null,
   DR                   bool not null,
   SM                   text,
   FIELD2               char(10),
   FIELD3               char(10),
   primary key (XLID)
);

/*==============================================================*/
/* Table: CWGL_XFXX_ZB                                          */
/*==============================================================*/
create table CWGL_XFXX_ZB
(
   XFLSH                char(12) not null,
   DLID                 char(32) not null,
   XFSJ                 timestamp not null,
   XFDD                 text,
   XFJE                 float(8,0) not null,
   BZ                   text,
   FIELD1               char(10),
   FIELD2               char(10),
   FIELD3               char(10),
   FIELD4               char(10),
   TS                   timestamp not null,
   DR                   bool,
   primary key (XFLSH)
);

alter table CWGL_GX_XFCYZ_USER add constraint FK_CWGL_GX_XFCYZ_USER foreign key (USERID)
      references CWGL_USER (USERID) on delete restrict on update restrict;

alter table CWGL_GX_XFCYZ_USER add constraint FK_CWGL_GX_XFCYZ_USER2 foreign key ()
      references CWGL_XFCYZ (UKEY) on delete restrict on update restrict;

alter table CWGL_GX_XFXXZB_XFCYZ add constraint FK_CWGL_GX_XFXXZB_XFCYZ foreign key (XFLSH)
      references CWGL_XFXX_ZB (XFLSH) on delete restrict on update restrict;

alter table CWGL_GX_XFXXZB_XFCYZ add constraint FK_CWGL_GX_XFXXZB_XFCYZ2 foreign key ()
      references CWGL_XFCYZ (UKEY) on delete restrict on update restrict;

alter table CWGL_GX_XFXXZB_XFXL add constraint FK_CWGL_GX_XFXXZB_XFXL foreign key (XLID)
      references CWGL_XFXL (XLID) on delete restrict on update restrict;

alter table CWGL_GX_XFXXZB_XFXL add constraint FK_CWGL_GX_XFXXZB_XFXL2 foreign key (XFLSH)
      references CWGL_XFXX_ZB (XFLSH) on delete restrict on update restrict;

alter table CWGL_LOGIN add constraint FK_CWGL_GX_LOGIN_USER foreign key (USERID)
      references CWGL_USER (USERID) on delete restrict on update restrict;

alter table CWGL_USER add constraint FK_CWGL_GX_LOGIN_USER2 foreign key (USERNAME)
      references CWGL_LOGIN (USERNAME) on delete restrict on update restrict;

alter table CWGL_XFXL add constraint FK_CWGL_GX_XFDL_XFXL foreign key (DLID)
      references CWGL_XFDL (DLID) on delete restrict on update restrict;

alter table CWGL_XFXX_ZB add constraint FK_CWGL_GX_XFXXZB_XFDL foreign key (DLID)
      references CWGL_XFDL (DLID) on delete restrict on update restrict;

