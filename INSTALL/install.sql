CREATE TABLE IF NOT EXISTS `pi_ratepay_settings` (
  `OXID` INT(11) NOT NULL AUTO_INCREMENT,
  `SHOPID` INT(11) NOT NULL DEFAULT '1',
  `ACTIVE` TINYINT(1) NOT NULL DEFAULT '0',
  `COUNTRY` VARCHAR(2) NOT NULL,
  `PROFILE_ID` VARCHAR(255) DEFAULT NULL,
  `SECURITY_CODE` VARCHAR(255) DEFAULT NULL,
  `URL` VARCHAR(255) DEFAULT NULL,
  `SANDBOX` TINYINT(1) NOT NULL DEFAULT '1',
  `TYPE` VARCHAR(11) NOT NULL,
  `LIMIT_MIN` INT(4) NOT NULL DEFAULT '0',
  `LIMIT_MAX` INT(6) NOT NULL DEFAULT '0',
  `LIMIT_MAX_B2B` INT(6) NOT NULL DEFAULT '0',
  `MONTH_ALLOWED` VARCHAR(100) NOT NULL,
  `MIN_RATE` INT(5) NOT NULL DEFAULT '0',
  `INTEREST_RATE` FLOAT(5) NOT NULL DEFAULT '0',
  `PAYMENT_FIRSTDAY` VARCHAR(5) NOT NULL DEFAULT '0',
  `SAVEBANKDATA` TINYINT(1) NOT NULL DEFAULT '0',
  `ACTIVATE_ELV` TINYINT(1) NOT NULL DEFAULT '0',
  `B2B` TINYINT(1) NOT NULL DEFAULT '0',
  `ALA` TINYINT(1) NOT NULL DEFAULT '0',
  `IBAN_ONLY` TINYINT(1) NOT NULL DEFAULT '0',
  `DFP` TINYINT(1) NOT NULL DEFAULT '0',
  `DFP_SNIPPET_ID` VARCHAR(128) DEFAULT NULL,
  `CURRENCIES` varchar(50),
  `DELIVERY_COUNTRIES` varchar(50),
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `pi_ratepay_global_settings` (
 `SHOPID` INT(11) NOT NULL DEFAULT '1',
 `LOGGING` TINYINT(1) NOT NULL DEFAULT '1',
 `AUTOCONFIRM` TINYINT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (`SHOPID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `pi_ratepay_orders` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` varchar(32) character set latin1 collate latin1_general_ci NOT NULL,
  `TRANSACTION_ID` varchar(64) NOT NULL,
  `DESCRIPTOR` varchar(128) NOT NULL,
  `USERBIRTHDATE` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `pi_ratepay_order_details` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ARTICLE_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `UNIQUE_ARTICLE_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `PRICE` DOUBLE NOT NULL DEFAULT '0',
  `VAT` DOUBLE NOT NULL DEFAULT '0',
  `ORDERED` INT NOT NULL DEFAULT '1',
  `SHIPPED` INT NOT NULL DEFAULT '0',
  `CANCELLED` INT NOT NULL DEFAULT '0',
  `RETURNED` INT NOT NULL DEFAULT '0',
   PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pi_ratepay_logs` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` varchar(255) CHARACTER SET utf8 NOT NULL,
  `TRANSACTION_ID` varchar(255) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_METHOD` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_TYPE` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PAYMENT_SUBTYPE` varchar(40) CHARACTER SET utf8 NOT NULL,
  `RESULT` varchar(40) CHARACTER SET utf8 NOT NULL,
  `REQUEST` mediumtext CHARACTER SET utf8 NOT NULL,
  `RESPONSE` mediumtext CHARACTER SET utf8 NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RESULT_CODE` varchar(5) CHARACTER SET utf8 NOT NULL,
  `FIRST_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `LAST_NAME` varchar(40) CHARACTER SET utf8 NOT NULL,
  `REASON` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `pi_ratepay_history` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDER_NUMBER` VARCHAR( 255 ) NOT NULL ,
  `ARTICLE_NUMBER` VARCHAR (255) NOT NULL,
  `QUANTITY` INT NOT NULL,
  `METHOD` VARCHAR( 40 ) NOT NULL,
  `SUBMETHOD` VARCHAR( 40 ) DEFAULT '',
  `DATE` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
   PRIMARY KEY  (`OXID`)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `pi_ratepay_rate_details` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ORDERID` VARCHAR(255) NOT NULL ,
  `TOTALAMOUNT` DOUBLE NOT NULL ,
  `AMOUNT` DOUBLE NOT NULL ,
  `INTERESTAMOUNT` DOUBLE NOT NULL ,
  `SERVICECHARGE` DOUBLE NOT NULL ,
  `ANNUALPERCENTAGERATE` DOUBLE NOT NULL ,
  `MONTHLYDEBITINTEREST` DOUBLE NOT NULL ,
  `NUMBEROFRATES` DOUBLE NOT NULL ,
  `RATE` DOUBLE NOT NULL ,
  `LASTRATE` DOUBLE NOT NULL,
  `CHECKOUTTYPE` VARCHAR(255) DEFAULT '',
  `OWNER` VARCHAR(255) DEFAULT '',
  `BANKACCOUNTNUMBER` VARCHAR(255) DEFAULT '',
  `BANKCODE` VARCHAR(255) DEFAULT '',
  `BANKNAME` VARCHAR(255) DEFAULT '',
  `IBAN` VARCHAR(255) DEFAULT '',
  `BICSWIFT` VARCHAR(255) DEFAULT '',
  PRIMARY KEY  (`OXID`)
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE `pi_ratepay_debit_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(256) NOT NULL,
  `owner` blob NOT NULL,
  `accountnumber` blob NOT NULL,
  `bankcode` blob NOT NULL,
  `bankname` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MYISAM CHARACTER SET utf8 COLLATE utf8_general_ci;


INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_rechnung', 1, 'RatePAY Rechnung', 0, 'abs', 0, 0, 999999, '', 1, 'RatePAY Rechnung', '', '', '', '', '', '', '', '', '', 0, '');

INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_rate', 1, 'RatePAY Rate', 0, 'abs', 0, 0, 999999, '', 1, 'RatePAY Rate', '', '', '', '', '', '', '', '', '', 0, '');

INSERT INTO oxpayments (OXID, OXACTIVE, OXDESC, OXADDSUM, OXADDSUMTYPE, OXFROMBONI, OXFROMAMOUNT, OXTOAMOUNT, OXVALDESC, OXCHECKED, OXDESC_1, OXVALDESC_1, OXDESC_2, OXVALDESC_2, OXDESC_3, OXVALDESC_3, OXLONGDESC, OXLONGDESC_1, OXLONGDESC_2, OXLONGDESC_3, OXSORT, OXTSPAYMENTID)
VALUES ('pi_ratepay_elv', 1, 'RatePAY SEPA-Lastschrift', 0, 'abs', 0, 0, 999999, '', 1, 'RatePAY SEPA-Lastschrift', '', '', '', '', '', '', '', '', '', 0, '');
