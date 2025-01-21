-- ------------------------------------------
-- Database Schema for a Restaurant Tepi Danau Bistro
-- ------------------------------------------

-- Create a new database named "restaurant_db"
CREATE restaurant_db;

-- Use the "restaurant_db" database
USE restaurant_db;

-- ------------------------------------------
-- Table: admin
-- Description: Stores information about administrators
-- ------------------------------------------
CREATE TABLE admin (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each admin
    username VARCHAR(255) NOT NULL, -- Admin's username
    PASSWORD VARCHAR(255) NOT NULL, -- Admin's password (hashed for security)
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
    NAME VARCHAR(255) NOT NULL, -- Name of the category
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
    NAME VARCHAR(255) NOT NULL, -- Name of the menu item
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
    NAME VARCHAR(255) NOT NULL, -- Name of the customer
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
    NAME VARCHAR(255) NOT NULL, -- Name of the team member
    POSITION VARCHAR(255) NOT NULL, -- Position of the team member
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
    FOREIGN KEY (admin_id) REFERENCES admin(id) -- Establishing a foreign key constraint
);

INSERT INTO admin (username, PASSWORD, email, phone, address) VALUES
('admin1', 'hashed_password_1', 'admin1@example.com', '1234567890', '123 Main Street'),
('admin2', 'hashed_password_2', 'admin2@example.com', '9876543210', '456 Elm Street'),
('admin3', 'hashed_password_3', 'admin3@example.com', '5551234567', '789 Oak Street'),
('admin4', 'hashed_password_4', 'admin4@example.com', '3332221111', '321 Pine Street'),
('admin5', 'hashed_password_5', 'admin5@example.com', '9998887777', '654 Maple Street'),
('admin6', 'hashed_password_6', 'admin6@example.com', '1112223333', '876 Cedar Street'),
('admin7', 'hashed_password_7', 'admin7@example.com', '4445556666', '987 Walnut Street'),
('admin8', 'hashed_password_8', 'admin8@example.com', '7778889999', '234 Birch Street'),
('admin9', 'hashed_password_9', 'admin9@example.com', '6667778888', '543 Pineapple Street'),
('admin10', 'hashed_password_10', 'admin10@example.com', '2223334444', '876 Cherry Street');

INSERT INTO category (NAME, description, admin_id) VALUES
('Sarapan', 'Menu untuk sarapan pagi.', 1),
('Makan Siang', 'Menu untuk santap siang.', 2),
('Makan Malam', 'Menu untuk makan malam.', 3),
('Brunch', 'Paduan antara sarapan dan makan siang.', 1),
('Camilan', 'Makanan ringan untuk tengah malam.', 2),
('Minuman', 'Minuman segar untuk menemani hidangan.', 1),
('Sayuran', 'Menu sayuran segar.', 3),
('Pasta', 'Menu pasta yang lezat.', 1),
('Dessert', 'Menu pencuci mulut yang manis.', 2),
('Sandwich', 'Variasi sandwich yang menggiurkan.', 3);

INSERT INTO menu (NAME, image, description, price, category_id, category_admin_id) VALUES
('Telur Mata Sapi', 'https://example.com/telur-mata-sapi.jpg', 'Telur goreng dengan tomat dan daun seledri.', 10000, 1, 1),
('Roti Bakar', 'https://example.com/roti-bakar.jpg', 'Roti gandum panggang dengan mentega dan selai stroberi.', 7500, 1, 1),
('Nasi Goreng', 'https://example.com/nasi-goreng.jpg', 'Nasi goreng dengan sayuran, daging ayam, dan telur.', 15000, 2, 2),
('Ayam Goreng', 'https://example.com/ayam-goreng.jpg', 'Ayam potong digoreng dengan rempah-rempah, disajikan dengan nasi dan sambal.', 12000, 2, 2),
('Steak', 'https://example.com/steak.jpg', 'Steak daging sapi premium dengan saus black pepper dan kentang goreng.', 25000, 3, 3),
('Pancake', 'https://example.com/pancake.jpg', 'Pancake disiram sirup maple dan buah segar.', 12000, 1, 1),
('Burger', 'https://example.com/burger.jpg', 'Burger daging sapi panggang dengan keju leleh dan saus burger.', 18000, 2, 2),
('Pizza', 'https://example.com/pizza.jpg', 'Pizza tebal dengan saus tomat dan keju mozarella.', 20000, 3, 3),
('Es Krim', 'https://example.com/es-krim.jpg', 'Es krim vanila dengan toping pilihan.', 8500, 2, 2),
('Salad', 'https://example.com/salad.jpg', 'Salad segar dengan dressing balsamic vinaigrette.', 16000, 1, 1);

