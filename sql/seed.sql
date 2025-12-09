-- seed.sql
-- feed the beast
USE goncourt_2025;

-- /////////////////////////////////////////////////
-- PUBLISHERS
-- /////////////////////////////////////////////////
INSERT INTO
    publisher (id_publisher, name)
VALUES
    (1, 'Gallimard'),
    (2, 'P.O.L'),
    (3, 'Marchialy'),
    (4, 'Julliard'),
    (5, 'Albin Michel'),
    (6, 'Sabine Wespieser'),
    (7, 'Seuil'),
    (8, 'Verdier'),
    (9, 'Stock'),
    (10, 'Minuit'),
    (11, 'Robert Laffont'),
    (12, 'Verticales'),
    (13, 'L''Olivier');

-- /////////////////////////////////////////////////
-- AUTHORS
-- /////////////////////////////////////////////////
INSERT INTO
    author (id_author, first_name, last_name, biography)
VALUES
    (
        1,
        'Nathacha',
        'Appanah',
        'Nathacha Appanah est romancière. Ses romans ont été récompensés par plusieurs prix littéraires et traduits dans de nombreux pays. La nuit au coeur est son douzième livre.'
    ),
    (
        2,
        'Emmanuel',
        'Carrère',
        'Emmanuel Carrère est né en 1957. D''abord journaliste il a publié un essai sur le cinéaste Werner Herzog en 1982 puis L''Amie du jaguar Bravoure (prix Passion 1984 prix de la Vocation 1985), Le Détroit de Behring essai sur l''Histoire imaginaire (prix Valery Larbaud et Grand Prix de la science-fiction française 1987),Hors d''atteinte ? et une biographie du romancier Philip K. Dick : Je suis vivant et vous êtes morts. La Classe de neige prix Femina 1995 a été porté à l''écran par Claude Miller et L''Adversaire par Nicole Garcia. En 2003 Emmanuel Carrère réalise un documentaire Retour à Kotelnitch et adapte lui-même en 2004 La Moustache avec Vincent Lindon et Emmanuelle Devos. Il a depuis écrit Un roman russe, D''autres vies que la mienne, Limonov prix Renaudot 2011, Le Royaume prix littéraire Le Monde, lauréat-palmarès Le Point, Meilleur livre de l''année, Lire 2014, Il est avantageux d''avoir où aller et Yoga. En 2020 il a réalisé un nouveau film Ouistreham d''après le livre de Florence Aubenas avec Juliette Binoche et des actrices non professionnelles. Ses livres sont traduits dans une vingtaine de langues.'
    ),
    (
        3,
        'David',
        'Deneufgermain',
        'David Deneufgermain est écrivain-médecin. Psychiatre, il a exercé en prison, en hôpital psychiatrique et soigne depuis onze ans les malades à la rue et dans son cabinet. L''Adieu au visage est son premier roman du réel.'
    ),
    (
        4,
        'David',
        'Diop',
        'Né en 1966, David Diop est l''auteur de trois romans, dont deux publiés aux éditions du Seuil : Frère d''âme (prix Goncourt des lycéens 2018, International Booker Prize 2021) et La Porte du voyage sans retour (finaliste du National Book Award 2023).'
    ),
    (
        5,
        'Ghislaine',
        'Dunant',
        'Ghislaine Dunant a publié trois romans aux éditions Gallimard, dont son premier, très remarqué, L''Impudeur (1989). Elle a reçu le prix Michel-Dentan (2008) pour Un effondrement et le prix Femina essai pour Charlotte Delbo. La vie retrouvée (2016), tous deux parus chez Grasset.Elle vit à Paris.'
    ),
    (
        6,
        'Paul',
        'Gasnier',
        'Né en 1990, Paul Gasnier est journaliste. La collision est son premier récit.'
    ),
    (
        7,
        'Yanick',
        'Lahens',
        'Lauréate du prix Femina 2014 pour Bain de lune, titulaire de la chaire des Mondes francophones au Collège de France en 2019, Yanick Lahens est née en 1953 en Haïti, où elle vit aujourd''hui encore. Son oeuvre, traduite dans de nombreux pays, est publiée par Sabine Wespieser éditeur.'
    ),
    (
        8,
        'Caroline',
        'Lamarche',
        'Caroline Lamarche vit à Liège. Son oeuvre témoigne d''un éclectisme et d''une hardiesse renouvelés de livre en livre. Elle a notamment obtenu le prix Rossel avec Le Jour du Chien (Les Éditions de Minuit) et le Goncourt de la nouvelle pour Nous sommes à la lisière (Gallimard). Elle signe avec Le Bel Obscur son retour au roman.'
    ),
    (
        9,
        'Hélène',
        'Laurain',
        'Hélène Laurain, née en 1988 à Metz, est une autrice française. Son deuxième roman, Tambora, fait partie de la première sélection du Prix Goncourt 2025.'
    ),
    (
        10,
        'Charif',
        'Majdalani',
        'Charif Majdalani est écrivain et professeur à l''université Saint-Joseph à Beyrouth. Il est l''auteur d''une dizaine de livres dont Histoire de la grande maison (Seuil, 2005), Villa des femmes (Seuil, prix Jean Giono 2015), Beyrouth 2020 : Journal d''un effondrement (Actes Sud, prix spécial du jury Femina 2020) et Dernière Oasis (Actes Sud, 2021).'
    ),
    (
        11,
        'Laurent',
        'Mauvignier',
        'Laurent Mauvignier, né le 6 juillet 1967 à Tours, est un écrivain français. Frère du réalisateur Thierry Mauvignier et de l''écrivain psychanalyste Frédéric Mauvignier, il est ancien pensionnaire de la Villa Médicis. Il obtient le prix Goncourt 2025 pour son roman La Maison vide publié aux éditions de Minuit.'
    ),
    (
        12,
        'Alfred',
        'de Montesquiou',
        'Diplômé de Sciences Po, reporter de guerre, lauréat du prix Albert-Londres. Alfred de Montesquiou est réalisateur et écrivain. Son premier roman, L''Étoile des frontières, est paru en 2021.'
    ),
    (
        13,
        'Guillaume',
        'Poix',
        'Né en 1986, Guillaume Poix a publié plusieurs pièces aux Éditions Théâtrales, dont Soudain Romy Schneider, Un sacre/La vie invisible et Léviathan (matériau). Il est l''auteur de trois romans aux Éditions Verticales : Les fils conducteurs (prix Wepler-Fondation La Poste, 2017), Là d''où je viens a disparu (2020) et Star (2023).'
    ),
    (
        14,
        'Maria',
        'Pourchet',
        'Maria Pourchet est écrivaine. Elle est notamment l''autrice de Rome en un jour (2013), Toutes les femmes sauf une (prix Révélation de la SGDL 2018), Feu (2021) et Western (prix de Flore 2023).'
    ),
    (
        15,
        'David',
        'Thomas',
        'David Thomas est l''auteur de plusieurs romans et recueils d''instantanés parmi lesquels La Patience des buffles sous la pluie ou Seul entouré de chiens qui mordent (prix de la nouvelle de l''Académie française 2021). Son dernier livre, Partout les autres, a été couronné en 2023 par le prix Goncourt de la nouvelle.'
    );

