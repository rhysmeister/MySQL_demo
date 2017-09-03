# A profile has one identity which can be shared with other profiles
CREATE TABLE IF NOT EXISTS profile (
  id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  dob DATE NULL,
  identity_id INTEGER UNSIGNED NOT NULL,
  created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY `fk_identity_id` (identity_id) REFERENCES identity (id)
);
