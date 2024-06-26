DROP TABLE IF EXISTS `glpi_plugin_manufacturersimports_configs`;
CREATE TABLE `glpi_plugin_manufacturersimports_configs` (
   `id` int unsigned NOT NULL auto_increment,
   `name` varchar(255) collate utf8mb4_unicode_ci default NULL,
   `entities_id` int unsigned NOT NULL default '0',
   `is_recursive` tinyint NOT NULL default '0',
   `supplier_url` varchar(255) collate utf8mb4_unicode_ci default NULL,
   `manufacturers_id` int unsigned NOT NULL default '0' COMMENT 'RELATION to glpi_manufacturers (id)',
   `suppliers_id` int unsigned NOT NULL default '0' COMMENT 'RELATION to glpi_suppliers (id)',
   `warranty_duration` int unsigned NOT NULL default '0',
   `document_adding` int unsigned NOT NULL default '0',
   `documentcategories_id` int unsigned NOT NULL default '0' COMMENT 'RELATION to glpi_documentcategories (id)',
   `comment_adding` int unsigned NOT NULL default '0',
   `supplier_key` VARCHAR(255) default NULL,
   `supplier_secret` VARCHAR(255) NULL DEFAULT NULL,
   `token_url` VARCHAR(255) NULL DEFAULT NULL,
   `warranty_url` VARCHAR(255) NULL DEFAULT NULL,
   PRIMARY KEY  (`id`),
   KEY `name` (`name`),
   KEY `entities_id` (`entities_id`),
   KEY `manufacturers_id` (`manufacturers_id`),
   KEY `suppliers_id` (`suppliers_id`),
   KEY `documentcategories_id` (`documentcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `glpi_plugin_manufacturersimports_logs`;
CREATE TABLE `glpi_plugin_manufacturersimports_logs` (
   `id` int unsigned NOT NULL auto_increment,
   `import_status` int unsigned NOT NULL default '0',
   `items_id` int unsigned NOT NULL default '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
   `itemtype` varchar(100) collate utf8mb4_unicode_ci NOT NULL COMMENT 'see .class.php file',
   `documents_id` int unsigned NOT NULL default '0' COMMENT 'RELATION to glpi_documents (id)',
   `date_import` timestamp NULL DEFAULT NULL,
   PRIMARY KEY  (`id`),
   UNIQUE KEY `unicity` (`import_status`,`items_id`,`itemtype`),
  KEY `FK_device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
