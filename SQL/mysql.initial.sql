--
-- 	Identity switch RoundCube Bundle
--
--	@copyright	(c) 2024 - 2025 Florian Daeumling, Germany. All right reserved
-- 	@license 	https://github.com/toteph42/identity_switch/blob/master/LICENSE
--
--  Created with phpmyadmin

CREATE TABLE IF NOT EXISTS `identity_switch`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `iid` INT UNSIGNED NOT NULL,
    `label` VARCHAR(32) NOT NULL,
    `flags` INT NOT NULL DEFAULT 0,
    `imap_user` VARCHAR(64),
    `imap_pwd` VARCHAR(128),
    `imap_host` VARCHAR(64),
    `imap_port` SMALLINT DEFAULT NULL,
    `imap_delim` CHAR(1),
    `newmail_check` SMALLINT DEFAULT 300,
    `notify_timeout` SMALLINT DEFAULT 10,
    `smtp_host` VARCHAR(64),
    `smtp_port` SMALLINT DEFAULT NULL,
    `drafts` VARCHAR(64) DEFAULT '',
    `sent` VARCHAR(64) DEFAULT '',
    `junk` VARCHAR(64) DEFAULT '',
    `trash` VARCHAR(64) DEFAULT '',
    UNIQUE `user_id_label`(`user_id`, `label`),
    CONSTRAINT `fk_identity_user_id` 
    	FOREIGN KEY(`user_id`) 
    	REFERENCES `users`(`user_id`) 
    	ON DELETE CASCADE 
    	ON UPDATE CASCADE,
    CONSTRAINT `fk_identity_identity_id` 
    	FOREIGN KEY(`iid`) 
    	REFERENCES `identities`(`identity_id`) 
    	ON DELETE CASCADE 
    	ON UPDATE CASCADE,
    PRIMARY KEY(`id`),
    INDEX `IX_identity_switch_user_id`(`user_id`),
    INDEX `IX_identity_switch_iid`(`iid`)
);
