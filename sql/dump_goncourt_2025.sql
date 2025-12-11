-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 11 déc. 2025 à 07:34
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt_2025`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id_author` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `biography` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_author`),
  KEY `idx_author_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id_author`, `first_name`, `last_name`, `biography`) VALUES
(1, 'Nathacha', 'Appanah', 'Nathacha Appanah est romancière. Ses romans ont été récompensés par plusieurs prix littéraires et traduits dans de nombreux pays. La nuit au coeur est son douzième livre.'),
(2, 'Emmanuel', 'Carrère', 'Emmanuel Carrère est né en 1957. D\'abord journaliste il a publié un essai sur le cinéaste Werner Herzog en 1982 puis L\'Amie du jaguar Bravoure (prix Passion 1984 prix de la Vocation 1985), Le Détroit de Behring essai sur l\'Histoire imaginaire (prix Valery Larbaud et Grand Prix de la science-fiction française 1987),Hors d\'atteinte ? et une biographie du romancier Philip K. Dick : Je suis vivant et vous êtes morts. La Classe de neige prix Femina 1995 a été porté à l\'écran par Claude Miller et L\'Adversaire par Nicole Garcia. En 2003 Emmanuel Carrère réalise un documentaire Retour à Kotelnitch et adapte lui-même en 2004 La Moustache avec Vincent Lindon et Emmanuelle Devos. Il a depuis écrit Un roman russe, D\'autres vies que la mienne, Limonov prix Renaudot 2011, Le Royaume prix littéraire Le Monde, lauréat-palmarès Le Point, Meilleur livre de l\'année, Lire 2014, Il est avantageux d\'avoir où aller et Yoga. En 2020 il a réalisé un nouveau film Ouistreham d\'après le livre de Florence Aubenas avec Juliette Binoche et des actrices non professionnelles. Ses livres sont traduits dans une vingtaine de langues.'),
(3, 'David', 'Deneufgermain', 'David Deneufgermain est écrivain-médecin. Psychiatre, il a exercé en prison, en hôpital psychiatrique et soigne depuis onze ans les malades à la rue et dans son cabinet. L\'Adieu au visage est son premier roman du réel.'),
(4, 'David', 'Diop', 'Né en 1966, David Diop est l\'auteur de trois romans, dont deux publiés aux éditions du Seuil : Frère d\'âme (prix Goncourt des lycéens 2018, International Booker Prize 2021) et La Porte du voyage sans retour (finaliste du National Book Award 2023).'),
(5, 'Ghislaine', 'Dunant', 'Ghislaine Dunant a publié trois romans aux éditions Gallimard, dont son premier, très remarqué, L\'Impudeur (1989). Elle a reçu le prix Michel-Dentan (2008) pour Un effondrement et le prix Femina essai pour Charlotte Delbo. La vie retrouvée (2016), tous deux parus chez Grasset.Elle vit à Paris.'),
(6, 'Paul', 'Gasnier', 'Né en 1990, Paul Gasnier est journaliste. La collision est son premier récit.'),
(7, 'Yanick', 'Lahens', 'Lauréate du prix Femina 2014 pour Bain de lune, titulaire de la chaire des Mondes francophones au Collège de France en 2019, Yanick Lahens est née en 1953 en Haïti, où elle vit aujourd\'hui encore. Son oeuvre, traduite dans de nombreux pays, est publiée par Sabine Wespieser éditeur.'),
(8, 'Caroline', 'Lamarche', 'Caroline Lamarche vit à Liège. Son oeuvre témoigne d\'un éclectisme et d\'une hardiesse renouvelés de livre en livre. Elle a notamment obtenu le prix Rossel avec Le Jour du Chien (Les Éditions de Minuit) et le Goncourt de la nouvelle pour Nous sommes à la lisière (Gallimard). Elle signe avec Le Bel Obscur son retour au roman.'),
(9, 'Hélène', 'Laurain', 'Hélène Laurain, née en 1988 à Metz, est une autrice française. Son deuxième roman, Tambora, fait partie de la première sélection du Prix Goncourt 2025.'),
(10, 'Charif', 'Majdalani', 'Charif Majdalani est écrivain et professeur à l\'université Saint-Joseph à Beyrouth. Il est l\'auteur d\'une dizaine de livres dont Histoire de la grande maison (Seuil, 2005), Villa des femmes (Seuil, prix Jean Giono 2015), Beyrouth 2020 : Journal d\'un effondrement (Actes Sud, prix spécial du jury Femina 2020) et Dernière Oasis (Actes Sud, 2021).'),
(11, 'Laurent', 'Mauvignier', 'Laurent Mauvignier, né le 6 juillet 1967 à Tours, est un écrivain français. Frère du réalisateur Thierry Mauvignier et de l\'écrivain psychanalyste Frédéric Mauvignier, il est ancien pensionnaire de la Villa Médicis. Il obtient le prix Goncourt 2025 pour son roman La Maison vide publié aux éditions de Minuit.'),
(12, 'Alfred', 'de Montesquiou', 'Diplômé de Sciences Po, reporter de guerre, lauréat du prix Albert-Londres. Alfred de Montesquiou est réalisateur et écrivain. Son premier roman, L\'Étoile des frontières, est paru en 2021.'),
(13, 'Guillaume', 'Poix', 'Né en 1986, Guillaume Poix a publié plusieurs pièces aux Éditions Théâtrales, dont Soudain Romy Schneider, Un sacre/La vie invisible et Léviathan (matériau). Il est l\'auteur de trois romans aux Éditions Verticales : Les fils conducteurs (prix Wepler-Fondation La Poste, 2017), Là d\'où je viens a disparu (2020) et Star (2023).'),
(14, 'Maria', 'Pourchet', 'Maria Pourchet est écrivaine. Elle est notamment l\'autrice de Rome en un jour (2013), Toutes les femmes sauf une (prix Révélation de la SGDL 2018), Feu (2021) et Western (prix de Flore 2023).'),
(15, 'David', 'Thomas', 'David Thomas est l\'auteur de plusieurs romans et recueils d\'instantanés parmi lesquels La Patience des buffles sous la pluie ou Seul entouré de chiens qui mordent (prix de la nouvelle de l\'Académie française 2021). Son dernier livre, Partout les autres, a été couronné en 2023 par le prix Goncourt de la nouvelle.');

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `summary` text COLLATE utf8mb4_general_ci,
  `publication_date` date DEFAULT NULL,
  `page_count` int UNSIGNED DEFAULT NULL,
  `isbn` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `author_id` int UNSIGNED NOT NULL,
  `publisher_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_book`),
  KEY `idx_book_title` (`title`),
  KEY `idx_book_author` (`author_id`),
  KEY `idx_book_publisher` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id_book`, `title`, `summary`, `publication_date`, `page_count`, `isbn`, `price`, `author_id`, `publisher_id`) VALUES