INSERT INTO gallery (image, description, admin_id) VALUES
('https://via.placeholder.com/500x300', 'Suasana karaoke yang meriah dengan teman-teman!', 1),
('https://via.placeholder.com/500x300', 'Bergembira di malam karaoke dengan lagu-lagu favorit!', 2),
('https://via.placeholder.com/500x300', 'Semangat menyala-nyala saat berkaraoke di malam yang cerah!', 3),
('https://via.placeholder.com/500x300', 'Pesta karaoke yang seru dengan lagu-lagu terpopuler!', 1),
('https://via.placeholder.com/500x300', 'Suasana karaoke yang ramai dengan semangat menyenangkan!', 2),
('https://via.placeholder.com/500x300', 'Momen kebersamaan yang tak terlupakan di malam karaoke!', 3),
('https://via.placeholder.com/500x300', 'Santai bersama teman-teman sambil berkaraoke!', 1),
('https://via.placeholder.com/500x300', 'Semaraknya suasana karaoke di tengah malam yang cerah!', 2),
('https://via.placeholder.com/500x300', 'Suasana pesta karaoke yang meriah dengan tawa dan nyanyian!', 3),
('https://via.placeholder.com/500x300', 'Semangat menyala-nyala di malam karaoke bersama sahabat!', 1);

INSERT INTO testimonials (NAME, image, message, admin_id) VALUES
('rahel', 'https://example.com/rahel-nat.jpg', 'Great experience! The service was excellent and the food was delicious.', 1),
('putri', 'https://example.com/putri-geral.jpg', 'Highly recommended! The staff was friendly and attentive.', 2),
('rizki', 'https://example.com/rizki-kris.jpg', 'Amazing place! The ambiance was fantastic and the drinks were superb.', 3),
('baha', 'https://example.com/baha-ambro.jpg', 'Wonderful experience! The live music added a great touch to the evening.', 1),
('raymond', 'https://example.com/raymond-gandi.jpg', 'Outstanding service! The staff went above and beyond to make our night special.', 2),
('perez', 'https://example.com/perez-pros.jpg', 'Incredible atmosphere! The decor and lighting created a magical evening.', 3),
('teresa', 'https://example.com/teresa-maul.jpg', 'Phenomenal service! The attention to detail made our celebration unforgettable.', 1),
('olivia', 'https://example.com/olivia-purna.jpg', 'Fantastic experience! The food was exquisite and the presentation was impeccable.', 2),
('yohana', 'https://example.com/yohana-mir.jpg', 'Exceptional service! The staff anticipated our every need with grace and professionalism.', 3),
('miranda', 'https://example.com/miranda-mery.jpg', 'Memorable evening! The ambiance was romantic and the food was divine.', 1);

SELECT *FROM testimonials;

INSERT INTO teams (NAME, POSITION, image, admin_id) VALUES
('Adi', 'Chef', 'https://via.placeholder.com/300', 1),
('Budi', 'Chef', 'https://via.placeholder.com/300', 2),
('Citra', 'Pelayan', 'https://via.placeholder.com/300', 3),
('Dian', 'Pelayan', 'https://via.placeholder.com/300', 1),
('Eka', 'Chef', 'https://via.placeholder.com/300', 2),
('Fitri', 'Chef', 'https://via.placeholder.com/300', 3),
('Gita', 'Pelayan', 'https://via.placeholder.com/300', 1),
('Hadi', 'Pelayan', 'https://via.placeholder.com/300', 2),
('Indra', 'Chef', 'https://via.placeholder.com/300', 3),
('Joko', 'Pelayan', 'https://via.placeholder.com/300', 1);

INSERT INTO hour_open (day_of_week, start_time, end_time, admin_id) VALUES
('Senin', '08:00:00', '17:00:00', 1),
('Selasa', '09:00:00', '18:00:00', 1),
('Rabu', '09:00:00', '18:00:00', 1),
('Kamis', '09:00:00', '18:00:00', 1),
('Jumat', '09:00:00', '18:00:00', 1),
('Sabtu', '09:00:00', '18:00:00', 1),
('Minggu', '10:00:00', '15:00:00', 1);

