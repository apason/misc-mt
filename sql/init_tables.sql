# Create schemas


# Create tables
CREATE TABLE IF NOT EXISTS answer
(
    id INT NOT NULL AUTO_INCREMENT,
    task_id INT NOT NULL,
    subuser_id INT NOT NULL,
    created DATETIME NOT NULL, # DEFAULT CURRENT_TIMESTAMP,
    uploaded TINYINT(1) NOT NULL DEFAULT 0,
    enabled TINYINT(1) NOT NULL DEFAULT 0,
    uri VARCHAR(255),
    PRIMARY KEY(id)
);


# like is a reserved word in sql so lets use "likes" here!
CREATE TABLE IF NOT EXISTS likes
(
    id INT NOT NULL AUTO_INCREMENT,
    subuser_id INT NOT NULL,
    answer_id INT NOT NULL,
    created DATETIME NOT NULL, # DEFAULT CURRENT_TIMESTAMP
    PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS category
(
    id INT NOT NULL AUTO_INCREMENT,
    created DATETIME NOT NULL, # DEFAULT CURRENT_TIMESTAMP
    uploaded TINYINT(1) NOT NULL DEFAULT 0,
    enabled TINYINT(1) NOT NULL DEFAULT 0,
    name VARCHAR(255) NOT NULL,
    coordinate_x INT,
    coordinate_y INT,
    bg_uri VARCHAR(255),
    # animated_icon?
    icon_uri VARCHAR(255),
    PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS subuser
(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    created DATETIME NOT NULL, # DEFAULT CURRENT_TIMESTAMP
    nick VARCHAR(255) NOT NULL,
    avatar_url VARCHAR(255),
    PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS user
(
    id INT NOT NULL AUTO_INCREMENT,
    created DATETIME NOT NULL, # DEFAULT CURRENT_TIMESTAMP
    enabled TINYINT(1) NOT NULL DEFAULT 0,
    email VARCHAR(60) NOT NULL,
    password VARCHAR(128) NOT NULL,
    pin VARCHAR(80),
    privacy_level SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS task
(
    id INT NOT NULL AUTO_INCREMENT,
    category_id INT NOT NULL,
    created DATETIME NOT NULL, # DEFAULT CURRENT_TIMESTAMP
    uploaded TINYINT(1) NOT NULL DEFAULT 0,
    enabled TINYINT(1) NOT NULL DEFAULT 0,
    name VARCHAR(255) NOT NULL,
    info VARCHAR(10000),
    coordinate_x INT,
    coordinate_y INT,
    uri VARCHAR(255),
    icon_uri VARCHAR(255),
    PRIMARY KEY(id)
);


## additional info table
CREATE TABLE IF NOT EXISTS info
(
    eula VARCHAR(100000) NOT NULL,
    instructions VARCHAR(100000) NOT NULL,
    category_menu_bg_uri VARCHAR(255)
);


# Create FKs
ALTER TABLE answer
    ADD FOREIGN KEY (task_id)
    REFERENCES task(id)
;

ALTER TABLE answer
    ADD FOREIGN KEY (subuser_id)
    REFERENCES subuser(id)
;

ALTER TABLE task
    ADD FOREIGN KEY (category_id)
    REFERENCES category(id)
;

ALTER TABLE subuser
    ADD FOREIGN KEY (user_id)
    REFERENCES user(id)
;

ALTER TABLE likes
    ADD FOREIGN KEY (subuser_id)
    REFERENCES subuser(id)
;

ALTER TABLE likes
    ADD FOREIGN KEY (answer_id)
    REFERENCES answer(id)
;