(1, 'La nuit au cœur', 'De ces nuits et de ces vies, de ces femmes qui courent, de ces coeurs qui luttent, de ces instants qui sont si accablants qu\'ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l\'impossibilité de la vérité entière à chaque page mais la quête désespérée d\'une justesse au plus près de la vie, de la nuit, du coeur, du corps, de l\'esprit. De ces trois femmes, il a fallu commencer par la première, celle qui vient d\'avoir vingt-cinq ans quand elle court et qui est la seule à être encore en vie aujourd\'hui. Cette femme, c\'est moi. » La nuit au coeur entrelace trois histoires de femmes victimes de la violence de leur compagnon. Sur le fil entre force et humilité, Nathacha Appanah scrute l\'énigme insupportable du féminicide conjugal, quand la nuit noire prend la place de l\'amour.', '2025-08-21', 282, '9782073080028', 21.00, 1, 1),
(2, 'Kolkhoze', 'Cette nuit-là, rassemblés tous les trois autour de notre mère, nous avons pour la dernière fois fait kolkhoze.', '2025-08-28', 558, '9782818061985', 24.00, 2, 2),
(3, 'L\'Adieu au visage', 'Mars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son temps entre son équipe mobile qui maraude dans une ville fantôme à la recherche de marginaux à protéger, et les unités covid où les malades meurent seuls, privés de tout rite. Entre obéissance à la loi et refus de l\'horreur, que ce soit à l\'hôpital ou dehors, chacun à son niveau cherche des solutions et improvise. L\'Adieu au visage est l\'écriture d\'une résistance fragile et d\'une lutte pour prendre soin de l\'autre. « Au commencement, on ne lave plus les corps, on ne les coiffe plus, on ne les habille plus, on ne les présente plus - d\'accompagner les morts, il n\'est plus question. »', '2025-08-20', 261, '9782381340647', 21.10, 3, 3),
(4, 'Où s’adosse le ciel', 'À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque et s\'apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe, sous le regard incrédule d\'un médecin français qui cherche à percer les secrets de son immunité. En pure perte. Déjà, Bilal est ailleurs, porté par une autre histoire, celle qu\'il ne cesse de psalmodier, un mythe immense, demeuré intact en lui, transmis par la grande chaîne de la parole qui le relie à ses ancêtres. Une odyssée qui fut celle du peuple égyptien, alors sous le joug des Ptolémées, conduite par Ounifer, grand prêtre d\'Osiris qui caressait le rêve de rendre leur liberté aux siens, les menant vers l\'ouest à travers les déserts, jusqu\'à une terre promise, un bel horizon, là où s\'adosse le ciel... Ce chemin, Bilal l\'emprunte à son tour, vers son pays natal, en passant par Djenné, la cité rouge, où vint buter un temps le voyage d\'Ounifer et de son peuple. De l\'Égypte ancienne au Sénégal, David Diop signe un roman magistral sur un homme parti à la reconquête de ses origines et des sources immémoriales de sa parole.', '2025-08-14', 363, '9782260057307', 22.50, 4, 4),
(5, 'Un amour infini', 'Elle est descendue en retard, elle voulait encore fumer une cigarette, fumer seule, une fois de plus. Pour sentir le temps qui passe, ne plus savoir qui elle est, ni ce qu\'on peut vouloir d\'elle. Ce roman installe le lecteur au coeur d\'une rencontre de trois jours sur l\'île de Ténérife, en juin 1964, prévue mais bouleversée par un événement tragique, entre un astrophysicien d\'origine hongroise qui a dû fuir l\'Europe et s\'exiler aux États-Unis et une mère de famille française. Alors que rien ne devrait les rapprocher, leurs conversations sur leurs passés distincts et l\'exploration de l\'île vont les ouvrir profondément l\'un à l\'autre. Le ciel, l\'univers, l\'histoire de la Terre... Les sujets de l\'astrophysicien rejoignent la sensibilité de celle qui a observé le mystère de la toute petite enfance et a toujours eu une approche sensitive des êtres. Leur désir réciproque va s\'accompagner de la puissance des éléments qui les entourent. 1964. Sur l\'île de Tenerife. Une femme et un homme que rien ne destinait à se rencontrer, et, pourtant, durant 3 jours, en cette géographie volcanique et insulaire, naîtra l\'une des plus belles rencontres amoureuses écrites ces dernières années...Roman sensible subtile et sensuel, où le paysage cosmique, absolu de l\'île de Tenerife et la rencontre entre Louise et Nathan confluent si intimement que l\'impression laissée par cette histoire à l\'écriture aussi délicate que tellurique perdure infiniment.', '2025-08-20', 170, '9782226498687', 19.90, 5, 5),
(6, 'La collision', 'En 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h. Dix ans plus tard, son fils, qui n\'a cessé d\'être hanté par le drame, est devenu journaliste. Il observe la façon dont ce genre de catastrophe est utilisé quotidiennement pour fracturer la société et dresser une partie de l\'opinion contre l\'autre. Il décide de se replonger dans la complexité de cet accident, et de se lancer sur les traces du motard pour comprendre d\'où il vient, quel a été son parcours et comment un tel événement a été rendu possible. En décortiquant ce drame familial, Paul Gasnier révèle deux destins qui s\'écrivent en parallèle, dans la même ville, et qui s\'ignorent jusqu\'au jour où ils entrent violemment en collision. C\'est aussi l\'histoire de deux familles qui racontent chacune l\'évolution du pays. Un récit en forme d\'enquête littéraire qui explore la force de nos convictions quand le réel les met à mal, et les manquements collectifs qui créent l\'irrémédiable.', '2025-08-21', 160, '9782073101228', 19.00, 6, 1),
(7, 'Passagères de nuit', 'Dans ce nouveau roman, comme arraché au chaos de son quotidien à Port-au-Prince, Yanick Lahens rend un hommage d’espoir et de résistance à la lignée des femmes dont elle est issue. La première d’entre elles, Élizabeth Dubreuil, naît vers 1820 à La Nouvelle-Orléans. Sa grand-mère, arrivée d’Haïti au début du siècle dans le sillage du maître de la plantation qui avait fini par l’affranchir, n’a plus jamais voulu dépendre d’un homme. Inspirée par ce puissant exemple, la jeune Élisabeth se rebelle à son tour contre le désir prédateur d’un ami de son père. Elle doit fuir la ville, devenant à son tour une « passagère de nuit » sur un bateau à destination de Port-au-Prince. Ce qui adviendra d’elle, nous l’apprendrons quand son existence croisera celle de Régina, autre grande figure de ce roman des origines. Née pauvre parmi les pauvres dans un hameau du sud de l’île d’Haïti, Régina elle aussi a forcé le destin : rien ne la déterminait à devenir la maîtresse d’un des généraux arrivé en libérateur à Port-au-Prince en 1867. C’est à « mon général, mon amant, mon homme » qu’elle adresse le monologue amoureux dans lequel elle évoque sa trajectoire d’émancipation : la cruauté mesquine des maîtres qu’elle a fuis trouve son contrepoint dans les mains tendues par ces femmes qui lui ont appris à opposer aux coups du sort une ténacité silencieuse. Cette ténacité silencieuse, Élizabeth et Régina l’ont reçue en partage de leurs lointaines ascendantes, ces « passagères de nuit » des bateaux négriers, dont Yanick Lahens évoque ici l’effroyable réalité, de même qu’elle nous plonge – et ce n’est pas la moindre qualité de ce très grand livre – dans les convulsions de l’histoire haïtienne. Lorsque les deux héroïnes se rencontreront, dans une scène d’une rare qualité d’émotion, nous, lectrices et lecteurs, comprendrons que l’histoire ne s’écrit pas seulement avec les vainqueurs, mais dans la beauté des gestes, des regards et des mystères tus, qui à bas bruit montrent le chemin d’une résistance forçant l’admiration.', '0000-00-00', 233, '9782848055701', 20.00, 7, 6),
(8, 'Le bel obscur', 'Alors qu’elle tente d’élucider le destin d’un ancêtre banni par sa famille, une femme reprend l’histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur existence comme des péripéties de leur émancipation respective, rien n’est tu. Ce roman lumineux nous offre une leçon de courage, de tolérance, de curiosité aussi. Car jamais cette femme libre n’aura cessé de se réinventer, d’affirmer la puissance de ses rêves contre les conventions sociales, avec une fantaisie et une délicatesse infinies.', '2025-08-22', 229, '9782021603439', 20.00, 8, 7),
(9, 'Tambora', 'Une mère nous parle de ses deux filles, qu’elle voit amples comme des villes en expansion. La première est déjà là quand le récit commence, la seconde naîtra bientôt, après la perte d’un autre enfant lors d’une fausse couche. Ici, la temporalité de la maternité domine : celle de grossesses compliquées, d’hôpitaux et de services des urgences, la temporalité d’un corps qui produit, parfois sans qu’on le veuille, la temporalité de la naissance, celle des soins, ou des désirs trop souvent empêchés. Mais d’autres réalités existent aussi, se faufilent et tentent de prendre leur place : un manuscrit qui intéresse un éditeur, des confinements, qui ne changent pas grand-chose lorsqu’on doit rester alitée, la catastrophe environnementale qui se déploie, gigantesque, et fait songer à la fin du monde que l’humanité a cru vivre en 1815 quand l’éruption du volcan Tambora plongea une partie de la Terre dans le froid et l’obscurité. Hélène Laurain écrit avec cela, et écrit tout cela, avec crudité parfois. Son livre conjugue récit, réflexions et poésie, et nous emmène à la rencontre d’un monde incertain.', '2025-08-28', 192, '9782378562588', 18.50, 9, 8),
(10, 'Le nom des rois', '« Et d\'un seul coup, le monde qui servait de décor à tout cela s\'écroula. J\'en avais été un témoin distrait, mais le bruit qu\'il provoqua en s\'effondrant me fit lever la tête et ce que je vis alors n\'était plus qu\'un univers de violence et de mort. C\'est de celui-là que je suis devenu contemporain. J\'avais été, durant des années, dispensé d\'intérêt pour ce qui se passait autour de moi par ma passion des atlas, par les royautés anciennes et inutiles et par les terres lointaines et isolées, les berceaux de vieux empires oubliés. Désormais, l\'histoire se faisait sous mes yeux et je la trouvais moche, roturière et vulgaire. » Dans ce récit de passage à l\'âge adulte porté par une écriture ample et élégante, Charif Majdalani raconte la disparition d\'un pays et explore ce qui subsiste de l\'enfance lorsqu\'elle capitule devant les fracas du monde.', '2025-08-20', 214, '9782234097278', 20.00, 10, 9),
(11, 'La maison vide', 'En 1976, mon père a rouvert la maison qu’il avait reçue de sa mère, restée fermée pendant vingt ans. À l’intérieur : un piano, une commode au marbre ébréché, une Légion d’honneur, des photographies sur lesquelles un visage a été découpé aux ciseaux. Une maison peuplée de récits, où se croisent deux guerres mondiales, la vie rurale de la première moitié du vingtième siècle, mais aussi Marguerite, ma grand-mère, sa mère Marie-Ernestine, la mère de celle-ci, et tous les hommes qui ont gravité autour d’elles. Toutes et tous ont marqué la maison et ont été progressivement effacés. J’ai tenté de les ramener à la lumière pour comprendre ce qui a pu être leur histoire, et son ombre portée sur la nôtre.', '2025-08-28', 743, '9782707356741', 25.00, 11, 10),
(12, 'Le crépuscule des hommes', 'Nuremberg, 1945 : un procès fait l\'Histoire, eux la vivent. Un roman vrai, qui saisit les sursauts de l\'Histoire en marche. Chacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir de novembre 1945. Mais que se passe-t-il hors de la salle d\'audience ? Ils sont là : Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos, venus assister à ces dix mois où doit oeuvrer la justice. Des dortoirs de l\'étrange château Faber-Castell, qui loge la presse internationale, aux box des accusés, tous partagent la frénésie des reportages, les frictions entre alliés occidentaux et soviétiques, l\'effroi que suscite le récit inédit des déportés. Avec autant de précision historique que de tension romanesque, Alfred de Montesquiou ressuscite des hommes et des femmes de l\'ombre, témoins du procès le plus retentissant du XXe siècle.', '2025-08-28', 382, '9782221267660', 22.00, 12, 11),
(13, 'Perpétuité', '18h45. Une maison d\'arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d\'autres surveillants prennent leur service de nuit. Captifs d\'une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une série d\'incidents plus éprouvants qu\'à l\'ordinaire. En regardant celles et ceux qui regardent, Guillaume Poix plonge dans le quotidien d\'un métier méconnu, sinon méprisé, et interroge le sens d\'une institution au bord du gouffre.', '2025-08-28', 382, '9782221267660', 22.00, 13, 12),
(14, 'Tressaillir', '« J\'ai coupé un lien avec quelque chose d\'aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. » Une femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve mais elle éprouve, prostrée dans une chambre d\'hôtel, l\'élémentaire supplice de l\'arrachement. Et si rompre n\'était pas à sa portée ? Si la seule issue au chagrin, c\'était revenir ? Car sans un homme à ses côtés, cette femme a peur. Depuis toujours sur le qui-vive, elle a peur. Mais au fond, de quoi ? Dans ce texte du retour aux origines et du retour de la joie, Maria Pourchet entreprend une archéologie de ces terreurs d\'enfant qui hantent les adultes. Elle nous transporte au coeur des forêts du Grand Est sur les traces de drames intimes et collectifs.', '2025-08-20', 324, '9782234097155', 21.90, 14, 9),
(15, 'Un frère', '« Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. » David Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depuis la mort brutale d’Édouard jusqu’aux années heureuses, il remonte à la source du lien qu’il a eu avec son aîné et grâce auquel il s’est construit. Lors de ce cheminement, il s’interroge : comment écrire cette histoire sans trahir, sans enjoliver ? Écrire pour rejoindre Édouard. Le retrouver.', '2025-08-24', 139, '9782823623376', 19.50, 15, 13);