INSERT INTO about (description, admin_id) VALUES
('Restoran kami menawarkan hidangan lezat dari masakan lokal dan internasional. Kami bangga menyajikan makanan berkualitas tinggi dengan bahan-bahan segar dan cita rasa yang autentik.', 1),
('Dengan suasana yang nyaman dan ramah, restoran kami adalah tempat yang sempurna untuk berkumpul bersama keluarga dan teman-teman. Kami menyediakan layanan terbaik untuk memastikan pengalaman bersantap Anda menyenangkan.', 2),
('Kami juga mengadakan berbagai acara khusus seperti pesta ulang tahun, acara pernikahan, dan acara perusahaan. Hubungi kami untuk informasi lebih lanjut dan pemesanan.', 1),
('Dibuka sejak tahun 2010, restoran kami telah menjadi destinasi favorit bagi pecinta kuliner. Kami selalu berusaha untuk memberikan pengalaman makan yang istimewa kepada setiap pelanggan.', 3),
('Komitmen kami adalah memberikan pelayanan terbaik dan menyajikan hidangan lezat yang memanjakan lidah Anda. Kunjungi restoran kami dan nikmati sensasi kuliner yang tak terlupakan.', 2);


-- query
-- 1
SELECT * FROM testimonials;

-- 2
SELECT * FROM testimonials WHERE NAME = 'John Doe';

-- 3
SELECT NAME, message FROM testimonials WHERE image IS NOT NULL;

-- 4
SELECT *FROM testimonials WHERE LENGTH(message) > 10;

-- 5
SELECT * FROM testimonials WHERE admin_id = 2 ORDER BY NAME ASC;

-- 6	
SELECT * FROM testimonials WHERE message LIKE '%service%';

-- 7
SELECT * FROM testimonials WHERE admin_id = 3 ORDER BY NAME;

-- 8
SELECT * FROM testimonials WHERE message NOT LIKE '%recommended%';

-- 9
SELECT * FROM testimonials WHERE LENGTH(message) > 50;

-- 10
SELECT admin_id, COUNT(*) AS total_testimonials FROM testimonials GROUP BY admin_id;

-- JOIN

-- 1
SELECT m.*, c.NAME AS category_name FROM menu m  INNER JOIN category c ON m.category_id = c.id;

-- 2
SELECT h.*, a.*FROM hour_open h CROSS JOIN admin a;

-- 3
SELECT m.*, c.*FROM menu m LEFT OUTER JOIN category c ON m.category_id = c.id;

-- 4
SELECT m.*, c.* FROM menu m RIGHT OUTER JOIN category c ON m.category_id = c.id;

-- 5
SELECT m.*, h.*FROM menu m RIGHT OUTER JOIN hour_open h ON m.id = h.id;

-- 6
SELECT m.*, g.*FROM menu m CROSS JOIN gallery g;

-- 7
SELECT m.*, g.*FROM menu m INNER JOIN gallery g ON m.id = g.id;

-- 8
SELECT m.*, t.*FROM menu m INNER JOIN teams t ON m.id = t.id;

-- 9
SELECT m.*, t.*FROM menu m INNER JOIN teams t ON m.category_admin_id = t.admin_id;

-- 10
SELECT t.*, g.*FROM teams t LEFT JOIN gallery g ON t.admin_id = g.admin_id;

-- subquery
-- 1
SELECT c.NAME AS category_name, (SELECT COUNT(*) FROM menu WHERE category_id = c.id) AS total_menu FROM category c;

-- 2
SELECT c.NAME AS category_name, (SELECT AVG(price) FROM menu WHERE category_id = c.id) AS average_price FROM category c;

-- 3
SELECT c.NAME AS category_name, COUNT(*) AS total_menu FROM menu m INNER JOIN category c ON m.category_id = c.id GROUP BY c.NAME HAVING COUNT(*) > 5;

-- 4
SELECT *FROM menu WHERE price > (SELECT AVG(price) FROM menu);

-- 5
SELECT COUNT(*) FROM menu WHERE category_admin_id = (SELECT id FROM admin WHERE username = 'admin2' LIMIT 1);