-- /////////////////////////////////////////////////
-- BOOKS (15 romans de la 1ère sélection)
-- /////////////////////////////////////////////////
INSERT INTO
    book (
        id_book,
        title,
        summary,
        publication_date,
        page_count,
        isbn,
        price,
        author_id,
        publisher_id
    )
VALUES
    -- 1. Nathacha Appanah, La nuit au cœur (Gallimard)
    (
        1,
        'La nuit au cœur',
        'De ces nuits et de ces vies, de ces femmes qui courent, de ces coeurs qui luttent, de ces instants qui sont si accablants qu''ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l''impossibilité de la vérité entière à chaque page mais la quête désespérée d''une justesse au plus près de la vie, de la nuit, du coeur, du corps, de l''esprit. De ces trois femmes, il a fallu commencer par la première, celle qui vient d''avoir vingt-cinq ans quand elle court et qui est la seule à être encore en vie aujourd''hui. Cette femme, c''est moi. » La nuit au coeur entrelace trois histoires de femmes victimes de la violence de leur compagnon. Sur le fil entre force et humilité, Nathacha Appanah scrute l''énigme insupportable du féminicide conjugal, quand la nuit noire prend la place de l''amour.',
        '2025-08-21',
        282,
        '9782073080028',
        21.00,
        1,
        1
    ),
    -- 2. Emmanuel Carrère, Kolkhoze (P.O.L)
    (
        2,
        'Kolkhoze',
        'Cette nuit-là, rassemblés tous les trois autour de notre mère, nous avons pour la dernière fois fait kolkhoze.',
        '2025-08-28',
        558,
        '9782818061985',
        24.00,
        2,
        2
    ),
    -- 3. David Deneufgermain, L’Adieu au visage (Marchialy)
    (
        3,
        'L''Adieu au visage',
        'Mars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son temps entre son équipe mobile qui maraude dans une ville fantôme à la recherche de marginaux à protéger, et les unités covid où les malades meurent seuls, privés de tout rite. Entre obéissance à la loi et refus de l''horreur, que ce soit à l''hôpital ou dehors, chacun à son niveau cherche des solutions et improvise. L''Adieu au visage est l''écriture d''une résistance fragile et d''une lutte pour prendre soin de l''autre. « Au commencement, on ne lave plus les corps, on ne les coiffe plus, on ne les habille plus, on ne les présente plus - d''accompagner les morts, il n''est plus question. »',
        '2025-08-20',
        261,
        '9782381340647',
        21.10,
        3,
        3
    ),
    -- 4. David Diop, Où s’adosse le ciel (Julliard)
    (
        4,
        'Où s’adosse le ciel',
        'À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque et s''apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe, sous le regard incrédule d''un médecin français qui cherche à percer les secrets de son immunité. En pure perte. Déjà, Bilal est ailleurs, porté par une autre histoire, celle qu''il ne cesse de psalmodier, un mythe immense, demeuré intact en lui, transmis par la grande chaîne de la parole qui le relie à ses ancêtres. Une odyssée qui fut celle du peuple égyptien, alors sous le joug des Ptolémées, conduite par Ounifer, grand prêtre d''Osiris qui caressait le rêve de rendre leur liberté aux siens, les menant vers l''ouest à travers les déserts, jusqu''à une terre promise, un bel horizon, là où s''adosse le ciel... Ce chemin, Bilal l''emprunte à son tour, vers son pays natal, en passant par Djenné, la cité rouge, où vint buter un temps le voyage d''Ounifer et de son peuple. De l''Égypte ancienne au Sénégal, David Diop signe un roman magistral sur un homme parti à la reconquête de ses origines et des sources immémoriales de sa parole.',
        '2025-08-14',
        363,
        '9782260057307',
        22.50,
        4,
        4
    ),
    -- 5. Ghislaine Dunant, Un amour infini (Albin Michel)
    (
        5,
        'Un amour infini',
        'Elle est descendue en retard, elle voulait encore fumer une cigarette, fumer seule, une fois de plus. Pour sentir le temps qui passe, ne plus savoir qui elle est, ni ce qu''on peut vouloir d''elle. Ce roman installe le lecteur au coeur d''une rencontre de trois jours sur l''île de Ténérife, en juin 1964, prévue mais bouleversée par un événement tragique, entre un astrophysicien d''origine hongroise qui a dû fuir l''Europe et s''exiler aux États-Unis et une mère de famille française. Alors que rien ne devrait les rapprocher, leurs conversations sur leurs passés distincts et l''exploration de l''île vont les ouvrir profondément l''un à l''autre. Le ciel, l''univers, l''histoire de la Terre... Les sujets de l''astrophysicien rejoignent la sensibilité de celle qui a observé le mystère de la toute petite enfance et a toujours eu une approche sensitive des êtres. Leur désir réciproque va s''accompagner de la puissance des éléments qui les entourent. 1964. Sur l''île de Tenerife. Une femme et un homme que rien ne destinait à se rencontrer, et, pourtant, durant 3 jours, en cette géographie volcanique et insulaire, naîtra l''une des plus belles rencontres amoureuses écrites ces dernières années...Roman sensible subtile et sensuel, où le paysage cosmique, absolu de l''île de Tenerife et la rencontre entre Louise et Nathan confluent si intimement que l''impression laissée par cette histoire à l''écriture aussi délicate que tellurique perdure infiniment.',
        '2025-08-20',
        170,
        '9782226498687',
        19.90,
        5,
        5
    ),
    -- 6. Paul Gasnier, La collision (Gallimard)
    (
        6,
        'La collision',
        'En 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h. Dix ans plus tard, son fils, qui n''a cessé d''être hanté par le drame, est devenu journaliste. Il observe la façon dont ce genre de catastrophe est utilisé quotidiennement pour fracturer la société et dresser une partie de l''opinion contre l''autre. Il décide de se replonger dans la complexité de cet accident, et de se lancer sur les traces du motard pour comprendre d''où il vient, quel a été son parcours et comment un tel événement a été rendu possible. En décortiquant ce drame familial, Paul Gasnier révèle deux destins qui s''écrivent en parallèle, dans la même ville, et qui s''ignorent jusqu''au jour où ils entrent violemment en collision. C''est aussi l''histoire de deux familles qui racontent chacune l''évolution du pays. Un récit en forme d''enquête littéraire qui explore la force de nos convictions quand le réel les met à mal, et les manquements collectifs qui créent l''irrémédiable.',
        '2025-08-21',
        160,
        '9782073101228',
        19.00,
        6,
        1
    ),
    -- 7. Yanick Lahens, Passagères de nuit (Sabine Wespieser)
    (
        7,
        'Passagères de nuit',
        'Dans ce nouveau roman, comme arraché au chaos de son quotidien à Port-au-Prince, Yanick Lahens rend un hommage d’espoir et de résistance à la lignée des femmes dont elle est issue. La première d’entre elles, Élizabeth Dubreuil, naît vers 1820 à La Nouvelle-Orléans. Sa grand-mère, arrivée d’Haïti au début du siècle dans le sillage du maître de la plantation qui avait fini par l’affranchir, n’a plus jamais voulu dépendre d’un homme. Inspirée par ce puissant exemple, la jeune Élisabeth se rebelle à son tour contre le désir prédateur d’un ami de son père. Elle doit fuir la ville, devenant à son tour une « passagère de nuit » sur un bateau à destination de Port-au-Prince. Ce qui adviendra d’elle, nous l’apprendrons quand son existence croisera celle de Régina, autre grande figure de ce roman des origines. Née pauvre parmi les pauvres dans un hameau du sud de l’île d’Haïti, Régina elle aussi a forcé le destin : rien ne la déterminait à devenir la maîtresse d’un des généraux arrivé en libérateur à Port-au-Prince en 1867. C’est à « mon général, mon amant, mon homme » qu’elle adresse le monologue amoureux dans lequel elle évoque sa trajectoire d’émancipation : la cruauté mesquine des maîtres qu’elle a fuis trouve son contrepoint dans les mains tendues par ces femmes qui lui ont appris à opposer aux coups du sort une ténacité silencieuse. Cette ténacité silencieuse, Élizabeth et Régina l’ont reçue en partage de leurs lointaines ascendantes, ces « passagères de nuit » des bateaux négriers, dont Yanick Lahens évoque ici l’effroyable réalité, de même qu’elle nous plonge – et ce n’est pas la moindre qualité de ce très grand livre – dans les convulsions de l’histoire haïtienne. Lorsque les deux héroïnes se rencontreront, dans une scène d’une rare qualité d’émotion, nous, lectrices et lecteurs, comprendrons que l’histoire ne s’écrit pas seulement avec les vainqueurs, mais dans la beauté des gestes, des regards et des mystères tus, qui à bas bruit montrent le chemin d’une résistance forçant l’admiration.',
        '2025-08-28',
        233,
        '9782848055701',
        20.00,
        7,
        6
    ),
    -- 8. Caroline Lamarche, Le bel obscur (Seuil)
    (
        8,
        'Le bel obscur',
        'Alors qu’elle tente d’élucider le destin d’un ancêtre banni par sa famille, une femme reprend l’histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur existence comme des péripéties de leur émancipation respective, rien n’est tu. Ce roman lumineux nous offre une leçon de courage, de tolérance, de curiosité aussi. Car jamais cette femme libre n’aura cessé de se réinventer, d’affirmer la puissance de ses rêves contre les conventions sociales, avec une fantaisie et une délicatesse infinies.',
        '2025-08-22',
        229,
        '9782021603439',
        20.00,
        8,
        7
    ),
    -- 9. Hélène Laurain, Tambora (Verdier)
    (
        9,
        'Tambora',
        'Une mère nous parle de ses deux filles, qu’elle voit amples comme des villes en expansion. La première est déjà là quand le récit commence, la seconde naîtra bientôt, après la perte d’un autre enfant lors d’une fausse couche. Ici, la temporalité de la maternité domine : celle de grossesses compliquées, d’hôpitaux et de services des urgences, la temporalité d’un corps qui produit, parfois sans qu’on le veuille, la temporalité de la naissance, celle des soins, ou des désirs trop souvent empêchés. Mais d’autres réalités existent aussi, se faufilent et tentent de prendre leur place : un manuscrit qui intéresse un éditeur, des confinements, qui ne changent pas grand-chose lorsqu’on doit rester alitée, la catastrophe environnementale qui se déploie, gigantesque, et fait songer à la fin du monde que l’humanité a cru vivre en 1815 quand l’éruption du volcan Tambora plongea une partie de la Terre dans le froid et l’obscurité. Hélène Laurain écrit avec cela, et écrit tout cela, avec crudité parfois. Son livre conjugue récit, réflexions et poésie, et nous emmène à la rencontre d’un monde incertain.',
        '2025-08-28',
        192,
        '9782378562588',
        18.50,
        9,
        8
    ),
    -- 10. Charif Majdalani, Le nom des rois (Stock)
    (
        10,
        'Le nom des rois',
        '« Et d''un seul coup, le monde qui servait de décor à tout cela s''écroula. J''en avais été un témoin distrait, mais le bruit qu''il provoqua en s''effondrant me fit lever la tête et ce que je vis alors n''était plus qu''un univers de violence et de mort. C''est de celui-là que je suis devenu contemporain. J''avais été, durant des années, dispensé d''intérêt pour ce qui se passait autour de moi par ma passion des atlas, par les royautés anciennes et inutiles et par les terres lointaines et isolées, les berceaux de vieux empires oubliés. Désormais, l''histoire se faisait sous mes yeux et je la trouvais moche, roturière et vulgaire. » Dans ce récit de passage à l''âge adulte porté par une écriture ample et élégante, Charif Majdalani raconte la disparition d''un pays et explore ce qui subsiste de l''enfance lorsqu''elle capitule devant les fracas du monde.',
        '2025-08-20',
        214,
        '9782234097278',
        20.00,
        10,
        9
    ),
    -- 11. Laurent Mauvignier, La maison vide (Minuit)
    (
        11,
        'La maison vide',
        'En 1976, mon père a rouvert la maison qu’il avait reçue de sa mère, restée fermée pendant vingt ans. À l’intérieur : un piano, une commode au marbre ébréché, une Légion d’honneur, des photographies sur lesquelles un visage a été découpé aux ciseaux. Une maison peuplée de récits, où se croisent deux guerres mondiales, la vie rurale de la première moitié du vingtième siècle, mais aussi Marguerite, ma grand-mère, sa mère Marie-Ernestine, la mère de celle-ci, et tous les hommes qui ont gravité autour d’elles. Toutes et tous ont marqué la maison et ont été progressivement effacés. J’ai tenté de les ramener à la lumière pour comprendre ce qui a pu être leur histoire, et son ombre portée sur la nôtre.',
        '2025-08-28',
        743,
        '9782707356741',
        25.00,
        11,
        10
    ),
    -- 12. Alfred de Montesquiou, Le crépuscule des hommes (Robert Laffont)
    (
        12,
        'Le crépuscule des hommes',
        'Nuremberg, 1945 : un procès fait l''Histoire, eux la vivent. Un roman vrai, qui saisit les sursauts de l''Histoire en marche. Chacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir de novembre 1945. Mais que se passe-t-il hors de la salle d''audience ? Ils sont là : Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos, venus assister à ces dix mois où doit oeuvrer la justice. Des dortoirs de l''étrange château Faber-Castell, qui loge la presse internationale, aux box des accusés, tous partagent la frénésie des reportages, les frictions entre alliés occidentaux et soviétiques, l''effroi que suscite le récit inédit des déportés. Avec autant de précision historique que de tension romanesque, Alfred de Montesquiou ressuscite des hommes et des femmes de l''ombre, témoins du procès le plus retentissant du XXe siècle.',
        '2025-08-28',
        382,
        '9782221267660',
        22.00,
        12,
        11
    ),
    -- 13. Guillaume Poix, Perpétuité (Verticales)
    (
        13,
        'Perpétuité',
        '18h45. Une maison d''arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d''autres surveillants prennent leur service de nuit. Captifs d''une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une série d''incidents plus éprouvants qu''à l''ordinaire. En regardant celles et ceux qui regardent, Guillaume Poix plonge dans le quotidien d''un métier méconnu, sinon méprisé, et interroge le sens d''une institution au bord du gouffre.',
        '2025-08-28',
        382,
        '9782221267660',
        22.00,
        13,
        12
    ),
    -- 14. Maria Pourchet, Tressaillir (Stock)
    (
        14,
        'Tressaillir',
        '« J''ai coupé un lien avec quelque chose d''aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. » Une femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve mais elle éprouve, prostrée dans une chambre d''hôtel, l''élémentaire supplice de l''arrachement. Et si rompre n''était pas à sa portée ? Si la seule issue au chagrin, c''était revenir ? Car sans un homme à ses côtés, cette femme a peur. Depuis toujours sur le qui-vive, elle a peur. Mais au fond, de quoi ? Dans ce texte du retour aux origines et du retour de la joie, Maria Pourchet entreprend une archéologie de ces terreurs d''enfant qui hantent les adultes. Elle nous transporte au coeur des forêts du Grand Est sur les traces de drames intimes et collectifs.',
        '2025-08-20',
        324,
        '9782234097155',
        21.90,
        14,
        9
    ),
    -- 15. David Thomas, Un frère (L’Olivier)
    (
        15,
        'Un frère',
        '« Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. » David Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depuis la mort brutale d’Édouard jusqu’aux années heureuses, il remonte à la source du lien qu’il a eu avec son aîné et grâce auquel il s’est construit. Lors de ce cheminement, il s’interroge : comment écrire cette histoire sans trahir, sans enjoliver ? Écrire pour rejoindre Édouard. Le retrouver.',
        '2025-08-24',
        139,
        '9782823623376',
        19.50,
        15,
        13
    );

