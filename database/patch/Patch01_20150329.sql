ALTER TABLE `playright`.`pr_cvg_data` 
CHANGE COLUMN `Image` `Image` MEDIUMBLOB NULL DEFAULT NULL ;
/
ALTER TABLE `playright`.`pr_cvg_data` 
ADD COLUMN `image_attachment` VARCHAR(8) NULL DEFAULT 'N' AFTER `Image`;
/
ALTER TABLE `playright`.`pr_cvg_data` 
ADD COLUMN `image_type` VARCHAR(64) AFTER `Image`;
/
ALTER TABLE `playright`.`pr_cvg_data` 
ADD COLUMN `image_filename` VARCHAR(255) AFTER `Image`;
/
