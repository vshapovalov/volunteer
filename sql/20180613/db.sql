/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.21-log : Database - volunteer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `admin_setting_groups` */

DROP TABLE IF EXISTS `admin_setting_groups`;

CREATE TABLE `admin_setting_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_setting_groups` */

insert  into `admin_setting_groups`(`id`,`code`,`name`) values 
(1,'site','Сайт'),
(2,'admin','Админ.панель');

/*Table structure for table `admin_settings` */

DROP TABLE IF EXISTS `admin_settings`;

CREATE TABLE `admin_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_setting_group_id` int(10) unsigned DEFAULT NULL,
  `crud_field_type_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_settings_admin_setting_group_id_foreign` (`admin_setting_group_id`),
  KEY `admin_settings_crud_field_type_id_foreign` (`crud_field_type_id`),
  CONSTRAINT `admin_settings_admin_setting_group_id_foreign` FOREIGN KEY (`admin_setting_group_id`) REFERENCES `admin_setting_groups` (`id`),
  CONSTRAINT `admin_settings_crud_field_type_id_foreign` FOREIGN KEY (`crud_field_type_id`) REFERENCES `crud_field_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_settings` */

/*Table structure for table `crud_field_types` */

DROP TABLE IF EXISTS `crud_field_types`;

CREATE TABLE `crud_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crud_field_types` */

insert  into `crud_field_types`(`id`,`code`,`name`) values 
(1,'textbox','textbox'),
(2,'checkbox','checkbox'),
(3,'colorbox','colorbox'),
(4,'textarea','textarea'),
(5,'datepicker','datepicker'),
(6,'richedit','richedit'),
(7,'image','image');

/*Table structure for table `crud_fields` */

DROP TABLE IF EXISTS `crud_fields`;