-- --------------------------------------------------------

--
-- Structure de la table `book_character`
--

DROP TABLE IF EXISTS `book_character`;
CREATE TABLE IF NOT EXISTS `book_character` (
  `id_character` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `book_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_character`),
  KEY `idx_character_book` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `book_character`
--

INSERT INTO `book_character` (`id_character`, `name`, `book_id`) VALUES
(1, 'Natacha Appanah', 1),
(2, 'Deuxième femme victime', 1),
(3, 'Troisième femme victime', 1),
(4, 'Hélène Carrère d\'Encausse', 2),
(5, 'Emmanuel Carrère', 2),
(6, 'Premier frère', 2),
(7, 'Deuxième frère', 2),
(8, 'Le psychiatre', 3),
(9, 'Les personnes à la rue', 3),
(10, 'Les patients en unités Covid', 3),
(11, 'Bilal Seck', 4),
(12, 'Le médecin français', 4),
(13, 'Ounifer', 4),
(14, 'Le peuple égyptien', 4),
(15, 'Louise', 5),
(16, 'Nathan', 5),
(17, 'La mère', 6),
(18, 'Le fils journaliste', 6),
(19, 'Le jeune motard', 6),
(20, 'Élizabeth Dubreuil', 7),
(21, 'Régina', 7),
(22, 'Mon général', 7),
(23, 'Les Maîtres', 7),
(24, 'La narratrice', 8),
(25, 'Le mari', 8),
(26, 'L\'ancêtre banni', 8),
(27, 'La mère', 9),
(28, 'La première fille', 9),
(29, 'La seconde fille', 9),
(30, 'Le narrateur', 10),
(31, 'Le pays en guerre', 10),
(32, 'Laurent Mauvignier', 11),
(33, 'Le père', 11),
(34, 'Marguerite', 11),
(35, 'Marie-Ernestine', 11),
(36, 'Hermann Göring', 12),
(37, 'Joseph Kessel', 12),
(38, 'Elsa Triolet', 12),
(39, 'Martha Gellhorn', 12),
(40, 'John Dos Passos', 12),
(41, 'Pierre', 13),
(42, 'Houda', 13),
(43, 'Laurent', 13),
(44, 'Maëva', 13),
(45, 'Surveillants', 13),
(46, 'Michelle', 14),
(47, 'Sirius', 14),
(48, 'Ariel', 14),
(49, 'Amie de Michelle', 14),
(50, 'La fille de Michelle', 14),
(51, 'David Thomas', 15),
(52, 'Édouard', 15);

