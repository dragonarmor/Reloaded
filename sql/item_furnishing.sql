-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 03 Janvier 2012 à 19:42
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `item_furnishing`
--

DROP TABLE IF EXISTS `item_furnishing`;
CREATE TABLE IF NOT EXISTS `item_furnishing` (
  `itemid` smallint(5) unsigned NOT NULL,
  `name` text NOT NULL,
  `storage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `moghancement` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `aura` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=25 PACK_KEYS=1 CHECKSUM=1;

--
-- Contenu de la table `item_furnishing`
--

INSERT INTO `item_furnishing` VALUES (1, 'pile_of_chocobo_bedding', 1, 0, 7, 2);
INSERT INTO `item_furnishing` VALUES (2, 'simple_bed', 1, 0, 5, 3);
INSERT INTO `item_furnishing` VALUES (3, 'oak_bed', 1, 0, 2, 5);
INSERT INTO `item_furnishing` VALUES (4, 'mahogany_bed', 1, 0, 6, 7);
INSERT INTO `item_furnishing` VALUES (5, 'bronze_bed', 1, 0, 1, 6);
INSERT INTO `item_furnishing` VALUES (6, 'nobles_bed', 1, 0, 4, 12);
INSERT INTO `item_furnishing` VALUES (7, 'gold_bed', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (8, 'royal_bed', 2, 0, 7, 8);
INSERT INTO `item_furnishing` VALUES (21, 'desk', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (22, 'workbench', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (23, 'maple_table', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (24, 'oak_table', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (26, 'tarutaru_desk', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (28, 'drawing_desk', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (29, 'secretaire', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (30, 'bureau', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (32, 'dresser', 15, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (33, 'millionaire_desk', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (43, 'wicker_box', 4, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (46, 'armor_box', 5, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (49, 'coffer', 5, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (51, 'chest', 3, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (55, 'cabinet', 7, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (56, 'commode', 6, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (57, 'cupboard', 6, 1, 0, 6);
INSERT INTO `item_furnishing` VALUES (59, 'chiffonier', 6, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (61, 'armoire', 14, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (76, 'royal_bookshelf', 10, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (77, 'bookshelf', 20, 1, 0, 8);
INSERT INTO `item_furnishing` VALUES (86, 'san_dorian_holiday_tree', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (87, 'kadomatsu', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (88, 'timepiece', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (89, 'wastebasket', 2, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (90, 'rusty_bucket', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (91, 'blue_pitcher', 4, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (92, 'tarutaru_stool', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (93, 'water_cask', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (95, 'water_barrel', 6, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (96, 'beverage_barrel', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (97, 'bookholder', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (98, 'scimitar_cactus', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (99, 'elshimo_palm', 1, 0, 0, 2);
INSERT INTO `item_furnishing` VALUES (102, 'flower_stand', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (103, 'goldfish_bowl', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (104, 'tarutaru_folding_screen', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (105, 'sky_pot', 7, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (106, 'red_jar', 7, 1, 0, 5);
INSERT INTO `item_furnishing` VALUES (107, 'water_jug', 2, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (109, 'urn', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (110, 'white_jar', 6, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (112, 'yellow_jar', 4, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (113, 'cleaning_tool_set', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (114, 'my_first_magic_kit', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (115, 'bastokan_holiday_tree', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (116, 'windurstian_holiday_tree', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (117, 'wing_egg', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (118, 'lamp_egg', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (119, 'flower_egg', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (120, 'freshwater_aquarium', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (121, 'saltwater_aquarium', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (122, 'amir_bed', 1, 0, 0, 6);
INSERT INTO `item_furnishing` VALUES (123, 'athenienne', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (124, 'wardrobe', 10, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (125, 'reliquary', 8, 0, 0, 2);
INSERT INTO `item_furnishing` VALUES (126, 'falsiam_vase', 6, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (127, 'coffee_table', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (128, 'console', 6, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (129, 'imperial_standard', 1, 0, 0, 9);
INSERT INTO `item_furnishing` VALUES (130, 'marble_bed', 1, 0, 0, 16);
INSERT INTO `item_furnishing` VALUES (131, 'stationery_set', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (132, 'tableware_set', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (133, 'tea_set', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (134, 'copy_of_emeralda', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (135, 'magic_tome_set', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (136, 'set_of_kaiserin_cosmetics', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (137, 'cordon_bleu_cooking_set', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (138, 'jeunoan_tree', 4, 0, 4, 3);
INSERT INTO `item_furnishing` VALUES (139, 'star_globe', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (140, 'dream_platter', 2, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (141, 'dream_coffer', 2, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (142, 'drogarogas_fang', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (143, 'ngoma', 2, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (144, 'caisson', 5, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (145, 'thurible', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (146, 'walahra_burner', 3, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (147, 'imperial_tapestry', 2, 0, 0, 3);
INSERT INTO `item_furnishing` VALUES (148, 'cartonnier', 20, 0, 0, 12);
INSERT INTO `item_furnishing` VALUES (149, 'set_of_alchemists_tools', 1, 0, 0, 4);
INSERT INTO `item_furnishing` VALUES (150, 'leather_pot', 4, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (151, 'stack_of_fools_gold', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (152, 'flowerpot', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (153, 'mastersmith_anvil', 1, 0, 0, 9);
INSERT INTO `item_furnishing` VALUES (154, 'miniature_airship', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (155, 'dream_stocking', 2, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (176, 'snowman_knight', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (177, 'snowman_miner', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (178, 'snowman_mage', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (179, 'jeweled_egg', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (180, 'bonbori', 2, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (181, 'san_dorian_flag', 1, 0, 0, 9);
INSERT INTO `item_furnishing` VALUES (182, 'bastokan_flag', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (183, 'windurstian_flag', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (184, 'jeunoan_flag', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (185, 'rook_banner', 1, 1, 0, 7);
INSERT INTO `item_furnishing` VALUES (186, 'shield_plaque', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (187, 'buckler_plaque', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (188, 'copy_of_acolytes_grief', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (189, 'copy_of_autumns_end_in_gustaberg', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (190, 'copy_of_lines_and_space', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (191, 'fishing_hole_map', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (192, 'copy_of_hoary_spire', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (193, 'adventuring_certificate', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (194, 'blacksmiths_plaque', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (195, 'stuffed_big_one', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (196, 'melodious_egg', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (197, 'clockwork_egg', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (198, 'gilt_tapestry', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (199, 'hatchling_egg', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (200, 'tsahyan_mask', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (201, 'totem_pole', 1, 1, 0, 8);
INSERT INTO `item_furnishing` VALUES (202, 'golden_fleece', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (203, 'bomb_lantern', 1, 1, 0, 2);
INSERT INTO `item_furnishing` VALUES (204, 'pumpkin_lantern', 1, 1, 0, 2);
INSERT INTO `item_furnishing` VALUES (205, 'mandragora_lantern', 1, 1, 0, 2);
INSERT INTO `item_furnishing` VALUES (206, 'copy_of_ancient_blood', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (207, 'fire_lamp', 1, 1, 0, 2);
INSERT INTO `item_furnishing` VALUES (208, 'ice_lamp', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (209, 'wind_lamp', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (210, 'earth_lamp', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (211, 'lightning_lamp', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (212, 'water_lamp', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (213, 'light_lamp', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (214, 'dark_lamp', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (215, 'set_of_festival_dolls', 3, 1, 0, 3);
INSERT INTO `item_furnishing` VALUES (216, 'porcelain_flowerpot', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (217, 'brass_flowerpot', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (218, 'earthen_flowerpot', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (219, 'ceramic_flowerpot', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (220, 'wooden_flowerpot', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (221, 'arcane_flowerpot', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (222, 'fighting_fish_tank', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (223, 'river_aquarium', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (224, 'bay_aquarium', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (225, 'reef_aquarium', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (246, 'blackhorn', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (247, 'stripehorn', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (248, 'whitehorn', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (256, 'hume_?_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (257, 'hume_?_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (258, 'elvaan_?_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (259, 'elvaan_?_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (260, 'tarutaru_?_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (261, 'tarutaru_?_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (262, 'mithra_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (263, 'galka_mannequin', 28, 0, 6, 6);
INSERT INTO `item_furnishing` VALUES (264, 'stuffed_chocobo', 4, 0, 0, 4);
INSERT INTO `item_furnishing` VALUES (265, 'adamantoise_statue', 4, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (266, 'behemoth_statue', 4, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (267, 'fafnir_statue', 4, 1, 0, 3);
INSERT INTO `item_furnishing` VALUES (268, 'nomad_moogle_statue', 4, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (269, 'shadow_lord_statue', 4, 0, 7, 3);
INSERT INTO `item_furnishing` VALUES (270, 'odin_statue', 4, 0, 7, 3);
INSERT INTO `item_furnishing` VALUES (271, 'alexander_statue', 4, 0, 6, 5);
INSERT INTO `item_furnishing` VALUES (272, 'ark_angel_hm_statue', 1, 0, 7, 3);
INSERT INTO `item_furnishing` VALUES (273, 'ark_angel_ev_statue', 1, 0, 7, 3);
INSERT INTO `item_furnishing` VALUES (274, 'ark_angel_tt_statue', 1, 0, 7, 3);
INSERT INTO `item_furnishing` VALUES (275, 'ark_angel_mr_statue', 1, 0, 7, 3);
INSERT INTO `item_furnishing` VALUES (276, 'ark_angel_gk_statue', 1, 0, 7, 3);
INSERT INTO `item_furnishing` VALUES (277, 'prishe_statue', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (295, 'bonfire', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (303, 'crystal_stakes_gold_cup', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (304, 'crystal_stakes_mythril_cup', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (305, 'crystal_stakes_bronze_cup', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (307, 'mythril_trophy', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (308, 'bronze_trophy', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (309, 'yellow_vcs_plaque', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (310, 'black_vcs_plaque', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (311, 'red_vcs_plaque', 1, 1, 0, 1);
INSERT INTO `item_furnishing` VALUES (312, 'blue_vcs_plaque', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (313, 'green_vcs_plaque', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (314, '9-drawer_almirah', 16, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (315, '6-drawer_almirah', 15, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (316, '3-drawer_almirah', 14, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (317, 'bronze_rose', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (318, 'crystal_rose', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (319, 'shell_lamp', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (320, 'harpsichord', 4, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (321, 'mythril_bell', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (322, 'horn_trophy', 2, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (323, 'sprig_of_red_bamboo_grass', 2, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (324, 'sprig_of_blue_bamboo_grass', 2, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (325, 'sprig_of_green_bamboo_grass', 2, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (326, 'yellow_hobby_bo', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (327, 'red_hobby_bo', 1, 1, 0, 1);
INSERT INTO `item_furnishing` VALUES (328, 'black_hobby_bo', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (329, 'blue_hobby_bo', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (330, 'green_hobby_bo', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (331, 'winged_altar', 2, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (332, 'winged_plaque', 2, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (333, 'winged_balance', 2, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (334, 'blacksmiths_signboard', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (335, 'goldsmiths_signboard', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (336, 'boneworkers_signboard', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (337, 'weavers_signboard', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (338, 'culinarians_signboard', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (339, 'tanners_signboard', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (340, 'fishermans_signboard', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (341, 'carpenters_signboard', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (342, 'alchemists_signboard', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (343, 'harp_stool', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (345, 'san_dorian_marriage_certificate', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (346, 'bastokan_marriage_certificate', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (347, 'windurstian_marriage_certificate', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (349, 'royal_squires_bunk', 3, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (350, 'republican_legionnaires_bedding', 4, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (351, 'federal_mercenarys_hammock', 2, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (352, 'half_partition', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (353, 'spence', 16, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (354, 'bookstack', 16, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (355, 'bread_crock', 9, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (356, 'set_of_guild_flyers', 1, 0, 4, 1);
INSERT INTO `item_furnishing` VALUES (357, 'partition', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (358, 'credenza', 7, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (359, 'bahut', 8, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (360, 'matka', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (361, 'gallipot', 8, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (362, 'fluoro-flora', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (363, 'amigo_cactus', 2, 0, 0, 4);
INSERT INTO `item_furnishing` VALUES (364, 'amiga_cactus', 2, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (365, 'poele_classique', 3, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (366, 'kanonenofen', 3, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (367, 'pot_topper', 3, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (368, 'san_dorian_tea_set', 1, 0, 0, 6);
INSERT INTO `item_furnishing` VALUES (369, 'bastokan_tea_set', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (370, 'windurstian_tea_set', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (371, 'butterfly_cage', 3, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (372, 'cricket_cage', 3, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (373, 'glowfly_cage', 3, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (374, 'parclose', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (375, 'cs_gold_stand', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (376, 'cs_mythril_stand', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (377, 'cs_bronze_stand', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (378, 'blue_9-drawer_almirah', 16, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (379, 'blue_6-drawer_almirah', 15, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (380, 'blue_3-drawer_almirah', 14, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (381, 'green_9-drawer_almirah', 16, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (382, 'green_6-drawer_almirah', 15, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (383, 'green_3-drawer_almirah', 14, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (384, 'yellow_9-drawer_almirah', 16, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (385, 'yellow_6-drawer_almirah', 15, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (386, 'yellow_3-drawer_almirah', 14, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (387, 'white_9-drawer_almirah', 16, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (388, 'white_6-drawer_almirah', 15, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (389, 'white_3-drawer_almirah', 14, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (390, 'carmine_desk', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (391, 'cerulean_desk', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (392, 'myrtle_desk', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (393, 'ecru_desk', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (394, 'blue_tarutaru_desk', 2, 0, 4, 4);
INSERT INTO `item_furnishing` VALUES (395, 'green_tarutaru_desk', 2, 0, 3, 4);
INSERT INTO `item_furnishing` VALUES (396, 'yellow_tarutaru_desk', 1, 0, 2, 4);
INSERT INTO `item_furnishing` VALUES (397, 'white_tarutaru_desk', 2, 0, 6, 4);
INSERT INTO `item_furnishing` VALUES (402, 'blue_nobles_bed', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (403, 'green_nobles_bed', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (404, 'yellow_nobles_bed', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (405, 'white_nobles_bed', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (406, 'blue_tarutaru_standing_screen', 1, 0, 4, 3);
INSERT INTO `item_furnishing` VALUES (407, 'green_tarutaru_standing_screen', 1, 0, 3, 3);
INSERT INTO `item_furnishing` VALUES (408, 'yellow_tarutaru_standing_screen', 1, 0, 1, 3);
INSERT INTO `item_furnishing` VALUES (409, 'white_tarutaru_standing_screen', 1, 0, 6, 3);
INSERT INTO `item_furnishing` VALUES (410, 'red_round_table', 5, 1, 0, 3);
INSERT INTO `item_furnishing` VALUES (411, 'blue_round_table', 5, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (412, 'green_round_table', 5, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (413, 'yellow_round_table', 5, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (414, 'white_round_table', 5, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (415, 'aldebaran_horn', 3, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (416, 'tomeshelf', 10, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (417, 'storage_hutch', 12, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (418, 'tidings_board', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (419, 'leisure_table', 2, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (420, 'pot_of_meadsweet', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (421, 'vase_of_rulude_orchids', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (422, 'elshimo_pachira', 2, 0, 0, 1);
INSERT INTO `item_furnishing` VALUES (423, 'tavern_bench', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (424, 'feasting_table', 7, 0, 1, 7);
INSERT INTO `item_furnishing` VALUES (425, 'girandola', 3, 0, 0, 4);
INSERT INTO `item_furnishing` VALUES (426, 'orchestrion', 2, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (429, 'red_storm_lantern', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (430, 'blue_storm_lantern', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (431, 'green_storm_lantern', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (432, 'yellow_storm_lantern', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (433, 'white_storm_lantern', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (438, 'orblight', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (440, 'squat_desk', 4, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (441, 'taru_tot_toyset', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (445, 'vaisselier_royale', 8, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (450, 'candelabrum', 1, 0, 0, 1);
INSERT INTO `item_furnishing` VALUES (451, 'egg_stool', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (452, 'egg_table', 3, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (453, 'egg_locker', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (454, 'egg_lantern', 1, 0, 0, 5);
INSERT INTO `item_furnishing` VALUES (455, 'egg_buffet', 10, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (456, 'pepo_lantern', 10, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (457, 'cushaw_lantern', 6, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (458, 'calabazilla_lantern', 2, 0, 7, 6);
INSERT INTO `item_furnishing` VALUES (459, 'candle_holder', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (460, 'bakery_platter', 1, 0, 5, 1);
INSERT INTO `item_furnishing` VALUES (461, 'buffalo_milk_case', 4, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3584, 'panetiere', 65, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3585, 'galley_kitchen', 17, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (3586, 'pot_of_red_viola', 4, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3587, 'pot_of_blue_viola', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3588, 'pot_of_yellow_viola', 4, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3589, 'pot_of_white_viola', 4, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3592, 'jewelry_case', 6, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3593, 'keepsake_case', 6, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3594, 'gemstone_case', 6, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3595, 'gemscope', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3596, 'ornament_case', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3598, 'opus_shelf', 14, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3609, 'stepping_stool', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3610, 'red_mariners_bed', 2, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3611, 'blue_mariners_bed', 2, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3612, 'green_mariners_bed', 2, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3613, 'yellow_mariners_bed', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3614, 'white_mariners_bed', 2, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3619, 'couronne_des_etoiles', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3620, 'silberkranz', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3621, 'leafberry_wreath', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3622, 'jack-o-pricket', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3623, 'djinn_pricket', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3624, 'korrigan_pricket', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3625, 'blacksmiths_stall', 20, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3626, 'goldsmiths_stall', 20, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3627, 'boneworkers_stall', 20, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3628, 'weavers_stall', 20, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3629, 'culinarians_stall', 20, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3630, 'tanners_stall', 20, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3631, 'fishermens_stall', 20, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (3632, 'carpenters_stall', 20, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3633, 'alchemists_stall', 20, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (3634, 'starlight_cake', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3635, 'buche_des_etoiles', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3636, 'serving_of_bavarois_potiron', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3637, 'banquet_set', 1, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3638, 'plate_of_mock_hare', 1, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3639, 'purifying_ewer', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (3640, 'rolanberry_delightaru', 1, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3641, 'kabuto-kazari', 2, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3642, 'katana-kazari', 1, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (3643, 'carillon_vermeil', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3644, 'aeolsglocke', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3645, 'leafbell', 1, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3646, 'mandragora_pricket', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3647, 'spook-a-swirl', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3648, 'chocolate_grumpkin', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3649, 'harvest_horror', 1, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3655, 'treasury_table', 10, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3656, 'treasury_stand', 10, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3657, 'sundries_table', 10, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (3658, 'sundries_stand', 10, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (3659, 'supply_table', 10, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3660, 'supply_stand', 10, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3661, 'stone_hearth', 4, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3662, 'case_of_display_blades', 2, 0, 0, 0);
INSERT INTO `item_furnishing` VALUES (3663, 'set_of_bonecrafting_tools', 4, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3664, 'shell_assortment', 2, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3665, 'spinning_wheel', 4, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3666, 'set_of_fine_raiments', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3667, 'brass_crock', 4, 0, 2, 0);
INSERT INTO `item_furnishing` VALUES (3668, 'hide_stretcher', 4, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3669, 'set_of_courier_bags', 2, 0, 1, 0);
INSERT INTO `item_furnishing` VALUES (3670, 'net_and_lure', 4, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (3671, 'set_of_stockfish', 2, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (3672, 'carpenters_kit', 4, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3673, 'set_of_chocobo_carvings', 2, 0, 3, 0);
INSERT INTO `item_furnishing` VALUES (3674, 'alembic', 4, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (3675, 'flask_set', 2, 0, 4, 0);
INSERT INTO `item_furnishing` VALUES (3676, 'celestial_globe', 5, 0, 7, 0);
INSERT INTO `item_furnishing` VALUES (3677, 'spinet', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3678, 'recital_bench', 1, 0, 6, 0);
INSERT INTO `item_furnishing` VALUES (3729, 'light_chest', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (3730, 'bulky_coffer', 1, 0, 5, 0);
INSERT INTO `item_furnishing` VALUES (3731, 'azure_chest', 1, 0, 5, 0);