CREATE TABLE `crud_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crud_form_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `by_default` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json` tinyint(1) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tab` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `columns` int(11) NOT NULL DEFAULT '12',
  `crud_relation_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crud_fields` */

insert  into `crud_fields`(`id`,`crud_form_id`,`name`,`caption`,`type`,`visibility`,`by_default`,`json`,`readonly`,`description`,`tab`,`validation`,`additional`,`order`,`columns`,`crud_relation_id`,`created_at`,`updated_at`) values 
(1,NULL,'add','Добавление','checkbox','[ \"browse\", \"edit\", \"add\" ]','1',0,0,NULL,'Основные параметры','required',NULL,1,6,10,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(2,NULL,'edit','Редактирование','checkbox','[ \"browse\", \"edit\", \"add\" ]','1',0,0,NULL,'Основные параметры',NULL,NULL,2,6,10,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(3,NULL,'delete','Удаление','checkbox','[ \"browse\", \"edit\", \"add\" ]','1',0,0,NULL,'Основные параметры','required',NULL,3,6,10,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(4,1,'name','ФИО','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,1,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(5,1,'password','Пароль','textbox','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,'{ \"mode\":\"password\"}',3,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(6,1,'email','E-mail','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,2,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(7,2,'code','code','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,2,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(8,2,'name','name','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,1,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(9,2,'model','model','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,3,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(10,2,'id','id field','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,4,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(11,2,'display','display field','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,5,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(12,2,'type','type','dropdown','[ \"browse\", \"edit\", \"add\" ]','list',0,0,NULL,'Основные параметры','required','{\"mode\":\"single\", \"values\": [ {\"key\":\"list\", \"value\":\"list\"}, {\"key\":\"tree\", \"value\":\"tree\"} ]}',6,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(13,2,'fields','fields','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Поля',NULL,'{ \"buttons\": [ \"add\", \"delete_all\"]}',7,12,3,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(14,2,'scopes','Scopes','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Scopes',NULL,'{ \"buttons\": [ \"add\", \"delete_all\"]}',8,12,2,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(15,3,'name','Param name','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,0,12,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(16,4,'name','name','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,0,12,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(17,4,'params','Scope params','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,1,12,1,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(18,5,'name','name','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,1,6,NULL,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(19,5,'caption','caption','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,2,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(20,5,'type','type','dropdown','[ \"browse\", \"edit\", \"add\" ]','textbox',0,0,NULL,'Основные параметры','required','{ \"mode\": \"single\", \"values\": [ {\"key\":\"textbox\", \"value\":\"textbox\"}, {\"key\":\"colorbox\", \"value\":\"colorbox\"}, {\"key\":\"checkbox\", \"value\":\"checkbox\"}, {\"key\":\"textarea\", \"value\":\"textarea\"}, {\"key\":\"datepicker\", \"value\":\"datepicker\"}, {\"key\":\"richedit\", \"value\":\"richedit\"}, {\"key\":\"image\", \"value\":\"image\"}, {\"key\":\"dynamic\", \"value\":\"dynamic\"}, {\"key\":\"relation\", \"value\":\"relation\"}, {\"key\":\"dropdown\", \"value\":\"dropdown\"} ]}',3,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(21,5,'relation','relation','relation','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,4,6,5,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(22,5,'visibility','visibility','dropdown','[ \"browse\", \"edit\", \"add\" ]','[ \"edit\", \"add\" ]',0,0,NULL,'Основные параметры','required','{ \"mode\":\"multi\",\"values\": [ {\"key\":\"browse\", \"value\": \"browse\"}, {\"key\":\"add\", \"value\": \"add\"}, {\"key\":\"edit\", \"value\": \"edit\"} ]}',5,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(23,5,'by_default','by_default','textbox','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,6,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(24,5,'validation','validation','textbox','[\"add\",\"edit\"]','required',0,0,NULL,'Основные параметры',NULL,NULL,7,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(25,5,'tab','tab','textbox','[\"add\",\"edit\"]','Основные параметры',0,0,NULL,'Основные параметры','required',NULL,9,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(26,5,'json','json','checkbox','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,11,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(27,5,'readonly','readonly','checkbox','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,12,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(28,5,'description','description','textarea','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,14,12,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(29,5,'additional','additional','textarea','[\"add\",\"edit\"]','{ \"mode\":\"single\", \"type\":\"image\", \"resize\": {\"width\": 1440, \"height\": null, \"quality\": 90}}   {\"mode\":\"single\", \"values\": [ {\"key\":\"\", \"value\":\"\"} ]}',0,0,NULL,'Основные параметры',NULL,NULL,13,12,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(30,5,'order','order','textbox','[\"add\",\"edit\"]','0',0,0,NULL,'Основные параметры','required',NULL,9,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(31,5,'columns','columns','dropdown','[\"add\",\"edit\"]','6',0,0,NULL,'Основные параметры','required','{\"mode\":\"single\", \"values\": [ {\"key\": 12, \"value\":\"12\"}, {\"key\": 6, \"value\":\"6\"}, {\"key\": 4, \"value\":\"4\"}, {\"key\": 3, \"value\":\"3\"}]}',10,6,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(32,6,'type','Тип','dropdown','[ \"browse\", \"edit\", \"add\" ]','belongsTo',0,0,NULL,'Основные параметры','required','{\"mode\":\"single\", \"values\": [ {\"key\":\"belongsTo\", \"value\":\"belongsTo\"}, {\"key\":\"belongsToMany\",\"value\":\"belongsToMany\"}, {\"key\":\"hasOne\",\"value\":\"hasOne\"}, {\"key\":\"hasMany\",\"value\":\"hasMany\"} ]}',0,12,NULL,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(33,6,'crud','crud','relation','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,1,12,4,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(34,6,'pivot','pivot','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Pivot',NULL,NULL,2,12,3,'2018-06-13 08:33:12','2018-06-13 08:33:12'),
(35,7,'name','name','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,1,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(36,7,'caption','caption','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,2,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(37,7,'action','action','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,3,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(38,7,'status','status','dropdown','[\"add\",\"edit\"]','enabled',0,0,NULL,'Основные параметры','required','{\"mode\":\"single\", \"values\": [ {\"key\":\"disabled\", \"value\":\"disabled\"},{\"key\":\"enabled\", \"value\":\"enabled\"} ]}',4,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(39,7,'order','order','textbox','[\"add\",\"edit\"]','0',0,0,NULL,'Основные параметры','required',NULL,5,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(40,7,'default','default','checkbox','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,6,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(41,7,'parent','parent','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,7,6,6,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(42,8,'code','Код','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,0,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(43,8,'name','Название','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,1,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(44,8,'users','Пользователи','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Пользователи',NULL,NULL,2,12,8,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(45,8,'menus','Доступ к меню','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Доступ к меню',NULL,NULL,3,12,9,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(46,8,'forms','Доступ к данным','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Доступ к данным',NULL,'{ buttons: [\"pick\", \"delete_all\"] }',4,12,10,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(47,9,'title','Заголовок','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required|string|max:191','{\"slugify\":\"url\"}',1,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(48,9,'parent','Главное меню','relation','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,3,6,11,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(49,9,'url','Ссылка','textbox','[ \"browse\", \"edit\", \"add\" ]','/',0,0,NULL,'Основные параметры',NULL,NULL,2,6,11,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(50,9,'code','Код','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,4,6,11,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(51,10,'name','Название','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,1,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(52,10,'code','Код','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,0,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(53,11,'code','Код','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,0,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(54,11,'name','Название','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,0,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(55,12,'name','Название','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,1,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(56,12,'key','Код','textbox','[ \"browse\", \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,0,6,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(57,12,'adminSettingGroup','Группа настроек','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required',NULL,2,6,12,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(58,12,'crudFieldType','Тип поля','relation','[\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required',NULL,3,6,13,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(59,12,'value','Значение','dynamic','[\"browse\",\"edit\"]',NULL,0,0,NULL,'Основные параметры',NULL,'{\"type\":\"related\",\"from\":\"crudFieldType.code\"}',4,12,NULL,'2018-06-13 08:33:13','2018-06-13 08:33:13'),
(60,13,'title','Название','textbox','[\"browse\",\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,0,12,NULL,'2018-06-13 13:13:27','2018-06-13 13:18:07'),
(61,14,'title','Название','textbox','[\"browse\",\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,0,12,NULL,'2018-06-13 13:14:37','2018-06-13 13:18:00'),
(62,15,'title','Название','textbox','[\"browse\",\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,1,12,NULL,'2018-06-13 13:16:19','2018-06-13 13:17:52'),
(63,15,'file','Файл','image','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required','{ \"mode\":\"single\", \"type\":\"file\"}',2,12,NULL,'2018-06-13 13:17:46','2018-06-13 13:17:52'),
(64,16,'title','Название','textbox','[\"browse\",\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,1,12,NULL,'2018-06-13 13:19:17','2018-06-13 13:19:18'),
(65,17,'title','Название','textbox','[\"browse\",\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,1,12,NULL,'2018-06-13 13:22:33','2018-06-13 13:45:20'),
(66,17,'slug','Ссылка','textbox','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,2,6,NULL,'2018-06-13 13:23:07','2018-06-13 13:45:20'),
(67,17,'status','Статус','textbox','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,3,6,NULL,'2018-06-13 13:23:21','2018-06-13 13:45:20'),
(68,17,'contact','Контакт','textbox','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,4,12,NULL,'2018-06-13 13:24:25','2018-06-13 13:45:20'),
(69,17,'text','Описание','textarea','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,6,12,NULL,'2018-06-13 13:25:15','2018-06-13 13:45:20'),
(70,17,'logo','Логотип','image','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,'{ \"mode\":\"single\", \"type\":\"image\", \"fit\": {\"width\": 150, \"height\": 150} }',10,6,NULL,'2018-06-13 13:26:46','2018-06-13 13:45:20'),
(71,17,'background','Обложка','image','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,'{ \"mode\":\"single\", \"type\":\"image\", \"resize\": {\"width\": 1440, \"height\": null, \"quality\": 90}}',20,6,NULL,'2018-06-13 13:27:39','2018-06-13 13:45:20'),
(72,18,'title','Заголовок','textbox','[\"browse\",\"add\",\"edit\"]',NULL,0,0,NULL,'Основные параметры','required|string|max:191',NULL,1,12,NULL,'2018-06-13 13:30:28','2018-06-13 14:03:29'),
(73,18,'text','Описание','textarea','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,2,12,NULL,'2018-06-13 13:31:16','2018-06-13 14:03:29'),
(74,18,'images','Фото','image','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,'{ \"mode\":\"multi\", \"type\":\"image\", \"resize\": {\"width\": 1440, \"height\": null, \"quality\": 90}}',5,12,NULL,'2018-06-13 13:32:32','2018-06-13 14:03:29'),
(75,18,'status','Статус','textbox','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required',NULL,6,6,NULL,'2018-06-13 13:32:55','2018-06-13 14:03:29'),
(76,18,'postType','Тип публикации','relation','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры','required','{ \"buttons\": [\"pick\"] }',7,6,14,'2018-06-13 13:33:52','2018-06-13 14:03:29'),
(77,18,'helpType','Тип помощи','relation','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,'{ \"buttons\": [ \"pick\" ] }',8,6,15,'2018-06-13 13:34:53','2018-06-13 14:03:29'),
(78,18,'categories','Категории','relation','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,NULL,10,12,16,'2018-06-13 13:36:09','2018-06-13 14:03:29'),
(79,18,'start_date','Дата начала','datepicker','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,'{ \"mode\":\"date\" }',25,6,NULL,'2018-06-13 13:37:49','2018-06-13 14:03:29'),
(80,18,'end_date','Дата окончания','datepicker','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Основные параметры',NULL,'{ \"mode\":\"date\" }',30,6,NULL,'2018-06-13 13:38:18','2018-06-13 14:03:29'),
(81,17,'posts','Публикации','relation','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Публикации',NULL,NULL,30,12,17,'2018-06-13 13:40:17','2018-06-13 13:45:20'),
(82,17,'users','Сотрудники','relation','[ \"edit\", \"add\" ]',NULL,0,0,NULL,'Сотрудники',NULL,NULL,50,6,18,'2018-06-13 13:45:19','2018-06-13 13:45:20');

/*Table structure for table `crud_forms` */

DROP TABLE IF EXISTS `crud_forms`;

CREATE TABLE `crud_forms` (
  `sur_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crud_forms` */

insert  into `crud_forms`(`sur_id`,`name`,`code`,`model`,`id`,`display`,`type`,`created_at`,`updated_at`) values 
(1,'Пользователи','users','App\\User','id','name','list','2018-06-13 08:33:09','2018-06-13 08:33:09'),
(2,'CRUD формы','crudforms','Vshapovalov\\Crud\\Models\\CrudForm','sur_id','name','list','2018-06-13 08:33:09','2018-06-13 08:33:09'),
(3,'CRUD Scope params','crudscopeparams','Vshapovalov\\Crud\\Models\\CrudScopeParam','id','name','list','2018-06-13 08:33:09','2018-06-13 08:33:09'),
(4,'CRUD Scopes','crudscopes','Vshapovalov\\Crud\\Models\\CrudScope','id','name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(5,'CRUD поля','crudfields','Vshapovalov\\Crud\\Models\\CrudField','id','name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(6,'CRUD связи','crudrelations','Vshapovalov\\Crud\\Models\\CrudRelation','id','crud.name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(7,'Меню админки','crudmenu','Vshapovalov\\Crud\\Models\\CrudMenu','id','name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(8,'Роли','roles','Vshapovalov\\Crud\\Models\\Role','id','name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(9,'Меню сайта','menuitems','Vshapovalov\\Crud\\Models\\MenuItem','id','title','tree','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(10,'CRUD типы полей','crudfieldtypes','Vshapovalov\\Crud\\Models\\CrudFieldType','id','name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(11,'Группы настроек','adminsettinggroups','Vshapovalov\\Crud\\Models\\AdminSettingGroup','id','name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(12,'Настройки','adminsettings','Vshapovalov\\Crud\\Models\\AdminSetting','id','name','list','2018-06-13 08:33:10','2018-06-13 08:33:10'),
(13,'Тип публикации','posttype','App\\PostType','id','title','list','2018-06-13 13:18:07','2018-06-13 13:18:07'),
(14,'Тип помощи','helptype','App\\HelpType','id','title','list','2018-06-13 13:18:00','2018-06-13 13:18:00'),
(15,'Файлы','fundfiles','App\\FundFile','id','title','list','2018-06-13 13:17:52','2018-06-13 13:17:52'),
(16,'Категории публикаций','postcategory','App\\PostCategory','id','title','list','2018-06-13 13:19:18','2018-06-13 13:19:18'),
(17,'Фонд','funds','App\\Fund','id','title','list','2018-06-13 13:45:20','2018-06-13 13:45:20'),
(18,'Публикации','posts','App\\Post','id','title','list','2018-06-13 14:03:29','2018-06-13 14:03:29');

/*Table structure for table `crud_menus` */

DROP TABLE IF EXISTS `crud_menus`;

CREATE TABLE `crud_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crud_menus` */

insert  into `crud_menus`(`id`,`name`,`caption`,`action`,`default`,`parent_id`,`order`,`status`,`created_at`,`updated_at`) values 
(1,'media-library','Медиа библиотека','medialibrary:mount',0,NULL,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(2,'system-menu','Системные настройки',NULL,0,NULL,2,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(3,'crudmenu','Меню админ.панели','crud:crudmenu:mount',0,2,2,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(4,'menuitems','Меню сайта','crud:menuitems:mount',0,2,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(5,'crudfieldtypes','Типы полей','crud:crudfieldtypes:mount',0,2,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(6,'adminsettinggroups','Группы настроек','crud:adminsettinggroups:mount',0,2,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(7,'crudforms','CRUD формы','crud:crudforms:mount',0,2,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(8,'adminsettings','Настройки','crud:adminsettings:mount',0,NULL,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(9,'users','Пользователи','crud:users:mount',0,NULL,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(10,'roles','Роли','crud:roles:mount',0,NULL,1,'enabled','2018-06-13 08:33:14','2018-06-13 08:33:14'),
(11,'posttype','Тип публикации','crud:posttype:mount',0,NULL,0,'enabled','2018-06-13 13:41:23','2018-06-13 13:41:23'),
(12,'helptype','Тип помощи','crud:helptype:mount',0,NULL,0,'enabled','2018-06-13 13:41:41','2018-06-13 13:41:41'),
(13,'postcategory','Категории публикаций','crud:postcategory:mount',0,NULL,0,'enabled','2018-06-13 13:41:59','2018-06-13 13:41:59'),
(14,'funds','Фонды','crud:funds:mount',0,NULL,0,'enabled','2018-06-13 13:42:31','2018-06-13 13:42:31');

/*Table structure for table `crud_relations` */

DROP TABLE IF EXISTS `crud_relations`;

CREATE TABLE `crud_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crud_form_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crud_relations` */

insert  into `crud_relations`(`id`,`type`,`crud_form_id`,`created_at`,`updated_at`) values 
(1,'hasMany',3,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(2,'hasMany',4,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(3,'hasMany',5,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(4,'belongsTo',2,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(5,'belongsTo',6,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(6,'belongsTo',7,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(7,'belongsToMany',8,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(8,'belongsToMany',1,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(9,'belongsToMany',7,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(10,'belongsToMany',2,'2018-06-13 08:33:10','2018-06-13 08:33:10'),
(11,'belongsTo',9,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(12,'belongsTo',11,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(13,'belongsTo',10,'2018-06-13 08:33:11','2018-06-13 08:33:11'),
(14,'belongsTo',13,'2018-06-13 13:33:48','2018-06-13 13:33:48'),
(15,'belongsTo',14,'2018-06-13 13:34:51','2018-06-13 13:34:51'),
(16,'belongsToMany',16,'2018-06-13 13:35:54','2018-06-13 13:35:54'),
(17,'hasMany',18,'2018-06-13 13:40:13','2018-06-13 13:40:13'),
(18,'belongsToMany',1,'2018-06-13 13:45:00','2018-06-13 13:45:00');

/*Table structure for table `crud_scope_params` */

DROP TABLE IF EXISTS `crud_scope_params`;

CREATE TABLE `crud_scope_params` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crud_scope_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_crud_scope_params_crud_scope_id` (`crud_scope_id`),
  CONSTRAINT `foreign_crud_scope_params_crud_scope_id` FOREIGN KEY (`crud_scope_id`) REFERENCES `crud_scopes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crud_scope_params` */