-- /////////////////////////////////////////////////
-- JURY MEMBERS (minimal : président)
-- /////////////////////////////////////////////////
INSERT INTO
    jury_member (
        id_member,
        first_name,
        last_name,
        is_president,
        login,
        password_hash
    )
VALUES
    (
        1,
        'Philippe',
        'Claudel',
        TRUE,
        'pclaudel',
        'pwd_placeholder'
    ),
    (
        2,
        'Christine',
        'Angot',
        FALSE,
        'cangot',
        'pwd_placeholder'
    ),
    (
        3,
        'Didier',
        'Decoin',
        FALSE,
        'ddecoin',
        'pwd_placeholder'
    ),
    (
        4,
        'Françoise',
        'Chandernagor',
        FALSE,
        'fchandernagor',
        'pwd_placeholder'
    ),
    (
        5,
        'Tahar',
        'Ben Jelloun',
        FALSE,
        'tbenjelloun',
        'pwd_placeholder'
    ),
    (
        6,
        'Paule',
        'Constant',
        FALSE,
        'pconstant',
        'pwd_placeholder'
    ),
    (
        7,
        'Pierre',
        'Assouline',
        FALSE,
        'passouline',
        'pwd_placeholder'
    ),
    (
        8,
        'Eric-Emmanuel',
        'Schmitt',
        FALSE,
        'eeschmitt',
        'pwd_placeholder'
    ),
    (
        9,
        'Camille',
        'Laurens',
        FALSE,
        'claurens',
        'pwd_placeholder'
    ),
    (
        10,
        'Pascal',
        'Bruckner',
        FALSE,
        'pbruckner',
        'pwd_placeholder'
    );

