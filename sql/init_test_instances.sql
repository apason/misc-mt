# Here we create a few test instances to the database. Instances should be created in correct order
# eg. Categories should be created befoce tasks because tasks has reference to category.

# Users and categories does not depend on any other tables so those are created first

# 3 user examples. 2 active and one banned. One active has already a token assigned.
INSERT INTO user 
	(id, email, password, enabled, create_time)
	VALUES 
	(1, "matti.meikalainen@gmail.com", "password1", true, NOW())
;

INSERT INTO user 
	(id, email, password, enabled, create_time)
	VALUES
	(2, "maija.meikalainen@helsinki.fi", "password2", true, NOW())
;

INSERT INTO user
	(id, email, password, enabled, create_time)
	VALUES
	(3, "trolli@peikko.banned", "password3", false, NOW())
;

# 3 subuser test-examples pointing to different users. Two of them have the same nick but pointing to diferent user.

INSERT INTO subuser
       (nick, user_id)
       VALUES
       ("Minna", 1)
;

INSERT INTO subuser
       (nick, user_id)
       VALUES
       ("Minna", 2)
;

INSERT INTO subuser
       (nick, user_id)
       VALUES
       ("Pekka", 2)
;       

# 2 test categories.
INSERT INTO category
	(id, name)
	VALUES
	(1, 'test_category')
;

INSERT INTO category
	(id, name)
	VALUES
	(2, 'fysiikka')
;

# 3 task examples. One, id 3, has the default value (not assigned) for the field info.
INSERT INTO task
	(id, loaded, category_id, enabled, info)
	VALUES
	(1, NOW(), 1, true, "tehtävä1")
;

INSERT INTO task
	(id, loaded, category_id, enabled, info)
	VALUES
	(2, NOW(), 1, false, "tehtävä2")
;

INSERT INTO task
	(id, loaded, category_id, enabled)
	VALUES
	(3, NOW(), 2, true)
;

# 4 test answers for enabled users.
INSERT INTO answer
	(issued, id, loaded, enabled, task_id, subuser_id)
	VALUES
	(NOW(),1, NOW(), true, 1, 2)
;

INSERT INTO answer
	(issued, id, loaded, enabled, task_id, subuser_id)
	VALUES
	(NOW(), 2, NOW(), true, 1, 1)
;

INSERT INTO answer
	(issued, id, loaded, enabled, task_id, subuser_id)
	VALUES
	(NOW(), 3, NOW(), true, 3, 2);
;

INSERT INTO answer
        (issued, id, loaded, enabled, task_id, subuser_id)
        VALUES
        (NOW(), 4, NOW(), false, 1, 2);
;



