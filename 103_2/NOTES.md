docker run --name sql2 -e MYSQL_ROOT_PASSWORD="1qaz2wsx" -d mysql/mysql-server

docker exec -it sql3 bash

mysql -uroot -p"1qaz2wsx"

SQL:
CREATE DATABASE IF NOT EXISTS food_info;
USE food_info;
CREATE TABLE `breakfast` (
    `id` INT NOT NULL,
    `name` VARCHAR(255),
    `serving_size` INT,
    `serving_measurement` VARCHAR(255),
    `calories` INT,
    PRIMARY KEY (id)
);

USE food_info;
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Smoked Salmon', 1, 'oz', 33);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (2, 'Bacon', 1, 'slice', 37);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (3, 'Toast', 1, 'slice', 69);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (4, 'Grapefruit', 1, 'unit', 82);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (5, 'Cereal', 1, 'cup', 113);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (6, 'Fruit Smoothie', 1, 'cup', 130);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (7, 'Oatmeal', 1, 'cup', 143);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (8, 'Scrambled Eggs', 1, 'unit', 142);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (9, 'Blueberry Muffin', 1, 'unit', 426);

Create Docker Network
docker network create python-app-network

To run database with seeded data:
docker run --name dbhost -d -p 3306:3306 --net=python-app-network fiftyforth/103mysql:v1 

To run the app container
docker run --name app -d -p 3006:3006 --net=python-app-network pyapp:v5

To Build the app container
docker build --no-cache -t pyapp:v5 .

