CREATE TABLE `tbl_file` (
  `fileID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) NOT NULL,
  `fileLocate` varchar(1000) NOT NULL,
  `fromID` int(15) NOT NULL,
  `toID` int(15) NOT NULL,
  `acceptState` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