-- /////////////////////////////////////////////////
-- SELECTIONS (3 tours 2025)
-- /////////////////////////////////////////////////
INSERT INTO
    selection (id_selection, year, round_number, selection_date)
VALUES
    (1, 2025, 1, '2025-09-03'), -- 1ère sélection
    (2, 2025, 2, '2025-10-07'), -- 2ème sélection
    (3, 2025, 3, '2025-10-28');

-- 3ème sélection
-- /////////////////////////////////////////////////
-- SELECTION_BOOK (liens livres / sélections)
-- /////////////////////////////////////////////////
-- 1ère sélection : 15 romans
INSERT INTO
    selection_book (id_selection, id_book)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 10),
    (1, 11),
    (1, 12),
    (1, 13),
    (1, 14),
    (1, 15);

-- 2ème sélection : 8 romans
-- Nathacha APPANAH, La nuit au cœur (Gallimard)
-- Emmanuel CARRÈRE, Kolkhoze (P.O.L)
-- Paul GASNIER, La collision (Gallimard)
-- Yanick LAHENS, Passagères de nuit (Sabine Wespieser)
-- Caroline LAMARCHE, Le bel obscur (Seuil)
-- Charif MAJDALANI, Le nom des rois (Stock)
-- Laurent MAUVIGNIER, La maison vide (Minuit)
-- Alfred de MONTESQUIOU, Le crépuscule des hommes (Robert Laffont)
INSERT INTO
    selection_book (id_selection, id_book)
