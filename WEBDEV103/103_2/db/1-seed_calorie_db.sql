-- USE food_info;

-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Smoked Salmon', 1, 'oz', 33);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Bacon', 1, 'slice', 37);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Toast', 1, 'slice', 69);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Grapefruit', 1, 'unit', 82);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Cereal', 1, 'cup', 113);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Fruit Smoothie', 1, 'cup', 130);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Oatmeal', 1, 'cup', 143);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Scrambled Eggs', 1, 'unit', 142);
-- INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Blueberry Muffin', 1, 'unit', 426);

CREATE DATABASE IF NOT EXISTS allergen_info;
USE allergen_info;
CREATE TABLE `foods` (
    `id` INT NOT NULL,
    `name` VARCHAR(255),
    `lab_product` BOOLEAN,
    `serving_size_g` FLOAT,
    `gluten_g` FLOAT,
    `lactose_g` FLOAT,
    `egg_g` FLOAT,
    `alpha-gal_g` FLOAT,
    `ara_h_1_g` FLOAT,
    `ara_h_3_g` FLOAT,
    `fructose_g` FLOAT,
    PRIMARY KEY (id)
);

INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (1, 'Un-believibeef', TRUE, 50, 0,0,0,0,0,0,0);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (2, 'Beef', FALSE, 50, 0,0,0,0.00000250,0,0,0);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (3, 'Baloney bologna', TRUE, 30, 0,0.02,0,0.00000003,0,0,0);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (4, 'Bologna', FALSE, 30, 0,0,0,0.00015,0,0,0);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (5, 'Straw-very', TRUE, 10, 0,0.02,0,0,0,0,0.001);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (6, 'Strawberry', FALSE, 10, 0,0,0,0,0,0,5);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (7, 'Chunky nut butter', TRUE, 100, 0,0.1,0,0,0,0,0.001);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (8, 'Peanut butter', FALSE, 100, 0,0.01,0,0,1,1,0.91);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (9, 'Better off bread', TRUE, 40, 0.01,0,0,0,0,0,0);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (10, 'Bread', FALSE, 40, 5,0,0,0,0,0,1.4);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (11, 'Say cheddar', TRUE, 30, 0,0.02,0,0,0,0,0);
INSERT INTO `foods` (`id`,`name`,`lab_product`,`serving_size_g`,`gluten_g`,`lactose_g`,`egg_g`,`alpha-gal_g`,`ara_h_1_g`,`ara_h_3_g`,`fructose_g`) VALUES (12, 'Cheddar', FALSE, 30, 0,2,0,0,0,0,0);

CREATE USER 'pythonapp'@'localhost' IDENTIFIED BY 'secretPass123!';
CREATE USER 'pythonapp'@'%' IDENTIFIED BY 'secretPass123!';

GRANT ALL ON *.* TO 'pythonapp'@'localhost';
GRANT ALL ON *.* TO 'pythonapp'@'%';
FLUSH PRIVILEGES;