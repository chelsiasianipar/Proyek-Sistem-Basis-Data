-- ------------------------------------------
-- Database Schema for a Restaurant Tepi Danau Bistro
-- ------------------------------------------

-- Create a new database named "restaurant_db"
CREATE DATABASE restaurant_db;

-- Use the "restaurant_db" database
USE restaurant_db;

-- ------------------------------------------
-- Table: admin
-- Description: Stores information about administrators
-- ------------------------------------------
CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each admin
    username VARCHAR(255) NOT NULL, -- Admin's username
    password VARCHAR(255) NOT NULL, -- Admin's password (hashed for security)
    email VARCHAR(255) NOT NULL, -- Admin's email address
    phone VARCHAR(20) NOT NULL, -- Admin's phone number
    address VARCHAR(255) NOT NULL -- Admin's address
);

-- ------------------------------------------
-- Table: category
-- Description: Stores categories of menu items
-- ------------------------------------------
CREATE TABLE category (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each category
    name VARCHAR(255) NOT NULL, -- Name of the category
    description TEXT NOT NULL, -- Description of the category
    admin_id INT, -- Foreign key referencing the admin who created the category
    FOREIGN KEY (admin_id) REFERENCES admin(id) -- Establishing a foreign key constraint
);

-- ------------------------------------------
-- Table: menu
-- Description: Stores menu items
-- ------------------------------------------
CREATE TABLE menu (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each menu item
    name VARCHAR(255) NOT NULL, -- Name of the menu item
    image VARCHAR(255) NOT NULL, -- Image URL of the menu item
    description TEXT NOT NULL, -- Description of the menu item
    price DECIMAL(10,2) NOT NULL, -- Price of the menu item
    category_id INT, -- Foreign key referencing the category to which the menu item belongs
    category_admin_id INT, -- Foreign key referencing the admin who owns the category
    FOREIGN KEY (category_id) REFERENCES category(id), -- Establishing foreign key constraints
    FOREIGN KEY (category_admin_id) REFERENCES admin(id)
);

-- ------------------------------------------
-- Table: gallery
-- Description: Stores images and descriptions for the gallery section
-- ------------------------------------------
CREATE TABLE gallery (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each gallery item
    image BLOB NOT NULL, -- Image data
    description TEXT NOT NULL, -- Description of the image
    admin_id INT, -- Foreign key referencing the admin who uploaded the image
    FOREIGN KEY (admin_id) REFERENCES admin(id) -- Establishing a foreign key constraint
);

-- ------------------------------------------
-- Table: testimonials
-- Description: Stores customer testimonials
-- ------------------------------------------
CREATE TABLE testimonials (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each testimonial
    name VARCHAR(255) NOT NULL, -- Name of the customer
    image VARCHAR(255) NOT NULL, -- Image URL of the customer
    message TEXT NOT NULL, -- Testimonial message
    admin_id INT, -- Foreign key referencing the admin who manages the testimonial
    FOREIGN KEY (admin_id) REFERENCES admin(id) -- Establishing a foreign key constraint
);

-- ------------------------------------------
-- Table: teams
-- Description: Stores information about restaurant team members
-- ------------------------------------------
CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each team member
    name VARCHAR(255) NOT NULL, -- Name of the team member
    position VARCHAR(255) NOT NULL, -- Position of the team member
    image BLOB NOT NULL, -- Image data of the team member
    admin_id INT, -- Foreign key referencing the admin who manages the team member
    FOREIGN KEY (admin_id) REFERENCES admin(id) -- Establishing a foreign key constraint
);

-- ------------------------------------------
-- Table: hour_open
-- Description: Stores opening hours of the restaurant
-- ------------------------------------------
CREATE TABLE hour_open (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each opening hour entry
    day_of_week INT NOT NULL, -- Day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    start_time TIME NOT NULL, -- Opening time
    end_time TIME NOT NULL, -- Closing time
    admin_id INT, -- Foreign key referencing the admin who manages the opening hours
    FOREIGN KEY (admin_id) REFERENCES admin(id) -- Establishing a foreign key constraint
);

-- ------------------------------------------
-- Table: about
-- Description: Stores information about the restaurant
-- ------------------------------------------
CREATE TABLE about (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for the about section
    description TEXT NOT NULL, -- Description of the restaurant
    admin_id INT, -- Foreign key referencing the admin who manages the about section
    FOREIGN KEY (admin_id) REFERENCES admin(id) -- Establishing a foreign key constraint
);