VALUES
    (2, 1),
    (2, 2),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 10),
    (2, 11),
    (2, 12);

-- 3ème sélection : 4 finalistes
-- Nathacha APPANAH, La nuit au cœur
-- Emmanuel CARRÈRE, Kolkhoze
-- Caroline LAMARCHE, Le bel obscur
-- Laurent MAUVIGNIER, La maison vide
INSERT INTO
    selection_book (id_selection, id_book)
VALUES
    (3, 1),
    (3, 2),
    (3, 8),
    (3, 11);

-- /////////////////////////////////////////////////
-- FINAL RESULT (voix au dernier tour)
-- /////////////////////////////////////////////////
-- Source : Goncourt 2025, 6 voix pour La maison vide contre 4 pour Le bel obscur.
INSERT INTO
    final_result (id_book, nb_votes)
VALUES
    (11, 6), -- Laurent Mauvignier, lauréat
    (8, 4);

INSERT INTO
    book_character (name, book_id)
VALUES
    -- /////////////////////////////////////////////////
    -- 1. La nuit au cœur (Nathacha Appanah)
    -- /////////////////////////////////////////////////
    ('Natacha Appanah', 1),
    ('Deuxième femme victime', 1),
    ('Troisième femme victime', 1),
    -- /////////////////////////////////////////////////
    -- 2. Kolkhoze (Emmanuel Carrère)
    -- /////////////////////////////////////////////////
    ('Hélène Carrère d''Encausse', 2),
    ('Emmanuel Carrère', 2),
    ('Premier frère', 2),
    ('Deuxième frère', 2),
    -- /////////////////////////////////////////////////
    -- 3. L''Adieu au visage (David Deneufgermain)
    -- /////////////////////////////////////////////////
    ('Le psychiatre', 3),
    ('Les personnes à la rue', 3),
    ('Les patients en unités Covid', 3),
    -- /////////////////////////////////////////////////
    -- 4. Où s’adosse le ciel (David Diop)
    -- /////////////////////////////////////////////////
    ('Bilal Seck', 4),
    ('Le médecin français', 4),
    ('Ounifer', 4),
    ('Le peuple égyptien', 4),
    -- /////////////////////////////////////////////////
    -- 5. Un amour infini (Ghislaine Dunant)
    -- /////////////////////////////////////////////////
    ('Louise', 5),
    ('Nathan', 5),
    -- /////////////////////////////////////////////////
    -- 6. La collision (Paul Gasnier)
    -- /////////////////////////////////////////////////
    ('La mère', 6),
    ('Le fils journaliste', 6),
    ('Le jeune motard', 6),
    -- /////////////////////////////////////////////////
    -- 7. Passagères de nuit (Yanick Lahens)
    -- /////////////////////////////////////////////////
    ('Élizabeth Dubreuil', 7),
    ('Régina', 7),
    ('Mon général', 7),
    ('Les Maîtres', 7),
    -- /////////////////////////////////////////////////
    -- 8. Le bel obscur (Caroline Lamarche)
    -- /////////////////////////////////////////////////
    ('La narratrice', 8),
    ('Le mari', 8),
    ('L''ancêtre banni', 8),
    -- /////////////////////////////////////////////////
    -- 9. Tambora (Hélène Laurain)
    -- /////////////////////////////////////////////////
    ('La mère', 9),
    ('La première fille', 9),
    ('La seconde fille', 9),
    -- /////////////////////////////////////////////////
    -- 10. Le nom des rois (Charif Majdalani)
    -- /////////////////////////////////////////////////
    ('Le narrateur', 10),
    ('Le pays en guerre', 10),
    -- /////////////////////////////////////////////////
    -- 11. La maison vide (Laurent Mauvignier)
    -- /////////////////////////////////////////////////
    ('Laurent Mauvignier', 11),
    ('Le père', 11),
    ('Marguerite', 11),
    ('Marie-Ernestine', 11),
    -- /////////////////////////////////////////////////
    -- 12. Le crépuscule des hommes (Alfred de Montesquiou)
    -- /////////////////////////////////////////////////
    ('Hermann Göring', 12),
    ('Joseph Kessel', 12),
    ('Elsa Triolet', 12),
    ('Martha Gellhorn', 12),
    ('John Dos Passos', 12),
    -- /////////////////////////////////////////////////
    -- 13. Perpétuité (Guillaume Poix)
    -- /////////////////////////////////////////////////
    ('Pierre', 13),
    ('Houda', 13),
    ('Laurent', 13),
    ('Maëva', 13),
    ('Surveillants', 13),
    -- /////////////////////////////////////////////////
    -- 14. Tressaillir (Maria Pourchet)
    -- /////////////////////////////////////////////////
    ('Michelle', 14),
    ('Sirius', 14),
    ('Ariel', 14),
    ('Amie de Michelle', 14),
    ('La fille de Michelle', 14),
    -- /////////////////////////////////////////////////
    -- 15. Un frère (David Thomas)
    -- /////////////////////////////////////////////////
    ('David Thomas', 15),
    ('Édouard', 15);