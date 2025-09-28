--
-- 	Identity switch RoundCube Bundle
--
--	@copyright	(c) 2024 - 2025 Florian Daeumling, Germany. All right reserved
-- 	@license 	https://github.com/toteph42/identity_switch/blob/master/LICENSE
--
-- Created with: https://sqliteonline.com/

CREATE TABLE IF NOT EXISTS identity_switch(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL 
    	REFERENCES users(user_id) 
    	ON DELETE CASCADE ON UPDATE CASCADE,
    iid INTEGER NOT NULL 
    	REFERENCES identities(identity_id) 
    	ON DELETE CASCADE ON UPDATE CASCADE UNIQUE,
    label VARCHAR(32),
    flags INTEGER NOT NULL DEFAULT 0,
    imap_user VARCHAR(64),
    imap_pwd VARCHAR(128),
    imap_host VARCHAR(64),
    imap_port SMALLINT DEFAULT 0,
    imap_delim CHAR(1),
    newmail_check SMALLINT DEFAULT 300,
    notify_timeout SMALLINT DEFAULT 10,
    smtp_host VARCHAR(64),
    smtp_port SMALLINT DEFAULT 0,
    drafts VARCHAR(64) DEFAULT '',
    sent VARCHAR(64) DEFAULT '',
    junk VARCHAR(64) DEFAULT '',
    trash VARCHAR(64) DEFAULT '',
    UNIQUE (user_id, label)
);

CREATE INDEX IX_identity_switch_user_id ON identity_switch(user_id);