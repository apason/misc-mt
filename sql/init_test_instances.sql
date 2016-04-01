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

# 2 subuser examples. One has an avatar picture and the other not.
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

# 2 example categories. Note: Background images and icons have to be uploaded to S3 separately.
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

# 3 test tasks. Last one is "not yet uploaded" -one.
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

# 4 test answers. Last one is "not yet uploaded" -one.
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