-- --------------------------------------------------------

--
-- Structure de la table `final_result`
--

DROP TABLE IF EXISTS `final_result`;
CREATE TABLE IF NOT EXISTS `final_result` (
  `id_book` int UNSIGNED NOT NULL,
  `nb_votes` int UNSIGNED NOT NULL DEFAULT '0',
  `is_winner` tinyint(1) NOT NULL DEFAULT '0',
  `decided_by_president` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jury_member`
--

DROP TABLE IF EXISTS `jury_member`;
CREATE TABLE IF NOT EXISTS `jury_member` (
  `id_member` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `is_president` tinyint(1) NOT NULL DEFAULT '0',
  `login` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_member`),
  UNIQUE KEY `uniq_jury_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jury_member`
--

INSERT INTO `jury_member` (`id_member`, `first_name`, `last_name`, `is_president`, `login`, `password_hash`) VALUES
(1, 'Philippe', 'Claudel', 1, 'pclaudel', 'pwd_placeholder'),
(2, 'Christine', 'Angot', 0, 'cangot', 'pwd_placeholder'),
(3, 'Didier', 'Decoin', 0, 'ddecoin', 'pwd_placeholder'),
(4, 'Françoise', 'Chandernagor', 0, 'fchandernagor', 'pwd_placeholder'),
(5, 'Tahar', 'Ben Jelloun', 0, 'tbenjelloun', 'pwd_placeholder'),
(6, 'Paule', 'Constant', 0, 'pconstant', 'pwd_placeholder'),
(7, 'Pierre', 'Assouline', 0, 'passouline', 'pwd_placeholder'),
(8, 'Eric-Emmanuel', 'Schmitt', 0, 'eeschmitt', 'pwd_placeholder'),
(9, 'Camille', 'Laurens', 0, 'claurens', 'pwd_placeholder'),
(10, 'Pascal', 'Bruckner', 0, 'pbruckner', 'pwd_placeholder');

