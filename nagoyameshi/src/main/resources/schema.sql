CREATE TABLE IF NOT EXISTS category (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	category_name VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS storeinfo (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	categories_id INT NOT NULL,
	storename VARCHAR(255) NOT NULL,
	image_name VARCHAR(255),
	description VARCHAR(255) NOT NULL,
	lowerprice INT NOT NULL,
	maxprice INT NOT NULL,
	opening VARCHAR(255) NOT NULL,
	closed VARCHAR(255) NOT NULL,
	postal_code VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	regular_holiday VARCHAR(50) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (categories_id) REFERENCES category (id)
);

CREATE TABLE IF NOT EXISTS roles (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS memberinfo (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	role_id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	furigana VARCHAR(50) NOT NULL,
	mailaddress VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	postal_code VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	enabled BOOLEAN NOT NULL,
	Customer_ID VARCHAR(50),
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE IF NOT EXISTS reservations (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	store_id INT NOT NULL,
	memberinfo_id INT NOT NULL,
	reservationday DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	people INT NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (store_id) REFERENCES storeinfo (id),
	FOREIGN KEY (memberinfo_id) REFERENCES memberinfo (id)
);

CREATE TABLE IF NOT EXISTS reviews (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	store_id INT NOT NULL,
	memberinfo_id INT NOT NULL,
	star INT NOT NULL,
	comment VARCHAR(1000) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (store_id) REFERENCES storeinfo (id),
 	FOREIGN KEY (memberinfo_id) REFERENCES memberinfo (id)
);

CREATE TABLE IF NOT EXISTS favorite (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	store_id INT NOT NULL,
	user_id INT NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
	list VARCHAR(255) NOT NULL,
	FOREIGN KEY (store_id) REFERENCES storeinfo (id)
);

CREATE TABLE IF NOT EXISTS company (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	company_name VARCHAR(255) NOT NULL,
	representative VARCHAR(50) NOT NULL,
	founding_company VARCHAR(50) NOT NULL,
	postal_code VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL,
	business_details VARCHAR(1000) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS administrator (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mailaddress VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS verification_tokens (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     user_id INT NOT NULL UNIQUE,
     token VARCHAR(255) NOT NULL,      
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES memberinfo (id) 
 );
 
 CREATE TABLE IF NOT EXISTS password_reset_token (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     user_id INT NOT NULL UNIQUE,
     token VARCHAR(255) NOT NULL,
     expiry_date DATETIME,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES memberinfo (id) 
 );