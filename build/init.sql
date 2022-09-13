-- MySQL dump 10.13 Distrib 5.6.13, for Linux (i686)
--
-- Host: localhost Database: zm
-- ------------------------------------------------------
-- Server version 5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `zm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zm`;

USE `zm`;

--
-- Table structure for table `Config`
--

DROP TABLE IF EXISTS `Config`;
CREATE TABLE `Config` (
  `Id` smallint(5) unsigned NOT NULL default '0',
  `Name` varchar(32) NOT NULL default '',
  `Value` text NOT NULL,
  `Type` tinytext NOT NULL,
  `DefaultValue` text,
  `Hint` tinytext,
  `Pattern` tinytext,
  `Format` tinytext,
  `Prompt` tinytext,
  `Help` text,
  `Category` varchar(32) NOT NULL default '',
  `Readonly` tinyint(3) unsigned NOT NULL default '0',
  `Requires` text,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB;

--
-- Table structure for table `ControlPresets`
--

DROP TABLE IF EXISTS `ControlPresets`;
CREATE TABLE `ControlPresets` (
  `MonitorId` int(10) unsigned NOT NULL default '0',
  `Preset` int(10) unsigned NOT NULL default '0',
  `Label` varchar(64) NOT NULL default '',
  PRIMARY KEY (`MonitorId`,`Preset`)
) ENGINE=InnoDB;

--
-- Table structure for table `Controls`
--

DROP TABLE IF EXISTS `Controls`;
CREATE TABLE `Controls` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `Type` enum('Local','Remote','File','Ffmpeg','Libvlc','cURL','WebSite','NVSocket','VNC') NOT NULL default 'Local',
  `Protocol` varchar(64) default NULL,
  `CanWake` tinyint(3) unsigned NOT NULL default '0',
  `CanSleep` tinyint(3) unsigned NOT NULL default '0',
  `CanReset` tinyint(3) unsigned NOT NULL default '0',
  `CanReboot` tinyint(3) unsigned NOT NULL default '0',
  `CanZoom` tinyint(3) unsigned NOT NULL default '0',
  `CanAutoZoom` tinyint(3) unsigned NOT NULL default '0',
  `CanZoomAbs` tinyint(3) unsigned NOT NULL default '0',
  `CanZoomRel` tinyint(3) unsigned NOT NULL default '0',
  `CanZoomCon` tinyint(3) unsigned NOT NULL default '0',
  `MinZoomRange` int(10) unsigned default NULL,
  `MaxZoomRange` int(10) unsigned default NULL,
  `MinZoomStep` int(10) unsigned default NULL,
  `MaxZoomStep` int(10) unsigned default NULL,
  `HasZoomSpeed` tinyint(3) unsigned NOT NULL default '0',
  `MinZoomSpeed` int(10) unsigned default NULL,
  `MaxZoomSpeed` int(10) unsigned default NULL,
  `CanFocus` tinyint(3) unsigned NOT NULL default '0',
  `CanAutoFocus` tinyint(3) unsigned NOT NULL default '0',
  `CanFocusAbs` tinyint(3) unsigned NOT NULL default '0',
  `CanFocusRel` tinyint(3) unsigned NOT NULL default '0',
  `CanFocusCon` tinyint(3) unsigned NOT NULL default '0',
  `MinFocusRange` int(10) unsigned default NULL,
  `MaxFocusRange` int(10) unsigned default NULL,
  `MinFocusStep` int(10) unsigned default NULL,
  `MaxFocusStep` int(10) unsigned default NULL,
  `HasFocusSpeed` tinyint(3) unsigned NOT NULL default '0',
  `MinFocusSpeed` int(10) unsigned default NULL,
  `MaxFocusSpeed` int(10) unsigned default NULL,
  `CanIris` tinyint(3) unsigned NOT NULL default '0',
  `CanAutoIris` tinyint(3) unsigned NOT NULL default '0',
  `CanIrisAbs` tinyint(3) unsigned NOT NULL default '0',
  `CanIrisRel` tinyint(3) unsigned NOT NULL default '0',
  `CanIrisCon` tinyint(3) unsigned NOT NULL default '0',
  `MinIrisRange` int(10) unsigned default NULL,
  `MaxIrisRange` int(10) unsigned default NULL,
  `MinIrisStep` int(10) unsigned default NULL,
  `MaxIrisStep` int(10) unsigned default NULL,
  `HasIrisSpeed` tinyint(3) unsigned NOT NULL default '0',
  `MinIrisSpeed` int(10) unsigned default NULL,
  `MaxIrisSpeed` int(10) unsigned default NULL,
  `CanGain` tinyint(3) unsigned NOT NULL default '0',
  `CanAutoGain` tinyint(3) unsigned NOT NULL default '0',
  `CanGainAbs` tinyint(3) unsigned NOT NULL default '0',
  `CanGainRel` tinyint(3) unsigned NOT NULL default '0',
  `CanGainCon` tinyint(3) unsigned NOT NULL default '0',
  `MinGainRange` int(10) unsigned default NULL,
  `MaxGainRange` int(10) unsigned default NULL,
  `MinGainStep` int(10) unsigned default NULL,
  `MaxGainStep` int(10) unsigned default NULL,
  `HasGainSpeed` tinyint(3) unsigned NOT NULL default '0',
  `MinGainSpeed` int(10) unsigned default NULL,
  `MaxGainSpeed` int(10) unsigned default NULL,
  `CanWhite` tinyint(3) unsigned NOT NULL default '0',
  `CanAutoWhite` tinyint(3) unsigned NOT NULL default '0',
  `CanWhiteAbs` tinyint(3) unsigned NOT NULL default '0',
  `CanWhiteRel` tinyint(3) unsigned NOT NULL default '0',
  `CanWhiteCon` tinyint(3) unsigned NOT NULL default '0',
  `MinWhiteRange` int(10) unsigned default NULL,
  `MaxWhiteRange` int(10) unsigned default NULL,
  `MinWhiteStep` int(10) unsigned default NULL,
  `MaxWhiteStep` int(10) unsigned default NULL,
  `HasWhiteSpeed` tinyint(3) unsigned NOT NULL default '0',
  `MinWhiteSpeed` int(10) unsigned default NULL,
  `MaxWhiteSpeed` int(10) unsigned default NULL,
  `HasPresets` tinyint(3) unsigned NOT NULL default '0',
  `NumPresets` tinyint(3) unsigned NOT NULL default '0',
  `HasHomePreset` tinyint(3) unsigned NOT NULL default '0',
  `CanSetPresets` tinyint(3) unsigned NOT NULL default '0',
  `CanMove` tinyint(3) unsigned NOT NULL default '0',
  `CanMoveDiag` tinyint(3) unsigned NOT NULL default '0',
  `CanMoveMap` tinyint(3) unsigned NOT NULL default '0',
  `CanMoveAbs` tinyint(3) unsigned NOT NULL default '0',
  `CanMoveRel` tinyint(3) unsigned NOT NULL default '0',
  `CanMoveCon` tinyint(3) unsigned NOT NULL default '0',
  `CanPan` tinyint(3) unsigned NOT NULL default '0',
  `MinPanRange` int(10) default NULL,
  `MaxPanRange` int(10) default NULL,
  `MinPanStep` int(10) default NULL,
  `MaxPanStep` int(10) default NULL,
  `HasPanSpeed` tinyint(3) unsigned NOT NULL default '0',
  `MinPanSpeed` int(10) default NULL,
  `MaxPanSpeed` int(10) default NULL,
  `HasTurboPan` tinyint(3) unsigned NOT NULL default '0',
  `TurboPanSpeed` int(10) default NULL,
  `CanTilt` tinyint(3) unsigned NOT NULL default '0',
  `MinTiltRange` int(10) default NULL,
  `MaxTiltRange` int(10) default NULL,
  `MinTiltStep` int(10) default NULL,
  `MaxTiltStep` int(10) default NULL,
  `HasTiltSpeed` tinyint(3) unsigned NOT NULL default '0',
  `MinTiltSpeed` int(10) default NULL,
  `MaxTiltSpeed` int(10) default NULL,
  `HasTurboTilt` tinyint(3) unsigned NOT NULL default '0',
  `TurboTiltSpeed` int(10) default NULL,
  `CanAutoScan` tinyint(3) unsigned NOT NULL default '0',
  `NumScanPaths` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

--
-- Table structure for table `Devices`
--

DROP TABLE IF EXISTS `Devices`;
CREATE TABLE `Devices` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` tinytext NOT NULL,
  `Type` enum('X10') NOT NULL default 'X10',
  `KeyString` varchar(32) NOT NULL default '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
CREATE TABLE `Events` (
  `Id` bigint unsigned NOT NULL auto_increment,
  `MonitorId` int(10) unsigned NOT NULL default '0',
  `StorageId`	smallint(5) unsigned default 0,
  `SecondaryStorageId`	smallint(5) unsigned default 0,
  `Name` varchar(64) NOT NULL default '',
  `Cause` varchar(32) NOT NULL default '',
  `StartDateTime` datetime default NULL,
  `EndDateTime` datetime default NULL,
  `Width` smallint(5) unsigned NOT NULL default '0',
  `Height` smallint(5) unsigned NOT NULL default '0',
  `Length` decimal(10,2) NOT NULL default '0.00',
  `Frames` int(10) unsigned default NULL,
  `AlarmFrames` int(10) unsigned default NULL,
  `DefaultVideo` VARCHAR( 64 ) DEFAULT '' NOT NULL,
  `SaveJPEGs` TINYINT,
  `TotScore` int(10) unsigned NOT NULL default '0',
  `AvgScore` smallint(5) unsigned default '0',
  `MaxScore` smallint(5) unsigned default '0',
  `Archived` tinyint(3) unsigned NOT NULL default '0',
  `Videoed` tinyint(3) unsigned NOT NULL default '0',
  `Uploaded` tinyint(3) unsigned NOT NULL default '0',
  `Emailed` tinyint(3) unsigned NOT NULL default '0',
  `Messaged` tinyint(3) unsigned NOT NULL default '0',
  `Executed` tinyint(3) unsigned NOT NULL default '0',
  `Notes` text,
  `StateId` int(10) unsigned NOT NULL,
  `Orientation` enum('ROTATE_0','ROTATE_90','ROTATE_180','ROTATE_270','FLIP_HORI','FLIP_VERT') NOT NULL default 'ROTATE_0',
  `DiskSpace`   bigint unsigned default NULL,
  `Scheme`   enum('Deep','Medium','Shallow') NOT NULL default 'Medium',
  `Locked`    BOOLEAN NOT NULL DEFAULT False,
  PRIMARY KEY (`Id`),
  KEY `Events_MonitorId_idx` (`MonitorId`),
  KEY `Events_StorageId_idx` (`StorageId`),
  KEY `Events_StartDateTime_idx` (`StartDateTime`),
  KEY `Events_EndDateTime_DiskSpace` (`EndDateTime`,`DiskSpace`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Events_Hour`;
CREATE TABLE `Events_Hour` (
  `EventId` BIGINT unsigned NOT NULL,
  `MonitorId` int(10) unsigned NOT NULL,
  `StartDateTime` datetime default NULL,
  `DiskSpace`   bigint default NULL,
  PRIMARY KEY (`EventId`),
  KEY `Events_Hour_MonitorId_idx` (`MonitorId`),
  KEY `Events_Hour_StartDateTime_idx` (`StartDateTime`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Events_Day`;
CREATE TABLE `Events_Day` (
  `EventId` BIGINT unsigned NOT NULL,
  `MonitorId` int(10) unsigned NOT NULL,
  `StartDateTime` datetime default NULL,
  `DiskSpace`   bigint default NULL,
  PRIMARY KEY (`EventId`),
  KEY `Events_Day_MonitorId_idx` (`MonitorId`),
  KEY `Events_Day_StartDateTime_idx` (`StartDateTime`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Events_Week`;
CREATE TABLE `Events_Week` (
  `EventId` BIGINT unsigned NOT NULL,
  `MonitorId` int(10) unsigned NOT NULL,
  `StartDateTime` datetime default NULL,
  `DiskSpace`   bigint default NULL,
  PRIMARY KEY (`EventId`),
  KEY `Events_Week_MonitorId_idx` (`MonitorId`),
  KEY `Events_Week_StartDateTime_idx` (`StartDateTime`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Events_Month`;
CREATE TABLE `Events_Month` (
  `EventId` BIGINT unsigned NOT NULL,
  `MonitorId` int(10) unsigned NOT NULL,
  `StartDateTime` datetime default NULL,
  `DiskSpace`   bigint default NULL,
  PRIMARY KEY (`EventId`),
  KEY `Events_Month_MonitorId_idx` (`MonitorId`),
  KEY `Events_Month_StartDateTime_idx` (`StartDateTime`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `Events_Archived`;
CREATE TABLE `Events_Archived` (
  `EventId` BIGINT unsigned NOT NULL,
  `MonitorId` int(10) unsigned NOT NULL,
  `DiskSpace`   bigint default NULL,
  PRIMARY KEY (`EventId`),
  KEY `Events_Archived_MonitorId_idx` (`MonitorId`)
) ENGINE=InnoDB;

--
-- Table structure for table `Filters`
--

DROP TABLE IF EXISTS `Filters`;
CREATE TABLE `Filters` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `UserId`  int(10) unsigned,
  `Query_json` text NOT NULL,
  `AutoArchive` tinyint(3) unsigned NOT NULL default '0',
  `AutoUnarchive` tinyint(3) unsigned NOT NULL default '0',
  `AutoVideo` tinyint(3) unsigned NOT NULL default '0',
  `AutoUpload` tinyint(3) unsigned NOT NULL default '0',
  `AutoEmail` tinyint(3) unsigned NOT NULL default '0',
	`EmailTo`				TEXT,
	`EmailSubject`	TEXT,
	`EmailBody`			TEXT,
  `AutoMessage` tinyint(3) unsigned NOT NULL default '0',
  `AutoExecute` tinyint(3) unsigned NOT NULL default '0',
  `AutoExecuteCmd` tinytext,
  `AutoDelete` tinyint(3) unsigned NOT NULL default '0',
  `AutoMove` tinyint(3) unsigned NOT NULL default '0',
  `AutoMoveTo`	smallint(5) unsigned NOT NULL default 0,
  `AutoCopy` tinyint(3) unsigned NOT NULL default '0',
  `AutoCopyTo`	smallint(5) unsigned NOT NULL default 0,
  `UpdateDiskSpace` tinyint(3) unsigned NOT NULL default '0',
  `Background` tinyint(1) unsigned NOT NULL default '0',
  `Concurrent` tinyint(1) unsigned NOT NULL default '0',
  `LockRows` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY (`Id`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB;

--
-- Table structure for table `Frames`
--

DROP TABLE IF EXISTS `Frames`;
CREATE TABLE `Frames` (
  `Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `EventId` BIGINT UNSIGNED NOT NULL default '0',
  FOREIGN KEY (`EventId`) REFERENCES `Events` (`Id`) ON DELETE CASCADE,
  `FrameId` int(10) unsigned NOT NULL default '0',
  `Type` enum('Normal','Bulk','Alarm') NOT NULL default 'Normal',
  `TimeStamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Delta` decimal(8,2) NOT NULL default '0.00',
  `Score` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY (`Id`),
  INDEX `EventId_idx` (`EventId`),
  KEY `Type` (`Type`),
  KEY `TimeStamp` (`TimeStamp`)
) ENGINE=InnoDB;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
CREATE TABLE `Groups` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `ParentId` int(10) unsigned,
  FOREIGN KEY (`ParentId`) REFERENCES `Groups` (`Id`) ON DELETE CASCADE,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

--
-- Table structure for table `Groups_Monitors`
--

DROP TABLE IF EXISTS `Groups_Monitors`;
CREATE TABLE `Groups_Monitors` (
    `Id` INT(10) unsigned NOT NULL auto_increment,
    `GroupId` int(10) unsigned NOT NULL,
    FOREIGN KEY (`GroupId`) REFERENCES `Groups` (`Id`) ON DELETE CASCADE,
    `MonitorId` int(10) unsigned NOT NULL,
    FOREIGN KEY (`MonitorId`) REFERENCES `Monitors` (`Id`) ON DELETE CASCADE,
    PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

CREATE INDEX `Groups_Monitors_GroupId_idx` ON `Groups_Monitors` (`GroupId`);
CREATE INDEX `Groups_Monitors_MonitorId_idx` ON `Groups_Monitors` (`MonitorId`);

--
-- Table structure for table `Logs`
--

DROP TABLE IF EXISTS `Logs`;
CREATE TABLE `Logs` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TimeKey` decimal(16,6) NOT NULL,
  `Component` varchar(32) NOT NULL,
  `ServerId` int(10) unsigned,
  `Pid` int(10) DEFAULT NULL,
  `Level` tinyint(3) NOT NULL,
  `Code` char(3) NOT NULL,
  `Message` text NOT NULL,
  `File` varchar(255) DEFAULT NULL,
  `Line` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `TimeKey` (`TimeKey`)
) ENGINE=InnoDB;

CREATE INDEX `Logs_TimeKey_idx` ON `Logs` (`TimeKey`);
CREATE INDEX `Logs_Level_idx` ON `Logs` (`Level`);
--
-- Table structure for table `Manufacturers`
--

DROP TABLE IF EXISTS `Manufacturers`;
CREATE TABLE `Manufacturers` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name`  varchar(64) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY (`Name`)
) ENGINE=InnoDB;

--
-- Table structure for table `Models`
--

DROP TABLE IF EXISTS `Models`;
CREATE TABLE `Models` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name`  varchar(64) NOT NULL,
  `ManufacturerId` int(10),
  PRIMARY KEY (`Id`),
  UNIQUE KEY (`ManufacturerId`,`Name`)
) ENGINE=InnoDB;

--
-- Table structure for table `MonitorPresets`
--

DROP TABLE IF EXISTS `MonitorPresets`;
CREATE TABLE `MonitorPresets` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `Type` enum('Local','Remote','File','Ffmpeg','Libvlc','cURL','WebSite','NVSocket','VNC') NOT NULL default 'Local',
  `Device` tinytext,
  `Channel` tinyint(3) unsigned default NULL,
  `Format` int(10) unsigned default NULL,
  `Protocol` varchar(16) default NULL,
  `Method` varchar(16) default NULL,
  `Host` varchar(64) default NULL,
  `Port` varchar(8) default NULL,
  `Path` varchar(255) default NULL,
  `SubPath` varchar(64) default NULL,
  `Width` smallint(5) unsigned default NULL,
  `Height` smallint(5) unsigned default NULL,
  `Palette` int(10) unsigned default NULL,
  `MaxFPS` decimal(5,3) default NULL,
  `Controllable` tinyint(3) unsigned NOT NULL default '0',
  `ControlId` varchar(16) default NULL,
  `ControlDevice` varchar(255) default NULL,
  `ControlAddress` varchar(255) default NULL,
  `DefaultRate` smallint(5) unsigned NOT NULL default '100',
  `DefaultScale` smallint(5) unsigned NOT NULL default '100',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

--
-- Table structure for table `Monitors`
--

DROP TABLE IF EXISTS `Monitors`;
CREATE TABLE `Monitors` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `Notes` TEXT,
  `ServerId` int(10) unsigned,
  `StorageId`	smallint(5) unsigned default 0,
  `Type` enum('Local','Remote','File','Ffmpeg','Libvlc','cURL','WebSite','NVSocket','VNC') NOT NULL default 'Local',
  `Function` enum('None','Monitor','Modect','Record','Mocord','Nodect') NOT NULL default 'Monitor',
  `Enabled` tinyint(3) unsigned NOT NULL default '1',
  `DecodingEnabled` tinyint(3) unsigned NOT NULL default '1',
  `LinkedMonitors` varchar(255),
  `Triggers` set('X10') NOT NULL default '',
  `ONVIF_URL` VARCHAR(255) NOT NULL DEFAULT '',
  `ONVIF_Username` VARCHAR(64) NOT NULL DEFAULT '',
  `ONVIF_Password` VARCHAR(64) NOT NULL DEFAULT '',
  `ONVIF_Options` VARCHAR(64) NOT NULL DEFAULT '',
  `Device` tinytext NOT NULL default '',
  `Channel` tinyint(3) unsigned NOT NULL default '0',
  `Format` int(10) unsigned NOT NULL default '0',
  `V4LMultiBuffer`	tinyint(1) unsigned,
  `V4LCapturesPerFrame`	tinyint(3) unsigned,
  `Protocol` varchar(16),
  `Method` varchar(16) default '',
  `Host` varchar(64),
  `Port` varchar(8) NOT NULL default '',
  `SubPath` varchar(64) NOT NULL default '',
  `Path` varchar(255),
  `SecondPath` varchar(255),
  `Options` varchar(255),
  `User` varchar(64),
  `Pass` varchar(64),
  `Width` smallint(5) unsigned NOT NULL default '0',
  `Height` smallint(5) unsigned NOT NULL default '0',
  `Colours` tinyint(3) unsigned NOT NULL default '1',
  `Palette` int(10) unsigned NOT NULL default '0',
  `Orientation` enum('ROTATE_0','ROTATE_90','ROTATE_180','ROTATE_270','FLIP_HORI','FLIP_VERT') NOT NULL default 'ROTATE_0',
  `Deinterlacing` int(10) unsigned NOT NULL default '0',
  `DecoderHWAccelName`  varchar(64),
  `DecoderHWAccelDevice`  varchar(255),
  `SaveJPEGs` TINYINT NOT NULL DEFAULT '3' ,
  `VideoWriter` TINYINT NOT NULL DEFAULT '0',
  `OutputCodec` int(10) unsigned NOT NULL default 0,
  `Encoder`     varchar(32),
  `OutputContainer` enum('auto','mp4','mkv'),
  `EncoderParameters` TEXT,
  `RecordAudio` TINYINT NOT NULL DEFAULT '0',
  `RTSPDescribe` tinyint(1) unsigned,
  `Brightness` mediumint(7) NOT NULL default '-1',
  `Contrast` mediumint(7) NOT NULL default '-1',
  `Hue` mediumint(7) NOT NULL default '-1',
  `Colour` mediumint(7) NOT NULL default '-1',
  `EventPrefix` varchar(32) NOT NULL default 'Event-',
  `LabelFormat` varchar(64),
  `LabelX` smallint(5) unsigned NOT NULL default '0',
  `LabelY` smallint(5) unsigned NOT NULL default '0',
  `LabelSize` smallint(5) unsigned NOT NULL DEFAULT '1',
  `ImageBufferCount` smallint(5) unsigned NOT NULL default '3',
  `MaxImageBufferCount` smallint(5) unsigned NOT NULL default '0',
  `WarmupCount` smallint(5) unsigned NOT NULL default '0',
  `PreEventCount` smallint(5) unsigned NOT NULL default '10',
  `PostEventCount` smallint(5) unsigned NOT NULL default '10',
  `StreamReplayBuffer` int(10) unsigned NOT NULL default '0',
  `AlarmFrameCount` smallint(5) unsigned NOT NULL default '1',
  `SectionLength` int(10) unsigned NOT NULL default '600',
  `MinSectionLength` int(10) unsigned NOT NULL default '10',
  `FrameSkip` smallint(5) unsigned NOT NULL default '0',
  `MotionFrameSkip` smallint(5) unsigned NOT NULL default '0',
  `AnalysisFPSLimit` decimal(5,2) default NULL,
  `AnalysisUpdateDelay` smallint(5) unsigned NOT NULL default '0',
  `MaxFPS` decimal(5,2) default NULL,
  `AlarmMaxFPS` decimal(5,2) default NULL,
  `FPSReportInterval` smallint(5) unsigned NOT NULL default '250',
  `RefBlendPerc` tinyint(3) unsigned NOT NULL default '6',
  `AlarmRefBlendPerc` tinyint(3) unsigned NOT NULL default '6',
  `Controllable` tinyint(3) unsigned NOT NULL default '0',
  `ControlId` int(10) unsigned,
  `ControlDevice` varchar(255) default NULL,
  `ControlAddress` varchar(255) default NULL,
  `AutoStopTimeout` decimal(5,2) default NULL,
  `TrackMotion` tinyint(3) unsigned NOT NULL default '0',
  `TrackDelay` smallint(5) unsigned,
  `ReturnLocation` tinyint(3) NOT NULL default '-1',
  `ReturnDelay` smallint(5) unsigned,
  `ModectDuringPTZ` tinyint(3) unsigned NOT NULL default '0',
  `DefaultRate` smallint(5) unsigned NOT NULL default '100',
  `DefaultScale` smallint(5) unsigned NOT NULL default '100',
  `DefaultCodec` enum('auto','MP4','MJPEG') NOT NULL default 'auto',
  `SignalCheckPoints` INT UNSIGNED NOT NULL default '0',
  `SignalCheckColour` varchar(32) NOT NULL default '#0000BE',
  `WebColour` varchar(32) NOT NULL default 'red',
  `Exif` tinyint(1) unsigned NOT NULL default '0',
  `Sequence` smallint(5) unsigned default NULL,
  `ZoneCount` TINYINT NOT NULL DEFAULT 0,
  `Refresh` int(10) unsigned default NULL,
  `Latitude`  DECIMAL(10,8),
  `Longitude`  DECIMAL(11,8),
  `RTSPServer`  BOOLEAN NOT NULL DEFAULT FALSE,
  `RTSPStreamName`  varchar(255) NOT NULL default '',
  `Importance`  enum('Normal','Less','Not') NOT NULL default 'Normal',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

CREATE INDEX `Monitors_ServerId_idx` ON `Monitors` (`ServerId`);

DROP TABLE IF EXISTS `Monitor_Status`;
CREATE TABLE `Monitor_Status` (
  `MonitorId` int(10) unsigned NOT NULL,
  `Status`  enum('Unknown','NotRunning','Running','Connected','Signal') NOT NULL default 'Unknown',
  `CaptureFPS`  DECIMAL(10,2) NOT NULL default 0,
  `AnalysisFPS`  DECIMAL(5,2) NOT NULL default 0,
  `CaptureBandwidth`  INT NOT NULL default 0,
  PRIMARY KEY (`MonitorId`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Event_Summaries`;
CREATE TABLE `Event_Summaries` (
  `MonitorId` int(10) unsigned NOT NULL,
  `TotalEvents` int(10) default NULL,
  `TotalEventDiskSpace` bigint default NULL,
  `HourEvents` int(10) default NULL,
  `HourEventDiskSpace` bigint default NULL,
  `DayEvents` int(10) default NULL,
  `DayEventDiskSpace` bigint default NULL,
  `WeekEvents` int(10) default NULL,
  `WeekEventDiskSpace` bigint default NULL,
  `MonthEvents` int(10) default NULL,
  `MonthEventDiskSpace` bigint default NULL,
  `ArchivedEvents` int(10) default NULL,
  `ArchivedEventDiskSpace` bigint default NULL,
  PRIMARY KEY (`MonitorId`)
) ENGINE=InnoDB;

--
-- Table structure for table `States`
-- PP - Added IsActive to track custom run states
-- Also made sure Name is unique

DROP TABLE IF EXISTS `States`;
CREATE TABLE `States` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `Definition` text NOT NULL,
  `IsActive` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY (`Name`)
) ENGINE=InnoDB;
INSERT INTO States (Name,Definition,IsActive) VALUES ('default','','1');


--
-- Table structure for table `Servers`
--

DROP TABLE IF EXISTS `Servers`;
CREATE TABLE `Servers` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Protocol`  TEXT,
  `Hostname` TEXT,
  `Port`      INTEGER UNSIGNED,
  `PathToIndex`  TEXT,
  `PathToZMS`  TEXT,
  `PathToApi`  TEXT,
  `Name` varchar(64) NOT NULL default '',
  `State_Id`	int(10) unsigned,
  `Status` enum('Unknown','NotRunning','Running') NOT NULL default 'Unknown',
  `CpuLoad` DECIMAL(5,1) default NULL,
  `TotalMem` bigint unsigned default null,
  `FreeMem` bigint unsigned default null,
  `TotalSwap` bigint  unsigned default null,
  `FreeSwap` bigint unsigned default null, 
  `zmstats`  BOOLEAN NOT NULL DEFAULT FALSE,
  `zmaudit`  BOOLEAN NOT NULL DEFAULT FALSE,
  `zmtrigger`  BOOLEAN NOT NULL DEFAULT FALSE,
  `zmeventnotification`  BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

CREATE INDEX `Servers_Name_idx` ON `Servers` (`Name`);

--
-- Table structure for table `Stats`
--

DROP TABLE IF EXISTS `Stats`;
CREATE TABLE `Stats` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MonitorId` int(10) unsigned NOT NULL default '0',
  FOREIGN KEY (`MonitorId`) REFERENCES `Monitors` (`Id`) ON DELETE CASCADE,
  `ZoneId` int(10) unsigned NOT NULL default '0',
  FOREIGN KEY (`ZoneId`) REFERENCES `Zones` (`Id`) ON DELETE CASCADE,
  `EventId` BIGINT UNSIGNED NOT NULL,
  FOREIGN KEY (`EventId`) REFERENCES `Events` (`Id`) ON DELETE CASCADE,
  `FrameId` int(10) unsigned NOT NULL default '0',
  `PixelDiff` tinyint(3) unsigned NOT NULL default '0',
  `AlarmPixels` int(10) unsigned NOT NULL default '0',
  `FilterPixels` int(10) unsigned NOT NULL default '0',
  `BlobPixels` int(10) unsigned NOT NULL default '0',
  `Blobs` smallint(5) unsigned NOT NULL default '0',
  `MinBlobSize` int(10) unsigned NOT NULL default '0',
  `MaxBlobSize` int(10) unsigned NOT NULL default '0',
  `MinX` smallint(5) unsigned NOT NULL default '0',
  `MaxX` smallint(5) unsigned NOT NULL default '0',
  `MinY` smallint(5) unsigned NOT NULL default '0',
  `MaxY` smallint(5) unsigned NOT NULL default '0',
  `Score` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY (`Id`),
  KEY `EventId` (`EventId`),
  KEY `MonitorId` (`MonitorId`),
  KEY `ZoneId` (`ZoneId`)
) ENGINE=InnoDB;

--
-- Table structure for table `TriggersX10`
--

DROP TABLE IF EXISTS `TriggersX10`;
CREATE TABLE `TriggersX10` (
  `MonitorId` int(10) unsigned NOT NULL default '0',
  `Activation` varchar(32) default NULL,
  `AlarmInput` varchar(32) default NULL,
  `AlarmOutput` varchar(32) default NULL,
  PRIMARY KEY (`MonitorId`)
) ENGINE=InnoDB;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Username` varchar(32) character set latin1 collate latin1_bin NOT NULL default '',
  `Password` varchar(64) NOT NULL default '',
  `Language` varchar(8),
  `Enabled` tinyint(3) unsigned NOT NULL default '1',
  `Stream` enum('None','View') NOT NULL default 'None',
  `Events` enum('None','View','Edit') NOT NULL default 'None',
  `Control` enum('None','View','Edit') NOT NULL default 'None',
  `Monitors` enum('None','View','Edit') NOT NULL default 'None',
  `Groups` enum('None','View','Edit') NOT NULL default 'None',
  `Devices` enum('None','View','Edit') NOT NULL default 'None',
  `Snapshots` enum('None','View','Edit') NOT NULL default 'None',
  `System` enum('None','View','Edit') NOT NULL default 'None',
  `MaxBandwidth` varchar(16),
  `MonitorIds` text,
  `TokenMinExpiry`   BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `APIEnabled`  tinyint(3) UNSIGNED NOT NULL default 1,
  `HomeView`  varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UC_Username` (`Username`)
) ENGINE=InnoDB;

--
-- Table structure for table `ZonePresets`
--

DROP TABLE IF EXISTS `ZonePresets`;
CREATE TABLE `ZonePresets` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `Type` enum('Active','Inclusive','Exclusive','Preclusive','Inactive','Privacy') NOT NULL default 'Active',
  `Units` enum('Pixels','Percent') NOT NULL default 'Pixels',
  `CheckMethod` enum('AlarmedPixels','FilteredPixels','Blobs') NOT NULL default 'Blobs',
  `MinPixelThreshold` smallint(5) unsigned default NULL,
  `MaxPixelThreshold` smallint(5) unsigned default NULL,
  `MinAlarmPixels` int(10) unsigned default NULL,
  `MaxAlarmPixels` int(10) unsigned default NULL,
  `FilterX` tinyint(3) unsigned default NULL,
  `FilterY` tinyint(3) unsigned default NULL,
  `MinFilterPixels` int(10) unsigned default NULL,
  `MaxFilterPixels` int(10) unsigned default NULL,
  `MinBlobPixels` int(10) unsigned default NULL,
  `MaxBlobPixels` int(10) unsigned default NULL,
  `MinBlobs` smallint(5) unsigned default NULL,
  `MaxBlobs` smallint(5) unsigned default NULL,
  `OverloadFrames` smallint(5) unsigned NOT NULL default '0',
  `ExtendAlarmFrames` smallint(5) unsigned not null default 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

--
-- Table structure for table `Zones`
--

DROP TABLE IF EXISTS `Zones`;
CREATE TABLE `Zones` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `MonitorId` int(10) unsigned NOT NULL default '0',
  FOREIGN KEY (`MonitorId`) REFERENCES `Monitors` (`Id`) ON DELETE CASCADE,
  `Name` varchar(64) NOT NULL default '',
  `Type` enum('Active','Inclusive','Exclusive','Preclusive','Inactive','Privacy') NOT NULL default 'Active',
  `Units` enum('Pixels','Percent') NOT NULL default 'Pixels',
  `NumCoords` tinyint(3) unsigned NOT NULL default '0',
  `Coords` tinytext NOT NULL,
  `Area` int(10) unsigned NOT NULL default '0',
  `AlarmRGB` int(10) unsigned default '0',
  `CheckMethod` enum('AlarmedPixels','FilteredPixels','Blobs') NOT NULL default 'Blobs',
  `MinPixelThreshold` smallint(5) unsigned default NULL,
  `MaxPixelThreshold` smallint(5) unsigned default NULL,
  `MinAlarmPixels` int(10) unsigned default NULL,
  `MaxAlarmPixels` int(10) unsigned default NULL,
  `FilterX` tinyint(3) unsigned default NULL,
  `FilterY` tinyint(3) unsigned default NULL,
  `MinFilterPixels` int(10) unsigned default NULL,
  `MaxFilterPixels` int(10) unsigned default NULL,
  `MinBlobPixels` int(10) unsigned default NULL,
  `MaxBlobPixels` int(10) unsigned default NULL,
  `MinBlobs` smallint(5) unsigned default NULL,
  `MaxBlobs` smallint(5) unsigned default NULL,
  `OverloadFrames` smallint(5) unsigned NOT NULL default '0',
  `ExtendAlarmFrames` smallint(5) unsigned not null default 0,
  PRIMARY KEY (`Id`),
  KEY `MonitorId` (`MonitorId`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Storage`;
CREATE TABLE `Storage` (
	`Id`	smallint(5) unsigned NOT NULL auto_increment,
	`Path`	varchar(64)	NOT NULL default '',
	`Name`	varchar(64) NOT NULL default '',
	`Type`	enum('local','s3fs') NOT NULL default 'local',
  `Url` varchar(255) default NULL,
  `DiskSpace`   bigint default NULL,
  `Scheme`   enum('Deep','Medium','Shallow') NOT NULL default 'Medium',
  `ServerId` int(10) unsigned,
  `DoDelete`  BOOLEAN NOT NULL DEFAULT true,
  `Enabled`  BOOLEAN NOT NULL DEFAULT true,
	PRIMARY KEY (`Id`)
) ENGINE=InnoDB;

--
-- Create a default storage location
--
insert into Storage VALUES (NULL, '/var/cache/zoneminder/events', 'Default', 'local', NULL, NULL, 'Medium', 0, true, true );

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Initial data to be loaded into ZoneMinder database
--

--
-- Create a default admin user.
--
INSERT INTO `Users` (
  `Username`,
  `Password`,
  `Language`,
  `Enabled`,
  `Stream`,
  `Events`,
  `Control`,
  `Monitors`,
  `Groups`,
  `Devices`,
  `Snapshots`,
  `System`,
  `MaxBandwidth`,
  `MonitorIds`,
  `TokenMinExpiry`,
  `APIEnabled`,
  `HomeView`
  ) VALUES (
    'admin',
    '$2b$12$NHZsm6AM2f2LQVROriz79ul3D6DnmFiZC.ZK5eqbF.ZWfwH9bqUJ6',
    '' /* Language */,
    1 /* Enabled */,
    'View' /* Stream */,
    'Edit' /* Events */,
    'Edit' /* Control */,
    'Edit' /* Monitors */,
    'Edit' /* Groups */,
    'Edit' /* Devices */,
    'Edit' /* Snapshots */,
    'Edit' /* System */,
    '' /* Max Bandwidth */,
    '' /* MonitorIds */,
    0 /* TokenMinExpiry */,
    0 /* Api Endabled */,
    '' /* Homeview */);

--
-- Add a sample filter to purge the oldest 100 events when the disk is 95% full
--

INSERT INTO `Filters`
  (
    `Name`,
    `Query_json`,
    `AutoArchive`,
    `AutoVideo`,
    `AutoUpload`,
    `AutoEmail`,
    `EmailTo`,
    `EmailSubject`,
    `EmailBody`,
    `AutoMessage`,
    `AutoExecute`,
    `AutoExecuteCmd`,
    `AutoDelete`,
    `AutoMove`,
    `AutoMoveTo`,
    `AutoCopy`,
    `AutoCopyTo`,
    `UpdateDiskSpace`,
    `UserId`,
    `Background`,
    `Concurrent`
  )
  VALUES
  (
    'PurgeWhenFull',
    '{"sort_field":"Id","terms":[{"val":0,"attr":"Archived","op":"="},{"cnj":"and","val":95,"attr":"DiskPercent","op":">="},{"cnj":"and","obr":"0","attr":"EndDateTime","op":"IS NOT","val":"NULL","cbr":"0"}],"limit":100,"sort_asc":1}',
    0/*AutoArchive*/,
    0/*AutoVideo*/,
    0/*AutoUpload*/,
    0/*AutoEmail*/,
    ''/*EmailTo*/,
    ''/*EmailSubject*/,
    ''/*EmailBody*/,
    0/*AutoMessage*/,
    0/*AutoExecute*/,'',
    1/*AutoDelete*/,
    0/*AutoMove*/,0/*MoveTo*/,
    0/*AutoCopy*/,0/*CopyTo*/,
    0/*UpdateDiskSpace*/,
    1/*UserId = admin*/,
    1/*Background*/,
    0/*Concurrent*/
  );
INSERT INTO `Filters`
  (
    `Name`,
    `Query_json`,
    `AutoArchive`,
    `AutoVideo`,
    `AutoUpload`,
    `AutoEmail`,
    `EmailTo`,
    `EmailSubject`,
    `EmailBody`,
    `AutoMessage`,
    `AutoExecute`,
    `AutoExecuteCmd`,
    `AutoDelete`,
    `AutoMove`,
    `AutoMoveTo`,
    `AutoCopy`,
    `AutoCopyTo`,
    `UpdateDiskSpace`,
    `UserId`,
    `Background`,
    `Concurrent`
  )
VALUES (
  'Update DiskSpace',
  '{"terms":[{"attr":"DiskSpace","op":"IS","val":"NULL"},{"cnj":"and","obr":"0","attr":"EndDateTime","op":"IS NOT","val":"NULL","cbr":"0"}]}',
  0/*AutoArchive*/,
  0/*AutoVideo*/,
  0/*AutoUpload*/,
  0/*AutoEmail*/,
  ''/*EmailTo*/,
  ''/*EmailSubject*/,
  ''/*EmailBody*/,
  0/*AutoMessage*/,
  0/*AutoExecute*/,'',
  0/*AutoDelete*/,
  0/*AutoMove*/,0/*MoveTo*/,
  0/*AutoCopy*/,0/*CopyTo*/,
  1/*UpdateDiskSpace*/,
  1/*UserId=admin*/,
  1/*Background*/,
  0/*Concurrent*/
);

--
-- Add in some sample control protocol definitions
--
INSERT INTO `Controls` VALUES (NULL,'Pelco-D','Local','PelcoD',1,1,0,0,1,1,0,0,1,NULL,NULL,NULL,NULL,1,0,3,1,1,0,0,1,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,20,1,1,1,1,0,0,0,1,1,NULL,NULL,NULL,NULL,1,0,63,1,254,1,NULL,NULL,NULL,NULL,1,0,63,1,254,0,0);
INSERT INTO `Controls` VALUES (NULL,'Pelco-P','Local','PelcoP',1,1,0,0,1,1,0,0,1,NULL,NULL,NULL,NULL,1,0,3,1,1,0,0,1,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,20,1,1,1,1,0,0,0,1,1,NULL,NULL,NULL,NULL,1,0,63,1,254,1,NULL,NULL,NULL,NULL,1,0,63,1,254,0,0);
INSERT INTO `Controls` VALUES (NULL,'Sony VISCA','Local','Visca',1,1,0,0,1,0,0,0,1,0,16384,10,4000,1,1,6,1,1,1,0,1,0,1536,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,3,1,1,1,1,0,1,1,0,1,-15578,15578,100,10000,1,1,50,1,254,1,-7789,7789,100,5000,1,1,50,1,254,0,0);
INSERT INTO `Controls` VALUES (NULL,'Axis API v2','Remote','AxisV2',0,0,0,0,1,0,0,1,0,0,9999,10,2500,0,NULL,NULL,1,1,0,1,0,0,9999,10,2500,0,NULL,NULL,1,1,0,1,0,0,9999,10,2500,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,12,1,1,1,1,1,0,1,0,1,-360,360,1,90,0,NULL,NULL,0,NULL,1,-360,360,1,90,0,NULL,NULL,0,NULL,0,0);
INSERT INTO `Controls` VALUES (NULL,'Panasonic IP','Remote','PanasonicIP',0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,8,1,1,1,0,1,0,0,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,0,0);
INSERT INTO `Controls` VALUES (NULL,'Neu-Fusion NCS370','Remote','Ncs370',0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,24,1,0,1,1,0,0,0,1,1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,0,0);
INSERT INTO `Controls` VALUES (NULL,'AirLink SkyIPCam 7xx','Remote','SkyIPCam7xx',0,0,1,0,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,8,1,1,1,0,1,0,1,0,1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,0,0);
INSERT INTO `Controls` VALUES (NULL,'Pelco-D','Ffmpeg','PelcoD',1,1,0,0,1,1,0,0,1,NULL,NULL,NULL,NULL,1,0,3,1,1,0,0,1,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,20,1,1,1,1,0,0,0,1,1,NULL,NULL,NULL,NULL,1,0,63,1,254,1,NULL,NULL,NULL,NULL,1,0,63,1,254,0,0);
INSERT INTO `Controls` VALUES (NULL,'Pelco-P','Ffmpeg','PelcoP',1,1,0,0,1,1,0,0,1,NULL,NULL,NULL,NULL,1,0,3,1,1,0,0,1,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,1,0,1,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,20,1,1,1,1,0,0,0,1,1,NULL,NULL,NULL,NULL,1,0,63,1,254,1,NULL,NULL,NULL,NULL,1,0,63,1,254,0,0);
INSERT INTO `Controls` VALUES (NULL,'Foscam FI8620','Ffmpeg','FI8620_Y2k',0,0,0,0,1,0,0,0,1,1,10,1,10,1,1,63,1,1,0,0,1,1,63,1,63,1,1,63,1,1,0,0,1,0,0,0,0,1,0,255,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,1,0,255,1,8,0,1,1,1,0,0,0,1,1,1,360,1,360,1,1,63,0,0,1,1,90,1,90,1,1,63,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Foscam FI8608W','Ffmpeg','FI8608W_Y2k',1,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,1,0,255,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,1,0,255,1,8,0,1,1,1,0,0,0,1,1,0,0,0,0,1,1,128,0,0,1,0,0,0,0,1,1,128,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Foscam FI8908W','Remote','FI8908W',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Foscam FI9821W','Ffmpeg','FI9821W_Y2k',1,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,1,0,100,1,1,0,0,1,0,100,0,100,1,0,100,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,100,0,100,1,0,100,1,16,0,1,1,1,0,0,0,1,1,0,360,0,360,1,0,4,0,0,1,0,90,0,90,1,0,4,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Loftek Sentinel','Remote','LoftekSentinel',0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,255,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,6,1,1,0,0,0,1,10,0,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Toshiba IK-WB11A','Remote','Toshiba_IK_WB11A',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,10,0,1,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'WanscamPT','Remote','Wanscam',1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,16,0,0,0,0,0,1,16,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'3S Domo N5071', 'Remote', '3S', 0, 0, 1, 0,1, 0, 1, 1, 0, 0, 9999, 0, 9999, 0, 0, 0, 1, 1, 1, 1, 0, 0, 9999, 20, 9999, 0, 0, 0, 1, 1, 1, 1, 0, 0, 9999, 1, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 64, 1, 0, 1, 1, 0, 0, 0, 0, 1, -180, 180, 40, 100, 1, 40, 100, 0, 0, 1, -180, 180, 40, 100, 1, 40, 100, 0, 0, 0, 0);
INSERT INTO `Controls` VALUES (NULL,'ONVIF Camera','Ffmpeg','onvif',0,0,1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,255,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,6,1,1,0,0,0,1,10,1,1,1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Foscam 9831W','Ffmpeg','FI9831W',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,16,1,1,1,1,0,0,0,1,1,0,360,0,360,1,0,4,0,0,1,0,90,0,90,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Foscam FI8918W','Ffmpeg','FI8918W',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,8,0,1,1,1,0,0,0,1,1,0,360,0,360,1,0,4,0,0,1,0,90,0,90,1,0,4,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'SunEyes SP-P1802SWPTZ','Libvlc','SPP1802SWPTZ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,8,0,1,1,0,0,0,0,1,1,0,0,0,0,1,0,64,0,0,1,0,0,0,0,1,0,64,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Wanscam HW0025','Libvlc','WanscamHW0025', 1, 1, 1, 0,1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 16, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 350, 0, 0, 1, 0, 10, 0, 0, 1, 0, 0, 0, 0, 1, 0, 10, 0, 0, 0, 0);
INSERT INTO `Controls` VALUES (NULL,'IPCC 7210W','Remote','IPCC7210W', 1, 1, 1, 0,1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 16, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `Controls` VALUES (NULL,'Vivotek ePTZ','Remote','Vivotek_ePTZ',0,0,1,0,1,0,0,0,1,0,0,0,0,1,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,1,0,5,0,0,1,0,0,0,0,1,0,5,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Netcat ONVIF','Ffmpeg','Netcat',0,0,1,0,1,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,100,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,100,5,5,0,0,0,1,255,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Keekoon','Remote','Keekoon', 0, 0, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `Controls` VALUES (NULL,'HikVision','Local','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,20,1,1,1,1,0,0,0,1,1,0,0,0,0,1,1,100,0,0,1,0,0,0,0,1,1,100,1,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Maginon Supra IPC','cURL','MaginonIPC',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Floureon 1080P','Ffmpeg','Floureon',0,0,0,0,1,0,0,0,1,1,18,1,1,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,20,0,1,1,1,0,0,0,1,1,0,0,0,0,1,1,8,0,0,1,0,0,0,0,1,1,8,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Reolink RLC-423','Ffmpeg','Reolink',0,0,1,0,1,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,64,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Reolink RLC-411','Ffmpeg','Reolink',0,0,1,0,1,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Reolink RLC-420','Ffmpeg','Reolink',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'D-LINK DCS-3415','Remote','DCS3415',0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'D-Link DCS-5020L','Remote','DCS5020L',1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,24,1,0,1,1,1,0,1,0,1,0,0,1,30,0,0,0,0,0,1,0,0,1,30,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'IOS Camera','Ffmpeg','IPCAMIOS',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Dericam P2','Ffmpeg','DericamP2',0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,10,0,1,1,1,0,0,0,1,1,0,0,0,0,1,1,45,0,0,1,0,0,0,0,1,1,45,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Trendnet','Remote','Trendnet',1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'PSIA','Remote','PSIA',0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,20,0,1,1,1,0,0,1,0,1,0,0,0,0,1,-100,100,0,0,1,0,0,0,0,1,-100,100,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'Dahua','Ffmpeg','Dahua',0,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,20,1,1,1,1,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `Controls` VALUES (NULL,'FOSCAMR2C','Libvlc','FOSCAMR2C',1,1,1,0,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,1,12,0,1,1,1,0,0,0,1,1,NULL,NULL,NULL,NULL,1,0,4,0,NULL,1,NULL,NULL,NULL,NULL,1,0,4,0,NULL,0,0);
INSERT INTO `Controls` VALUES (NULL,'Amcrest HTTP API','Ffmpeg','Amcrest_HTTP',0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,5,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,5);

--
-- Add some monitor preset values
--

INSERT into MonitorPresets VALUES (NULL,'Amcrest, IP8M-T2499EW 640x480, RTP/RTSP','Ffmpeg','rtsp',0,255,'rtsp','rtpRtsp','NULL',554,'rtsp://<username>:<password>@<ip-address>/cam/realmonitor?channel=1&subtype=1',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT into MonitorPresets VALUES (NULL,'Amcrest, IP8M-T2499EW 3840x2160, RTP/RTSP','Ffmpeg','rtsp',0,255,'rtsp','rtpRtsp','NULL',554,'rtsp://<username>:<password>@<ip-address>/cam/realmonitor?channel=1&subtype=0',NULL,3840,2160,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 320x240, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=320x240',NULL,320,240,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 320x240, mpjpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=320x240&req_fps=5',NULL,320,240,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 320x240, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=320x240',NULL,320,240,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 320x240, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=320x240',NULL,320,240,3,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 640x480, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=640x480',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 640x480, mpjpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=640x480&req_fps=5',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 640x480, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=640x480',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 640x480, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=640x480',NULL,640,480,3,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 320x240, mpjpeg, B&W','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=320x240&color=0',NULL,320,240,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP, 640x480, mpjpeg, B&W','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=640x480&color=0',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 320x240, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=320x240',NULL,320,240,3,NULL,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 320x240, mpjpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=320x240&req_fps=5',NULL,320,240,3,NULL,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 320x240, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=320x240',NULL,320,240,3,NULL,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 320x240, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=320x240',NULL,320,240,3,5.0,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 640x480, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=640x480',NULL,640,480,3,NULL,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 640x480, mpjpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/mjpg/video.cgi?resolution=640x480&req_fps=5',NULL,640,480,3,NULL,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 640x480, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=640x480',NULL,640,480,3,NULL,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis IP PTZ, 640x480, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/axis-cgi/jpg/image.cgi?resolution=640x480',NULL,640,480,3,5.0,1,4,NULL,'<ip-address>:<port>',100,100);
INSERT into MonitorPresets VALUES (NULL,'Axis IP, mpeg4, unicast','Remote','rtsp',0,255,'rtsp','rtpUni','<ip-address>',554,'/mpeg4/media.amp','/trackID=',NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT into MonitorPresets VALUES (NULL,'Axis IP, mpeg4, multicast','Remote','rtsp',0,255,'rtsp','rtpMulti','<ip-address>',554,'/mpeg4/media.amp','/trackID=',NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT into MonitorPresets VALUES (NULL,'Axis IP, mpeg4, RTP/RTSP','Remote','rtsp',0,255,'rtsp','rtpRtsp','<ip-address>',554,'/mpeg4/media.amp','/trackID=',NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT into MonitorPresets VALUES (NULL,'Axis IP, mpeg4, RTP/RTSP/HTTP','Remote',NULL,NULL,NULL,'rtsp','rtpRtspHttp','<ip-address>',554,'/mpeg4/media.amp','/trackID=',NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'D-link DCS-930L, 640x480, mjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/mjpeg.cgi',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'D-Link DCS-5020L, 640x480, mjpeg','Remote','http',0,0,'http','simple','<username>:<pwd>@<ip-address>','80','/video.cgi',NULL,640,480,0,NULL,1,'34',NULL,'<username>:<pwd>@<ip-address>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP, 320x240, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/nphMotionJpeg?Resolution=320x240&Quality=Standard',NULL,320,240,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP, 320x240, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=320x240&Quality=Standard',NULL,320,240,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP, 320x240, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=320x240&Quality=Standard',NULL,320,240,3,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP, 640x480, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/nphMotionJpeg?Resolution=640x480&Quality=Standard',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP, 640x480, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=640x480&Quality=Standard',NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP, 640x480, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=640x480&Quality=Standard',NULL,640,480,3,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP PTZ, 320x240, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/nphMotionJpeg?Resolution=320x240&Quality=Standard',NULL,320,240,3,NULL,1,5,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP PTZ, 320x240, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=320x240&Quality=Standard',NULL,320,240,3,NULL,1,5,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP PTZ, 320x240, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=320x240&Quality=Standard',NULL,320,240,3,5.0,1,5,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP PTZ, 640x480, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/nphMotionJpeg?Resolution=640x480&Quality=Standard',NULL,640,480,3,NULL,1,5,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP PTZ, 640x480, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=640x480&Quality=Standard',NULL,640,480,3,NULL,1,5,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Panasonic IP PTZ, 640x480, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/SnapshotJPEG?Resolution=640x480&Quality=Standard',NULL,640,480,3,5.0,1,5,NULL,'<ip-address>:<port>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Gadspot IP, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/Jpeg/CamImg.jpg',NULL,NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Gadspot IP, jpeg, max 5 FPS','Remote','http',0,0,'http','simple','<ip-address>',80,'/Jpeg/CamImg.jpg',NULL,NULL,NULL,3,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Gadspot IP, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/GetData.cgi',NULL,NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Gadspot IP, mpjpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/Jpeg/CamImg.jpg',NULL,NULL,NULL,3,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'IP Webcam by Pavel Khlebovich 1920x1080','Remote','/dev/video<?>','0',255,'http','simple','<ip-address>','8080','/video','',1920,1080,0,NULL,0,'0','','',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'VEO Observer, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/Jpeg/CamImg.jpg',NULL,NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Blue Net Video Server, jpeg','Remote','http',0,0,'http','simple','<ip-address>',80,'/cgi-bin/image.cgi?control=0&id=admin&passwd=admin',NULL,320,240,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT into MonitorPresets VALUES (NULL,'ACTi IP, mpeg4, unicast','Remote',NULL,NULL,NULL,'rtsp','rtpUni','<ip-address>',7070,'','/track',NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis FFMPEG H.264','Ffmpeg',NULL,NULL,NULL,NULL,NULL,'rtsp://<host/address>/axis-media/media.amp?videocodec=h264',NULL,NULL,NULL,640,480,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Vivotek FFMPEG','Ffmpeg',NULL,NULL,NULL,NULL,NULL,'rtsp://<host/address>:554/live.sdp',NULL,NULL,NULL,352,240,NULL,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Axis FFMPEG','Ffmpeg',NULL,NULL,NULL,NULL,NULL,'rtsp://<host/address>/axis-media/media.amp',NULL,NULL,NULL,640,480,NULL,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'ACTi TCM FFMPEG','Ffmpeg',NULL,NULL,NULL,NULL,NULL,'rtsp://admin:123456@<host/address>:7070',NULL,NULL,NULL,320,240,NULL,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), PAL, 320x240','Local','/dev/video<?>',0,255,NULL,'v4l2',NULL,NULL,NULL,NULL,320,240,1345466932,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), PAL, 320x240, max 5 FPS','Local','/dev/video<?>',0,255,NULL,'v4l2',NULL,NULL,NULL,NULL,320,240,1345466932,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), PAL, 640x480','Local','/dev/video<?>',0,255,NULL,'v4l2',NULL,NULL,NULL,NULL,640,480,1345466932,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), PAL, 640x480, max 5 FPS','Local','/dev/video<?>',0,255,NULL,'v4l2',NULL,NULL,NULL,NULL,640,480,1345466932,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), NTSC, 320x240','Local','/dev/video<?>',0,45056,NULL,'v4l2',NULL,NULL,NULL,NULL,320,240,1345466932,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), NTSC, 320x240, max 5 FPS','Local','/dev/video<?>',0,45056,NULL,'v4l2',NULL,NULL,NULL,NULL,320,240,1345466932,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), NTSC, 640x480','Local','/dev/video<?>',0,45056,NULL,'v4l2',NULL,NULL,NULL,NULL,640,480,1345466932,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L2), NTSC, 640x480, max 5 FPS','Local','/dev/video<?>',0,45056,NULL,'v4l2',NULL,NULL,NULL,NULL,640,480,1345466932,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), PAL, 320x240','Local','/dev/video<?>',0,0,NULL,'v4l1',NULL,NULL,NULL,NULL,320,240,13,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), PAL, 320x240, max 5 FPS','Local','/dev/video<?>',0,0,NULL,'v4l1',NULL,NULL,NULL,NULL,320,240,13,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), PAL, 640x480','Local','/dev/video<?>',0,0,NULL,'v4l1',NULL,NULL,NULL,NULL,640,480,13,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), PAL, 640x480, max 5 FPS','Local','/dev/video<?>',0,0,NULL,'v4l1',NULL,NULL,NULL,NULL,640,480,13,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), NTSC, 320x240','Local','/dev/video<?>',0,1,NULL,'v4l1',NULL,NULL,NULL,NULL,320,240,13,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), NTSC, 320x240, max 5 FPS','Local','/dev/video<?>',0,1,NULL,'v4l1',NULL,NULL,NULL,NULL,320,240,13,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), NTSC, 640x480','Local','/dev/video<?>',0,1,NULL,'v4l1',NULL,NULL,NULL,NULL,640,480,13,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'BTTV Video (V4L1), NTSC, 640x480, max 5 FPS','Local','/dev/video<?>',0,1,NULL,'v4l1',NULL,NULL,NULL,NULL,640,480,13,5.0,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Remote ZoneMinder','Remote',NULL,NULL,NULL,'http','simple','<ip-address>',80,'/cgi-bin/nph-zms?mode=jpeg&monitor=<monitor-id>&scale=100&maxfps=5&buffer=0',NULL,NULL,NULL,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Foscam FI8620 FFMPEG H.264','Ffmpeg',NULL,NULL,NULL,NULL,'','','','rtsp://<username>:<pwd>@<ip-address>:554/11',NULL,704,576,0,NULL,1,'10','<admin_pwd>','<ip-address>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Foscam FI8608W FFMPEG H.264','Ffmpeg',NULL,NULL,NULL,NULL,'','','','rtsp://<username>:<pwd>@<ip-address>:554/11',NULL,640,480,0,NULL,1,'11','<admin_pwd>','<ip-address>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Foscam FI9821W FFMPEG H.264','Ffmpeg',NULL,NULL,NULL,NULL,'','','','rtsp://<username>:<pwd>@<ip-address>:88/videoMain',NULL,1280,720,0,NULL,1,'12','<admin_pwd>','<ip-address>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Loftek Sentinel PTZ, 640x480, mjpeg','Remote','http',0,0,NULL,NULL,'<ip-address>','80','/videostream.cgi?user=<username>&pwd=<password>&resolution=32&rate=11',NULL,640,480,4,NULL,1,'13','','<username>:<pwd>@<ip-address>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Airlink 777W PTZ, 640x480, mjpeg','Remote','http',0,0,NULL,NULL,'<username>:<password>@<ip-address>','80','/cgi/mjpg/mjpg.cgi',NULL,640,480,4,NULL,1,'7','','<username>:<pwd>@<ip-address>',100,100);
INSERT INTO MonitorPresets VALUES (NULL,'SunEyes SP-P1802SWPTZ','Libvlc','/dev/video<?>','0',255,'','rtpMulti','','80','rtsp://<ip-address>:554/11','',1920,1080,0,0.00,1,'16','-speed=64','<ip-address>:<port>',100,33);
INSERT INTO MonitorPresets VALUES (NULL,'Qihan IP, 1280x720, RTP/RTSP','Ffmpeg','rtsp',0,255,'rtsp','rtpRtsp',NULL,554,'rtsp://<ip-address>/tcp_live/ch0_0',NULL,1280,720,3,NULL,0,NULL,NULL,NULL,100,100);
INSERT INTO MonitorPresets VALUES (NULL,'Qihan IP, 1920x1080, RTP/RTSP','Ffmpeg','rtsp',0,255,'rtsp','rtpRtsp',NULL,554,'rtsp://<ip-address>/tcp_live/ch0_0',NULL,1920,1080,3,NULL,0,NULL,NULL,NULL,100,100);

--
-- Add some zone preset values
--
INSERT INTO ZonePresets VALUES (1,'Default','Active','Percent','Blobs',25,NULL,3,75,3,3,3,75,2,NULL,1,NULL,0,0);
INSERT INTO ZonePresets VALUES (2,'Fast, low sensitivity','Active','Percent','AlarmedPixels',60,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
INSERT INTO ZonePresets VALUES (3,'Fast, medium sensitivity','Active','Percent','AlarmedPixels',40,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
INSERT INTO ZonePresets VALUES (4,'Fast, high sensitivity','Active','Percent','AlarmedPixels',20,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
INSERT INTO ZonePresets VALUES (5,'Best, low sensitivity','Active','Percent','Blobs',60,NULL,36,NULL,7,7,24,NULL,20,NULL,1,NULL,0,0);
INSERT INTO ZonePresets VALUES (6,'Best, medium sensitivity','Active','Percent','Blobs',40,NULL,16,NULL,5,5,12,NULL,10,NULL,1,NULL,0,0);
INSERT INTO ZonePresets VALUES (7,'Best, high sensitivity','Active','Percent','Blobs',20,NULL,8,NULL,3,3,6,NULL,5,NULL,1,NULL,0,0);

DROP TABLE IF EXISTS Maps;

CREATE TABLE Maps (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name`      VARCHAR(64) NOT NULL,
  `Filename`  VARCHAR(64) NOT NULL default '',
  `NumCoords` tinyint(3) unsigned NOT NULL default '0',
  `Coords` tinytext NOT NULL,
  `ParentId`   int(1) unsigned,
  PRIMARY KEY (`Id`)
);

DROP TABLE IF EXISTS MontageLayouts;

CREATE TABLE MontageLayouts (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name`    TEXT  NOT NULL,
  `Positions` LONGTEXT,
  /*`Positions` JSON,*/
  PRIMARY KEY (`Id`)
);

INSERT INTO MontageLayouts (`Name`,`Positions`) VALUES ('Freeform', '{ "default":{"float":"left","left":"0px","right":"0px","top":"0px","bottom":"0px"} }' );
INSERT INTO MontageLayouts (`Name`,`Positions`) VALUES ('2 Wide', '{ "default":{"float":"left", "width":"49%","left":"0px","right":"0px","top":"0px","bottom":"0px"} }' );
INSERT INTO MontageLayouts (`Name`,`Positions`) VALUES ('3 Wide', '{ "default":{"float":"left", "width":"33%","left":"0px","right":"0px","top":"0px","bottom":"0px"} }' );
INSERT INTO MontageLayouts (`Name`,`Positions`) VALUES ('4 Wide', '{ "default":{"float":"left", "width":"24.5%","left":"0px","right":"0px","top":"0px","bottom":"0px"} }' );
INSERT INTO MontageLayouts (`Name`,`Positions`) VALUES ('5 Wide', '{ "default":{"float":"left", "width":"19%","left":"0px","right":"0px","top":"0px","bottom":"0px"} }' );

DROP TABLE IF EXISTS Sessions;

CREATE TABLE Sessions (
  id char(32) not null,
  access INT(10) UNSIGNED DEFAULT NULL,
  data text,
  PRIMARY KEY(id)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Snapshots;

CREATE TABLE Snapshots (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name`  VARCHAR(64),
  `Description` TEXT,
  `CreatedBy`   int(10),
  `CreatedOn`   datetime default NULL,
  PRIMARY KEY(Id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Snapshot_Events;

CREATE TABLE Snapshot_Events (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `SnapshotId` int(10) unsigned NOT NULL,
  FOREIGN KEY (`SnapshotId`) REFERENCES `Snapshots` (`Id`) ON DELETE CASCADE,
  `EventId`    bigint unsigned NOT NULL,
  FOREIGN KEY (`EventId`) REFERENCES `Events` (`Id`) ON DELETE CASCADE,
  KEY `Snapshot_Events_SnapshotId_idx` (`SnapshotId`),
  PRIMARY KEY(Id)
) ENGINE=InnoDB;


-- We generally don't alter triggers, we drop and re-create them, so let's keep them in a separate file that we can just source in update scripts.
source /var/lib/mysql/init_2.sql
--
-- Apply the initial configuration
--
-- This section is autogenerated by zmconfgen.pl
-- Do not edit this file as any changes will be overwritten
--

delete from Config;

INSERT INTO Config SET Id = 0, Name = 'ZM_SKIN_DEFAULT', Value = 'classic', Type = 'string', DefaultValue = 'classic', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Default skin used by web interface', Help = '
      ZoneMinder allows the use of many different web interfaces.
      This option allows you to set the default skin used by the
      website. Users can change their skin later, this merely sets
      the default.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 1, Name = 'ZM_CSS_DEFAULT', Value = 'base', Type = 'string', DefaultValue = 'base', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Default set of css files used by web interface', Help = '
      ZoneMinder allows the use of many different web interfaces, and
      some skins allow the use of different set of CSS files to
      control the appearance. This option allows you to set the
      default set of css files used by the website.  Users can change
      their css later, this merely sets the default.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 2, Name = 'ZM_BANDWIDTH_DEFAULT', Value = 'high', Type = 'string', DefaultValue = 'high', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Default setting for bandwidth profile used by web interface', Help = 'The classic skin for ZoneMinder has different
      profiles to use for low, medium, or high bandwidth connections.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 3, Name = 'ZM_LANG_DEFAULT', Value = 'en_gb', Type = 'string', DefaultValue = 'en_gb', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Default language used by web interface', Help = '
      ZoneMinder allows the web interface to use languages other than
      English if the appropriate language file has been created and
      is present. This option allows you to change the default
      language that is used from the shipped language, British
      English, to another language
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 4, Name = 'ZM_OPT_USE_AUTH', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Authenticate user logins to ZoneMinder', Help = '
      ZoneMinder can run in two modes. The simplest is an entirely
      unauthenticated mode where anyone can access ZoneMinder and
      perform all tasks. This is most suitable for installations
      where the web server access is limited in other ways. The other
      mode enables user accounts with varying sets of permissions.
      Users must login or authenticate to access ZoneMinder and are
      limited by their defined permissions.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 5, Name = 'ZM_AUTH_TYPE', Value = 'builtin', Type = 'string', DefaultValue = 'builtin', Hint = 'builtin|remote', Pattern = '(?^i:^([br]))', Format = ' $1 =~ /^b/ ? \'builtin\' : \'remote\' ', Prompt = 'What is used to authenticate ZoneMinder users', Help = '
      ZoneMinder can use two methods to authenticate users when
      running in authenticated mode. The first is a builtin method
      where ZoneMinder provides facilities for users to log in and
      maintains track of their identity. The second method allows
      interworking with other methods such as http basic
      authentication which passes an independently authentication
      \'remote\' user via http. In this case ZoneMinder would use the
      supplied user without additional authentication provided such a
      user is configured in ZoneMinder.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_AUTH=1';
INSERT INTO Config SET Id = 6, Name = 'ZM_AUTH_RELAY', Value = 'hashed', Type = 'string', DefaultValue = 'hashed', Hint = 'hashed|plain|none', Pattern = '(?^i:^([hpn]))', Format = ' ($1 =~ /^h/) ? \'hashed\' : ($1 =~ /^p/ ? \'plain\' : \'none\' ) ', Prompt = 'Method used to relay authentication information', Help = '
      When ZoneMinder is running in authenticated mode it can pass
      user details between the web pages and the back end processes.
      There are two methods for doing this. This first is to use a
      time limited hashed string which contains no direct username or
      password details, the second method is to pass the username and
      passwords around in plaintext. This method is not recommend
      except where you do not have the md5 libraries available on
      your system or you have a completely isolated system with no
      external access. You can also switch off authentication
      relaying if your system is isolated in other ways.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_AUTH=1';
INSERT INTO Config SET Id = 7, Name = 'ZM_AUTH_HASH_SECRET', Value = '...Change me to something unique...', Type = 'string', DefaultValue = '...Change me to something unique...', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Secret for encoding hashed authentication information', Help = '
      When ZoneMinder is running in hashed authenticated mode it is
      necessary to generate hashed strings containing encrypted
      sensitive information such as usernames and password. Although
      these string are reasonably secure the addition of a random
      secret increases security substantially.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_AUTH=1;ZM_AUTH_RELAY=hashed';
INSERT INTO Config SET Id = 8, Name = 'ZM_AUTH_HASH_IPS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Include IP addresses in the authentication hash', Help = '
      When ZoneMinder is running in hashed authenticated mode it can
      optionally include the requesting IP address in the resultant
      hash. This adds an extra level of security as only requests
      from that address may use that authentication key. However in
      some circumstances, such as access over mobile networks, the
      requesting address can change for each request which will cause
      most requests to fail. This option allows you to control
      whether IP addresses are included in the authentication hash on
      your system. If you experience intermitent problems with
      authentication, switching this option off may help.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_AUTH=1;ZM_AUTH_RELAY=hashed';
INSERT INTO Config SET Id = 9, Name = 'ZM_AUTH_HASH_TTL', Value = '2', Type = 'integer', DefaultValue = '2', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'The number of hours that an authentication hash is valid for.', Help = '
      The default has traditionally been 2 hours. A new hash will
      automatically be regenerated at half this value.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_AUTH=1;ZM_AUTH_RELAY=hashed';
INSERT INTO Config SET Id = 10, Name = 'ZM_AUTH_HASH_LOGINS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Allow login by authentication hash', Help = '
      The normal process for logging into ZoneMinder is via the login
      screen with username and password. In some circumstances it may
      be desirable to allow access directly to one or more pages, for
      instance from a third party application. If this option is
      enabled then adding an \'auth\' parameter to any request will
      include a shortcut login bypassing the login screen, if not
      already logged in. As authentication hashes are time and,
      optionally, IP limited this can allow short-term access to
      ZoneMinder screens from other web pages etc. In order to use
      this the calling application will have to generate the
      authentication hash itself and ensure it is valid. If you use
      this option you should ensure that you have modified the
      ZM_AUTH_HASH_SECRET to something unique to your system.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_AUTH=1;ZM_AUTH_RELAY=hashed';
INSERT INTO Config SET Id = 11, Name = 'ZM_ENABLE_CSRF_MAGIC', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Enable csrf-magic library', Help = '
      CSRF stands for Cross-Site Request Forgery which, under specific
      circumstances, can allow an attacker to perform any task your
      ZoneMinder user account has permission to perform. To accomplish
      this, the attacker must write a very specific web page and get
      you to navigate to it, while you are logged into the ZoneMinder
      web console at the same time. Enabling ZM_ENABLE_CSRF_MAGIC will
      help mitigate these kinds of attacks.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 12, Name = 'ZM_OPT_USE_API', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Enable ZoneMinder APIs', Help = '
      ZoneMinder now features a new API using which 3rd party
      applications can interact with ZoneMinder data. It is
      STRONGLY recommended that you enable authentication along
      with APIs. Note that the APIs return sensitive data like
      Monitor access details which are configured as JSON objects.
      Which is why we recommend you enabling authentication, especially
      if you are exposing your ZM instance on the Internet.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 13, Name = 'ZM_OPT_USE_LEGACY_API_AUTH', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Enable legacy API authentication', Help = '
      Starting version 1.34.0, ZoneMinder uses a more secure 
      Authentication mechanism using JWT tokens. Older versions used a less secure MD5 based auth hash. It is recommended you turn this off after you are sure you don\'t need it. If you are using a 3rd party app that relies on the older API auth mechanisms, you will have to update that app if you turn this off. Note that zmNinja 1.3.057 onwards supports the new token system
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 14, Name = 'ZM_OPT_USE_EVENTNOTIFICATION', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Enable 3rd party Event Notification Server', Help = '
      zmeventnotification is a 3rd party event notification server
      that is used to get notifications for alarms detected by ZoneMinder
      in real time. zmNinja requires this server for push notifications to
      mobile phones. This option only enables the server if its already installed.
      Please visit the [zmeventserver project site](https://github.com/pliablepixels/zmeventserver)
      for installation instructions.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 15, Name = 'ZM_OPT_USE_GOOG_RECAPTCHA', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Add Google reCaptcha to login page', Help = '
      This option allows you to include a google
      reCaptcha validation at login. This means in addition to providing
      a valid usernane and password, you will also have to
      pass the reCaptcha test. Please note that enabling this
      option results in the zoneminder login page reach out
      to google servers for captcha validation. Also please note
      that enabling this option will break 3rd party clients
      like zmNinja and zmView as they also need to login to ZoneMinder
      and they will fail the reCaptcha test.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_AUTH=1';
INSERT INTO Config SET Id = 16, Name = 'ZM_OPT_GOOG_RECAPTCHA_SITEKEY', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Your recaptcha site-key', Help = 'You need to generate your keys from
      the Google reCaptcha website.
      Please refer to the [recaptcha project site](https://www.google.com/recaptcha/)
      for more details.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_GOOG_RECAPTCHA=1';
INSERT INTO Config SET Id = 17, Name = 'ZM_OPT_GOOG_RECAPTCHA_SECRETKEY', Value = '...Insert your recaptcha secret-key here...', Type = 'string', DefaultValue = '...Insert your recaptcha secret-key here...', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Your recaptcha secret-key', Help = 'You need to generate your keys from
      the Google reCaptcha website.
      Please refer to the [recaptcha project site](https://www.google.com/recaptcha/)
      for more details.
      ', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_GOOG_RECAPTCHA=1';
INSERT INTO Config SET Id = 18, Name = 'ZM_OPT_USE_GEOLOCATION', Value = '0', Type = 'boolean', DefaultValue = '', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Add geolocation features to ZoneMinder.', Help = 'Whether or not to enable Latitude/Longitude settings on Monitors and enable mapping options.', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 19, Name = 'ZM_OPT_GEOLOCATION_TILE_PROVIDER', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Tile provider to use for maps.', Help = 'OpenStreetMaps does not itself provide the images to use in the map. There are many to choose from.  Mapbox.com is one example that offers free tiles and has been tested during development of this feature.', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_GEOLOCATION=1';
INSERT INTO Config SET Id = 20, Name = 'ZM_OPT_GEOLOCATION_ACCESS_TOKEN', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Access Token for the tile provider used for maps.', Help = 'OpenStreetMaps does not itself provide the images to use in the map. There are many to choose from.  Mapbox.com is one example that offers free tiles and has been tested during development of this feature. You must go to mapbox.com and sign up and get an access token and cutnpaste it here.', Category = 'system', Readonly = '0', Requires = 'ZM_OPT_USE_GEOLOCATION=1';
INSERT INTO Config SET Id = 21, Name = 'ZM_SYSTEM_SHUTDOWN', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Allow Admin users to power off or restart the system from the ZoneMinder UI.', Help = 'The system will need to have sudo installed and the following added to /etc/sudoers~~
    ~~
    www-data ALL=NOPASSWD: /sbin/shutdown~~
    ~~
      to perform the shutdown or reboot', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 22, Name = 'ZM_FEATURES_SNAPSHOTS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Enable snapshot functionality.', Help = 'Snapshots are a collection of events.  They can be created using the snapshot button in montage view.  All visible monitors will have a short event created, archived and added to the Snapshot.', Category = 'hidden', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 23, Name = 'ZM_USE_DEEP_STORAGE', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Use a deep filesystem hierarchy for events', Help = '
      This option is now the default for new ZoneMinder systems and
      should not be changed. Previous versions of ZoneMinder stored
      all events for a monitor under one folder. Enabling
      USE_DEEP_STORAGE causes ZoneMinder to store events under a
      folder structure that follows year/month/day/hour/min/second.
      Storing events this way avoids the limitation of storing more
      than 32k files in a single folder inherent in some filesystems.
      It is important to note that you cannot simply change this
      option. You must stop zoneminder, enable USE_DEEP_STORAGE, and
      then run \"sudo zmupdate.pl --migrate-events\". FAILURE TO DO
      SO WILL RESULT IN LOSS OF YOUR DATA! Consult the ZoneMinder
      WiKi for further details.
      ', Category = 'hidden', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 24, Name = 'ZM_COLOUR_JPEG_FILES', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Colourise greyscale JPEG files', Help = '
      Cameras that capture in greyscale can write their captured
      images to jpeg files with a corresponding greyscale colour
      space. This saves a small amount of disk space over colour
      ones. However some tools such as ffmpeg either fail to work
      with this colour space or have to convert it beforehand.
      Setting this option to yes uses up a little more space but
      makes creation of MPEG files much faster.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 25, Name = 'ZM_ADD_JPEG_COMMENTS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Add jpeg timestamp annotations as file header comments', Help = '
      JPEG files may have a number of extra fields added to the file
      header. The comment field may have any kind of text added. This
      options allows you to have the same text that is used to
      annotate the image additionally included as a file header
      comment. If you archive event images to other locations this
      may help you locate images for particular events or times if
      you use software that can read comment headers.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 26, Name = 'ZM_JPEG_FILE_QUALITY', Value = '70', Type = 'integer', DefaultValue = '70', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Set the JPEG quality setting for the saved event files (1-100)', Help = '
      When ZoneMinder detects an event it will save the images
      associated with that event to files. These files are in the
      JPEG format and can be viewed or streamed later. This option
      specifies what image quality should be used to save these
      files. A higher number means better quality but less
      compression so will take up more disk space and take longer to
      view over a slow connection. By contrast a low number means
      smaller, quicker to view, files but at the price of lower
      quality images. This setting applies to all images written
      except if the capture image has caused an alarm and the alarm
      file quality option is set at a higher value when that is used
      instead.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 27, Name = 'ZM_JPEG_ALARM_FILE_QUALITY', Value = '0', Type = 'integer', DefaultValue = '0', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Set the JPEG quality setting for the saved event files during an alarm (1-100)', Help = '
      This value is equivalent to the regular jpeg file quality
      setting above except that it only applies to images saved while
      in an alarm state and then only if this value is set to a
      higher quality setting than the ordinary file setting. If set
      to a lower value then it is ignored. Thus leaving it at the
      default of 0 effectively means to use the regular file quality
      setting for all saved images. This is to prevent accidentally
      saving important images at a worse quality setting.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 28, Name = 'ZM_JPEG_STREAM_QUALITY', Value = '70', Type = 'integer', DefaultValue = '70', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Set the JPEG quality setting for the streamed \'live\' images (1-100)', Help = '
      When viewing a \'live\' stream for a monitor ZoneMinder will grab
      an image from the buffer and encode it into JPEG format before
      sending it. This option specifies what image quality should be
      used to encode these images. A higher number means better
      quality but less compression so will take longer to view over a
      slow connection. By contrast a low number means quicker to view
      images but at the price of lower quality images. This option
      does not apply when viewing events or still images as these are
      usually just read from disk and so will be encoded at the
      quality specified by the previous options.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 29, Name = 'ZM_MPEG_TIMED_FRAMES', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Tag video frames with a timestamp for more realistic streaming', Help = '
      When using streamed MPEG based video, either for live monitor
      streams or events, ZoneMinder can send the streams in two ways.
      If this option is selected then the timestamp for each frame,
      taken from it\'s capture time, is included in the stream. This
      means that where the frame rate varies, for instance around an
      alarm, the stream will still maintain it\'s \'real\' timing. If
      this option is not selected then an approximate frame rate is
      calculated and that is used to schedule frames instead. This
      option should be selected unless you encounter problems with
      your preferred streaming method.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 30, Name = 'ZM_MPEG_LIVE_FORMAT', Value = 'swf', Type = 'string', DefaultValue = 'swf', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'What format \'live\' video streams are played in', Help = '
      When using MPEG mode ZoneMinder can output live video. However
      what formats are handled by the browser varies greatly between
      machines. This option allows you to specify a video format
      using a file extension format, so you would just enter the
      extension of the file type you would like and the rest is
      determined from that. The default of \'asf\' works well under
      Windows with Windows Media Player but I\'m currently not sure
      what, if anything, works on a Linux platform. If you find out
      please let me know! If this option is left blank then live
      streams will revert to being in motion jpeg format
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 31, Name = 'ZM_MPEG_REPLAY_FORMAT', Value = 'swf', Type = 'string', DefaultValue = 'swf', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'What format \'replay\' video streams are played in', Help = '
      When using MPEG mode ZoneMinder can replay events in encoded
      video format. However what formats are handled by the browser
      varies greatly between machines. This option allows you to
      specify a video format using a file extension format, so you
      would just enter the extension of the file type you would like
      and the rest is determined from that. The default of \'asf\'
      works well under Windows with Windows Media Player and \'mpg\',
      or \'avi\' etc should work under Linux. If you know any more then
      please let me know! If this option is left blank then live
      streams will revert to being in motion jpeg format
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 32, Name = 'ZM_RAND_STREAM', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Add a random string to prevent caching of streams', Help = '
      Some browsers can cache the streams used by ZoneMinder. In
      order to prevent this a harmless random string can be appended
      to the url to make each invocation of the stream appear unique.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 33, Name = 'ZM_OPT_CAMBOZOLA', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Is the (optional) cambozola java streaming client installed', Help = '
      Cambozola is a handy low fat cheese flavoured Java applet that
      ZoneMinder uses to view image streams on browsers such as
      Internet Explorer that don\'t natively support this format. If
      you use this browser it is highly recommended to install this
      from the [cambozola project site](http://www.charliemouse.com/code/cambozola/).
      However, if it is not installed still images at a lower refresh rate can
      still be viewed.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 34, Name = 'ZM_PATH_CAMBOZOLA', Value = 'cambozola.jar', Type = 'string', DefaultValue = 'cambozola.jar', Hint = 'relative/path/to/somewhere', Pattern = '(?^:^((?:[^/].*)?)/?$)', Format = ' $1 ', Prompt = 'Web path to (optional) cambozola java streaming client', Help = '
      Cambozola is a handy low fat cheese flavoured Java applet that
      ZoneMinder uses to view image streams on browsers such as
      Internet Explorer that don\'t natively support this format. If
      you use this browser it is highly recommended to install this
      from the [cambozola project site](http://www.charliemouse.com/code/cambozola/).
      However if it is not installed still images at a lower refresh rate can
      still be viewed. Leave this as \'cambozola.jar\' if cambozola is
      installed in the same directory as the ZoneMinder web client
      files.
      ', Category = 'images', Readonly = '0', Requires = 'ZM_OPT_CAMBOZOLA=1';
INSERT INTO Config SET Id = 35, Name = 'ZM_RELOAD_CAMBOZOLA', Value = '0', Type = 'integer', DefaultValue = '0', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'After how many seconds should Cambozola be reloaded in live view', Help = '
      Cambozola allows for the viewing of streaming MJPEG however it
      caches the entire stream into cache space on the computer,
      setting this to a number > 0 will cause it to automatically
      reload after that many seconds to avoid filling up a hard
      drive.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 36, Name = 'ZM_TIMESTAMP_ON_CAPTURE', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Timestamp images as soon as they are captured', Help = '
      ZoneMinder can add a timestamp to images in two ways. The
      default method, when this option is set, is that each image is
      timestamped immediately when captured and so the image held in
      memory is marked right away. The second method does not
      timestamp the images until they are either saved as part of an
      event or accessed over the web. The timestamp used in both
      methods will contain the same time as this is preserved along
      with the image. The first method ensures that an image is
      timestamped regardless of any other circumstances but will
      result in all images being timestamped even those never saved
      or viewed. The second method necessitates that saved images are
      copied before being saved otherwise two timestamps perhaps at
      different scales may be applied. This has the (perhaps)
      desirable side effect that the timestamp is always applied at
      the same resolution so an image that has scaling applied will
      still have a legible and correctly scaled timestamp.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 37, Name = 'ZM_TIMESTAMP_CODE_CHAR', Value = '%', Type = 'string', DefaultValue = '%', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Character to used to identify timestamp codes', Help = '
      There are a few codes one can use to tell ZoneMinder to insert
      data into the timestamp of each image. Traditionally, the
      percent (%) character has been used to identify these codes since
      the current character codes do not conflict with the strftime
      codes, which can also be used in the timestamp. While this works
      well for Linux, this does not work well for BSD operating systems.
      Changing the default character to something else, such as an
      exclamation point (!), resolves the issue. Note this only affects
      the timestamp codes built into ZoneMinder. It has no effect on
      the family of strftime codes one can use.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 38, Name = 'ZM_TIMEZONE', Value = '', Type = 'string', DefaultValue = '', Hint = 'America/Toronto', Pattern = '(?^:^(.+)$)', Format = '$1', Prompt = 'The timezone that php should use.', Help = '
      This should be set equal to the system timezone of the mysql server', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 39, Name = 'ZM_CPU_EXTENSIONS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Use advanced CPU extensions to increase performance', Help = '
      When advanced processor extensions such as SSE2 or SSSE3 are
      available, ZoneMinder can use them, which should increase
      performance and reduce system load. Enabling this option on
      processors that do not support the advanced processors
      extensions used by ZoneMinder is harmless and will have no
      effect.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 40, Name = 'ZM_FAST_IMAGE_BLENDS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Use a fast algorithm to blend the reference image', Help = '
      To detect alarms ZoneMinder needs to blend the captured image
      with the stored reference image to update it for comparison
      with the next image. The reference blend percentage specified
      for the monitor controls how much the new image affects the
      reference image. There are two methods that are available for
      this. If this option is set then fast calculation which does
      not use any multiplication or division is used. This
      calculation is extremely fast, however it limits the possible
      blend percentages to 50%, 25%, 12.5%, 6.25%, 3.25% and 1.5%.
      Any other blend percentage will be rounded to the nearest
      possible one. The alternative is to switch this option off
      and use standard blending instead, which is slower.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 41, Name = 'ZM_OPT_ADAPTIVE_SKIP', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should frame analysis try and be efficient in skipping frames', Help = '
      In previous versions of ZoneMinder the analysis daemon would
      attempt to keep up with the capture daemon by processing the
      last captured frame on each pass. This would sometimes have the
      undesirable side-effect of missing a chunk of the initial
      activity that caused the alarm because the pre-alarm frames
      would all have to be written to disk and the database before
      processing the next frame, leading to some delay between the
      first and second event frames. Setting this option enables a
      newer adaptive algorithm where the analysis daemon attempts to
      process as many captured frames as possible, only skipping
      frames when in danger of the capture daemon overwriting yet to
      be processed frames. This skip is variable depending on the
      size of the ring buffer and the amount of space left in it.
      Enabling this option will give you much better coverage of the
      beginning of alarms whilst biasing out any skipped frames
      towards the middle or end of the event. However you should be
      aware that this will have the effect of making the analysis
      daemon run somewhat behind the capture daemon during events and
      for particularly fast rates of capture it is possible for the
      adaptive algorithm to be overwhelmed and not have time to react
      to a rapid build up of pending frames and thus for a buffer
      overrun condition to occur.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 42, Name = 'ZM_MAX_SUSPEND_TIME', Value = '30', Type = 'integer', DefaultValue = '30', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Maximum time that a monitor may have motion detection suspended', Help = '
      ZoneMinder allows monitors to have motion detection to be
      suspended, for instance while panning a camera. Ordinarily this
      relies on the operator resuming motion detection afterwards as
      failure to do so can leave a monitor in a permanently suspended
      state. This setting allows you to set a maximum time which a
      camera may be suspended for before it automatically resumes
      motion detection. This time can be extended by subsequent
      suspend indications after the first so continuous camera
      movement will also occur while the monitor is suspended.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 43, Name = 'ZM_HTTP_VERSION', Value = '1.0', Type = 'string', DefaultValue = '1.0', Hint = '1.1|1.0', Pattern = '(?^:^(1\.[01])$)', Format = ' $1?$1:\'\' ', Prompt = 'The version of HTTP that ZoneMinder will use to connect', Help = '
      ZoneMinder can communicate with network cameras using either of
      the HTTP/1.1 or HTTP/1.0 standard. A server will normally fall
      back to the version it supports with no problem so this should
      usually by left at the default. However it can be changed to
      HTTP/1.0 if necessary to resolve particular issues.
      ', Category = 'network', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 44, Name = 'ZM_HTTP_UA', Value = 'ZoneMinder', Type = 'string', DefaultValue = 'ZoneMinder', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The user agent that ZoneMinder uses to identify itself', Help = '
      When ZoneMinder communicates with remote cameras it will
      identify itself using this string and it\'s version number. This
      is normally sufficient, however if a particular cameras expects
      only to communicate with certain browsers then this can be
      changed to a different string identifying ZoneMinder as
      Internet Explorer or Netscape etc.
      ', Category = 'network', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 45, Name = 'ZM_HTTP_TIMEOUT', Value = '2500', Type = 'integer', DefaultValue = '2500', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How long ZoneMinder waits before giving up on images (milliseconds)', Help = '
      When retrieving remote images ZoneMinder will wait for this
      length of time before deciding that an image is not going to
      arrive and taking steps to retry. This timeout is in
      milliseconds (1000 per second) and will apply to each part of
      an image if it is not sent in one whole chunk.
      ', Category = 'network', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 46, Name = 'ZM_MIN_STREAMING_PORT', Value = '', Type = 'integer', DefaultValue = '', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Alternate port range to contact for streaming video.', Help = '
    Due to browsers only wanting to open 6 connections, if you have more
    than 6 monitors, you can have trouble viewing more than 6.  This setting
    specified the beginning of a port range that will be used to contact ZM
    on.  Each monitor will use this value plus the Monitor Id to stream
    content.  So a value of 2000 here will cause a stream for Monitor 1 to
    hit port 2001.  Please ensure that you configure apache appropriately
    to respond on these ports.', Category = 'network', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 47, Name = 'ZM_MIN_RTSP_PORT', Value = '', Type = 'integer', DefaultValue = '', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Start of port range to contact for RTSP streaming video.', Help = '
      The beginng of a port range that will be used to offer
      RTSP streaming of live captured video.
      Each monitor will use this value plus the Monitor Id to stream
      content.  So a value of 2000 here will cause a stream for Monitor 1 to
      hit port 2001.', Category = 'network', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 48, Name = 'ZM_MIN_RTP_PORT', Value = '40200', Type = 'integer', DefaultValue = '40200', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Minimum port that ZoneMinder will listen for RTP traffic on', Help = '
      When ZoneMinder communicates with MPEG4 capable cameras using
      RTP with the unicast method it must open ports for the camera
      to connect back to for control and streaming purposes. This
      setting specifies the minimum port number that ZoneMinder will
      use. Ordinarily two adjacent ports are used for each camera,
      one for control packets and one for data packets. This port
      should be set to an even number, you may also need to open up a
      hole in your firewall to allow cameras to connect back if you
      wish to use unicasting.
      ', Category = 'network', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 49, Name = 'ZM_MAX_RTP_PORT', Value = '40499', Type = 'integer', DefaultValue = '40499', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Maximum port that ZoneMinder will listen for RTP traffic on', Help = '
      When ZoneMinder communicates with MPEG4 capable cameras using
      RTP with the unicast method it must open ports for the camera
      to connect back to for control and streaming purposes. This
      setting specifies the maximum port number that ZoneMinder will
      use. Ordinarily two adjacent ports are used for each camera,
      one for control packets and one for data packets. This port
      should be set to an even number, you may also need to open up a
      hole in your firewall to allow cameras to connect back if you
      wish to use unicasting. You should also ensure that you have
      opened up at least two ports for each monitor that will be
      connecting to unicasting network cameras.
      ', Category = 'network', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 50, Name = 'ZM_OPT_FFMPEG', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Is the ffmpeg video encoder/decoder installed', Help = '
      ZoneMinder can optionally encode a series of video images into
      an MPEG encoded movie file for viewing, downloading or storage.
      This option allows you to specify whether you have the ffmpeg
      tools installed. Note that creating MPEG files can be fairly
      CPU and disk intensive and is not a required option as events
      can still be reviewed as video streams without it.
      ', Category = 'images', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 51, Name = 'ZM_PATH_FFMPEG', Value = '/usr/bin/ffmpeg', Type = 'string', DefaultValue = '/usr/bin/ffmpeg', Hint = '/absolute/path/to/somewhere', Pattern = '(?^:^((?:/[^/]*)+?)/?$)', Format = ' $1 ', Prompt = 'Path to (optional) ffmpeg mpeg encoder', Help = 'This path should point to where ffmpeg has been installed.', Category = 'images', Readonly = '0', Requires = 'ZM_OPT_FFMPEG=1';
INSERT INTO Config SET Id = 52, Name = 'ZM_FFMPEG_INPUT_OPTIONS', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Additional input options to ffmpeg', Help = '
      Ffmpeg can take many options on the command line to control the
      quality of video produced. This option allows you to specify
      your own set that apply to the input to ffmpeg (options that
      are given before the -i option). Check the ffmpeg documentation
      for a full list of options which may be used here.
      ', Category = 'images', Readonly = '0', Requires = 'ZM_OPT_FFMPEG=1';
INSERT INTO Config SET Id = 53, Name = 'ZM_FFMPEG_OUTPUT_OPTIONS', Value = '-r 25', Type = 'string', DefaultValue = '-r 25', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Additional output options to ffmpeg', Help = '
      Ffmpeg can take many options on the command line to control the
      quality of video produced. This option allows you to specify
      your own set that apply to the output from ffmpeg (options that
      are given after the -i option). Check the ffmpeg documentation
      for a full list of options which may be used here. The most
      common one will often be to force an output frame rate
      supported by the video encoder.
      ', Category = 'images', Readonly = '0', Requires = 'ZM_OPT_FFMPEG=1';
INSERT INTO Config SET Id = 54, Name = 'ZM_FFMPEG_FORMATS', Value = 'mpg mpeg wmv asf avi* mov swf 3gp**', Type = 'string', DefaultValue = 'mpg mpeg wmv asf avi* mov swf 3gp**', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Formats to allow for ffmpeg video generation', Help = '
      Ffmpeg can generate video in many different formats. This
      option allows you to list the ones you want to be able to
      select. As new formats are supported by ffmpeg you can add them
      here and be able to use them immediately. Adding a \'*\' after a
      format indicates that this will be the default format used for
      web video, adding \'**\' defines the default format for phone
      video.
      ', Category = 'images', Readonly = '0', Requires = 'ZM_OPT_FFMPEG=1';
INSERT INTO Config SET Id = 55, Name = 'ZM_FFMPEG_OPEN_TIMEOUT', Value = '10', Type = 'integer', DefaultValue = '10', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Timeout in seconds when opening a stream.', Help = '
      When Ffmpeg is opening a stream, it can take a long time before
      failing; certain circumstances even seem to be able to lock
      indefinitely. This option allows you to set a maximum time in
      seconds to pass before closing the stream and trying to reopen
      it again.
      ', Category = 'images', Readonly = '0', Requires = 'ZM_OPT_FFMPEG=1';
INSERT INTO Config SET Id = 56, Name = 'ZM_LOG_LEVEL_SYSLOG', Value = '0', Type = 'integer', DefaultValue = '0', Hint = 'None=-5|Panic=-4|Fatal=-3|Error=-2|Warning=-1|Info=0|Debug=1', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Save logging output to the system log', Help = '
      ZoneMinder logging is now more integrated between
      components and allows you to specify the destination for
      logging output and the individual levels for each. This option
      lets you control the level of logging output that goes to the
      system log. ZoneMinder binaries have always logged to the
      system log but script and web logging is now included. To
      preserve the previous behaviour you should ensure this value is
      set to Info or Warning. This option controls the maximum level
      of logging that will be written, so Info includes Warnings and
      Errors etc. To disable entirely, set this option to None. You
      should use caution when setting this option to Debug as it can
      affect severely affect system performance. If you want debug
      you will also need to set a level and component below
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 57, Name = 'ZM_LOG_LEVEL_FILE', Value = '1', Type = 'integer', DefaultValue = '1', Hint = 'None=-5|Panic=-4|Fatal=-3|Error=-2|Warning=-1|Info=0|Debug=1', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Save logging output to component files', Help = '
      ZoneMinder logging is now more integrated between
      components and allows you to specify the destination for
      logging output and the individual levels for each. This option
      lets you control the level of logging output that goes to
      individual log files written by specific components. This is
      how logging worked previously and although useful for tracking
      down issues in specific components it also resulted in many
      disparate log files. To preserve this behaviour you should
      ensure this value is set to Info or Warning. This option
      controls the maximum level of logging that will be written, so
      Info includes Warnings and Errors etc. To disable entirely, set
      this option to None. You should use caution when setting this
      option to Debug as it can affect severely affect system
      performance though file output has less impact than the other
      options. If you want debug you will also need to set a level
      and component below
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 58, Name = 'ZM_LOG_LEVEL_WEBLOG', Value = '-5', Type = 'integer', DefaultValue = '-5', Hint = 'None=-5|Panic=-4|Fatal=-3|Error=-2|Warning=-1|Info=0|Debug=1', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Save logging output to the weblog', Help = '
      ZoneMinder logging is now more integrated between
      components and allows you to specify the destination for
      logging output and the individual levels for each. This option
      lets you control the level of logging output from the web
      interface that goes to the httpd error log. Note that only web
      logging from PHP and JavaScript files is included and so this
      option is really only useful for investigating specific issues
      with those components. This option controls the maximum level
      of logging that will be written, so Info includes Warnings and
      Errors etc. To disable entirely, set this option to None. You
      should use caution when setting this option to Debug as it can
      affect severely affect system performance. If you want debug
      you will also need to set a level and component below
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 59, Name = 'ZM_LOG_LEVEL_DATABASE', Value = '0', Type = 'integer', DefaultValue = '0', Hint = 'None=-5|Panic=-4|Fatal=-3|Error=-2|Warning=-1|Info=0|Debug=1', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Save logging output to the database', Help = '
      ZoneMinder logging is now more integrated between
      components and allows you to specify the destination for
      logging output and the individual levels for each. This option
      lets you control the level of logging output that is written to
      the database. This is a new option which can make viewing
      logging output easier and more intuitive and also makes it
      easier to get an overall impression of how the system is
      performing. If you have a large or very busy system then it is
      possible that use of this option may slow your system down if
      the table becomes very large. Ensure you use the
      LOG_DATABASE_LIMIT option to keep the table to a manageable
      size. This option controls the maximum level of logging that
      will be written, so Info includes Warnings and Errors etc. To
      disable entirely, set this option to None. You should use
      caution when setting this option to Debug as it can affect
      severely affect system performance. If you want debug you will
      also need to set a level and component below
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 60, Name = 'ZM_LOG_DATABASE_LIMIT', Value = '7 day', Type = 'string', DefaultValue = '7 day', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Maximum number of log entries to retain', Help = '
      If you are using database logging then it is possible to
      quickly build up a large number of entries in the Logs table.
      This option allows you to specify how many of these entries are
      kept. If you set this option to a number greater than zero then
      that number is used to determine the maximum number of rows,
      less than or equal to zero indicates no limit and is not
      recommended. You can also set this value to time values such as
      \'<n> day\' which will limit the log entries to those newer than
      that time. You can specify \'hour\', \'day\', \'week\', \'month\' and
      \'year\', note that the values should be singular (no \'s\' at the
      end). The Logs table is pruned periodically so it is possible
      for more than the expected number of rows to be present briefly
      in the meantime.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 61, Name = 'ZM_LOG_FFMPEG', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Log FFMPEG messages', Help = '
       When enabled (default is on), this option will log FFMPEG messages.
       FFMPEG messages can be useful when debugging streaming issues. However,
       depending on your distro and FFMPEG version, this may also result in
       more logs than you\'d typically like to see. If all your streams are working
       well, you may choose to turn this off.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 62, Name = 'ZM_LOG_DEBUG', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Switch debugging on', Help = '
      ZoneMinder components usually support debug logging available
      to help with diagnosing problems. Binary components have
      several levels of debug whereas more other components have only
      one. Normally this is disabled to minimize performance
      penalties and avoid filling logs too quickly. This option lets
      you switch on other options that allow you to configure
      additional debug information to be output. Components will pick
      up this instruction when they are restarted.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 63, Name = 'ZM_LOG_DEBUG_TARGET', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'What components should have extra debug enabled', Help = '
      There are three scopes of debug available. Leaving this option
      blank means that all components will use extra debug (not
      recommended). Setting this option to \'_<component>\', e.g. _zmc,
      will limit extra debug to that component only. Setting this
      option to \'_<component>_<identity>\', e.g. \'_zmc_m1\' will limit
      extra debug to that instance of the component only. This is
      ordinarily what you probably want to do. To debug scripts use
      their names without the .pl extension, e.g. \'_zmvideo\' and to
      debug issues with the web interface use \'_web\'. You can specify
      multiple targets by separating them with \'|\' characters.
      ', Category = 'logging', Readonly = '0', Requires = 'ZM_LOG_DEBUG=1';
INSERT INTO Config SET Id = 64, Name = 'ZM_LOG_DEBUG_LEVEL', Value = '1', Type = 'integer', DefaultValue = '1', Hint = '1|2|3|4|5|6|7|8|9', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What level of extra debug should be enabled', Help = '
      There are 9 levels of debug available, with higher numbers
      being more debug and level 0 being no debug. However not all
      levels are used by all components. Also if there is debug at a
      high level it is usually likely to be output at such a volume
      that it may obstruct normal operation. For this reason you
      should set the level carefully and cautiously until the degree
      of debug you wish to see is present. Scripts and the web
      interface only have one level so this is an on/off type option
      for them.
      ', Category = 'logging', Readonly = '0', Requires = 'ZM_LOG_DEBUG=1';
INSERT INTO Config SET Id = 65, Name = 'ZM_LOG_DEBUG_FILE', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Where extra debug is output to', Help = '
      This option allows you to specify a different target for debug
      output. All components have a default log file which will
      norally be in /tmp or /var/log and this is where debug will be
      written to if this value is empty. Adding a path here will
      temporarily redirect debug, and other logging output, to this
      file. This option is a simple filename and you are debugging
      several components then they will all try and write to the same
      file with undesirable consequences. Appending a \'+\' to the
      filename will cause the file to be created with a \'.<pid>\'
      suffix containing your process id. In this way debug from each
      run of a component is kept separate. This is the recommended
      setting as it will also prevent subsequent runs from
      overwriting the same log. You should ensure that permissions
      are set up to allow writing to the file and directory specified
      here.
      ', Category = 'logging', Readonly = '0', Requires = 'ZM_LOG_DEBUG=1';
INSERT INTO Config SET Id = 66, Name = 'ZM_LOG_CHECK_PERIOD', Value = '900', Type = 'integer', DefaultValue = '900', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Time period used when calculating overall system health', Help = '
      When ZoneMinder is logging events to the database it can
      retrospectively examine the number of warnings and errors that
      have occurred to calculate an overall state of system health.
      This option allows you to indicate what period of historical
      events are used in this calculation. This value is expressed in
      seconds and is ignored if LOG_LEVEL_DATABASE is set to None.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 67, Name = 'ZM_LOG_ALERT_WAR_COUNT', Value = '1', Type = 'integer', DefaultValue = '1', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Number of warnings indicating system alert state', Help = '
      When ZoneMinder is logging events to the database it can
      retrospectively examine the number of warnings and errors that
      have occurred to calculate an overall state of system health.
      This option allows you to specify how many warnings must have
      occurred within the defined time period to generate an overall
      system alert state. A value of zero means warnings are not
      considered. This value is ignored if LOG_LEVEL_DATABASE is set
      to None.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 68, Name = 'ZM_LOG_ALERT_ERR_COUNT', Value = '1', Type = 'integer', DefaultValue = '1', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Number of errors indicating system alert state', Help = '
      When ZoneMinder is logging events to the database it can
      retrospectively examine the number of warnings and errors that
      have occurred to calculate an overall state of system health.
      This option allows you to specify how many errors must have
      occurred within the defined time period to generate an overall
      system alert state. A value of zero means errors are not
      considered. This value is ignored if LOG_LEVEL_DATABASE is set
      to None.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 69, Name = 'ZM_LOG_ALERT_FAT_COUNT', Value = '0', Type = 'integer', DefaultValue = '0', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Number of fatal error indicating system alert state', Help = '
      When ZoneMinder is logging events to the database it can
      retrospectively examine the number of warnings and errors that
      have occurred to calculate an overall state of system health.
      This option allows you to specify how many fatal errors
      (including panics) must have occurred within the defined time
      period to generate an overall system alert state. A value of
      zero means fatal errors are not considered. This value is
      ignored if LOG_LEVEL_DATABASE is set to None.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 70, Name = 'ZM_LOG_ALARM_WAR_COUNT', Value = '100', Type = 'integer', DefaultValue = '100', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Number of warnings indicating system alarm state', Help = '
      When ZoneMinder is logging events to the database it can
      retrospectively examine the number of warnings and errors that
      have occurred to calculate an overall state of system health.
      This option allows you to specify how many warnings must have
      occurred within the defined time period to generate an overall
      system alarm state. A value of zero means warnings are not
      considered. This value is ignored if LOG_LEVEL_DATABASE is set
      to None.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 71, Name = 'ZM_LOG_ALARM_ERR_COUNT', Value = '10', Type = 'integer', DefaultValue = '10', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Number of errors indicating system alarm state', Help = '
      When ZoneMinder is logging events to the database it can
      retrospectively examine the number of warnings and errors that
      have occurred to calculate an overall state of system health.
      This option allows you to specify how many errors must have
      occurred within the defined time period to generate an overall
      system alarm state. A value of zero means errors are not
      considered. This value is ignored if LOG_LEVEL_DATABASE is set
      to None.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 72, Name = 'ZM_LOG_ALARM_FAT_COUNT', Value = '1', Type = 'integer', DefaultValue = '1', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Number of fatal error indicating system alarm state', Help = '
      When ZoneMinder is logging events to the database it can
      retrospectively examine the number of warnings and errors that
      have occurred to calculate an overall state of system health.
      This option allows you to specify how many fatal errors
      (including panics) must have occurred within the defined time
      period to generate an overall system alarm state. A value of
      zero means fatal errors are not considered. This value is
      ignored if LOG_LEVEL_DATABASE is set to None.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 73, Name = 'ZM_RECORD_EVENT_STATS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Record event statistical information, switch off if too slow', Help = '
      This version of ZoneMinder records detailed information about
      events in the Stats table. This can help in profiling what the
      optimum settings are for Zones though this is tricky at
      present. However in future releases this will be done more
      easily and intuitively, especially with a large sample of
      events. The default option of \'yes\' allows this information to
      be collected now in readiness for this but if you are concerned
      about performance you can switch this off in which case no
      Stats information will be saved.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 74, Name = 'ZM_RECORD_DIAG_IMAGES', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Record intermediate alarm diagnostic images, can be very slow', Help = '
      In addition to recording event statistics you can also record
      the intermediate diagnostic images that display the results of
      the various checks and processing that occur when trying to
      determine if an alarm event has taken place. There are several
      of these images generated for each frame and zone for each
      alarm or alert frame so this can have a massive impact on
      performance. Only switch this setting on for debug or analysis
      purposes and remember to switch it off again once no longer
      required.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 75, Name = 'ZM_DUMP_CORES', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Create core files on unexpected process failure.', Help = '
      When an unrecoverable error occurs in a ZoneMinder binary
      process is has traditionally been trapped and the details
      written to logs to aid in remote analysis. However in some
      cases it is easier to diagnose the error if a core file, which
      is a memory dump of the process at the time of the error, is
      created. This can be interactively analysed in the debugger and
      may reveal more or better information than that available from
      the logs. This option is recommended for advanced users only
      otherwise leave at the default. Note using this option to
      trigger core files will mean that there will be no indication
      in the binary logs that a process has died, they will just
      stop, however the zmdc log will still contain an entry. Also
      note that you may have to explicitly enable core file creation
      on your system via the \'ulimit -c\' command or other means
      otherwise no file will be created regardless of the value of
      this option.
      ', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 76, Name = 'ZM_WEB_NAVBAR_TYPE', Value = 'normal', Type = 'string', DefaultValue = 'normal', Hint = 'normal|collapsed', Pattern = '(?^i:^([nc]))', Format = ' ($1 =~ /^n/) ? \'normal\' : \'collapsed\' ', Prompt = 'Style of the web console navigation bar', Help = '
      Choose between different navigation bar styles for the web
      console. The \"normal\" style has a menu across the top, which
      collapses to a pull down menu on small screens. The \"collapsed\"
      style is collapsed all the time. Instead of a menu across the
      top, menu items are accessed from the drop down menu on the
      right.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 77, Name = 'ZM_WEB_TITLE', Value = 'ZoneMinder', Type = 'string', DefaultValue = 'ZoneMinder', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The title displayed wherever the site references itself.', Help = '
      If you want the site to identify as something other than ZoneMinder, change this here.
      It can be used to more accurately identify this installation from others.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 78, Name = 'ZM_WEB_TITLE_PREFIX', Value = 'ZM', Type = 'string', DefaultValue = 'ZM', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The title prefix displayed on each window', Help = '
      If you have more than one installation of ZoneMinder it can be
      helpful to display different titles for each one. Changing this
      option allows you to customise the window titles to include
      further information to aid identification.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 79, Name = 'ZM_HOME_URL', Value = 'http://zoneminder.com', Type = 'string', DefaultValue = 'http://zoneminder.com', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The url used in the home/logo area of the navigation bar.', Help = '
      By default this takes you to the zoneminder.com website,
      but perhaps you would prefer it to take you somewhere else.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 80, Name = 'ZM_HOME_CONTENT', Value = 'ZoneMinder', Type = 'string', DefaultValue = 'ZoneMinder', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The content of the home button.', Help = '
      You may wish to set this to empty if you are using css to put a background image on it.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 81, Name = 'ZM_HOME_ABOUT', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Whether to enable the ZoneMinder About menu.', Help = '
      When enabled, the ZoneMinder logo in the top left corner of the
      navigation bar becomes a menu with links to: the ZoneMinder
      website, ZoneMinder Documentation, and the ZoneMinder forum.
      End users wishing to rebrand their system may want to disable this
      as the menu items are currently hard coded.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 82, Name = 'ZM_WEB_CONSOLE_BANNER', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Arbitrary text message near the top of the console', Help = '
      Allows the administrator to place an arbitrary text message
      near the top of the web console. This is useful for the developers
      to display a message which indicates the running instance of
      ZoneMinder is a development snapshot, but it can also be used for
      any other purpose as well.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 83, Name = 'ZM_WEB_EVENT_DISK_SPACE', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Whether to show disk space used by each event.', Help = '
      Adds another column to the listing of events
      showing the disk space used by the event.  This will impart a small
      overhead as it will call du on the event directory.  In practice
      this overhead is fairly small but may be noticeable on IO-constrained
      systems.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 84, Name = 'ZM_WEB_RESIZE_CONSOLE', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should the console window resize itself to fit', Help = '
      Traditionally the main ZoneMinder web console window has
      resized itself to shrink to a size small enough to list only
      the monitors that are actually present. This is intended to
      make the window more unobtrusize but may not be to everyone\'s
      tastes, especially if opened in a tab in browsers which support
      this kind if layout. Switch this option off to have the console
      window size left to the users preference
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 85, Name = 'ZM_WEB_ID_ON_CONSOLE', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should the console list the monitor id', Help = '
      Some find it useful to have the id always visible
      on the console. This option will add a column listing it.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 86, Name = 'ZM_WEB_POPUP_ON_ALARM', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should the monitor window jump to the top if an alarm occurs', Help = '
      When viewing a live monitor stream you can specify whether you
      want the window to pop to the front if an alarm occurs when the
      window is minimised or behind another window. This is most
      useful if your monitors are over doors for example when they
      can pop up if someone comes to the doorway.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 87, Name = 'ZM_OPT_X10', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Support interfacing with X10 devices', Help = '
      If you have an X10 Home Automation setup in your home you can
      use ZoneMinder to initiate or react to X10 signals if your
      computer has the appropriate interface controller. This option
      indicates whether X10 options will be available in the browser
      client.
      ', Category = 'x10', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 88, Name = 'ZM_X10_DEVICE', Value = '/dev/ttyS0', Type = 'string', DefaultValue = '/dev/ttyS0', Hint = '/absolute/path/to/somewhere', Pattern = '(?^:^((?:/[^/]*)+?)/?$)', Format = ' $1 ', Prompt = 'What device is your X10 controller connected on', Help = '
      If you have an X10 controller device (e.g. XM10U) connected to
      your computer this option details which port it is connected on,
      the default of /dev/ttyS0 maps to serial or com port 1.
      ', Category = 'x10', Readonly = '0', Requires = 'ZM_OPT_X10=1';
INSERT INTO Config SET Id = 89, Name = 'ZM_X10_HOUSE_CODE', Value = 'A', Type = 'string', DefaultValue = 'A', Hint = 'A-P', Pattern = '(?^i:^([A-P]))', Format = ' uc($1) ', Prompt = 'What X10 house code should be used', Help = '
      X10 devices are grouped together by identifying them as all
      belonging to one House Code. This option details what that is.
      It should be a single letter between A and P.
      ', Category = 'x10', Readonly = '0', Requires = 'ZM_OPT_X10=1';
INSERT INTO Config SET Id = 90, Name = 'ZM_X10_DB_RELOAD_INTERVAL', Value = '60', Type = 'integer', DefaultValue = '60', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the X10 daemon reloads the monitors from the database', Help = '
      The zmx10 daemon periodically checks the database to find out
      what X10 events trigger, or result from, alarms. This option
      determines how frequently this check occurs, unless you change
      this area frequently this can be a fairly large value.
      ', Category = 'x10', Readonly = '0', Requires = 'ZM_OPT_X10=1';
INSERT INTO Config SET Id = 91, Name = 'ZM_WEB_SOUND_ON_ALARM', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should the monitor window play a sound if an alarm occurs', Help = '
      When viewing a live monitor stream you can specify whether you
      want the window to play a sound to alert you if an alarm
      occurs.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 92, Name = 'ZM_WEB_ALARM_SOUND', Value = '', Type = 'string', DefaultValue = '', Hint = 'filename', Pattern = '(?^:^([a-zA-Z0-9-_.]+)$)', Format = ' $1 ', Prompt = 'The sound to play on alarm, put this in the sounds directory', Help = '
      You can specify a sound file to play if an alarm occurs whilst
      you are watching a live monitor stream. So long as your browser
      understands the format it does not need to be any particular
      type. This file should be placed in the sounds directory
      defined earlier.
      ', Category = 'web', Readonly = '0', Requires = 'ZM_WEB_SOUND_ON_ALARM=1';
INSERT INTO Config SET Id = 93, Name = 'ZM_WEB_COMPACT_MONTAGE', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Compact the montage view by removing extra detail', Help = '
      The montage view shows the output of all of your active
      monitors in one window. This include a small menu and status
      information for each one. This can increase the web traffic and
      make the window larger than may be desired. Setting this option
      on removes all this extraneous information and just displays
      the images.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 94, Name = 'ZM_OPT_FAST_DELETE', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Delete only event database records for speed', Help = '
      Normally an event created as the result of an alarm consists of
      entries in one or more database tables plus the various files
      associated with it. When deleting events in the browser it can
      take a long time to remove all of this if your are trying to do
      a lot of events at once. It is recommended that you set this
      option which means that the browser client only deletes the key
      entries in the events table, which means the events will no
      longer appear in the listing, and leaves the zmaudit daemon to
      clear up the rest later. Note that this feature is less relevant
      with modern hardware. Recommend this feature be left off.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 95, Name = 'ZM_STRICT_VIDEO_CONFIG', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Allow errors in setting video config to be fatal', Help = '
      With some video devices errors can be reported in setting the
      various video attributes when in fact the operation was
      successful. Switching this option off will still allow these
      errors to be reported but will not cause them to kill the video
      capture daemon. Note however that doing this will cause all
      errors to be ignored including those which are genuine and
      which may cause the video capture to not function correctly.
      Use this option with caution.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 96, Name = 'ZM_LD_PRELOAD', Value = '', Type = 'string', DefaultValue = '', Hint = '/absolute/path/to/somewhere', Pattern = '(?^:^((?:/[^/]*)+?)/?$)', Format = ' $1 ', Prompt = 'Path to library to preload before launching daemons', Help = '
      Some older cameras require the use of the v4l1 compat
      library. This setting allows the setting of the path
      to the library, so that it can be loaded by zmdc.pl
      before launching zmc.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 97, Name = 'ZM_V4L_MULTI_BUFFER', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Use more than one buffer for Video 4 Linux devices', Help = '
      Performance when using Video 4 Linux devices is usually best if
      multiple buffers are used allowing the next image to be
      captured while the previous one is being processed. If you have
      multiple devices on a card sharing one input that requires
      switching then this approach can sometimes cause frames from
      one source to be mixed up with frames from another. Switching
      this option off prevents multi buffering resulting in slower
      but more stable image capture. This option is ignored for
      non-local cameras or if only one input is present on a capture
      chip. This option addresses a similar problem to the
      ZM_CAPTURES_PER_FRAME option and you should normally change the
      value of only one of the options at a time.  If you have
      different capture cards that need different values you can
      override them in each individual monitor on the source page.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 98, Name = 'ZM_CAPTURES_PER_FRAME', Value = '1', Type = 'integer', DefaultValue = '1', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How many images are captured per returned frame, for shared local cameras', Help = '
      If you are using cameras attached to a video capture card which
      forces multiple inputs to share one capture chip, it can
      sometimes produce images with interlaced frames reversed
      resulting in poor image quality and a distinctive comb edge
      appearance. Increasing this setting allows you to force
      additional image captures before one is selected as the
      captured frame. This allows the capture hardware to \'settle
      down\' and produce better quality images at the price of lesser
      capture rates. This option has no effect on (a) network
      cameras, or (b) where multiple inputs do not share a capture
      chip. This option addresses a similar problem to the
      ZM_V4L_MULTI_BUFFER option and you should normally change the
      value of only one of the options at a time.  If you have
      different capture cards that need different values you can
      override them in each individual monitor on the source page.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 99, Name = 'ZM_FILTER_RELOAD_DELAY', Value = '300', Type = 'integer', DefaultValue = '300', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) filters are reloaded in zmfilter', Help = '
      ZoneMinder allows you to save filters to the database which
      allow events that match certain criteria to be emailed, deleted
      or uploaded to a remote machine etc. The zmfilter daemon loads
      these and does the actual operation. This option determines how
      often the filters are reloaded from the database to get the
      latest versions or new filters. If you don\'t change filters
      very often this value can be set to a large value.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 100, Name = 'ZM_FILTER_EXECUTE_INTERVAL', Value = '60', Type = 'integer', DefaultValue = '60', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) to run automatic saved filters', Help = '
      ZoneMinder allows you to save filters to the database which
      allow events that match certain criteria to be emailed, deleted
      or uploaded to a remote machine etc. The zmfilter daemon loads
      these and does the actual operation. This option determines how
      often the filters are executed on the saved event in the
      database. If you want a rapid response to new events this
      should be a smaller value, however this may increase the
      overall load on the system and affect performance of other
      elements.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 101, Name = 'ZM_OPT_UPLOAD', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should ZoneMinder support uploading events from filters', Help = '
      In ZoneMinder you can create event filters that specify whether
      events that match certain criteria should be uploaded to a
      remote server for archiving. This option specifies whether this
      functionality should be available
      ', Category = 'upload', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 102, Name = 'ZM_UPLOAD_ARCH_FORMAT', Value = 'tar', Type = 'string', DefaultValue = 'tar', Hint = 'tar|zip', Pattern = '(?^i:^([tz]))', Format = ' $1 =~ /^t/ ? \'tar\' : \'zip\' ', Prompt = 'What format the uploaded events should be created in.', Help = '
      Uploaded events may be stored in either .tar or .zip format,
      this option specifies which. Note that to use this you will
      need to have the Archive::Tar and/or Archive::Zip perl modules
      installed.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 103, Name = 'ZM_UPLOAD_ARCH_COMPRESS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should archive files be compressed', Help = '
      When the archive files are created they can be compressed.
      However in general since the images are compressed already this
      saves only a minimal amount of space versus utilising more CPU
      in their creation. Only enable if you have CPU to waste and are
      limited in disk space on your remote server or bandwidth.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 104, Name = 'ZM_UPLOAD_ARCH_ANALYSE', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Include the analysis files in the archive', Help = '
      When the archive files are created they can contain either just
      the captured frames or both the captured frames and, for frames
      that caused an alarm, the analysed image with the changed area
      highlighted. This option controls files are included. Only
      include analysed frames if you have a high bandwidth connection
      to the remote server or if you need help in figuring out what
      caused an alarm in the first place as archives with these files
      in can be considerably larger.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 105, Name = 'ZM_UPLOAD_PROTOCOL', Value = 'ftp', Type = 'string', DefaultValue = 'ftp', Hint = 'ftp|sftp', Pattern = '(?^i:^([tz]))', Format = ' $1 =~ /^f/ ? \'ftp\' : \'sftp\' ', Prompt = 'What protocol to use to upload events', Help = '
      ZoneMinder can upload events to a remote server using either
      FTP or SFTP. Regular FTP is widely supported but not
      necessarily very secure whereas SFTP (Secure FTP) runs over an
      ssh connection and so is encrypted and uses regular ssh ports.
      Note that to use this you will need to have the appropriate
      perl module, either Net::FTP or Net::SFTP installed depending
      on your choice.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 106, Name = 'ZM_UPLOAD_HOST', Value = '', Type = 'string', DefaultValue = '', Hint = 'host.your.domain', Pattern = '(?^:^([a-zA-Z0-9_.-]+)$)', Format = ' $1 ', Prompt = 'The remote server to upload events to', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. This option indicates the name, or ip address,
      of the server to use.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 107, Name = 'ZM_UPLOAD_PORT', Value = '', Type = 'integer', DefaultValue = '', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'The port on the remote upload server, if not the default (SFTP only)', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. If you are using the SFTP protocol then this
      option allows you to specify a particular port to use for
      connection. If this option is left blank then the default, port
      22, is used. This option is ignored for FTP uploads.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 108, Name = 'ZM_UPLOAD_USER', Value = '', Type = 'string', DefaultValue = '', Hint = 'alphanumeric', Pattern = '(?^:^([a-zA-Z0-9-_]+)$)', Format = ' $1 ', Prompt = 'Remote server username', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. This option indicates the username that
      ZoneMinder should use to log in for transfer.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 109, Name = 'ZM_UPLOAD_PASS', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Remote server password', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. This option indicates the password that
      ZoneMinder should use to log in for transfer. If you are using
      certificate based logins for SFTP servers you can leave this
      option blank.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 110, Name = 'ZM_UPLOAD_LOC_DIR', Value = '/var/tmp/zm', Type = 'string', DefaultValue = '/var/tmp/zm', Hint = '/absolute/path/to/somewhere', Pattern = '(?^:^((?:/[^/]*)+?)/?$)', Format = ' $1 ', Prompt = 'The local directory in which to create upload files', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. This option indicates the local directory that
      ZoneMinder should use for temporary upload files. These are
      files that are created from events, uploaded and then deleted.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 111, Name = 'ZM_UPLOAD_REM_DIR', Value = '', Type = 'string', DefaultValue = '', Hint = 'relative/path/to/somewhere', Pattern = '(?^:^((?:[^/].*)?)/?$)', Format = ' $1 ', Prompt = 'The remote directory to upload to', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. This option indicates the remote directory
      that ZoneMinder should use to upload event files to.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 112, Name = 'ZM_UPLOAD_TIMEOUT', Value = '120', Type = 'integer', DefaultValue = '120', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How long to allow the transfer to take for each file', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. This option indicates the maximum inactivity
      timeout (in seconds) that should be tolerated before ZoneMinder
      determines that the transfer has failed and closes down the
      connection.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 113, Name = 'ZM_UPLOAD_STRICT', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Require strict host key checking for SFTP uploads', Help = '
      You can require SFTP uploads to verify the host key of the remote server
      for protection against man-in-the-middle attacks. You will need to add the
      server\'s key to the known_hosts file. On most systems, this will be
      ~/.ssh/known_hosts, where ~ is the home directory of the web server running
      ZoneMinder.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 114, Name = 'ZM_UPLOAD_FTP_PASSIVE', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Use passive ftp when uploading', Help = '
      If your computer is behind a firewall or proxy you may need to
      set FTP to passive mode. In fact for simple transfers it makes
      little sense to do otherwise anyway but you can set this to
      \'No\' if you wish.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 115, Name = 'ZM_UPLOAD_DEBUG', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Switch upload debugging on', Help = '
      You can use filters to instruct ZoneMinder to upload events to
      a remote server. If you are having (or expecting) troubles with
      uploading events then setting this to \'yes\' permits additional
      information to be generated by the underlying transfer modules
      and included in the logs.
      ', Category = 'upload', Readonly = '0', Requires = 'ZM_OPT_UPLOAD=1';
INSERT INTO Config SET Id = 116, Name = 'ZM_OPT_EMAIL', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should ZoneMinder email you details of events that match corresponding filters', Help = '
      In ZoneMinder you can create event filters that specify whether
      events that match certain criteria should have their details
      emailed to you at a designated email address. This will allow
      you to be notified of events as soon as they occur and also to
      quickly view the events directly. This option specifies whether
      this functionality should be available. The email created with
      this option can be any size and is intended to be sent to a
      regular email reader rather than a mobile device.
      ', Category = 'mail', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 117, Name = 'ZM_OPT_MESSAGE', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Should ZoneMinder message you with details of events that match corresponding filters', Help = '
      In ZoneMinder you can create event filters that specify whether
      events that match certain criteria should have their details
      sent to you at a designated short message email address. This
      will allow you to be notified of events as soon as they occur.
      This option specifies whether this functionality should be
      available. The email created by this option will be brief and
      is intended to be sent to an SMS gateway or a minimal mail
      reader such as a mobile device or phone rather than a regular
      email reader.
      ', Category = 'mail', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 118, Name = 'ZM_MESSAGE_ADDRESS', Value = '', Type = 'string', DefaultValue = '', Hint = 'your.name@your.domain', Pattern = '(?^:^([a-zA-Z0-9_.-]+)\@([a-zA-Z0-9_.-]+)$)', Format = ' $1\@$2 ', Prompt = 'The email address to send matching event details to', Help = '
      This option is used to define the short message email address
      that any events that match the appropriate filters will be sent
      to.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_MESSAGE=1';
INSERT INTO Config SET Id = 119, Name = 'ZM_MESSAGE_SUBJECT', Value = 'ZoneMinder: Alarm - %MN%-%EI%', Type = 'string', DefaultValue = 'ZoneMinder: Alarm - %MN%-%EI%', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The subject of the message used to send matching event details', Help = '
      This option is used to define the subject of the message that
      is sent for any events that match the appropriate filters.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_MESSAGE=1';
INSERT INTO Config SET Id = 120, Name = 'ZM_MESSAGE_BODY', Value = 'ZM alarm detected - %EL% secs, %EF%/%EFA% frames, t%EST%/m%ESM%/a%ESA% score.', Type = 'text', DefaultValue = 'ZM alarm detected - %EL% secs, %EF%/%EFA% frames, t%EST%/m%ESM%/a%ESA% score.', Hint = 'free text', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The body of the message used to send matching event details', Help = '
      This option is used to define the content of the message that
      is sent for any events that match the appropriate filters.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_MESSAGE=1';
INSERT INTO Config SET Id = 121, Name = 'ZM_NEW_MAIL_MODULES', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Use a newer perl method to send emails', Help = '
      Traditionally ZoneMinder has used the MIME::Entity perl module
      to construct and send notification emails and messages. Some
      people have reported problems with this module not being
      present at all or flexible enough for their needs. If you are
      one of those people this option allows you to select a new
      mailing method using MIME::Lite and Net::SMTP instead. This
      method was contributed by Ross Melin and should work for
      everyone but has not been extensively tested so currently is
      not selected by default.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_EMAIL=1;ZM_OPT_MESSAGE=1';
INSERT INTO Config SET Id = 122, Name = 'ZM_EMAIL_HOST', Value = 'localhost', Type = 'string', DefaultValue = 'localhost', Hint = 'host.your.domain', Pattern = '(?^:^([a-zA-Z0-9_.-]+)$)', Format = ' $1 ', Prompt = 'The host address of your SMTP mail server', Help = '
      If you have chosen SMTP as the method by which to send
      notification emails or messages then this option allows you to
      choose which SMTP server to use to send them. The default of
      localhost may work if you have the sendmail, exim or a similar
      daemon running however you may wish to enter your ISP\'s SMTP
      mail server here.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_EMAIL=1;ZM_OPT_MESSAGE=1';
INSERT INTO Config SET Id = 123, Name = 'ZM_FROM_EMAIL', Value = '', Type = 'string', DefaultValue = '', Hint = 'your.name@your.domain', Pattern = '(?^:^([a-zA-Z0-9_.-]+)\@([a-zA-Z0-9_.-]+)$)', Format = ' $1\@$2 ', Prompt = 'The email address you wish your event notifications to originate from', Help = '
      The emails or messages that will be sent to you informing you
      of events can appear to come from a designated email address to
      help you with mail filtering etc. An address of something like
      ZoneMinder\@your.domain is recommended.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_EMAIL=1;ZM_OPT_MESSAGE=1';
INSERT INTO Config SET Id = 124, Name = 'ZM_URL', Value = '', Type = 'string', DefaultValue = '', Hint = 'http://host.your.domain/', Pattern = '(?^:^(?:http://)?(.+)$)', Format = ' \'http://\'.$1 ', Prompt = 'The URL of your ZoneMinder installation', Help = '
      The emails or messages that will be sent to you informing you
      of events can include a link to the events themselves for easy
      viewing. If you intend to use this feature then set this option
      to the url of your installation as it would appear from where
      you read your email, e.g. http://host.your.domain/zm.php.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_EMAIL=1;ZM_OPT_MESSAGE=1';
INSERT INTO Config SET Id = 125, Name = 'ZM_MAX_RESTART_DELAY', Value = '600', Type = 'integer', DefaultValue = '600', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Maximum delay (in seconds) for daemon restart attempts.', Help = '
      The zmdc (zm daemon control) process controls when processeses
      are started or stopped and will attempt to restart any that
      fail. If a daemon fails frequently then a delay is introduced
      between each restart attempt. If the daemon stills fails then
      this delay is increased to prevent extra load being placed on
      the system by continual restarts. This option controls what
      this maximum delay is.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 126, Name = 'ZM_STATS_UPDATE_INTERVAL', Value = '60', Type = 'integer', DefaultValue = '60', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often to update the database statistics', Help = '
      The zmstats daemon performs various db queries that may take
      a long time in the background.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 127, Name = 'ZM_WATCH_CHECK_INTERVAL', Value = '10', Type = 'integer', DefaultValue = '10', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often to check the capture daemons have not locked up', Help = '
      The zmwatch daemon checks the image capture performance of the
      capture daemons to ensure that they have not locked up (rarely
      a sync error may occur which blocks indefinitely). This option
      determines how often the daemons are checked.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 128, Name = 'ZM_WATCH_MAX_DELAY', Value = '45', Type = 'decimal', DefaultValue = '45', Hint = 'decimal', Pattern = '(?^:^(\d+(?:\.\d+)?)$)', Format = ' $1 ', Prompt = 'The maximum delay allowed since the last captured image', Help = '
      The zmwatch daemon checks the image capture performance of the
      capture daemons to ensure that they have not locked up (rarely
      a sync error may occur which blocks indefinitely). This option
      determines the maximum delay to allow since the last captured
      frame. The daemon will be restarted if it has not captured any
      images after this period though the actual restart may take
      slightly longer in conjunction with the check interval value
      above.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 129, Name = 'ZM_RUN_AUDIT', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Run zmaudit to check data consistency', Help = '
      The zmaudit daemon exists to check that the saved information
      in the database and on the filesystem match and are consistent
      with each other. If an error occurs or if you are using \'fast
      deletes\' it may be that database records are deleted but files
      remain. In this case, and similar, zmaudit will remove
      redundant information to synchronise the two data stores. This
      option controls whether zmaudit is run in the background and
      performs these checks and fixes continuously. This is
      recommended for most systems however if you have a very large
      number of events the process of scanning the database and
      filesystem may take a long time and impact performance. In this
      case you may prefer to not have zmaudit running unconditionally
      and schedule occasional checks at other, more convenient,
      times.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 130, Name = 'ZM_AUDIT_CHECK_INTERVAL', Value = '900', Type = 'integer', DefaultValue = '900', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often to check database and filesystem consistency', Help = '
      The zmaudit daemon exists to check that the saved information
      in the database and on the filesystem match and are consistent
      with each other. If an error occurs or if you are using \'fast
      deletes\' it may be that database records are deleted but files
      remain. In this case, and similar, zmaudit will remove
      redundant information to synchronise the two data stores. The
      default check interval of 900 seconds (15 minutes) is fine for
      most systems however if you have a very large number of events
      the process of scanning the database and filesystem may take a
      long time and impact performance. In this case you may prefer
      to make this interval much larger to reduce the impact on your
      system. This option determines how often these checks are
      performed.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 131, Name = 'ZM_AUDIT_MIN_AGE', Value = '86400', Type = 'integer', DefaultValue = '86400', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'The minimum age in seconds event data must be in order to be deleted.', Help = '
      The zmaudit daemon exists to check that the saved information
      in the database and on the filesystem match and are consistent
      with each other. Event files or db records that are younger than
      this setting will not be deleted and a warning will be given.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 132, Name = 'ZM_FORCED_ALARM_SCORE', Value = '255', Type = 'integer', DefaultValue = '255', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'Score to give forced alarms', Help = '
      The \'zmu\' utility can be used to force an alarm on a monitor
      rather than rely on the motion detection algorithms. This
      option determines what score to give these alarms to
      distinguish them from regular ones. It must be 255 or less.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 133, Name = 'ZM_BULK_FRAME_INTERVAL', Value = '100', Type = 'integer', DefaultValue = '100', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often a bulk frame should be written to the database', Help = '
      Traditionally ZoneMinder writes an entry into the Frames
      database table for each frame that is captured and saved. This
      works well in motion detection scenarios but when in a DVR
      situation (\'Record\' or \'Mocord\' mode) this results in a huge
      number of frame writes and a lot of database and disk bandwidth
      for very little additional information. Setting this to a
      non-zero value will enabled ZoneMinder to group these non-alarm
      frames into one \'bulk\' frame entry which saves a lot of
      bandwidth and space. The only disadvantage of this is that
      timing information for individual frames is lost but in
      constant frame rate situations this is usually not significant.
      This setting is ignored in Modect mode and individual frames
      are still written if an alarm occurs in Mocord mode also.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 134, Name = 'ZM_EVENT_CLOSE_MODE', Value = 'idle', Type = 'string', DefaultValue = 'idle', Hint = 'time|idle|alarm', Pattern = '(?^i:^([tia]))', Format = ' ($1 =~ /^t/)
          ? \'time\'
          : ($1 =~ /^i/ ? \'idle\' : \'time\' )
          ', Prompt = 'When continuous events are closed.', Help = '
      When a monitor is running in a continuous recording mode
      (Record or Mocord) events are usually closed after a fixed
      period of time (the section length). However in Mocord mode it
      is possible that motion detection may occur near the end of a
      section. This option controls what happens when an alarm occurs
      in Mocord mode.~~
      ~~
      The \'time\' setting means that the event will be
      closed at the end of the section regardless of alarm activity.~~
      ~~
      The \'idle\' setting means that the event will be closed at the
      end of the section if there is no alarm activity occurring at
      the time otherwise it will be closed once the alarm is over
      meaning the event may end up being longer than the normal
      section length.~~
      ~~
      The \'alarm\' setting means that if an alarm
      occurs during the event, the event will be closed and a new one
     will be opened.  So events will only be alarmed or continuous.
     This has the
      effect of limiting the number of alarms to one per event and
      the events may be shorter than the section length if an alarm
      has occurred.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 135, Name = 'ZM_WEIGHTED_ALARM_CENTRES', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Use a weighted algorithm to calculate the centre of an alarm', Help = '
      ZoneMinder will always calculate the centre point of an alarm
      in a zone to give some indication of where on the screen it is.
      This can be used by the experimental motion tracking feature or
      your own custom extensions. In the alarmed or filtered pixels
      mode this is a simple midpoint between the extents of the
      detected pixels. However in the blob method this can instead be
      calculated using weighted pixel locations to give more accurate
      positioning for irregularly shaped blobs. This method, while
      more precise is also slower and so is turned off by default.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 136, Name = 'ZM_EVENT_IMAGE_DIGITS', Value = '5', Type = 'integer', DefaultValue = '5', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How many significant digits are used in event image numbering', Help = '
      As event images are captured they are stored to the filesystem
      with a numerical index. By default this index has three digits
      so the numbers start 001, 002 etc. This works for most
      scenarios as events with more than 999 frames are rarely
      captured. However if you have extremely long events and use
      external applications then you may wish to increase this to
      ensure correct sorting of images in listings etc. Warning,
      increasing this value on a live system may render existing
      events unviewable as the event will have been saved with the
      previous scheme. Decreasing this value should have no ill
      effects.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 137, Name = 'ZM_DEFAULT_ASPECT_RATIO', Value = '4:3', Type = 'string', DefaultValue = '4:3', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'The default width:height aspect ratio used in monitors', Help = '
      When specifying the dimensions of monitors you can click a
      checkbox to ensure that the width stays in the correct ratio to
      the height, or vice versa. This setting allows you to indicate
      what the ratio of these settings should be. This should be
      specified in the format <width value>:<height value> and the
      default of 4:3 normally be acceptable but 11:9 is another
      common setting. If the checkbox is not clicked when specifying
      monitor dimensions this setting has no effect.
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 138, Name = 'ZM_USER_SELF_EDIT', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Allow unprivileged users to change their details', Help = '
      Ordinarily only users with system edit privilege are able to
      change users details. Switching this option on allows ordinary
      users to change their passwords and their language settings
      ', Category = 'config', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 139, Name = 'ZM_OPT_CONTROL', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Support controllable (e.g. PTZ) cameras', Help = '
      ZoneMinder includes limited support for controllable cameras. A
      number of sample protocols are included and others can easily
      be added. If you wish to control your cameras via ZoneMinder
      then select this option otherwise if you only have static
      cameras or use other control methods then leave this option
      off.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 140, Name = 'ZM_OPT_TRIGGERS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Interface external event triggers via socket or device files', Help = '
      ZoneMinder can interact with external systems which prompt or
      cancel alarms. This is done via the zmtrigger.pl script. This
      option indicates whether you want to use these external
      triggers. Most people will say no here.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 141, Name = 'ZM_CHECK_FOR_UPDATES', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Check with zoneminder.com for updated versions', Help = '
      From ZoneMinder version 1.17.0 onwards new versions are
      expected to be more frequent. To save checking manually for
      each new version ZoneMinder can check with the zoneminder.com
      website to determine the most recent release. These checks are
      infrequent, about once per week, and no personal or system
      information is transmitted other than your current version
      number. If you do not wish these checks to take place or your
      ZoneMinder system has no internet access you can switch these
      check off with this configuration variable
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 142, Name = 'ZM_CSP_REPORT_URI', Value = '', Type = 'string', DefaultValue = '', Hint = 'http://host.your.domain/', Pattern = '(?^:^(?:http://)?(.+)$)', Format = ' \'http://\'.$1 ', Prompt = 'URI to report unsafe inline javascript violations to', Help = '
    See https://en.wikipedia.org/wiki/Content_Security_Policy for more information.  When the browser detects unsafe inline javascript it will report it to this url, which may warn you of malicious attacks on your ZoneMinder install.', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 143, Name = 'ZM_TELEMETRY_DATA', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Send usage information to ZoneMinder', Help = '
      Enable collection of usage information of the local system and send
      it to the ZoneMinder development team. This data will be used to
      determine things like who and where our customers are, how big their
      systems are, the underlying hardware and operating system, etc.
      This is being done for the sole purpose of creating a better
      product for our target audience. This script is intended to be
      completely transparent to the end user, and can be disabled from
      the web console under Options. For more details on what information
      we collect, please refer to our [privacy](?view=privacy) statement.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 144, Name = 'ZM_TELEMETRY_UUID', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Unique identifier for ZoneMinder telemetry', Help = '
      This variable is auto-generated once by the system and is used to
      uniquely identify it among all other ZoneMinder systems in
      existence.
      ', Category = 'dynamic', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 145, Name = 'ZM_TELEMETRY_LAST_UPLOAD', Value = '', Type = 'integer', DefaultValue = '', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'When the last ZoneMinder telemetry upload occurred', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 146, Name = 'ZM_TELEMETRY_INTERVAL', Value = '14*24*60*60', Type = 'string', DefaultValue = '14*24*60*60', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Interval in seconds between telemetry updates.', Help = 'This value can be expressed as a mathematical expression for ease.', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 147, Name = 'ZM_TELEMETRY_SERVER_ENDPOINT', Value = 'https://zmanon:2b2d0b4skps@telemetry.zoneminder.com/zmtelemetry/testing5', Type = 'string', DefaultValue = 'https://zmanon:2b2d0b4skps@telemetry.zoneminder.com/zmtelemetry/testing5', Hint = 'http://host.your.domain/', Pattern = '(?^:^(?:http://)?(.+)$)', Format = ' \'http://\'.$1 ', Prompt = 'URL that ZoneMinder will send usage data to', Help = '', Category = 'hidden', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 148, Name = 'ZM_UPDATE_CHECK_PROXY', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Proxy url if required to access zoneminder.com', Help = '
      If you use a proxy to access the internet then ZoneMinder needs
      to know so it can access zoneminder.com to check for updates.
      If you do use a proxy enter the full proxy url here in the form
      of http://<proxy host>:<proxy port>/
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 149, Name = 'ZM_SHM_KEY', Value = '0x7a6d0000', Type = 'hexadecimal', DefaultValue = '0x7a6d0000', Hint = 'hexadecimal', Pattern = '(?^:^(?:0x)?([0-9a-f]{1,8})$)', Format = ' \'0x\'.$1 ', Prompt = 'Shared memory root key to use', Help = '
      ZoneMinder uses shared memory to speed up communication between
      modules. To identify the right area to use shared memory keys
      are used. This option controls what the base key is, each
      monitor will have it\'s Id or\'ed with this to get the actual key
      used. You will not normally need to change this value unless it
      clashes with another instance of ZoneMinder on the same
      machine. Only the first four hex digits are used, the lower
      four will be masked out and ignored.
      ', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 150, Name = 'ZM_WEB_EVENT_SORT_FIELD', Value = 'StartDateTime', Type = 'string', DefaultValue = 'StartDateTime', Hint = 'Id|Name|Cause|DiskSpace|MonitorName|StartDateTime|Length|Frames|AlarmFrames|TotScore|AvgScore|MaxScore', Pattern = '(?^:.)', Format = ' $1 ', Prompt = 'Default field the event lists are sorted by', Help = '
      Events in lists can be initially ordered in any way you want.
      This option controls what field is used to sort them. You can
      modify this ordering from filters or by clicking on headings in
      the lists themselves. Bear in mind however that the \'Prev\' and
      \'Next\' links, when scrolling through events, relate to the
      ordering in the lists and so not always to time based ordering.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 151, Name = 'ZM_WEB_EVENT_SORT_ORDER', Value = 'asc', Type = 'string', DefaultValue = 'asc', Hint = 'asc|desc', Pattern = '(?^i:^([ad]))', Format = ' $1 =~ /^a/i ? \'asc\' : \'desc\' ', Prompt = 'Default order the event lists are sorted by', Help = '
      Events in lists can be initially ordered in any way you want.
      This option controls what order (ascending or descending) is
      used to sort them. You can modify this ordering from filters or
      by clicking on headings in the lists themselves. Bear in mind
      however that the \'Prev\' and \'Next\' links, when scrolling
      through events, relate to the ordering in the lists and so not
      always to time based ordering.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 152, Name = 'ZM_WEB_EVENTS_PER_PAGE', Value = '25', Type = 'integer', DefaultValue = '25', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How many events to list per page in paged mode', Help = '
      In the event list view you can either list all events or just a
      page at a time. This option controls how many events are listed
      per page in paged mode and how often to repeat the column
      headers in non-paged mode.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 153, Name = 'ZM_WEB_LIST_THUMBS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Display mini-thumbnails of event images in event lists', Help = '
      Ordinarily the event lists just display text details of the
      events to save space and time. By switching this option on you
      can also display small thumbnails to help you identify events
      of interest. The size of these thumbnails is controlled by the
      following two options.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 154, Name = 'ZM_WEB_LIST_THUMB_WIDTH', Value = '48', Type = 'integer', DefaultValue = '48', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'The width of the thumbnails that appear in the event lists', Help = '
      This options controls the width of the thumbnail images that
      appear in the event lists. It should be fairly small to fit in
      with the rest of the table. If you prefer you can specify a
      height instead in the next option but you should only use one
      of the width or height and the other option should be set to
      zero. If both width and height are specified then width will be
      used and height ignored.
      ', Category = 'web', Readonly = '0', Requires = 'ZM_WEB_LIST_THUMBS=1';
INSERT INTO Config SET Id = 155, Name = 'ZM_WEB_LIST_THUMB_HEIGHT', Value = '0', Type = 'integer', DefaultValue = '0', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'The height of the thumbnails that appear in the event lists', Help = '
      This options controls the height of the thumbnail images that
      appear in the event lists. It should be fairly small to fit in
      with the rest of the table. If you prefer you can specify a
      width instead in the previous option but you should only use
      one of the width or height and the other option should be set
      to zero. If both width and height are specified then width will
      be used and height ignored.
      ', Category = 'web', Readonly = '0', Requires = 'ZM_WEB_LIST_THUMBS=1';
INSERT INTO Config SET Id = 156, Name = 'ZM_WEB_ANIMATE_THUMBS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Enlarge and show the live stream when a thumbnail is hovered over', Help = '
      Enabling this option causes the static thumbnail, shown on certain
      views, to enlarge and show the live stream, when the thumbnail is
      hovered over by the mouse.
      ', Category = 'web', Readonly = '0', Requires = 'ZM_WEB_LIST_THUMBS=1';
INSERT INTO Config SET Id = 157, Name = 'ZM_WEB_USE_OBJECT_TAGS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Wrap embed in object tags for media content', Help = '
      There are two methods of including media content in web pages.
      The most common way is use the EMBED tag which is able to give
      some indication of the type of content. However this is not a
      standard part of HTML. The official method is to use OBJECT
      tags which are able to give more information allowing the
      correct media viewers etc. to be loaded. However these are less
      widely supported and content may be specifically tailored to a
      particular platform or player. This option controls whether
      media content is enclosed in EMBED tags only or whether, where
      appropriate, it is additionally wrapped in OBJECT tags.
      Currently OBJECT tags are only used in a limited number of
      circumstances but they may become more widespread in the
      future. It is suggested that you leave this option on unless
      you encounter problems playing some content.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 158, Name = 'ZM_WEB_XFRAME_WARN', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Warn when website X-Frame-Options is set to sameorigin', Help = '
      When creating a Web Site monitor, if the target web site has
      X-Frame-Options set to sameorigin in the header, the site will
      not display in ZoneMinder. This is a design feature in most modern
      browsers. When this condition occurs, ZoneMinder will write a
      warning to the log file. To get around this, one can install a browser
      plugin or extension to ignore X-Frame headers, and then the page will
      display properly. Once the plugin or extension has ben installed,
      the end user may choose to turn this warning off.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 159, Name = 'ZM_WEB_FILTER_SOURCE', Value = 'Hostname', Type = 'string', DefaultValue = 'Hostname', Hint = 'None|Hostname|NoCredentials', Pattern = '(?^i:^([NH]))', Format = ' ($1 =~ /^Non/)
          ? \'None\'
          : ($1 =~ /^H/ ? \'Hostname\' : \'NoCredentials\' )
          ', Prompt = 'How to filter information in the source column.', Help = '
      This option only affects monitors with a source type of Ffmpeg,
      Libvlc, or WebSite. This setting controls what information is
      displayed in the Source column on the console. Selecting \'None\'
      will not filter anything. The entire source string will be
      displayed, which may contain sensitive information. Selecting
      \'NoCredentials\' will strip out usernames and passwords from the
      string. If there are any port numbers in the string and they are
      common (80, 554, etc) then those will be removed as well.
      Selecting \'Hostname\' will filter out all information except for
      the hostname or ip address. When in doubt, stay with the default
      \'Hostname\'. This feature uses the php function \'url_parts\' to
      identify the various pieces of the url. If the url in question
      is unusual or not standard in some way, then filtering may not
      produce the desired results.
      ', Category = 'web', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 160, Name = 'ZM_WEB_H_REFRESH_MAIN', Value = '60', Type = 'integer', DefaultValue = '60', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the main console window should refresh itself', Help = '
      The main console window lists a general status and the event
      totals for all monitors. This is not a trivial task and should
      not be repeated too frequently or it may affect the performance
      of the rest of the system.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 161, Name = 'ZM_WEB_H_REFRESH_NAVBAR', Value = '60', Type = 'integer', DefaultValue = '60', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the navigation header should refresh itself', Help = '
      The navigation header contains the general status information about server load and storage space.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 162, Name = 'ZM_WEB_H_REFRESH_CYCLE', Value = '10', Type = 'integer', DefaultValue = '10', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the cycle watch window swaps to the next monitor', Help = '
      The cycle watch window is a method of continuously cycling
      between images from all of your monitors. This option
      determines how often to refresh with a new image.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 163, Name = 'ZM_WEB_H_REFRESH_IMAGE', Value = '3', Type = 'integer', DefaultValue = '3', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the watched image is refreshed (if not streaming)', Help = '
      The live images from a monitor can be viewed in either streamed
      or stills mode. This option determines how often a stills image
      is refreshed, it has no effect if streaming is selected.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 164, Name = 'ZM_WEB_H_REFRESH_STATUS', Value = '1', Type = 'integer', DefaultValue = '1', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the status refreshes itself in the watch window', Help = '
      The monitor window is actually made from several frames. The
      one in the middle merely contains a monitor status which needs
      to refresh fairly frequently to give a true indication. This
      option determines that frequency.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 165, Name = 'ZM_WEB_H_REFRESH_EVENTS', Value = '5', Type = 'integer', DefaultValue = '5', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the event listing is refreshed in the watch window', Help = '
      The monitor window is actually made from several frames. The
      lower frame contains a listing of the last few events for easy
      access. This option determines how often this is refreshed.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 166, Name = 'ZM_WEB_H_CAN_STREAM', Value = 'auto', Type = 'string', DefaultValue = 'auto', Hint = 'auto|yes|no', Pattern = '(?^i:^([ayn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : ($1 =~ /^n/ ? \'no\' : \'auto\' ) ', Prompt = 'Override the automatic detection of browser streaming capability', Help = '
      If you know that your browser can handle image streams of the
      type \'multipart/x-mixed-replace\' but ZoneMinder does not detect
      this correctly you can set this option to ensure that the
      stream is delivered with or without the use of the Cambozola
      plugin. Selecting \'yes\' will tell ZoneMinder that your browser
      can handle the streams natively, \'no\' means that it can\'t and
      so the plugin will be used while \'auto\' lets ZoneMinder decide.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 167, Name = 'ZM_WEB_H_STREAM_METHOD', Value = 'jpeg', Type = 'string', DefaultValue = 'jpeg', Hint = 'mpeg|jpeg', Pattern = '(?^i:^([mj]))', Format = ' $1 =~ /^m/ ? \'mpeg\' : \'jpeg\' ', Prompt = 'Which method should be used to send video streams to your browser.', Help = '
      ZoneMinder can be configured to use either mpeg encoded video
      or a series or still jpeg images when sending video streams.
      This option defines which is used. If you choose mpeg you
      should ensure that you have the appropriate plugins available
      on your browser whereas choosing jpeg will work natively on
      Mozilla and related browsers and with a Java applet on Internet
      Explorer
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 168, Name = 'ZM_WEB_H_DEFAULT_SCALE', Value = '100', Type = 'integer', DefaultValue = '100', Hint = '25|33|50|75|100|150|200|300|400', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the default scaling factor applied to \'live\' or \'event\' views is (%)', Help = '
      Normally ZoneMinder will display \'live\' or \'event\' streams in
      their native size. However if you have monitors with large
      dimensions or a slow link you may prefer to reduce this size,
      alternatively for small monitors you can enlarge it. This
      options lets you specify what the default scaling factor will
      be. It is expressed as a percentage so 100 is normal size, 200
      is double size etc.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 169, Name = 'ZM_WEB_H_DEFAULT_RATE', Value = '100', Type = 'integer', DefaultValue = '100', Hint = '25|50|100|150|200|400|1000|2500|5000|10000', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the default replay rate factor applied to \'event\' views is (%)', Help = '
      Normally ZoneMinder will display \'event\' streams at their
      native rate, i.e. as close to real-time as possible. However if
      you have long events it is often convenient to replay them at a
      faster rate for review. This option lets you specify what the
      default replay rate will be. It is expressed as a percentage so
      100 is normal rate, 200 is double speed etc.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 170, Name = 'ZM_WEB_H_VIDEO_BITRATE', Value = '150000', Type = 'integer', DefaultValue = '150000', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the bitrate of the video encoded stream should be set to', Help = '
      When encoding real video via the ffmpeg library a bit rate can
      be specified which roughly corresponds to the available
      bandwidth used for the stream. This setting effectively
      corresponds to a \'quality\' setting for the video. A low value
      will result in a blocky image whereas a high value will produce
      a clearer view. Note that this setting does not control the
      frame rate of the video however the quality of the video
      produced is affected both by this setting and the frame rate
      that the video is produced at. A higher frame rate at a
      particular bit rate result in individual frames being at a
      lower quality.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 171, Name = 'ZM_WEB_H_VIDEO_MAXFPS', Value = '30', Type = 'integer', DefaultValue = '30', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the maximum frame rate for streamed video should be', Help = '
      When using streamed video the main control is the bitrate which
      determines how much data can be transmitted. However a lower
      bitrate at high frame rates results in a lower quality image.
      This option allows you to limit the maximum frame rate to
      ensure that video quality is maintained. An additional
      advantage is that encoding video at high frame rates is a
      processor intensive task when for the most part a very high
      frame rate offers little perceptible improvement over one that
      has a more manageable resource requirement. Note, this option
      is implemented as a cap beyond which binary reduction takes
      place. So if you have a device capturing at 15fps and set this
      option to 10fps then the video is not produced at 10fps, but
      rather at 7.5fps (15 divided by 2) as the final frame rate must
      be the original divided by a power of 2.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 172, Name = 'ZM_WEB_H_SCALE_THUMBS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Scale thumbnails in events, bandwidth versus CPU in rescaling', Help = '
      If unset, this option sends the whole image to the browser
      which resizes it in the window. If set the image is scaled down
      on the server before sending a reduced size image to the
      browser to conserve bandwidth at the cost of CPU on the server.
      Note that ZM can only perform the resizing if the appropriate
      PHP graphics functionality is installed. This is usually
      available in the php-gd package.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 173, Name = 'ZM_WEB_H_EVENTS_VIEW', Value = 'events', Type = 'string', DefaultValue = 'events', Hint = 'events|timeline', Pattern = '(?^i:^([lt]))', Format = ' $1 =~ /^e/ ? \'events\' : \'timeline\' ', Prompt = 'What the default view of multiple events should be.', Help = '
      Stored events can be viewed in either an events list format or
      in a timeline based one. This option sets the default view that
      will be used. Choosing one view here does not prevent the other
      view being used as it will always be selectable from whichever
      view is currently being used.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 174, Name = 'ZM_WEB_H_SHOW_PROGRESS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Show the progress of replay in event view.', Help = '
      When viewing events an event navigation panel and progress bar
      is shown below the event itself. This allows you to jump to
      specific points in the event, but can also dynamically
      update to display the current progress of the event replay
      itself. This progress is calculated from the actual event
      duration and is not directly linked to the replay itself, so on
      limited bandwidth connections may be out of step with the
      replay. This option allows you to turn off the progress
      display, whilst still keeping the navigation aspect, where
      bandwidth prevents it functioning effectively.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 175, Name = 'ZM_WEB_H_AJAX_TIMEOUT', Value = '3000', Type = 'integer', DefaultValue = '3000', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How long to wait for Ajax request responses (ms)', Help = '
      The newer versions of the live feed and event views use Ajax to
      request information from the server and populate the views
      dynamically. This option allows you to specify a timeout if
      required after which requests are abandoned. A timeout may be
      necessary if requests would overwise hang such as on a slow
      connection. This would tend to consume a lot of browser memory
      and make the interface unresponsive. Ordinarily no requests
      should timeout so this setting should be set to a value greater
      than the slowest expected response. This value is in
      milliseconds but if set to zero then no timeout will be used.
      ', Category = 'highband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 176, Name = 'ZM_WEB_M_REFRESH_MAIN', Value = '300', Type = 'integer', DefaultValue = '300', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the main console window should refresh itself', Help = '
      The main console window lists a general status and the event
      totals for all monitors. This is not a trivial task and should
      not be repeated too frequently or it may affect the performance
      of the rest of the system.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 177, Name = 'ZM_WEB_M_REFRESH_NAVBAR', Value = '120', Type = 'integer', DefaultValue = '120', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the navigation header should refresh itself', Help = '
      The navigation header contains the general status information about server load and storage space.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 178, Name = 'ZM_WEB_M_REFRESH_CYCLE', Value = '20', Type = 'integer', DefaultValue = '20', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the cycle watch window swaps to the next monitor', Help = '
      The cycle watch window is a method of continuously cycling
      between images from all of your monitors. This option
      determines how often to refresh with a new image.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 179, Name = 'ZM_WEB_M_REFRESH_IMAGE', Value = '10', Type = 'integer', DefaultValue = '10', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the watched image is refreshed (if not streaming)', Help = '
      The live images from a monitor can be viewed in either streamed
      or stills mode. This option determines how often a stills image
      is refreshed, it has no effect if streaming is selected.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 180, Name = 'ZM_WEB_M_REFRESH_STATUS', Value = '5', Type = 'integer', DefaultValue = '5', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the status refreshes itself in the watch window', Help = '
      The monitor window is actually made from several frames. The
      one in the middle merely contains a monitor status which needs
      to refresh fairly frequently to give a true indication. This
      option determines that frequency.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 181, Name = 'ZM_WEB_M_REFRESH_EVENTS', Value = '60', Type = 'integer', DefaultValue = '60', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the event listing is refreshed in the watch window', Help = '
      The monitor window is actually made from several frames. The
      lower frame contains a listing of the last few events for easy
      access. This option determines how often this is refreshed.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 182, Name = 'ZM_WEB_M_CAN_STREAM', Value = 'auto', Type = 'string', DefaultValue = 'auto', Hint = 'auto|yes|no', Pattern = '(?^i:^([ayn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : ($1 =~ /^n/ ? \'no\' : \'auto\' ) ', Prompt = 'Override the automatic detection of browser streaming capability', Help = '
      If you know that your browser can handle image streams of the
      type \'multipart/x-mixed-replace\' but ZoneMinder does not detect
      this correctly you can set this option to ensure that the
      stream is delivered with or without the use of the Cambozola
      plugin. Selecting \'yes\' will tell ZoneMinder that your browser
      can handle the streams natively, \'no\' means that it can\'t and
      so the plugin will be used while \'auto\' lets ZoneMinder decide.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 183, Name = 'ZM_WEB_M_STREAM_METHOD', Value = 'jpeg', Type = 'string', DefaultValue = 'jpeg', Hint = 'mpeg|jpeg', Pattern = '(?^i:^([mj]))', Format = ' $1 =~ /^m/ ? \'mpeg\' : \'jpeg\' ', Prompt = 'Which method should be used to send video streams to your browser.', Help = '
      ZoneMinder can be configured to use either mpeg encoded video
      or a series or still jpeg images when sending video streams.
      This option defines which is used. If you choose mpeg you
      should ensure that you have the appropriate plugins available
      on your browser whereas choosing jpeg will work natively on
      Mozilla and related browsers and with a Java applet on Internet
      Explorer
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 184, Name = 'ZM_WEB_M_DEFAULT_SCALE', Value = '100', Type = 'integer', DefaultValue = '100', Hint = '25|33|50|75|100|150|200|300|400', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the default scaling factor applied to \'live\' or \'event\' views is (%)', Help = '
      Normally ZoneMinder will display \'live\' or \'event\' streams in
      their native size. However if you have monitors with large
      dimensions or a slow link you may prefer to reduce this size,
      alternatively for small monitors you can enlarge it. This
      options lets you specify what the default scaling factor will
      be. It is expressed as a percentage so 100 is normal size, 200
      is double size etc.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 185, Name = 'ZM_WEB_M_DEFAULT_RATE', Value = '100', Type = 'integer', DefaultValue = '100', Hint = '25|50|100|150|200|400|1000|2500|5000|10000', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the default replay rate factor applied to \'event\' views is (%)', Help = '
      Normally ZoneMinder will display \'event\' streams at their
      native rate, i.e. as close to real-time as possible. However if
      you have long events it is often convenient to replay them at a
      faster rate for review. This option lets you specify what the
      default replay rate will be. It is expressed as a percentage so
      100 is normal rate, 200 is double speed etc.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 186, Name = 'ZM_WEB_M_VIDEO_BITRATE', Value = '75000', Type = 'integer', DefaultValue = '75000', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the bitrate of the video encoded stream should be set to', Help = '
      When encoding real video via the ffmpeg library a bit rate can
      be specified which roughly corresponds to the available
      bandwidth used for the stream. This setting effectively
      corresponds to a \'quality\' setting for the video. A low value
      will result in a blocky image whereas a high value will produce
      a clearer view. Note that this setting does not control the
      frame rate of the video however the quality of the video
      produced is affected both by this setting and the frame rate
      that the video is produced at. A higher frame rate at a
      particular bit rate result in individual frames being at a
      lower quality.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 187, Name = 'ZM_WEB_M_VIDEO_MAXFPS', Value = '10', Type = 'integer', DefaultValue = '10', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the maximum frame rate for streamed video should be', Help = '
      When using streamed video the main control is the bitrate which
      determines how much data can be transmitted. However a lower
      bitrate at high frame rates results in a lower quality image.
      This option allows you to limit the maximum frame rate to
      ensure that video quality is maintained. An additional
      advantage is that encoding video at high frame rates is a
      processor intensive task when for the most part a very high
      frame rate offers little perceptible improvement over one that
      has a more manageable resource requirement. Note, this option
      is implemented as a cap beyond which binary reduction takes
      place. So if you have a device capturing at 15fps and set this
      option to 10fps then the video is not produced at 10fps, but
      rather at 7.5fps (15 divided by 2) as the final frame rate must
      be the original divided by a power of 2.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 188, Name = 'ZM_WEB_M_SCALE_THUMBS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Scale thumbnails in events, bandwidth versus CPU in rescaling', Help = '
      If unset, this option sends the whole image to the browser
      which resizes it in the window. If set the image is scaled down
      on the server before sending a reduced size image to the
      browser to conserve bandwidth at the cost of CPU on the server.
      Note that ZM can only perform the resizing if the appropriate
      PHP graphics functionality is installed. This is usually
      available in the php-gd package.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 189, Name = 'ZM_WEB_M_EVENTS_VIEW', Value = 'events', Type = 'string', DefaultValue = 'events', Hint = 'events|timeline', Pattern = '(?^i:^([lt]))', Format = ' $1 =~ /^e/ ? \'events\' : \'timeline\' ', Prompt = 'What the default view of multiple events should be.', Help = '
      Stored events can be viewed in either an events list format or
      in a timeline based one. This option sets the default view that
      will be used. Choosing one view here does not prevent the other
      view being used as it will always be selectable from whichever
      view is currently being used.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 190, Name = 'ZM_WEB_M_SHOW_PROGRESS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Show the progress of replay in event view.', Help = '
      When viewing events an event navigation panel and progress bar
      is shown below the event itself. This allows you to jump to
      specific points in the event, but can also dynamically
      update to display the current progress of the event replay
      itself. This progress is calculated from the actual event
      duration and is not directly linked to the replay itself, so on
      limited bandwidth connections may be out of step with the
      replay. This option allows you to turn off the progress
      display, whilst still keeping the navigation aspect, where
      bandwidth prevents it functioning effectively.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 191, Name = 'ZM_WEB_M_AJAX_TIMEOUT', Value = '5000', Type = 'integer', DefaultValue = '5000', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How long to wait for Ajax request responses (ms)', Help = '
      The newer versions of the live feed and event views use Ajax to
      request information from the server and populate the views
      dynamically. This option allows you to specify a timeout if
      required after which requests are abandoned. A timeout may be
      necessary if requests would overwise hang such as on a slow
      connection. This would tend to consume a lot of browser memory
      and make the interface unresponsive. Ordinarily no requests
      should timeout so this setting should be set to a value greater
      than the slowest expected response. This value is in
      milliseconds but if set to zero then no timeout will be used.
      ', Category = 'medband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 192, Name = 'ZM_WEB_L_REFRESH_MAIN', Value = '300', Type = 'integer', DefaultValue = '300', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the main console window should refresh itself', Help = '
      The main console window lists a general status and the event
      totals for all monitors. This is not a trivial task and should
      not be repeated too frequently or it may affect the performance
      of the rest of the system.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 193, Name = 'ZM_WEB_L_REFRESH_NAVBAR', Value = '180', Type = 'integer', DefaultValue = '180', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the navigation header should refresh itself', Help = '
      The navigation header contains the general status information about server load and storage space.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 194, Name = 'ZM_WEB_L_REFRESH_CYCLE', Value = '30', Type = 'integer', DefaultValue = '30', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the cycle watch window swaps to the next monitor', Help = '
      The cycle watch window is a method of continuously cycling
      between images from all of your monitors. This option
      determines how often to refresh with a new image.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 195, Name = 'ZM_WEB_L_REFRESH_IMAGE', Value = '15', Type = 'integer', DefaultValue = '15', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the watched image is refreshed (if not streaming)', Help = '
      The live images from a monitor can be viewed in either streamed
      or stills mode. This option determines how often a stills image
      is refreshed, it has no effect if streaming is selected.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 196, Name = 'ZM_WEB_L_REFRESH_STATUS', Value = '10', Type = 'integer', DefaultValue = '10', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the status refreshes itself in the watch window', Help = '
      The monitor window is actually made from several frames. The
      one in the middle merely contains a monitor status which needs
      to refresh fairly frequently to give a true indication. This
      option determines that frequency.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 197, Name = 'ZM_WEB_L_REFRESH_EVENTS', Value = '180', Type = 'integer', DefaultValue = '180', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How often (in seconds) the event listing is refreshed in the watch window', Help = '
      The monitor window is actually made from several frames. The
      lower frame contains a listing of the last few events for easy
      access. This option determines how often this is refreshed.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 198, Name = 'ZM_WEB_L_CAN_STREAM', Value = 'auto', Type = 'string', DefaultValue = 'auto', Hint = 'auto|yes|no', Pattern = '(?^i:^([ayn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : ($1 =~ /^n/ ? \'no\' : \'auto\' ) ', Prompt = 'Override the automatic detection of browser streaming capability', Help = '
      If you know that your browser can handle image streams of the
      type \'multipart/x-mixed-replace\' but ZoneMinder does not detect
      this correctly you can set this option to ensure that the
      stream is delivered with or without the use of the Cambozola
      plugin. Selecting \'yes\' will tell ZoneMinder that your browser
      can handle the streams natively, \'no\' means that it can\'t and
      so the plugin will be used while \'auto\' lets ZoneMinder decide.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 199, Name = 'ZM_WEB_L_STREAM_METHOD', Value = 'jpeg', Type = 'string', DefaultValue = 'jpeg', Hint = 'mpeg|jpeg', Pattern = '(?^i:^([mj]))', Format = ' $1 =~ /^m/ ? \'mpeg\' : \'jpeg\' ', Prompt = 'Which method should be used to send video streams to your browser.', Help = '
      ZoneMinder can be configured to use either mpeg encoded video
      or a series or still jpeg images when sending video streams.
      This option defines which is used. If you choose mpeg you
      should ensure that you have the appropriate plugins available
      on your browser whereas choosing jpeg will work natively on
      Mozilla and related browsers and with a Java applet on Internet
      Explorer
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 200, Name = 'ZM_WEB_L_DEFAULT_SCALE', Value = '100', Type = 'integer', DefaultValue = '100', Hint = '25|33|50|75|100|150|200|300|400', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the default scaling factor applied to \'live\' or \'event\' views is (%)', Help = '
      Normally ZoneMinder will display \'live\' or \'event\' streams in
      their native size. However if you have monitors with large
      dimensions or a slow link you may prefer to reduce this size,
      alternatively for small monitors you can enlarge it. This
      options lets you specify what the default scaling factor will
      be. It is expressed as a percentage so 100 is normal size, 200
      is double size etc.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 201, Name = 'ZM_WEB_L_DEFAULT_RATE', Value = '100', Type = 'integer', DefaultValue = '100', Hint = '25|50|100|150|200|400|1000|2500|5000|10000', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the default replay rate factor applied to \'event\' views is (%)', Help = '
      Normally ZoneMinder will display \'event\' streams at their
      native rate, i.e. as close to real-time as possible. However if
      you have long events it is often convenient to replay them at a
      faster rate for review. This option lets you specify what the
      default replay rate will be. It is expressed as a percentage so
      100 is normal rate, 200 is double speed etc.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 202, Name = 'ZM_WEB_L_VIDEO_BITRATE', Value = '25000', Type = 'integer', DefaultValue = '25000', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the bitrate of the video encoded stream should be set to', Help = '
      When encoding real video via the ffmpeg library a bit rate can
      be specified which roughly corresponds to the available
      bandwidth used for the stream. This setting effectively
      corresponds to a \'quality\' setting for the video. A low value
      will result in a blocky image whereas a high value will produce
      a clearer view. Note that this setting does not control the
      frame rate of the video however the quality of the video
      produced is affected both by this setting and the frame rate
      that the video is produced at. A higher frame rate at a
      particular bit rate result in individual frames being at a
      lower quality.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 203, Name = 'ZM_WEB_L_VIDEO_MAXFPS', Value = '5', Type = 'integer', DefaultValue = '5', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'What the maximum frame rate for streamed video should be', Help = '
      When using streamed video the main control is the bitrate which
      determines how much data can be transmitted. However a lower
      bitrate at high frame rates results in a lower quality image.
      This option allows you to limit the maximum frame rate to
      ensure that video quality is maintained. An additional
      advantage is that encoding video at high frame rates is a
      processor intensive task when for the most part a very high
      frame rate offers little perceptible improvement over one that
      has a more manageable resource requirement. Note, this option
      is implemented as a cap beyond which binary reduction takes
      place. So if you have a device capturing at 15fps and set this
      option to 10fps then the video is not produced at 10fps, but
      rather at 7.5fps (15 divided by 2) as the final frame rate must
      be the original divided by a power of 2.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 204, Name = 'ZM_WEB_L_SCALE_THUMBS', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Scale thumbnails in events, bandwidth versus CPU in rescaling', Help = '
      If unset, this option sends the whole image to the browser
      which resizes it in the window. If set the image is scaled down
      on the server before sending a reduced size image to the
      browser to conserve bandwidth at the cost of CPU on the server.
      Note that ZM can only perform the resizing if the appropriate
      PHP graphics functionality is installed. This is usually
      available in the php-gd package.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 205, Name = 'ZM_WEB_L_EVENTS_VIEW', Value = 'events', Type = 'string', DefaultValue = 'events', Hint = 'events|timeline', Pattern = '(?^i:^([lt]))', Format = ' $1 =~ /^e/ ? \'events\' : \'timeline\' ', Prompt = 'What the default view of multiple events should be.', Help = '
      Stored events can be viewed in either an events list format or
      in a timeline based one. This option sets the default view that
      will be used. Choosing one view here does not prevent the other
      view being used as it will always be selectable from whichever
      view is currently being used.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 206, Name = 'ZM_WEB_L_SHOW_PROGRESS', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Show the progress of replay in event view.', Help = '
      When viewing events an event navigation panel and progress bar
      is shown below the event itself. This allows you to jump to
      specific points in the event, but can also dynamically
      update to display the current progress of the event replay
      itself. This progress is calculated from the actual event
      duration and is not directly linked to the replay itself, so on
      limited bandwidth connections may be out of step with the
      replay. This option allows you to turn off the progress
      display, whilst still keeping the navigation aspect, where
      bandwidth prevents it functioning effectively.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 207, Name = 'ZM_WEB_L_AJAX_TIMEOUT', Value = '10000', Type = 'integer', DefaultValue = '10000', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'How long to wait for Ajax request responses (ms)', Help = '
      The newer versions of the live feed and event views use Ajax to
      request information from the server and populate the views
      dynamically. This option allows you to specify a timeout if
      required after which requests are abandoned. A timeout may be
      necessary if requests would overwise hang such as on a slow
      connection. This would tend to consume a lot of browser memory
      and make the interface unresponsive. Ordinarily no requests
      should timeout so this setting should be set to a value greater
      than the slowest expected response. This value is in
      milliseconds but if set to zero then no timeout will be used.
      ', Category = 'lowband', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 208, Name = 'ZM_DYN_LAST_VERSION', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'What the last version of ZoneMinder recorded from zoneminder.com is', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 209, Name = 'ZM_DYN_CURR_VERSION', Value = '1.36.11', Type = 'string', DefaultValue = '1.36.11', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = '
      What the effective current version of ZoneMinder is, might be
      different from actual if versions ignored
      ', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 210, Name = 'ZM_DYN_DB_VERSION', Value = '1.36.11', Type = 'string', DefaultValue = '1.36.11', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'What the version of the database is, from zmupdate', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 211, Name = 'ZM_DYN_LAST_CHECK', Value = '', Type = 'integer', DefaultValue = '', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'When the last check for version from zoneminder.com was', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 212, Name = 'ZM_DYN_NEXT_REMINDER', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'When the earliest time to remind about versions will be', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 213, Name = 'ZM_DYN_DONATE_REMINDER_TIME', Value = '0', Type = 'integer', DefaultValue = '0', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'When the earliest time to remind about donations will be', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 214, Name = 'ZM_DYN_SHOW_DONATE_REMINDER', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Remind about donations or not', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 215, Name = 'ZM_SHOW_PRIVACY', Value = '1', Type = 'boolean', DefaultValue = 'yes', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = 'Present the privacy statment', Help = '', Category = 'dynamic', Readonly = '1', Requires = '';
INSERT INTO Config SET Id = 216, Name = 'ZM_SSMTP_MAIL', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = '
      Use a SSMTP mail server if available.
      NEW_MAIL_MODULES must be enabled
      ', Help = '
      SSMTP is a lightweight and efficient method to send email.
      The SSMTP application is not installed by default.
      NEW_MAIL_MODULES must also be enabled.
      Please visit the ZoneMinder [SSMTP Wiki page](https://wiki.zoneminder.com/How_to_get_ssmtp_working_with_Zoneminder)
      for setup and configuration help.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_OPT_EMAIL=1;ZM_OPT_MESSAGE=1;ZM_NEW_MAIL_MODULES=1';
INSERT INTO Config SET Id = 217, Name = 'ZM_SSMTP_PATH', Value = '', Type = 'string', DefaultValue = '', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'SSMTP executable path', Help = '
      Recommend setting the path to the SSMTP application.
      If path is not defined. Zoneminder will try to determine
      the path via shell command. Example path: /usr/sbin/ssmtp.
      ', Category = 'mail', Readonly = '0', Requires = 'ZM_SSMTP_MAIL=1';
INSERT INTO Config SET Id = 218, Name = 'ZM_COOKIE_LIFETIME', Value = '3600', Type = 'integer', DefaultValue = '3600', Hint = 'integer', Pattern = '(?^:^(\d+)$)', Format = ' $1 ', Prompt = 'The maximum life of a COOKIE used when setting up PHP\'s session handler.', Help = 'This will affect how long a session will be valid for since the last request.  Keeping this short helps prevent session hijacking.  Keeping it long allows you to stay logged in longer without refreshing the view.', Category = 'system', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 219, Name = 'ZM_RECORD_DIAG_IMAGES_FIFO', Value = '0', Type = 'boolean', DefaultValue = 'no', Hint = 'yes|no', Pattern = '(?^i:^([yn]))', Format = ' ($1 =~ /^y/) ? \'yes\' : \'no\' ', Prompt = ' Recording intermediate alarm diagnostic use fifo instead of files (faster)', Help = 'This tries to lessen the load of recording diag images by sending them to a memory FIFO pipe instead of creating each file.', Category = 'logging', Readonly = '0', Requires = '';
INSERT INTO Config SET Id = 220, Name = 'ZM_FONT_FILE_LOCATION', Value = '/usr/share/zoneminder/fonts/default.zmfnt', Type = 'string', DefaultValue = '/usr/share/zoneminder/fonts/default.zmfnt', Hint = 'string', Pattern = '(?^:^(.+)$)', Format = ' $1 ', Prompt = 'Font file location', Help = 'This font is used for timestamp labels.', Category = 'config', Readonly = '0', Requires = '';