-- --------------------------------------------------------

--
-- Structure de la table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `id_publisher` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_publisher`),
  UNIQUE KEY `uniq_publisher_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `publisher`
--

INSERT INTO `publisher` (`id_publisher`, `name`) VALUES
(5, 'Albin Michel'),
(1, 'Gallimard'),
(4, 'Julliard'),
(13, 'L\'Olivier'),
(3, 'Marchialy'),
(10, 'Minuit'),
(2, 'P.O.L'),
(11, 'Robert Laffont'),
(6, 'Sabine Wespieser'),
(7, 'Seuil'),
(9, 'Stock'),
(8, 'Verdier'),
(12, 'Verticales');

-- --------------------------------------------------------

--
-- Structure de la table `selection`
--

DROP TABLE IF EXISTS `selection`;
CREATE TABLE IF NOT EXISTS `selection` (
  `id_selection` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  `round_number` tinyint UNSIGNED NOT NULL,
  `selection_date` date NOT NULL,
  PRIMARY KEY (`id_selection`),
  UNIQUE KEY `uniq_selection_year_round` (`year`,`round_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `selection`
--

INSERT INTO `selection` (`id_selection`, `year`, `round_number`, `selection_date`) VALUES
(1, 2025, 1, '2025-09-03'),
(2, 2025, 2, '2025-10-07'),
(3, 2025, 3, '2025-10-28');

-- --------------------------------------------------------

--
-- Structure de la table `selection_book`
--

DROP TABLE IF EXISTS `selection_book`;
CREATE TABLE IF NOT EXISTS `selection_book` (
  `id_selection` int UNSIGNED NOT NULL,
  `id_book` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_selection`,`id_book`),
  KEY `idx_selection_book_book` (`id_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `selection_book`
--

INSERT INTO `selection_book` (`id_selection`, `id_book`) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(2, 9),
(1, 10),
(2, 10),
(1, 11),
(2, 11),
(1, 12),
(2, 12),
(1, 13),
(2, 13),
(1, 14),
(2, 14),
(1, 15),
(2, 15);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id_author`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_book_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id_publisher`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `book_character`
--
ALTER TABLE `book_character`
  ADD CONSTRAINT `fk_character_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `final_result`
--
ALTER TABLE `final_result`
  ADD CONSTRAINT `fk_final_result_book` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `selection_book`
--
ALTER TABLE `selection_book`
  ADD CONSTRAINT `fk_selection_book_book` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_selection_book_selection` FOREIGN KEY (`id_selection`) REFERENCES `selection` (`id_selection`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
