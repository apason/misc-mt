# Create schemas

# Create tables
CREATE TABLE IF NOT EXISTS answer
(
    id INT NOT NULL AUTO_INCREMENT,
    task_id INT NOT NULL,
    subuser_id INT NOT NULL,
    created DATETIME NOT NULL, # DEFAULT NOW(),
    uploaded TINYINT(1) NOT NULL DEFAULT 0,
    enabled TINYINT(1) NOT NULL DEFAULT 0,
    uri VARCHAR(255),
    PRIMARY KEY(id)
);

# like is reserved word in sql so lets use "slaikka" here
CREATE TABLE IF NOT EXISTS slaikka
(
    id INT NOT NULL AUTO_INCREMENT,
    subuser_id INT NOT NULL,
    answer_id INT NOT NULL,
    loaded DATETIME NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS category
(
    id INT NOT NULL AUTO_INCREMENT,
    created DATETIME NOT NULL, # DEFAULT CURRENT_TIMESTAMP
    uploaded TINYINT(1) NOT NULL DEFAULT 0,
    enabled TINYINT(1) NOT NULL DEFAULT 0,
    name VARCHAR(255) NOT NULL,
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
    uri VARCHAR(255),
    icon_uri VARCHAR(255),
    PRIMARY KEY(id)
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

ALTER TABLE slaikka
    ADD FOREIGN KEY (subuser_id)
    REFERENCES subuser(id)
;

ALTER TABLE slaikka
    ADD FOREIGN KEY (answer_id)
    REFERENCES answer(id)
;    
