CREATE TABLE `pi_ratepay_global_settings` (
 `SHOPID` INT(11) NOT NULL DEFAULT '1',
 `LOGGING` TINYINT(1) NOT NULL DEFAULT '1',
 `AUTOCONFIRM` TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (`SHOPID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

ALTER TABLE `pi_ratepay_settings`
  DROP `LOGGING`;