-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 juil. 2024 à 14:12
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `my_plant_project`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240704164956', '2024-07-26 13:53:58', 84);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:170:\\\"https://127.0.0.1:8000/verify/email?expires=1721901738&signature=NGd3Q1eb2Szw39befw%2FDn%2FIhp68REkVZWjaqUDCeouY%3D&token=JQrNHYV3kc6AXh5hLZvR%2BAgdJw3fC037iboQDJ96Occ%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"mailer@fakedoe.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:7:\\\"fakedoe\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:16:\\\"tacite@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-25 09:02:19', '2024-07-25 09:02:19', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:168:\\\"https://127.0.0.1:8000/verify/email?expires=1721904685&signature=dah2T5jQm68IGqm6LCIyEBg8VD8x%2Bec2XCrHxj%2FrS3Q%3D&token=J3Q49fvny0Dq45ehUp2NAfFqSliRw75YrbuNnCQjZ5Y%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"mailer@fakedoe.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:7:\\\"fakedoe\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"test3@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-07-25 09:51:25', '2024-07-25 09:51:25', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `plant`
--

DROP TABLE IF EXISTS `plant`;
CREATE TABLE IF NOT EXISTS `plant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flowering_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plant`
--

INSERT INTO `plant` (`id`, `name`, `latin_name`, `type`, `description`, `size`, `flowering_date`, `created_date`, `updated_date`, `image`, `slug`) VALUES
(4, 'Tulipe', 'Plantae', 'Herbacées', 'Les tulipes sont des plantes vivaces bulbeuses à tiges longues, dures et solitaires, parfois tendues vers le haut.  Les feuilles sont assez peu nombreuses. Elles sont alternes, entières, à nervures peu profondes, charnues.  Les fleurs ont un périanthe constitué de trois pétales et trois sépales, ayant souvent la même couleur que les pétales. Elles comptent six étamines.  Le fruit est une capsule tripartite contenant de nombreuses graines.  Le génome de la tulipe a été séquencé en 2017. C\'est la deuxième plante ornementale séquencée, après l\'œillet en 2013.', 'Petites', '2024-03-01 00:00:00', '2024-07-26 11:43:58', '2024-07-26 11:43:58', 'tulipe-135728-66a38bfedc2dc.jpg', 'Tulipe'),
(5, 'Cactus', 'Cactaceae', 'Magnoliopsida', 'Les Cactus, Cactées ou encore Cactacées (Cactaceae) sont une famille de plantes à fleurs d\'origine quasi exclusivement américaine. Ce sont presque toutes des plantes grasses ou plantes succulentes, c\'est-à-dire des plantes xérophytes qui stockent dans leurs tissus des réserves de « suc » pour faire face aux longues périodes de sécheresse.', 'Variées', '2004-01-01 00:00:00', '2024-07-26 11:48:08', '2024-07-26 11:48:08', 'cactus-66a38cf8aef1b.jpg', 'Cactus'),
(6, 'magnolias', 'Magnoliopsida', 'Plantes à fleurs', 'Ce sont des arbres ou arbustes, à feuilles généralement grandes, alternes, ovales ou elliptiques, caduques ou persistantes, généralement coriaces.\r\n\r\nLes fleurs solitaires, sont grandes, très décoratives, souvent dressées, généralement en forme de coupe. Le périgone est formé de six à neuf tépales pétaloïdes (pétales et sépales indifférenciés) de couleur claire, blanc rosé, jaune clair. Les étamines, très nombreuses sont lamellaires. Les carpelles sont disposés en cône sur le réceptacle. Pour les botanistes, c\'est une fleur primitive. La floraison apparaît généralement après quinze à trente ans. Les fruits, en forme de cône, sont à déhiscence longitudinale. Ils sont composés d\'un ensemble de follicules (fruit sec dérivé d\'un seul carpelle) et contiennent des graines à tégument rouge.', 'Variées', '2023-05-01 00:00:00', '2024-07-26 11:50:19', '2024-07-26 14:00:01', 'magnolia-66a399a1e1ac6.jpg', 'magnolias'),
(7, 'Rose', 'Rosa', 'Fleur', 'Une fleur colorée et parfumée.', 'Moyenne', '2024-05-15 00:00:00', '2024-07-26 15:58:59', '2024-07-26 14:02:13', 'roses-66a3ac650a12f.jpg', 'Rose'),
(9, 'Orchidée', 'Orchidaceae', 'Fleur', 'Fleur exotique et élégante.', 'Grande', '2024-06-20 00:00:00', '2024-07-26 15:58:59', '2024-07-26 14:03:29', 'orchidee-66a3acb17f2da.jpg', 'Orchidee'),
(10, 'Lilas', 'Syringa', 'Arbuste', 'Arbuste avec des grappes de fleurs parfumées.', 'Moyenne', '2024-05-25 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'lilas'),
(11, 'Marguerite', 'Bellis perennis', 'Fleur', 'Fleur simple avec un cœur jaune.', 'Petite', '2024-07-15 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'marguerite'),
(12, 'Jasmin', 'Jasminum', 'Fleur', 'Plante grimpante aux fleurs parfumées.', 'Grande', '2024-08-01 00:00:00', '2024-07-26 15:58:59', '2024-07-26 14:05:45', 'jasmin-66a3ad39900ea.jpg', 'Jasmin'),
(13, 'Lys', 'Lilium', 'Fleur', 'Grande fleur élégante et parfumée.', 'Grande', '2024-07-10 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'lys'),
(14, 'Violette', 'Viola', 'Fleur', 'Petite fleur délicate et parfumée.', 'Petite', '2024-06-05 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'violette'),
(15, 'Hortensia', 'Hydrangea', 'Arbuste', 'Arbuste aux grandes fleurs en boules.', 'Grande', '2024-06-30 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'hortensia'),
(16, 'Camélia', 'Camellia', 'Fleur', 'Fleur élégante avec des pétales soyeux.', 'Grande', '2024-05-01 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'camelia'),
(17, 'Pivoine', 'Paeonia', 'Fleur', 'Fleur avec des pétales luxuriants.', 'Grande', '2024-05-20 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'pivoine'),
(18, 'Fuchsia', 'Fuchsia', 'Fleur', 'Fleur pendante avec des couleurs vives.', 'Petite', '2024-07-05 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'fuchsia'),
(19, 'Géranium', 'Pelargonium', 'Fleur', 'Plante avec des fleurs en grappes.', 'Petite', '2024-06-15 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'geranium'),
(20, 'Dahlia', 'Dahlia', 'Fleur', 'Fleur avec de grandes pétales colorés.', 'Grande', '2024-08-10 00:00:00', '2024-07-26 15:58:59', '2024-07-26 14:07:31', 'dahlia-66a3ada3cf827.jpg', 'Dahlia'),
(21, 'Lavande', 'Lavandula', 'Fleur', 'Plante aromatique avec des fleurs violettes.', 'Moyenne', '2024-07-25 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'lavande'),
(22, 'Bégonia', 'Begonia', 'Fleur', 'Fleur avec des couleurs vives et variées.', 'Petite', '2024-05-30 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'begonia'),
(23, 'Boule de neige', 'Viburnum', 'Arbuste', 'Arbuste avec des fleurs en boule blanche.', 'Grande', '2024-06-10 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'boule-de-neige'),
(24, 'Pâquerette', 'Bellis', 'Fleur', 'Petite fleur avec un cœur jaune et des pétales blancs.', 'Petite', '2024-05-05 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'paquerette'),
(25, 'Anémone', 'Anemone', 'Fleur', 'Fleur délicate avec des pétales variés.', 'Petite', '2024-06-25 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'anemone'),
(26, 'Basilic', 'Ocimum basilicum', 'Herbe', 'Plante aromatique avec des feuilles parfumées.', 'Petite', '2024-07-15 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'basilic'),
(27, 'Thym', 'Thymus', 'Herbe', 'Plante aromatique avec des petites feuilles.', 'Petite', '2024-08-05 00:00:00', '2024-07-26 15:58:59', '2024-07-26 15:58:59', NULL, 'thym');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roles`, `is_verified`) VALUES
(16, 'user@gmail.com', '$2y$13$Rrf5HlfIYmzwk7aTMfxJ8.60KFnndGetNtVVNot.zz1Ylpnkp8O16', '[\"ROLE_USER\"]', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