/*Table structure for table `crud_scopes` */

DROP TABLE IF EXISTS `crud_scopes`;

CREATE TABLE `crud_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crud_form_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crud_scopes_crud_form_id_foreign` (`crud_form_id`),
  CONSTRAINT `crud_scopes_crud_form_id_foreign` FOREIGN KEY (`crud_form_id`) REFERENCES `crud_forms` (`sur_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `crud_scopes` */

/*Table structure for table `fund_files` */

DROP TABLE IF EXISTS `fund_files`;

CREATE TABLE `fund_files` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `fund_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fund_id` (`fund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fund_files` */

/*Table structure for table `fund_user` */

DROP TABLE IF EXISTS `fund_user`;

CREATE TABLE `fund_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fund_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `position` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `contact` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`fund_id`,`user_id`),
  KEY `id_2` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fund_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fund_user_ibfk_2` FOREIGN KEY (`fund_id`) REFERENCES `funds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fund_user` */

/*Table structure for table `funds` */

DROP TABLE IF EXISTS `funds`;

CREATE TABLE `funds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `background` varchar(191) DEFAULT NULL,
  `text` text,
  `contact` varchar(191) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `funds` */

insert  into `funds`(`id`,`title`,`logo`,`background`,`text`,`contact`,`status`,`created_at`,`updated_at`,`slug`) values 
(1,'Общественный фонд \"HelpToday\"','/storage/uploads/funds/obshestvenniy-fond-helptoday/helptoday.png','/storage/uploads/funds/obshestvenniy-fond-helptoday/cta_bg.jpg','Наша Миссия\nСпасение тяжелобольных детей\nРазвитие благотворительной и волонтерской деятельности в Казахстане, с целью оказания помощи незащищенным слоям общества\n\nНаша История\nВ ноябре 2016 года опираясь на опыт работы в сфере благотворительности, командной волонтеров, было принято решение о создании общественного фонда «Help Today», что позволило оказывать помощь нуждающимся людям, в особенности детям, на масштабном уровне: более эффективно и оперативно. \n\nВ 2017г. ОФ \"Help Today\" стал членом Общественного совета при НЦПДиХ МЗ РК, членом совета Алматинского областного детского дома №1, принял участие в разработке дорожных карт по улучшению службы детской онкологии и орфанным диагнозам в РК на 2017/2019г.г. \n\nВсе поступающие пожертвования используются на развитие социально - значимых проектов в сфере здравоохранения\n\nНаши Награды\nЛауреат национальной общественной премии \"Алтын Журек\" в номинации \"За вклад в здравоохранение РК\" (председатель ОФ \"Help Today\" - Алиева Э.А.) в 2015 году.','8 (701) 727 2477','active','2018-06-13 13:54:25','2018-06-13 14:00:27','obshestvenniy-fond-helptoday');

