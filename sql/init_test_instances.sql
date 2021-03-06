# Here we create a few test instances to the database. Instances should be created in the correct order.
# Users and categories do not depend on any other tables so they are created first.

# - Important note: DO NOT make a test instance of a table where exists both 'enabled' and 'uploaded' so that 'enabled' is true/1 but 'uploaded' is false/0.
#   'Enabled' tells the client whether it is able or not to fecth data (or whether to do it or not if it is otherwise possible), so only when data has been already uploaded (to S3) it should be true.
# - Important note: If 'uploaded' is true then urls should NOT be null but setted. (Also they should point to something valid, but for testing is possible to not be so -> to test Client software.)



# 4 user examples. 3 enabled and one banned. Enabled ones have Ids ranging 1-3 and privacy levels in the same order ranging 1-3 (banned 0). The second one has pin-field setted to 1234.
INSERT INTO user
        (created, enabled, email, password, privacy_level)
        VALUES
        (NOW(), true, "matti.meikalainen@gmail.com", 'salasana1', 1)
;

INSERT INTO user
        (created, enabled, email, password, pin, privacy_level)
        VALUES
        (NOW(), true, "maija.meikalainen@helsinki.fi", 'salasana2', '1234', 2)
;

INSERT INTO user
        (created, enabled, email, password, privacy_level)
        VALUES
        (NOW(), true, "Kakku.kakkulandia@kakku.kak", 'salasana2', 3)
;

INSERT INTO user
        (created, enabled, email, password, privacy_level)
        VALUES
        (NOW(), false, "trolli.peikkonen@gmail.com", 'salasana3', 0)
;


# 2 subuser examples. One has an avatar picture and the other not. Note: Background avatar images have to be uploaded to S3 separately.
INSERT INTO subuser
        (user_id, created, nick, avatar_url)
        VALUES
        (1, NOW(), "Lissu", 'avatar_icon_id_1.png')
;

INSERT INTO subuser
        (user_id, created, nick)
        VALUES
        (2, NOW(), "Matti")
;


# 6 example categories. Note: Background images and icons have to be uploaded to S3 separately.
INSERT INTO category
        (created, uploaded, enabled, name, coordinate_x, coordinate_y, bg_uri, icon_uri)
        VALUES
        (NOW(), 1, 1, 'Fysiikka', 100, 100, 'category_bg_id_1.png', 'category_icon_id_1.png')
;

INSERT INTO category
        (created, uploaded, enabled, name, coordinate_x, coordinate_y, bg_uri, icon_uri)
        VALUES
        (NOW(), 1, 1, 'Kemia', 400, 500, 'category_bg_id_2.png', 'category_icon_id_2.png')
;

INSERT INTO category
        (created, uploaded, enabled, name, coordinate_x, coordinate_y, bg_uri, icon_uri)
        VALUES
        (NOW(), 1, 1, 'Piirtämisen salat', 1000, 600, 'category_bg_id_3.png', 'category_icon_id_3.png')
;

INSERT INTO category
        (created, uploaded, enabled, name, coordinate_x, coordinate_y, bg_uri, icon_uri)
        VALUES
        (NOW(), 1, 1, 'Lintujen tutkiminen', 800, 300, 'category_bg_id_4.png', 'category_icon_id_4.png')
;

INSERT INTO category
        (created, uploaded, enabled, name, coordinate_x, coordinate_y, bg_uri, icon_uri)
        VALUES
        (NOW(), 1, 1, 'Merenelävien mysteerit', 400, 100, 'category_bg_id_5.png', 'category_icon_id_5.png')
;

INSERT INTO category
        (created, uploaded, enabled, name, coordinate_x, coordinate_y, bg_uri, icon_uri)
        VALUES
        (NOW(), 1, 1, 'Pilvessä ollaan!', 1100, 900, 'category_bg_id_6.png', 'category_icon_id_6.png')
;


# 9 test tasks. 3rd one is "not yet uploaded" -one. Note: Videos and icons have to be uploaded to S3 separately.
INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (1, NOW(), 1, 1, 'Jään sulaminen', 'Tehtävässä tutkitaan, kuinka jää sulaa.', 100, 100, 'task_id_1.webm', 'task_icon_id_1.png')
;

INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (1, NOW(), 1, 1, 'Omenan putoaminen', 'Tehtävässä tutkitaan, kuinka omena putoaa.', 400, 500, 'task_id_2.webm', 'task_icon_id_2.png')
;

INSERT INTO task
        (category_id, created, uploaded, enabled, name, uri, coordinate_x, coordinate_y, icon_uri)
        VALUES
        (2, NOW(), 0, 0, 'Sokerin liukeneminen', 'task_id_3.webm', 1000, 600, 'task_icon_id_3.png')
;

INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (1, NOW(), 1, 1, 'Hankaussähkö', 'Paijataan kissaa ja katsotaan muodostuuko hankaussähköö.', 1200, 800, 'task_id_4.webm', 'task_icon_id_4.png')
;

INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (1, NOW(), 1, 1, 'Kalojen uinti', 'Tuijotetaan kaloja ja päätellään niiden sosiaalinen asema.', 1400, 1000, 'task_id_5.webm', 'task_icon_id_5.png')
;

INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (5, NOW(), 1, 1, 'Vedenalainen maailma', 'Siellä on kaloja, kasveja ja reilusti roskaa!.', 200, 300, 'task_id_6.webm', 'task_icon_id_6.png')
;

INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (5, NOW(), 1, 1, 'Kakkua merellä', 'Miten kalat pistää poskeensa ruuan.', 600, 500, 'task_id_7.webm', 'task_icon_id_7.png')
;

INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (5, NOW(), 1, 1, 'Äyriäiset ärsyttää', 'Mutta hyvän makuista.', 900, 900, 'task_id_8.webm', 'task_icon_id_8.png')
;


INSERT INTO task
        (category_id, created, uploaded, enabled, name, info, coordinate_x, coordinate_y, uri, icon_uri)
        VALUES
        (6, NOW(), 1, 1, 'Pilvessä ollaan!', 'Tutkitaan taivaatta!', 500, 500, 'task_id_9.webm', 'task_icon_id_9.png')
;


# 4 test answers. Last one is "not yet uploaded" -one. Note: Videos have to be uploaded to S3 separately.
INSERT INTO answer
        (task_id, subuser_id, created, uploaded, enabled, answer_type, uri)
        VALUES
        (1, 1, NOW(), 1, 1, "video", 'answer_suid_1_id_1.webm')
;

INSERT INTO answer
        (task_id, subuser_id, created, uploaded, enabled, answer_type, uri)
        VALUES
        (2, 1, NOW(), 1, 1, "video", 'answer_suid_1_id_2.mp4')
;

INSERT INTO answer
        (task_id, subuser_id, created, uploaded, enabled, answer_type, uri)
        VALUES
        (3, 2, NOW(), 1, 1, "image", 'answer_suid_2_id_3.png')
;

INSERT INTO answer
        (task_id, subuser_id, created, uploaded, enabled, answer_type, uri)
        VALUES
        (3, 2, NOW(), 0, 0, "video", 'answer_suid_2_id_4.mkv')
;


# 2 test likes.
INSERT INTO likes
       (id, subuser_id, answer_id, created)
       VALUES
       (1, 1, 1, NOW())
;

INSERT INTO likes
       (id, subuser_id, answer_id, created)
       VALUES
       (2, 1, 2, NOW())
;


## Test instances for info table. Note: these are not completely test instances since they are rather some initial values.
INSERT INTO info (id, info_text) VALUES ("eula", "Palvelun käyttöehdot");
INSERT INTO info (id, info_text) VALUES ("instructions", "Käyttöohjeet");
INSERT INTO info (id, info_text) VALUES ("category_menu_bg_uri", "category_menu_bg.png");



## Summary: After the initialization there is the following amount of test-instances for each table (if "x" is the amount then ids are 1-"x"):
## user table:                          4
## subuser table:                       2
## category table:                      6
## task table:                          9
## answer table:                        4
## likes table:                         2
##
## And some initial values for the info table.
