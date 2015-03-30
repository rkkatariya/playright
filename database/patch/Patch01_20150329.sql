ALTER TABLE `playright`.`pr_cvg_data` 
CHANGE COLUMN `Image` `Image` MEDIUMBLOB NULL DEFAULT NULL ;
/
ALTER TABLE `playright`.`pr_cvg_data` 
ADD COLUMN `image_type` VARCHAR(64) AFTER `Image`;
/
ALTER TABLE `playright`.`pr_cvg_data` 
ADD COLUMN `image_filename` VARCHAR(255) AFTER `Image`;
/
CREATE TABLE `playright`.`list_of_values` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `list_type` VARCHAR(255) NOT NULL,
  `list_name` VARCHAR(255) NOT NULL,
  `list_value` VARCHAR(255) NOT NULL,
  `is_deleted` VARCHAR(8) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`));
/
INSERT INTO `playright`.`list_of_values` (`list_type`, `list_value`, `list_name`) VALUES ('JOURNALIST_FACTOR', 'Editor', '1');
INSERT INTO `playright`.`list_of_values` (`list_type`, `list_value`, `list_name`) VALUES ('JOURNALIST_FACTOR', 'Reporter', '2');
INSERT INTO `playright`.`list_of_values` (`list_type`, `list_value`, `list_name`) VALUES ('JOURNALIST_FACTOR', 'Special Correspondent', '3');
INSERT INTO `playright`.`list_of_values` (`list_type`, `list_value`, `list_name`) VALUES ('JOURNALIST_FACTOR', 'Bureau', '4');
INSERT INTO `playright`.`list_of_values` (`list_type`, `list_value`, `list_name`) VALUES ('JOURNALIST_FACTOR', 'PTI copy', '5');

