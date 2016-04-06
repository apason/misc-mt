# Here we create a few test instances to the database. Instances should be created in the correct order.

# Users and categories do not depend on any other tables so they are created first.

# 3 user examples. 2 active and one banned.
INSERT INTO user
	(created, enabled, email, password)
	VALUES
	(NOW(), true, "matti.meikalainen@gmail.com", 'salasana1')
;

INSERT INTO user
	(created, enabled, email, password)
	VALUES
	(NOW(), true, "maija.meikalainen@helsinki.fi", 'salasana2')
;

INSERT INTO user
	(created, enabled, email, password)
	VALUES
	(NOW(), false, "trolli.peikkonen@gmail.com", 'salasana3')
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

# 3 example categories. Note: Background images and icons have to be uploaded to S3 separately.
INSERT INTO category
	(created, uploaded, enabled, name, bg_uri, icon_uri)
	VALUES
	(NOW(), 1, 1, 'Fysiikka', 'category_bg_id_1.png', 'category_icon_id_1.png')
;

INSERT INTO category
	(created, uploaded, enabled, name, bg_uri, icon_uri)
	VALUES
	(NOW(), 1, 1, 'Kemia', 'category_bg_id_2.png', 'category_icon_id_2.png')
;

INSERT INTO category
	(created, uploaded, enabled, name, bg_uri, icon_uri)
	VALUES
	(NOW(), 1, 1, 'Piirtämisen salat', 'category_bg_id_3.png', 'category_icon_id_3.png')
;

# 5 test tasks. 3rd one is "not yet uploaded" -one. Note: Videos and icons have to be uploaded to S3 separately.
INSERT INTO task
	(category_id, created, uploaded, enabled, name, info, uri, icon_uri)
	VALUES
	(1, NOW(), 1, 1, 'Jään sulaminen', 'Tehtävässä tutkitaan, kuinka jää sulaa.', 'task_id_1.webm', 'task_icon_id_1.png')
;

INSERT INTO task
	(category_id, created, uploaded, enabled, name, info, uri, icon_uri)
	VALUES
	(1, NOW(), 1, 1, 'Omenan putoaminen', 'Tehtävässä tutkitaan, kuinka omena putoaa.', 'task_id_2.webm', 'task_icon_id_2.png')
;

INSERT INTO task
	(category_id, created, uploaded, enabled, name, uri, icon_uri)
	VALUES
	(2, NOW(), 0, 0, 'Sokerin liukeneminen', 'task_id_3.webm', 'task_icon_id_3.png')
;

INSERT INTO task
	(category_id, created, uploaded, enabled, name, info, uri, icon_uri)
	VALUES
	(1, NOW(), 1, 1, 'Hankaussähkö', 'Paijataan kissaa ja katsotaan muodostuuko hankaussähköö.', 'task_id_4.webm', 'task_icon_id_4.png')
;

INSERT INTO task
	(category_id, created, uploaded, enabled, name, info, uri, icon_uri)
	VALUES
	(1, NOW(), 1, 1, 'Kalojen uinti', 'Tuijotetaan kaloja ja päätellään niiden sosiaalinen asema.', 'task_id_5.webm', 'task_icon_id_5.png')
;

# 4 test answers. Last one is "not yet uploaded" -one. Note: Videos have to be uploaded to S3 separately.
INSERT INTO answer
	(task_id, subuser_id, created, uploaded, enabled, uri)
	VALUES
	(1, 1, NOW(), 1, 1, 'answer_suid_1_id_1.webm')
;

INSERT INTO answer
	(task_id, subuser_id, created, uploaded, enabled, uri)
	VALUES
	(2, 1, NOW(), 1, 1, 'answer_suid_1_id_2.mp4')
;

INSERT INTO answer
	(task_id, subuser_id, created, uploaded, enabled, uri)
	VALUES
	(3, 2, NOW(), 1, 1, 'answer_suid_2_id_3.png')
;

INSERT INTO answer
	(task_id, subuser_id, created, uploaded, enabled, uri)
	VALUES
	(3, 2, NOW(), 0, 0, 'answer_suid_2_id_4.mkv')
;

INSERT INTO slaikka
       (id, subuser_id, answer_id, loaded)
       VALUES
       (1, 1, 1, NOW())
;       

## Summary: After initialization there is entitys with following id:s
## user_id:    1-3
## subuser_id: 1-2
## answer_id:  1-4
## task_id:    1-3
## slaikka_id: 1
