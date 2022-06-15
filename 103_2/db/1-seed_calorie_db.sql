USE food_info;
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Smoked Salmon', 1, 'oz', 33);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Bacon', 1, 'slice', 37);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Toast', 1, 'slice', 69);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Grapefruit', 1, 'unit', 82);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Cereal', 1, 'cup', 113);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Fruit Smoothie', 1, 'cup', 130);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Oatmeal', 1, 'cup', 143);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Scrambled Eggs', 1, 'unit', 142);
INSERT INTO `breakfast` (`id`,`name`,`serving_size`,`serving_measurement`,`calories`) VALUES (1, 'Blueberry Muffin', 1, 'unit', 426);

CREATE USER 'pythonapp'@'localhost' IDENTIFIED BY 'secretPass123!';
CREATE USER 'pythonapp'@'%' IDENTIFIED BY 'secretPass123!';

GRANT ALL ON *.* TO 'pythonapp'@'localhost';
GRANT ALL ON *.* TO 'pythonapp'@'%';
FLUSH PRIVILEGES;