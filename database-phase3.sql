/********************************************************
* This script creates the database named hellavapes 2
*********************************************************/

-- create the tables for the database

CREATE TABLE categories (
  category_id        SMALLINT            PRIMARY KEY  AUTO_INCREMENT,
  category_name      VARCHAR(20)            NOT NULL
);

CREATE TABLE products (
  product_id        SMALLINT            PRIMARY KEY   AUTO_INCREMENT,
  product_name      VARCHAR(40)   NOT NULL      UNIQUE,
  description       TEXT  NOT NULL,
  image_name        VARCHAR(25),
  price             DECIMAL(6,2),
  category_id       SMALLINT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE INDEX idx_product_name
ON products (product_name); 


CREATE TABLE users (
  user_id               INT            PRIMARY KEY   AUTO_INCREMENT,
  first_name            VARCHAR(60)    NOT NULL,
  last_name             VARCHAR(60)    NOT NULL,
  email_address         VARCHAR(255)   NOT NULL      UNIQUE,
  acct_password         VARCHAR(100)   NOT NULL,
  address               VARCHAR(40)    NOT NULL,
  city                  VARCHAR(20)    NOT NULL,
  state                 CHAR(2)        NOT NULL,
  zipcode               SMALLINT(5)    NOT NULL,
  user_level            SMALLINT(2)
);

CREATE TABLE orders (
  order_id           INT            PRIMARY KEY   AUTO_INCREMENT,
  product_id         SMALLINT       NOT NULL,
  user_id            INT            NOT NULL,
  order_total        DECIMAL(8,2)   NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products (product_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);


-- Insert data into the tables

INSERT INTO categories (category_id, category_name) VALUES
(1, "Mods"),
(2, "E-Liquid"),
(3, "Tanks"),
(4, "Full Sets"),
(5, "Parts");

INSERT INTO products (product_id, product_name, description, image_name, price, category_id) VALUES
(1, "Voopoo Drag Mod", "Voopoo Drag Mod....", null, 56.99, 1),
(2, "Uforce Tank","Uforce Tank...", null, 29.99, 3),
(3, "Hohm Life 18650 Batteries","Batteries...", null, 13.99, 5);

INSERT INTO users (user_id, first_name, last_name, email_address, acct_password, address, city, state, zipcode, user_level) VALUES
(1, "Mark", "Chapman", "markchapman@gmail.com", "Pajamas321", "123 Brooklyn Ave", "Brooklyn", "NY", 11213, 1),
(2, "Jane", "Faris", "janefaris@hellavapes.com", "JFaris2", "2301 Bluebird Rd", "Lebanon", "TN", 37087, 3);

INSERT INTO orders (order_id, product_id, user_id, order_total) VALUES
(1, 2, 1, 42.11);