/*Table structure for table `help_types` */

DROP TABLE IF EXISTS `help_types`;

CREATE TABLE `help_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `help_types` */

insert  into `help_types`(`id`,`title`,`created_at`,`updated_at`) values 
(1,'Физическая','2018-06-13 13:45:46','2018-06-13 13:45:46'),
(2,'Виртуальная','2018-06-13 13:45:52','2018-06-13 13:45:52'),
(3,'Денежная','2018-06-13 13:45:57','2018-06-13 13:45:57');

/*Table structure for table `menu_items` */

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_items` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2017_11_05_060117_create_admin_setting_groups_table',2),
(4,'2017_11_05_060204_create_crud_field_types_table',2),
(5,'2017_11_05_060225_create_admin_settings_table',2),
(6,'2017_11_05_060439_create_menu_items_table',2),
(7,'2018_01_11_111807_create_crud_menus_table',2),
(8,'2018_01_11_111953_create_crud_forms_table',2),
(9,'2018_01_11_112110_create_crud_fields_table',2),
(10,'2018_01_12_094224_create_crud_relations_table',2),
(11,'2018_01_14_122407_create_crud_scopes_table',2),
(12,'2018_01_14_122804_create_crud_scope_params_table',2),
(13,'2018_01_15_085744_create_roles_table',2),
(14,'2018_01_15_085827_create_user_role_table',2),
(15,'2018_01_15_093225_create_role_menu_table',2),
(16,'2018_02_09_093225_create_role_crud_form_table',2);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `post_categories` */

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `post_categories` */

