DELIMITER $$

DROP PROCEDURE IF EXISTS `generate_data`$$

CREATE PROCEDURE `generate_data` ()
BEGIN

	DECLARE counter INTEGER DEFAULT 100;
    DECLARE max_id INTEGER DEFAULT 0;

    WHILE (counter > 0) DO

		       INSERT INTO identity (username, email, password_hash)
			   SELECT SUBSTRING(MD5(UUID()), 1, FLOOR((RAND() * (30-15+1))+15)) AS username,
					  CONCAT(SUBSTRING(MD5(UUID()), 1, FLOOR((RAND() * (30-15+1))+15)), '@', SUBSTRING(MD5(UUID()), 1, FLOOR((RAND() * (30-15+1))+15)), '.com') AS email,
					  SUBSTRING(MD5(UUID()), 1, FLOOR((RAND() * (30-15+1))+15)) AS password_hash
			   FROM (SELECT COLUMN_NAME FROM information_schema.COLUMNS LIMIT 1000) AS t1
			   CROSS JOIN (SELECT COLUMN_NAME FROM information_schema.COLUMNS LIMIT 100) AS t2;

			   INSERT INTO profile (first_name, last_name, dob, identity_id)
			   SELECT SUBSTRING(MD5(UUID()), 1, FLOOR((RAND() * (15-5+1))+5)) AS first_name,
					  SUBSTRING(MD5(UUID()), 1, FLOOR((RAND() * (20-8+1))+8)) AS last_name,
					  DATE(FROM_UNIXTIME(ROUND((RAND() * (1104537600 - 0) + 0)))),
					  id AS identity_id
			   FROM identity
			   WHERE id > max_id;

               SET max_id = (SELECT MAX(id) FROM identity);

               SET counter = counter - 1;

    END WHILE;

END$$

DELIMITER ;