insert  into `post_categories`(`id`,`title`,`created_at`,`updated_at`) values 
(1,'Дети','2018-06-13 13:47:43','2018-06-13 13:47:43'),
(2,'Животные','2018-06-13 13:47:52','2018-06-13 13:47:52'),
(3,'Общество','2018-06-13 13:48:01','2018-06-13 13:48:01'),
(4,'Инвалиды','2018-06-13 13:48:08','2018-06-13 13:48:08'),
(5,'Ветераны','2018-06-13 13:48:12','2018-06-13 13:48:12'),
(6,'Мероприятия','2018-06-13 13:48:24','2018-06-13 13:48:24');

/*Table structure for table `post_category_post` */

DROP TABLE IF EXISTS `post_category_post`;

CREATE TABLE `post_category_post` (
  `post_id` int(10) unsigned NOT NULL,
  `post_category_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`post_id`,`post_category_id`),
  KEY `id` (`id`),
  KEY `post_category_id` (`post_category_id`),
  CONSTRAINT `post_category_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_category_post_ibfk_2` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `post_category_post` */

/*Table structure for table `post_types` */

DROP TABLE IF EXISTS `post_types`;

CREATE TABLE `post_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `post_types` */

insert  into `post_types`(`id`,`title`,`created_at`,`updated_at`) values 
(1,'Новость','2018-06-13 13:46:12','2018-06-13 13:47:20'),
(2,'Объявление','2018-06-13 13:46:18','2018-06-13 13:47:27');

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `text` text NOT NULL,
  `images` text,
  `status` varchar(20) NOT NULL,
  `post_type_id` int(20) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `help_type_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `views` int(10) unsigned DEFAULT '0',
  `fund_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_type_id` (`post_type_id`),
  KEY `help_type_id` (`help_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `posts` */

insert  into `posts`(`id`,`title`,`text`,`images`,`status`,`post_type_id`,`start_date`,`end_date`,`help_type_id`,`created_at`,`updated_at`,`views`,`fund_id`,`slug`) values 
(1,'Открылся центр в Талгарском районе \"Акжол-М\"','Дорогие друзья, как вы помните, в ноябре 2017г. благодаря народной поддержке, открылся центр в Талгарском районе \"Акжол-М\" (руководитель Рушана Тохтахунова) для 700 детей и молодежи с особыми потребностями? Все подопечные, получают услуги центра на БЕСПЛАТНОЙ основе.',NULL,'active',1,'2018-06-13',NULL,NULL,'2018-06-13 14:03:34','2018-06-13 14:03:34',0,NULL,NULL),
(2,'Открылся центр в Талгарском районе \"Акжол-М\"','Дорогие друзья, как вы помните, в ноябре 2017г. благодаря народной поддержке, открылся центр в Талгарском районе \"Акжол-М\" (руководитель Рушана Тохтахунова) для 700 детей и молодежи с особыми потребностями? Все подопечные, получают услуги центра на БЕСПЛАТНОЙ основе.',NULL,'active',1,'2018-06-13',NULL,NULL,'2018-06-13 14:04:33','2018-06-13 14:06:10',0,1,NULL),
(3,'Kурс для студентов КазГУ','Сегодня наш ОФ \"Help Today\" для студентов КазГУ будущих журналистов провел практический курс на тему : \"Эффективные переговоры на благо спасения жизни\". Целых 3 часа интересного общения, с приведением различных кейсов. Надеемся, что наш курс пойдет на пользу в будущей профессии PR менеджера и журналиста, и в целом в жизни. Благодарим за приглашение кафедру #ЮНЕСКО и кафедру журналистики КазГУ, а также преподавателя и руководителя пресс-службы НЦАГиП Алуа','[\"/storage/uploads/funds/obshestvenniy-fond-helptoday/kazgu.jpg\"]','active',1,'2018-06-13',NULL,NULL,'2018-06-13 14:06:08','2018-06-13 14:06:10',0,1,NULL);

/*Table structure for table `role_crud_form` */

DROP TABLE IF EXISTS `role_crud_form`;

CREATE TABLE `role_crud_form` (
  `role_id` int(10) unsigned NOT NULL,
  `crud_form_id` int(10) unsigned NOT NULL,
  `add` int(11) NOT NULL DEFAULT '1',
  `edit` int(11) NOT NULL DEFAULT '1',
  `delete` int(11) NOT NULL DEFAULT '1',
  KEY `role_crud_form_role_id_foreign` (`role_id`),
  KEY `role_crud_form_crud_form_id_foreign` (`crud_form_id`),
  CONSTRAINT `role_crud_form_crud_form_id_foreign` FOREIGN KEY (`crud_form_id`) REFERENCES `crud_forms` (`sur_id`) ON DELETE CASCADE,
  CONSTRAINT `role_crud_form_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_crud_form` */

insert  into `role_crud_form`(`role_id`,`crud_form_id`,`add`,`edit`,`delete`) values 
(1,2,1,1,1),
(1,6,1,1,1),
(1,12,1,1,1),
(1,11,1,1,1),
(1,10,1,1,1),
(1,9,1,1,1),
(1,8,1,1,1),
(1,7,1,1,1),
(1,5,1,1,1),
(1,4,1,1,1),
(1,3,1,1,1),
(1,1,1,1,1),
(1,13,1,1,1),
(1,14,1,1,1),
(1,15,1,1,1),
(1,16,1,1,1);

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `role_id` int(10) unsigned NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `role_crud_role_id_foreign` (`role_id`),
  KEY `role_crud_menu_id_foreign` (`menu_id`),
  CONSTRAINT `role_crud_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `crud_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_crud_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_menu` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`code`,`name`,`created_at`,`updated_at`) values 
(1,'admin','Администратор','2018-06-13 08:33:09','2018-06-13 08:33:09');

/*Table structure for table `user_favorite_cats` */

DROP TABLE IF EXISTS `user_favorite_cats`;

CREATE TABLE `user_favorite_cats` (
  `user_id` int(10) unsigned NOT NULL,
  `post_category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`post_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_favorite_cats` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `meta` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `user_role_user_id_foreign` (`user_id`),
  KEY `user_role_role_id_foreign` (`role_id`),
  CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`,`meta`,`created_at`,`updated_at`) values 
(1,1,NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'volunteer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`,`type`) values 
(1,'admin','admin@admin.com','$2y$10$yXXgm2NZ5pEIFRl6U5C4sOiamvuMv6pC/5R/Cadr3Rr.UoYtxM.Q2',NULL,'2018-06-13 08:33:09','2018-06-13 08:33:09','volunteer');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
