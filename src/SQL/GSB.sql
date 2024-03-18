-- db
DROP DATABASE IF EXISTS gsb;
create database gsb;
use gsb;


drop table if exists utilisateurs;

CREATE TABLE `utilisateurs` (
`id_utilisateur` int(11) PRIMARY KEY auto_increment NOT NULL,
`nom` varchar(255) DEFAULT NULL,
`prenom` varchar(255) DEFAULT NULL,
`email` varchar(255) DEFAULT NULL,
`mot_de_passe` varchar(255) DEFAULT NULL,
`role` varchar(40) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

drop table if exists  fournisseurs;

CREATE TABLE `fournisseurs` (
        `id_fournisseur` int(11) PRIMARY KEY auto_increment NOT NULL,
        `nom` varchar(255) DEFAULT NULL,
        `SIRET` BIGINT(200) DEFAULT NULL,
        `email` varchar(100) DEFAULT NULL,
        `telephone` varchar(20) DEFAULT NULL,
        `adresse` varchar(200) DEFAULT NULL,
        `CP` int(9) DEFAULT NULL,
        `ville` varchar(50) default null,
        `Categorie` enum('Substances actives','Materiel','non_categorise') default 'non_categorise'
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

drop table if exists traces_utilisateur;

CREATE TABLE `traces_utilisateur`(
    `id_trace` int(11) primary key auto_increment not null,
    `requete` varchar(220) default null,
    `params` varchar(100) default null,
    `date` datetime default current_timestamp()
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


drop table if exists commandes;

CREATE TABLE `commandes` (
                             `id_commande` int(11) PRIMARY KEY auto_increment NOT NULL,
                             `id_utilisateur` int(11) DEFAULT NULL,
                             `id_fournisseur` int(11) DEFAULT NULL,
                             `date_commande` datetime DEFAULT current_timestamp(),
                             `statut` enum('en_attente','validee','invalide', 'recu') DEFAULT 'en_attente',
                             `date_disponibilite` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

drop table if exists mouvements;

CREATE TABLE `mouvements` (
                              `id_mouvement` int(11) PRIMARY KEY auto_increment NOT NULL,
                              `id_stock` int(11) DEFAULT NULL,
                              `type_mouvement` enum('entree','sortie','non catégorisé') DEFAULT 'non catégorisé',
                              `date_mouvement` datetime DEFAULT current_timestamp(),
                              `id_commande` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

drop table if exists details_commande;

CREATE TABLE `details_commande` (
                                    `id_commande` int(11) NOT NULL,
                                    `id_stock` int(11) NOT NULL,
                                    `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


drop table if exists stock;

create table `stock`(
    `id_stock` int(11) primary key auto_increment not null,
    `nom` varchar(255) DEFAULT NULL,
    `categorie` varchar(200) DEFAULT NULL,
    `quantite_disponible` int(200)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

drop table if exists medicaments ;

CREATE TABLE `medicaments` (
  `id_med` int(11) PRIMARY KEY auto_increment NOT NULL,
  `id_stock` int(11) NOT NULL,
  `CIS` varchar(255) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

drop table if exists subtance_active;

create table `subtance_active` (
`id_subtance_active` int(11) primary key auto_increment not null,
`id_stock` int(11),
`CIS` varchar(255) default null,
`type` varchar(255) default null,
`masse` varchar(200)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `commandes`
    ADD KEY `id_utilisateur` (`id_utilisateur`);

ALTER TABLE `mouvements`
    ADD KEY `id_stock` (`id_stock`),
    ADD KEY `id_commande` (`id_commande`);


COMMIT;


INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (8, 'ANASTROZOLE ACCORD 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (8, 8, '60002283', 'comprimé pelliculé');


INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (10, 'BECLOSPIN 800 microgrammes/2ml suspension pour inhalation par nébuliseur', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (10, 10, '60003620', 'suspension pour inhalation par nébuliseur');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (11, 'FENOFIBRATE TEVA 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (11, 11, '60004277', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (12, 'TRAMADOL EG L.P. 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (12, 12, '60004487', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (13, 'CABAZITAXEL REDDY PHARMA 60 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (13, 13, '60004505', 'solution à  diluer et  solvant pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (14, 'VILDAGLIPTINE/METFORMINE SANDOZ 50 mg/1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (14, 14, '60004932', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (15, 'FAMOTIDINE EG 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (15, 15, '60005856', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (16, 'ATORVASTATINE TEVA SANTE 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (16, 16, '60007437', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (17, 'AFTAGEL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (17, 17, '60007960', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (18, 'DUTASTERIDE VIATRIS 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (18, 18, '60008724', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (19, 'GLUCOSE BIOSEDRA 15 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (19, 19, '60008845', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (20, 'RIVASTIGMINE EG 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (20, 20, '60008927', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (21, 'PARACETAMOL/CODEINE TEVA 500 mg/30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (21, 21, '60009573', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (22, 'THIOPENTAL VUAB 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (22, 22, '60010084', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (23, 'CHLORURE DE SODIUM PROAMP 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (23, 23, '60010166', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (24, 'CIPROFLOXACINE CRISTERS PHARMA 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (24, 24, '60010885', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (25, 'TERLOMEXIN 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (25, 25, '60010967', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (26, 'FAMENPAX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (26, 26, '60014894', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (27, 'CARVEDILOL VIATRIS 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (27, 27, '60016308', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (28, 'LEVOCARNIL 1 g/5 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (28, 28, '60016589', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (29, 'LYRICA 300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (29, 29, '60018088', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (30, 'ENTECAVIR TEVA 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (30, 30, '60018444', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (31, 'PERINDOPRIL TOSILATE TEVA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (31, 31, '60018896', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (32, 'OPTICRON 2 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (32, 32, '60019101', 'collyre');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (33, 'DOXYLAMINE CRISTERS 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (33, 33, '60019329', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (34, 'ARNIGEL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (34, 34, '60019350', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (35, 'LENALIDOMIDE ARROW 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (35, 35, '60019813', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (36, 'SOLIAN 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (36, 36, '60019927', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (37, 'SPIRONOLACTONE VIATRIS 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (37, 37, '60021127', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (38, 'PERSANTINE 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (38, 38, '60021216', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (39, 'CLARELUX 500 microgrammes/g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (39, 39, '60021312', 'mousse pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (40, 'FIBROVEIN 3 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (40, 40, '60021771', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (41, 'SILODOSINE VIATRIS 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (41, 41, '60021928', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (42, 'EPINITRIL 5 mg/24 heures', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (42, 42, '60022275', 'dispositif');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (43, 'DORZOLAMIDE CRISTERS 20 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (43, 43, '60023270', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (44, 'ADEMPAS 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (44, 44, '60025054', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (45, 'MACROGOL 3350 MAYOLY SPINDLER 8', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (45, 45, '60025314', 'poudre pour solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (46, 'EFFERALGAN 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (46, 46, '60025403', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (47, 'KALOBA 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (47, 47, '60026494', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (48, 'GLIBENCLAMIDE TEVA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (48, 48, '60026957', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (49, 'ELMIRON 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (49, 49, '60027685', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (50, 'GABAPENTINE RANBAXY 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (50, 50, '60028050', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (51, 'DOLIRHUMEPRO PARACETAMOL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (51, 51, '60028495', 'comprimé et  comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (52, 'TRACRIUM 25 mg/2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (52, 52, '60028552', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (53, 'TADALAFIL EG 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (53, 53, '60029394', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (54, 'THERASOLV 100 000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (54, 54, '60030699', 'poudre pour solution injectable ou pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (55, 'MEDIFLOR Numéro 7 CONTRE LA CONSTIPATION PASSAGERE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (55, 55, '60030980', 'mélange de plantes pour tisane');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (56, 'ARIPIPRAZOLE SANDOZ 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (56, 56, '60031071', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (57, 'BLEOMYCINE ACCORD 15000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (57, 57, '60033389', 'poudre pour solution injectable pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (58, 'VANCOMYCINE VIATRIS 125 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (58, 58, '60033510', 'poudre pour solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (59, 'BUCCOLAM 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (59, 59, '60034085', 'solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (60, 'SYNACTHENE RETARD 1 mg/1 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (60, 60, '60034644', 'suspension injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (61, 'KETOCONAZOLE BIOGARAN 2 pourcent', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (61, 61, '60034936', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (63, 'SIMPONI 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (63, 63, '60035714', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (64, 'OXOMEMAZINE VIATRIS 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (64, 64, '60035924', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (65, 'PROTAMINE CHOAY 1000 U.A.H./ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (65, 65, '60037327', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (66, 'AMLODIPINE/VALSARTAN KRKA 5 mg/160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (66, 66, '60037380', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (67, 'LAMOTRIGINE ARROW LAB 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (67, 67, '60038468', 'comprimé dispersible ou à  croquer');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (68, 'BUDESONIDE/FORMOTEROL SANDOZ FORSPIRO 320 microgrammes/9 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (68, 68, '60038525', 'poudre pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (69, 'SENOPHILE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (69, 69, '60040145', 'pommade');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (70, 'MONOSEPT 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (70, 70, '60040469', 'collyre');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (71, 'VIALEBEX 200 mg/mL NOUVEAUX-NES ET NOURRISSONS', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (71, 71, '60040572', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (72, 'TRAMADOL CRISTERS LP 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (72, 72, '60041560', 'comprimé pelliculé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (73, 'ACTYNOX 50 %/50 % v/v', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (73, 73, '60043038', 'gaz');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (74, 'OXCARBAZEPINE VIATRIS 300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (74, 74, '60043077', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (75, 'DONEPEZIL CRISTERS 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (75, 75, '60044492', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (76, 'LEVETIRACETAM VIATRIS 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (76, 76, '60044784', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (77, 'TILLHEPO 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (77, 77, '60044841', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (78, 'CAPECITABINE VIATRIS 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (78, 78, '60044987', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (79, 'ZIMINO 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (79, 79, '60045217', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (80, 'W270', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (80, 80, '60045288', 'poudre');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (81, 'PHOLCODINE BIOGARAN 6', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (81, 81, '60046529', 'sirop');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (82, 'VECTARION INJECTABLE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (82, 82, '60047143', 'lyophilisat et  solution pour préparation injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (83, 'CONCERTA LP 54 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (83, 83, '60047182', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (84, 'DARZALEX 1800 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (84, 84, '60047225', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (85, 'XALATAN 50 microgrammes/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (85, 85, '60047271', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (86, 'BETAHISTINE TEVA 24 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (86, 86, '60048672', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (87, 'RAMIPRIL ALMUS 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (87, 87, '60049895', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (88, 'ARUM TRIPHYLLUM COMPOSE BOIRON', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (88, 88, '60051024', 'granules');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (89, 'AVODART 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (89, 89, '60051234', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (90, 'PERINDOPRIL ARGININE/INDAPAMIDE VIATRIS 5 mg/1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (90, 90, '60051704', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (91, 'AMMONAPS 940 mg/g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (91, 91, '60052254', 'granulés');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (92, 'OLIGOSTIM COBALT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (92, 92, '60053064', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (93, 'ENANTONE LP 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (93, 93, '60054077', 'poudre et  solvant pour suspension injectable à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (94, 'SILODOSINE SANDOZ 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (94, 94, '60054312', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (95, 'DACARBAZINE LIPOMED 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (95, 95, '60054376', 'poudre pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (96, 'DIOSMINE SUN 600 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (96, 96, '60056815', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (97, 'EXFORGE 10 mg/160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (97, 97, '60058008', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (98, 'SPIRONOLACTONE ZENTIVA 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (98, 98, '60058378', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (99, 'GABITRIL 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (99, 99, '60058517', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (100, 'LYNPARZA 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (100, 100, '60058620', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (101, 'RITALINE 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (101, 101, '60059081', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (102, 'TETRALYSAL 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (102, 102, '60061171', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (103, 'OXYGENE MEDICINAL LIQUIDE AIR LIQUIDE ANTILLES GUYANE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (103, 103, '60061449', 'gaz pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (104, 'PREGABALINE TEVA SANTE 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (104, 104, '60061602', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (105, 'INEGY 10 mg/20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (105, 105, '60061709', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (106, 'DAFLON 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (106, 106, '60064527', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (107, 'GALANTAMINE ARROW LP 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (107, 107, '60064872', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (108, 'CELIPROLOL ZENTIVA 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (108, 108, '60065198', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (110, 'FESOTERODINE ARROW LP 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (110, 110, '60065390', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (111, 'ZADITEN 1 mg/5 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (111, 111, '60067562', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (112, 'ESCITALOPRAM VIATRIS 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (112, 112, '60068002', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (113, 'MILNACIPRAN EG 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (113, 113, '60068034', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (114, 'COVERAM 10 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (114, 114, '60068251', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (115, 'COVERAM 5 mg/5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (115, 115, '60068333', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (116, 'NITISINONE DIPHARMA 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (116, 116, '60069307', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (117, 'MONTELUKAST TEVA 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (117, 117, '60069339', 'granulés');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (118, 'MYCOHYDRALIN 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (118, 118, '60070359', 'capsule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (119, 'MIRCERA 200 microgrammes/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (119, 119, '60070665', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (120, 'SIMVASTATINE SANDOZ 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (120, 120, '60071190', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (121, 'DARUNAVIR REDDY PHARMA 600 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (121, 121, '60071233', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (122, 'OROMONE 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (122, 122, '60071379', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (124, 'ETIOVEN 30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (124, 124, '60073451', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (125, 'LEVOCETIRIZINE KRKA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (125, 125, '60073608', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (126, 'DONEPEZIL MYLAN 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (126, 126, '60073907', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (127, 'IBUPROFENE BIOGARAN CONSEIL 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (127, 127, '60073914', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (128, 'INTRAROSA 6', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (128, 128, '60073960', 'ovule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (129, 'PERMIXON 160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (129, 129, '60074432', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (130, 'OCTAPLASLG', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (130, 130, '60074795', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (131, 'MYAMBUTOL 1000 mg/10 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (131, 131, '60074934', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (132, 'BIOXYOL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (132, 132, '60075064', 'pà¢te pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (133, 'VENLAFAXINE ARROW LP 37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (133, 133, '60075192', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (134, 'FENTANYL ARROW 600 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (134, 134, '60075370', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (135, 'PREGABALINE BIOGARAN 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (135, 135, '60075452', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (136, 'LENALIDOMIDE STRAGEN 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (136, 136, '60076860', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (137, 'CARDENSIEL 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (137, 137, '60077574', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (138, 'LEVONORGESTREL EG 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (138, 138, '60078078', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (139, 'QUETIAPINE ACCORD HEALTHCARE LP 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (139, 139, '60078765', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (140, 'PERMIXON 160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (140, 140, '60079721', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (141, 'FIVASA 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (141, 141, '60080218', 'suppositoire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (142, 'VENOFER 20 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (142, 142, '60080232', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (143, 'FERVEXRHUME', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (143, 143, '60082023', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (144, 'COPAXONE 20 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (144, 144, '60082062', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (145, 'LATAZED 50 microgrammes/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (145, 145, '60082233', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (146, 'IZIXATE 12', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (146, 146, '60082450', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (147, 'AMITRIPTYLINE SUBSTIPHARM 40 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (147, 147, '60082938', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (148, 'OLANZAPINE ARROW GENERIQUES 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (148, 148, '60083132', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (149, 'GLUCAGEN 1 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (149, 149, '60084049', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (150, 'AMBRISENTAN STRAGEN 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (150, 150, '60085553', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (151, 'DENTINEA', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (151, 151, '60088834', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (152, 'ZALTRAP 25 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (152, 152, '60089217', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (153, 'PARACETAMOL TEVA 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (153, 153, '60091086', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (154, 'SINEMET 250 mg/25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (154, 154, '60092590', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (155, 'DECAPEPTYL L.P. 11', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (155, 155, '60092811', 'poudre et  solvant pour suspension injectable à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (156, 'ROPINIROLE BIOGARAN LP 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (156, 156, '60093639', 'comprimé pelliculé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (157, 'TRANDOLAPRIL VIATRIS 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (157, 157, '60094125', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (158, 'HEXTRIL 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (158, 158, '60095056', 'pà¢te dentifrice');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (159, 'IMODIUMLIQUICAPS 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (159, 159, '60095095', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (160, 'FOSINOPRIL ZENTIVA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (160, 160, '60095526', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (161, 'MAXILASE MAUX DE GORGE ALPHA-AMYLASE 3000 U. CEIP', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (161, 161, '60095729', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (162, 'PRAVASTATINE ARROW 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (162, 162, '60097203', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (163, 'DERMOVAL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (163, 163, '60097833', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (164, 'AMOXICILLINE/ACIDE CLAVULANIQUE ALMUS 500 mg/62', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (164, 164, '60099738', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (165, 'BETOPTIC 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (165, 165, '60100877', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (166, 'AMOXICILLINE KRKA 1 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (166, 166, '60101406', 'comprimé dispersible sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (167, 'GABAPENTINE ZENTIVA 600 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (167, 167, '60105162', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (168, 'ROPIVACAINE ALTAN 10 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (168, 168, '60105568', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (169, 'REFACTO AF 250 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (169, 169, '60106606', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (170, 'DROSPIBEL 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (170, 170, '60106848', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (171, 'APREXEVO 300 mg/5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (171, 171, '60106862', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (172, 'VERRUFILM', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (172, 172, '60107747', 'solution pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (173, 'ARKOGELULES CHARBON VEGETAL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (173, 173, '60107932', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (174, 'OXYCODONE SANDOZ 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (174, 174, '60108518', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (175, 'TERBINAFINE BIOGARAN 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (175, 175, '60108678', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (176, 'CAPTOPRIL SANDOZ 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (176, 176, '60108870', 'comprimé quadrisécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (177, 'MUPIROCINE PIERRE FABRE 2%', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (177, 177, '60109303', 'pommade');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (178, 'EAU POUR PREPARATIONS INJECTABLES FRESENIUS', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (178, 178, '60110031', 'solution pour préparation injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (179, 'ENTECAVIR ACCORD 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (179, 179, '60110896', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (180, 'MAGNESIUM/VITAMINE B6 VIATRIS CONSEIL 48 mg/5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (180, 180, '60111101', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (181, 'ACICLOVIR ARROW 800 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (181, 181, '60111197', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (182, 'TIORFAN 4 mg/mL NOURRISSONS ET ENFANTS', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (182, 182, '60111471', 'suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (183, 'URAPIDIL KALCEKS 50 mg/10 mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (183, 183, '60111553', 'solution injectable ou pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (184, 'ENALAPRIL ZENTIVA 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (184, 184, '60111813', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (185, 'ATORVASTATINE ZYDUS 80 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (185, 185, '60113814', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (186, 'GLIMEPIRIDE EG 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (186, 186, '60116447', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (187, 'PERINDOPRIL ARGININE/INDAPAMIDE BIOGARAN 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (187, 187, '60116810', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (188, 'CORTANCYL 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (188, 188, '60118715', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (189, 'ALLOPURINOL SUN 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (189, 189, '60120709', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (190, 'CAMPTO 20 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (190, 190, '60120812', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (191, 'CANDESARTAN CRISTERS 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (191, 191, '60122628', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (192, 'DEFERASIROX ZENTIVA 90 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (192, 192, '60122699', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (193, 'SEVELAMER CARBONATE SANDOZ 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (193, 193, '60122717', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (194, 'FINASTERIDE ACCORD 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (194, 194, '60123363', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (195, 'INTEGRILIN 2 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (195, 195, '60124020', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (196, 'PERINDOPRIL TERT-BUTYLAMINE/AMLODIPINE ARROW 4 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (196, 196, '60124472', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (197, 'CLOPIDOGREL ZF 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (197, 197, '60124999', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (198, 'CYAMEMAZINE VIATRIS 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (198, 198, '60125777', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (199, 'ACICLOVIR VIATRIS 5 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (199, 199, '60126377', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (200, 'OLANZAPINE VIATRIS 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (200, 200, '60126594', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (201, 'VIABORPAX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (201, 201, '60126612', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (202, 'SOLIFENACINE ACCORD 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (202, 202, '60126982', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (203, 'PEPSANE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (203, 203, '60127671', 'capsule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (204, 'SOLIFENACINE CRISTERS 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (204, 204, '60128339', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (205, 'HYRIMOZ 80 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (205, 205, '60129099', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (206, 'IBUPROFENE SANDOZ 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (206, 206, '60129665', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (207, 'METOJECT 17', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (207, 207, '60129957', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (208, 'FORMODUAL 100/6 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (208, 208, '60130062', 'solution pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (209, 'INOTYOL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (209, 209, '60130386', 'pommade');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (210, 'NAFTIDROFURYL TEVA 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (210, 210, '60130742', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (211, 'LOSARTAN ZENTIVA 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (211, 211, '60130906', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (212, 'XELEVIA 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (212, 212, '60131132', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (214, 'KEPPRA 100 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (214, 214, '60132330', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (215, 'CRISTAL NOURRISSONS', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (215, 215, '60132572', 'suppositoire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (216, 'RETROVIR 10 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (216, 216, '60132743', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (217, 'TUSSIDANE 30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (217, 217, '60133432', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (218, 'TAMSULOSINE ZYDUS FRANCE LP 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (218, 218, '60133973', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (219, 'LUMIGAN 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (219, 219, '60135981', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (220, 'ARIPIPRAZOLE SANDOZ 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (220, 220, '60136439', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (221, 'LACOSAMIDE ACCORD 10 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (221, 221, '60137021', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (222, 'RACECADOTRIL BIOGARAN CONSEIL 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (222, 222, '60139257', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (223, 'ESCITALOPRAM ZENTIVA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (223, 223, '60139563', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (224, 'CASPOFUNGINE STRAGEN 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (224, 224, '60140010', 'poudre pour solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (225, 'ARIPIPRAZOLE TEVA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (225, 225, '60140882', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (227, 'LOSARTAN HYDROCHLOROTHIAZIDE RANBAXY 100 mg/25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (227, 227, '60142043', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (228, 'ERLOTINIB BIOGARAN 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (228, 228, '60143654', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (229, 'KAPRUVIA 50 microgrammes/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (229, 229, '60144119', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (230, 'ROPINIROLE ARROW LP 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (230, 230, '60144464', 'comprimé pelliculé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (231, 'SIMVASTATINE ZYDUS FRANCE 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (231, 231, '60145580', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (233, 'VILDAGLIPTINE/METFORMINE EG 50 mg/1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (233, 233, '60148110', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (234, 'MOZOBIL 20 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (234, 234, '60148167', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (235, 'LANTHANE VIATRIS 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (235, 235, '60148893', 'comprimé à  croquer');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (236, 'EPHEDRINE AGUETTANT 3 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (236, 236, '60149276', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (237, 'RAVICTI 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (237, 237, '60150015', 'liquide');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (238, 'FOSFOCINE 4 g I.V.', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (238, 238, '60150232', 'poudre pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (239, 'DONEPEZIL ARROW GENERIQUES 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (239, 239, '60150467', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (240, 'REKAMBYS 900 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (240, 240, '60150638', 'suspension injectable à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (241, 'DIAMICRON 60 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (241, 241, '60150830', 'comprimé sécable à  libération modifiée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (242, 'MEMANTINE ARROW LAB 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (242, 242, '60151124', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (243, 'AMOXICILLINE ALMUS 1 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (243, 243, '60151544', 'comprimé dispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (244, 'OFLOXACINE BIOGARAN 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (244, 244, '60151697', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (245, 'ACIDE TRANEXAMIQUE VIATRIS SANTE 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (245, 245, '60151843', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (246, 'TRAMADOL/PARACETAMOL KRKA 37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (246, 246, '60152411', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (247, 'HAVRIX NOURRISSONS ET ENFANTS 720 U/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (247, 247, '60152436', 'suspension injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (248, 'BETNESOL 4 mg/1 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (248, 248, '60152607', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (249, 'ALFALASTIN 33', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (249, 249, '60153239', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (250, 'REPAGLINIDE SANDOZ 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (250, 250, '60154017', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (251, 'TRIMETAZIDINE EG 35 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (251, 251, '60154024', 'comprimé pelliculé à  libération modifiée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (252, 'CREME AU CALENDULA', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (252, 252, '60154309', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (253, 'TADALAFIL ALTER 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (253, 253, '60154743', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (254, 'DUPHALAC 10 g/15 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (254, 254, '60155329', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (255, 'ETOPOSIDE TEVA 200 mg/10 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (255, 255, '60155667', 'solution injectable pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (256, 'ZOLOFT 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (256, 256, '60155788', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (257, 'BICALUTAMIDE ALMUS 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (257, 257, '60156089', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (258, 'ENALAPRIL/LERCANIDIPINE ARROW 20 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (258, 258, '60156413', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (259, 'DICLOFENAC VIATRIS 1 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (259, 259, '60158147', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (260, 'ENALAPRIL EG 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (260, 260, '60159128', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (261, 'IVABRADINE ZENTIVA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (261, 261, '60160479', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (262, 'DEROXAT 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (262, 262, '60160707', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (263, 'SEVELAMER CARBONATE ARROW 800 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (263, 263, '60160835', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (264, 'CABAZITAXEL TEVA PHARMA 10 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (264, 264, '60160881', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (265, 'TRIATEC 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (265, 265, '60161143', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (266, 'SKUDEXUM 75 mg/25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (266, 266, '60162494', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (267, 'W770', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (267, 267, '60165234', 'granules et  solution en gouttes en gouttes buvable en gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (268, 'PREGABALINE CRISTERS PHARMA 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (268, 268, '60165394', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (269, 'MANIDIPINE BIOGARAN 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (269, 269, '60165857', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (270, 'LIPOROSA 20 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (270, 270, '60167235', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (271, 'RAMIPRIL KRKA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (271, 271, '60168465', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (272, 'NEORECORMON 30 000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (272, 272, '60168515', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (274, 'OLANZAPINE CRISTERS PHARMA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (274, 274, '60170224', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (275, 'ISOCARD', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (275, 275, '60172339', 'solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (276, 'ZELFUSOR 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (276, 276, '60173715', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (277, 'NAUSICALM ADULTES 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (277, 277, '60173964', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (278, 'REBLOZYL 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (278, 278, '60175591', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (279, 'IPRATROPIUM AGUETTANT ADULTES 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (279, 279, '60175716', 'solution pour inhalation par nébuliseur');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (280, 'PILOCARPINE 2 POUR CENT FAURE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (280, 280, '60175972', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (281, 'VORAXAZE 1000 unités', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (281, 281, '60176597', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (282, 'AMIODARONE SUN 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (282, 282, '60177044', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (283, 'L 28', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (283, 283, '60177628', 'solution buvable en gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (284, 'TEPADINA 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (284, 284, '60177724', 'poudre pour concentré pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (285, 'TRAVOPROST/TIMOLOL BIOGARAN 40 microgrammes/mL + 5 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (285, 285, '60178609', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (286, 'CHLORHYDRATE DE PROCAINE BIOSTABILEX 2 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (286, 286, '60178712', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (287, 'FENTANYL BIOGARAN 200 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (287, 287, '60179839', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (288, 'RAMIPRIL SANDOZ 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (288, 288, '60180720', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (289, 'VELETRI 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (289, 289, '60181231', 'poudre et  solvant pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (291, 'XYLOCAINE 10 mg/ml SANS CONSERVATEUR', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (291, 291, '60181733', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (293, 'BICARBONATE DE SODIUM BAXTER A 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (293, 293, '60182486', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (294, 'FRAXODI 11 400 U.I. Axa/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (294, 294, '60182657', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (295, 'NephroMAG 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (295, 295, '60183061', 'trousse et  trousse pour préparation radiopharmaceutique pour injection');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (297, 'CRESEMBA 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (297, 297, '60184590', 'poudre pour solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (298, 'RAMIPRIL VIATRIS 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (298, 298, '60185201', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (299, 'GELOFUSINE 40 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (299, 299, '60186552', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (300, 'LORMETAZEPAM ARROW 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (300, 300, '60186584', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (301, 'COVERAM 10 mg/5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (301, 301, '60187348', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (302, 'FENOFIBRATE CRISTERS PHARMA 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (302, 302, '60187501', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (303, 'TCAPS 37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (303, 303, '60188119', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (304, 'FUROSEMIDE ARROW 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (304, 304, '60192594', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (305, 'UNIFLOX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (305, 305, '60195010', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (306, 'VERCYTE 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (306, 306, '60195398', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (307, 'AMOXICILLINE/ACIDE CLAVULANIQUE VIATRIS 100 mg/12', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (307, 307, '60196176', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (308, 'RISPERIDONE MYLAN 3 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (308, 308, '60196945', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (309, 'FLUCONAZOLE AGUETTANT 2 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (309, 309, '60196977', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (310, 'ESCITALOPRAM ALMUS 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (310, 310, '60197011', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (311, 'BAVENCIO 20 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (311, 311, '60199966', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (312, 'NEUPRO 6 mg/24 h', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (312, 312, '60200500', 'dispositif');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (313, 'PERMIXON 160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (313, 313, '60200678', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (314, 'RETACRIT 4000 UI/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (314, 314, '60200938', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (315, 'L72', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (315, 315, '60202031', 'solution buvable en gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (316, 'BILASTINE ZENTIVA 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (316, 316, '60202750', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (317, 'RASAGILINE ARROW 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (317, 317, '60203418', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (318, 'PREGABALINE MYLAN 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (318, 318, '60203546', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (319, 'ADEMPAS 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (319, 319, '60203795', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (320, 'BUPRENORPHINE ARROW 6 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (320, 320, '60204573', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (321, 'BENLYSTA 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (321, 321, '60205159', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (322, 'KETESSE 50 mg/2 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (322, 322, '60205458', 'solution injectable et pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (323, 'PULMOSERUM', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (323, 323, '60206154', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (324, 'ACTIFED RHUME JOUR ET NUIT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (324, 324, '60206332', 'comprimé et  comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (325, 'EXEMESTANE SANDOZ 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (325, 325, '60207459', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (326, 'ALLOPURINOL EG 300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (326, 326, '60208251', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (327, 'NP100 PREMATURES AP-HP', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (327, 327, '60208447', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (328, 'PERINDOPRIL ARGININE ZENTIVA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (328, 328, '60208511', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (329, 'REPAGLINIDE ZYDUS 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (329, 329, '60209531', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (330, 'OXYNORM 10 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (330, 330, '60209645', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (331, 'CLOPIXOL 2 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (331, 331, '60209937', 'solution buvable gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (332, 'CALCIUM VITAMINE D3 BIOGARAN 500 mg/400 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (332, 332, '60210697', 'comprimé à  sucer');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (333, 'TCAPS 13 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (333, 333, '60210811', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (334, 'AZATHIOPRINE TEVA 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (334, 334, '60211183', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (335, 'JOSACINE 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (335, 335, '60212424', 'comprimé dispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (336, 'ANGUSTA 25 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (336, 336, '60213914', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (337, 'CAPTOPRIL HYDROCHLOROTHIAZIDE ARROW 50 mg/25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (337, 337, '60214350', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (338, 'CRYSVITA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (338, 338, '60215018', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (339, 'IDELVION 2000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (339, 339, '60216127', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (340, 'OLANZAPINE ARROW 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (340, 340, '60217108', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (341, 'W771', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (341, 341, '60217542', 'poudre');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (342, 'VINCRISTINE HOSPIRA 2 mg/2 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (342, 342, '60219803', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (343, 'FINASTERIDE ARROW GENERIQUES 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (343, 343, '60221042', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (344, 'CALTRATE 600 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (344, 344, '60222137', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (345, 'TALOXA 600 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (345, 345, '60223278', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (346, 'VOTUBIA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (346, 346, '60223417', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (347, 'MEDROL 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (347, 347, '60224316', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (348, 'NIMBEX 5 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (348, 348, '60224800', 'solution injectable et pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (349, 'TRAMADOL ARROW L.P. 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (349, 349, '60225681', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (350, 'MINOXIDIL COOPER 2 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (350, 350, '60226897', 'solution pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (351, 'CARBOCISTEINE SANDOZ CONSEIL 5 % ADULTES SANS SUCRE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (351, 351, '60226915', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (352, 'OLANZAPINE ACCORD 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (352, 352, '60226979', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (353, 'OZAWADE 18 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (353, 353, '60227166', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (354, 'TAMOXIFENE BIOGARAN 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (354, 354, '60230550', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (356, 'MAGNESIE SAN PELLEGRINO SANS ANIS 90 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (356, 356, '60232074', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (357, 'CYANOKIT 5 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (357, 357, '60232334', 'poudre pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (358, 'VALSARTAN KRKA 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (358, 358, '60232359', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (359, 'IBUFETUM 5 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (359, 359, '60233913', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (360, 'DOLIPRANE 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (360, 360, '60234100', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (361, 'VENLAFAXINE EVOLUGEN PHARMA LP 37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (361, 361, '60234214', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (362, 'TENSTATEN 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (362, 362, '60234221', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (363, 'CEFTRIAXONE VIATRIS 500 mg/5 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (363, 363, '60235330', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (364, 'PREZISTA 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (364, 364, '60235768', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (365, 'COVERAM 10 mg/5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (365, 365, '60236546', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (366, 'EPHEDRINE RENAUDIN 30 mg/10 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (366, 366, '60237858', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (367, 'SOLACY PEDIATRIQUE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (367, 367, '60238376', 'comprimé pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (369, 'PHYSIOGINE 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (369, 369, '60239706', 'ovule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (370, 'DESOGESTREL/ETHINYLESTRADIOL EG 150 microgrammes/20 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (370, 370, '60239802', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (371, 'UVIMAG B6', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (371, 371, '60240181', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (372, 'TALTZ 80 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (372, 372, '60241034', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (373, 'INNOVAIR 200/6 microgrammes par dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (373, 373, '60241874', 'solution pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (374, 'DYSPORT 500 UNITES SPEYWOOD', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (374, 374, '60242321', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (375, 'PENICILLINE G PANPHARMA 1 000 000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (375, 375, '60243544', 'poudre pour usage parentéral');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (376, 'DIALYSE PERITONEALE CONTINUE AMBULATOIRE 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (376, 376, '60244525', 'solution pour dialyse péritonéale');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (377, 'REVLIMID 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (377, 377, '60245253', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (378, 'DEBRIDAT 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (378, 378, '60246750', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (379, 'ESCITALOPRAM ZYDUS 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (379, 379, '60247432', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (380, 'EMTRICITABINE/TENOFOVIR DISOPROXIL ARROW 200 mg/245 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (380, 380, '60247507', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (381, 'LEPTAX 750 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (381, 381, '60248000', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (382, 'TAFINLAR 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (382, 382, '60248840', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (383, 'TREVICTA 350 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (383, 383, '60249796', 'suspension injectable à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (384, 'SPRYCEL 70 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (384, 384, '60249903', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (385, 'PREXATE 10 mg/ 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (385, 385, '60250567', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (386, 'ROSUVASTATINE EVOLUGEN 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (386, 386, '60251135', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (387, 'PIPERACILLINE PANPHARMA 1 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (387, 387, '60251352', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (388, 'EPINITRIL 10 mg/24 heures', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (388, 388, '60251516', 'dispositif');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (389, 'DOLOSPASMYL 60 mg/300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (389, 389, '60252027', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (390, 'EFFICORT LIPOPHILE 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (390, 390, '60252422', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (391, 'OLIGOSTIM MAGNESIUM', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (391, 391, '60252447', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (392, 'CALYPTOL INHALANT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (392, 392, '60253606', 'émulsion pour inhalation par fumigation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (393, 'TSOLUDOSE 150 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (393, 393, '60254754', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (394, 'SUVREZA 20 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (394, 394, '60254779', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (395, 'ALPROLIX 3000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (395, 395, '60256036', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (396, 'CALENDORON', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (396, 396, '60258521', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (397, 'NATISPRAY 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (397, 397, '60259242', 'solution pour pulvérisation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (398, 'OCTAPLEX 500 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (398, 398, '60259993', 'poudre et  solvant pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (399, 'TOXICARB', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (399, 399, '60260166', 'suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (400, 'RISPERDAL 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (400, 400, '60260497', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (401, 'BECLOSPIN 400 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (401, 401, '60260910', 'suspension pour inhalation par nébuliseur');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (402, 'RUBRACA 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (402, 402, '60261656', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (403, 'PERMIXON 160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (403, 403, '60263461', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (404, 'HERPESEDERMYL 5 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (404, 404, '60264410', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (405, 'BETATOP 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (405, 405, '60264830', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (406, 'OLANZAPINE MYLAN 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (406, 406, '60265252', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (407, 'ISOTRETINOINE ACNETRAIT 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (407, 407, '60265569', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (408, 'ATORVASTATINE VIATRIS GENERIQUES 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (408, 408, '60265932', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (409, 'GABAPENTINE CRISTERS 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (409, 409, '60266144', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (410, 'GALLIAD 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (410, 410, '60266265', 'générateur radiopharmaceutique');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (411, 'SIFROL 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (411, 411, '60267171', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (412, 'XIGDUO 5 mg/1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (412, 412, '60267506', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (413, 'ASMANEX TWISTHALER 400 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (413, 413, '60268519', 'poudre pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (414, 'VASTAREL 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (414, 414, '60269037', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (415, 'ORACILLINE 250 000 UI/5 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (415, 415, '60270114', 'suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (416, 'BOSENTAN ZENTIVA 125 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (416, 416, '60270395', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (417, 'PRAVASTATINE ZENTIVA 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (417, 417, '60270452', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (418, 'PERINDOPRIL/INDAPAMIDE KRKA 2 mg/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (418, 418, '60270712', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (419, 'XYLLOMAC 2 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (419, 419, '60271045', 'poudre pour solution injectable et pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (420, 'TERCIAN 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (420, 420, '60271248', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (421, 'SOMATOSTATINE VIATRIS 3 mg/1 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (421, 421, '60272948', 'poudre et  solvant pour solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (422, 'MONURIL 3 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (422, 422, '60273765', 'granulés pour solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (423, 'REANUTRIFLEX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (423, 423, '60274212', 'émulsion pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (424, 'TERBINAFINE VIATRIS 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (424, 424, '60274536', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (425, 'ROPINIROLE EG LP 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (425, 425, '60274618', 'comprimé pelliculé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (426, 'FLECTOR 1 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (426, 426, '60275086', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (427, 'ALYOSTAL PRICK CONTROLE POSITIF 10 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (427, 427, '60275467', 'solution pour prick-test');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (428, 'TERBUTALINE SANDOZ 5 mg/2 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (428, 428, '60277824', 'solution pour inhalation par nébuliseur');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (429, 'GABAPENTINE SANDOZ 800 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (429, 429, '60279775', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (430, 'FENTANYL ARROW 75 microgrammes/heure', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (430, 430, '60281114', 'dispositif');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (431, 'DAFALGANCAPS 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (431, 431, '60281210', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (432, 'ACEBUTOLOL BIOGARAN 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (432, 432, '60281598', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (433, 'SOLIFENACINE BIOGARAN 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (433, 433, '60282629', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (434, 'VALSARTAN ZENTIVA 160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (434, 434, '60282789', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (435, 'RIVASTIGMINE SANDOZ 4', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (435, 435, '60282814', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (436, 'SPEDIFEN 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (436, 436, '60282846', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (437, 'ABSTRAL 400 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (437, 437, '60282999', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (438, 'PIPERACILLINE PANPHARMA 4 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (438, 438, '60284142', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (439, 'LATANOPROST VIATRIS 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (439, 439, '60284377', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (440, 'NEBIVOLOL VIATRIS SANTE 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (440, 440, '60284516', 'comprimé quadrisécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (441, 'EZETIMIBE/SIMVASTATINE ARROW 10 mg/20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (441, 441, '60286296', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (442, 'SILDENAFIL EG 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (442, 442, '60286346', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (443, 'BIOCIDAN 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (443, 443, '60286556', 'collyre');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (444, 'RIXUBIS 3000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (444, 444, '60287206', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (446, 'TANAKAN 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (446, 446, '60287373', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (447, 'IMATINIB RANBAXY 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (447, 447, '60288137', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (448, 'MEMANTINE CRISTERS 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (448, 448, '60288443', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (449, 'OGASTORO 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (449, 449, '60288817', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (450, 'FERTISTARTKIT 900 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (450, 450, '60290273', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (451, 'VALIUM 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (451, 451, '60290800', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (452, 'ONCTOSE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (452, 452, '60291795', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (453, 'SOTALOL CRISTERS 80 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (453, 453, '60291941', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (454, 'IFOSFAMIDE EG 40 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (454, 454, '60292267', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (455, 'SORIATANE 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (455, 455, '60292349', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (456, 'SPEDIFEN 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (456, 456, '60292573', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (457, 'LETROZOLE ARROW LAB 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (457, 457, '60293216', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (458, 'GEL RECTOPANBILINE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (458, 458, '60293846', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (459, 'ZOLMITRIPTAN ZYDUS FRANCE 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (459, 459, '60294713', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (460, 'RECTOPANBILINE ADULTES', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (460, 460, '60295046', 'suppositoire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (461, 'BOCEAL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (461, 461, '60295135', 'solution pour pulvérisation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (463, 'BENDAMUSTINE MYLAN 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (463, 463, '60295427', 'poudre pour solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (464, 'EPLERENONE TEVA 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (464, 464, '60296511', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (465, 'PROPESS 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (465, 465, '60297517', 'système de diffusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (466, 'MYCODECYL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (466, 466, '60298028', 'poudre pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (467, 'EFFERALGANMED 80 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (467, 467, '60298455', 'suppositoire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (468, 'CERTICAN 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (468, 468, '60298932', 'comprimé');


INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (470, 'GLICLAZIDE TEVA 30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (470, 470, '60300340', 'comprimé à  libération modifiée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (471, 'NIFUROXAZIDE ARROW 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (471, 471, '60300408', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (472, 'CUROSURF 120 mg/1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (472, 472, '60301200', 'suspension pour instillation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (473, 'FENOFIBRATE BIOGARAN 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (473, 473, '60302512', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (474, 'TOPIRAMATE ARROW GENERIQUES 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (474, 474, '60303404', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (475, 'LIORESAL 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (475, 475, '60304050', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (476, 'TRAMADOL VIATRIS LP 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (476, 476, '60304591', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (477, 'NUROFEN 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (477, 477, '60305960', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (478, 'IRINOTECAN VIATRIS 20 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (478, 478, '60306813', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (479, 'FONGILEINE 1 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (479, 479, '60307032', 'poudre pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (480, 'SUPPLIVEN', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (480, 480, '60307630', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (481, 'CORDARONE 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (481, 481, '60308369', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (482, 'DOLIPRANE 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (482, 482, '60310861', 'suppositoire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (483, 'VALACICLOVIR VIATRIS 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (483, 483, '60311269', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (484, 'ACICLOVIR TEVA 5 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (484, 484, '60311803', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (485, 'ENTECAVIR MYLAN 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (485, 485, '60313672', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (486, 'ROSUVASTATINE CRISTERS 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (486, 486, '60314183', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (487, 'ARTIREM 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (487, 487, '60314272', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (488, 'BRINTELLIX 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (488, 488, '60316362', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (490, 'DILTIAZEM ZENTIVA LAB LP 300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (490, 490, '60319789', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (491, 'TCAPS 175 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (491, 491, '60320656', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (492, 'IBRANCE 125 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (492, 492, '60321676', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (493, 'HYDROXYZINE TEVA 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (493, 493, '60322461', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (494, 'PHENOBARBITAL RICHARD 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (494, 494, '60323481', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (495, 'KENZEN 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (495, 495, '60323969', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (496, 'SUPPOSITOIRE A LA GLYCERINE MAYOLY SPINDLER ADULTES', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (496, 496, '60324658', 'suppositoire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (497, 'NEFOPAM MEDISOL 20 mg/2 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (497, 497, '60325201', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (498, 'LEVOFLOXACINE ZYDUS 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (498, 498, '60326538', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (499, 'BETAHISTINE MYLAN 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (499, 499, '60327056', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (500, 'COMIRNATY OMICRON XBB.1.5 10 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (500, 500, '60327063', 'dispersion injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (501, 'BRIEM 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (501, 501, '60327266', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (502, 'ZALDIAR 37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (502, 502, '60327615', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (503, 'ACTISKENAN 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (503, 503, '60328261', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (504, 'NOLVADEX 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (504, 504, '60328432', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (505, 'MANNITOL 20 % AGUETTANT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (505, 505, '60329242', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (506, 'CEFOXITINE SUBSTIPHARM 1 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (506, 506, '60329598', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (507, 'SALICAIRINE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (507, 507, '60329609', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (508, 'TEICOPLANINE VIATRIS 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (508, 508, '60330180', 'poudre pour solution injectable pour perfusion ou buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (509, 'MELOXICAM BIOGARAN 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (509, 509, '60330522', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (510, 'FUCIDINE 2 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (510, 510, '60330586', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (511, 'PRASUGREL EG LABO 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (511, 511, '60330636', 'comprimé pelliculé');


INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (513, 'DIAMICRON 60 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (513, 513, '60331738', 'comprimé sécable à  libération modifiée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (515, 'LINEZOLIDE FRESENIUS KABI 600 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (515, 515, '60335124', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (516, 'RISEDRONATE ZYDUS FRANCE 35 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (516, 516, '60335291', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (517, 'GLIMEPIRIDE SANDOZ 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (517, 517, '60337328', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (518, 'SPIRONOLACTONE TEVA 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (518, 518, '60337762', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (519, 'FLUOXETINE BIOGARAN 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (519, 519, '60338857', 'comprimé dispersible sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (520, 'OMACOR 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (520, 520, '60339254', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (522, 'CINACALCET EG 30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (522, 522, '60340413', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (524, 'INDAPAMIDE ARROW 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (524, 524, '60342439', 'comprimé pelliculé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (525, 'LEVETIRACETAM CRISTERS 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (525, 525, '60344066', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (526, 'MONOCRIXO L.P. 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (526, 526, '60344529', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (527, 'NATRIXAM 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (527, 527, '60345218', 'comprimé à  libération modifiée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (528, 'TECENTRIQ 1200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (528, 528, '60345905', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (529, 'KETOCONAZOLE VIATRIS 2 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (529, 529, '60347710', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (530, 'FOSCARNET TILLOMED 24 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (530, 530, '60347728', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (531, 'EPCLUSA 200 mg/50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (531, 531, '60348342', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (532, 'DOXYLIS 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (532, 532, '60349519', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (533, 'DIFRAREL E', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (533, 533, '60349711', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (534, 'RIXUBIS 250 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (534, 534, '60351694', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (535, 'SERESTA 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (535, 535, '60351986', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (536, 'AMLODIPINE/VALSARTAN ACCORD 10 mg/160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (536, 536, '60352006', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (537, 'METHOTREXATE BIODIM 25 mg/1 mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (537, 537, '60353108', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (538, 'MAGNESPASMYL 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (538, 538, '60355027', 'granulés');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (539, 'ORAQIX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (539, 539, '60355340', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (540, 'GLIMEPIRIDE VIATRIS 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (540, 540, '60355600', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (541, 'LAMOTRIGINE SANDOZ 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (541, 541, '60355931', 'comprimé dispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (542, 'FLECAINIDE ZENTIVA LP 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (542, 542, '60356613', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (543, 'MATRIFEN 75 microgrammes/heure', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (543, 543, '60356727', 'dispositif');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (545, 'CEFTAZIDIME ARROW 2 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (545, 545, '60360608', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (546, 'ZANOSAR', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (546, 546, '60361959', 'lyophilisat pour préparation injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (547, 'SPIRIVA 18 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (547, 547, '60363967', 'poudre pour inhalation en gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (548, 'BIPRETERAX 10 mg/2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (548, 548, '60364161', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (550, 'ACIDE ALENDRONIQUE ARROW LAB 70 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (550, 550, '60365142', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (551, 'ZOPICLONE CRISTERS PHARMA 7', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (551, 551, '60365740', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (552, 'AMOXICILLINE BIOGARAN 125 mg/5 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (552, 552, '60366319', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (553, 'ROSUVASTATINE SUN 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (553, 553, '60366689', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (554, 'COVERAM 5 mg/5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (554, 554, '60367022', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (555, 'SIGNIFOR 60 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (555, 555, '60368028', 'poudre et  solvant pour suspension injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (556, 'ONCOVIN 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (556, 556, '60368099', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (557, 'TAGRISSO 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (557, 557, '60368512', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (558, 'CYTARABINE EG 50 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (558, 558, '60369984', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (559, 'NALTREXONE VIATRIS 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (559, 559, '60370919', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (560, 'NEUTRICID', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (560, 560, '60371120', 'suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (561, 'INEGY 10 mg/20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (561, 561, '60371679', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (562, 'ROPINIROLE KRKA LP 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (562, 562, '60371992', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (563, 'RAMIPRIL ARROW LAB 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (563, 563, '60372197', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (564, 'ANAUSIN METOCLOPRAMIDE 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (564, 564, '60372215', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (565, 'MYTELASE 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (565, 565, '60374821', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (566, 'ARACYTINE 1 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (566, 566, '60375001', 'poudre pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (567, 'AMOXICILLINE BIOGARAN 250 mg/5 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (567, 567, '60375058', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (568, 'GLUCOSE 5 % BAXTER', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (568, 568, '60375720', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (569, 'VALSARTAN BIOGARAN 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (569, 569, '60375880', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (570, 'PRETERVAL 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (570, 570, '60375930', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (571, 'VINORELBINE PIERRE FABRE 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (571, 571, '60376637', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (572, 'HYTRINE 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (572, 572, '60376815', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (573, 'KETOPROFENE/OMEPRAZOLE LABORATOIRE X.O 100 mg/20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (573, 573, '60377116', 'gélule à  libération modifiée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (574, 'ALPRAZOLAM VIATRIS 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (574, 574, '60377803', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (575, 'APROKAM 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (575, 575, '60378168', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (576, 'GLUCOSE 10 % BIOLUZ', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (576, 576, '60378182', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (577, 'ARTANE 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (577, 577, '60379544', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (578, 'QUADRASA 2 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (578, 578, '60382608', 'poudre pour solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (579, 'TIPUREX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (579, 579, '60385248', 'solution buvable en gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (580, 'TAXOTERE 20 mg/1 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (580, 580, '60385433', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (582, 'DANTRIUM 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (582, 582, '60385682', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (584, 'HAVRIX 1440 U/1 ml ADULTES', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (584, 584, '60386414', 'suspension injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (585, 'CEFOTAXIME NORIDEM 2 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (585, 585, '60386439', 'poudre pour solution injectable ou pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (586, 'CADUET 10 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (586, 586, '60386460', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (587, 'PERINDOPRIL EG 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (587, 587, '60386859', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (588, 'METHOTREXATE ACCORD 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (588, 588, '60390455', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (589, 'AVASTIN 25 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (589, 589, '60391646', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (590, 'IXPRIM 37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (590, 590, '60392513', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (591, 'XARELTO 15 mg + 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (591, 591, '60393661', 'comprimé pelliculé et  comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (592, 'HEXETIDINE SANDOZ CONSEIL 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (592, 592, '60394998', 'solution pour bain de bouche');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (593, 'SUSTIVA 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (593, 593, '60396426', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (594, 'TRAMADOL/PARACETAMOL BGR 37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (594, 594, '60396465', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (595, 'TIMOPTOL 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (595, 595, '60396928', 'collyre en solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (596, 'BEDELIX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (596, 596, '60397122', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (597, 'LEELOO CONTINU 100 microgrammes/20 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (597, 597, '60397542', 'comprimé pelliculé et  comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (598, 'REPLAGAL 1 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (598, 598, '60397909', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (599, 'SERTRALINE CRISTERS 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (599, 599, '60398167', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (600, 'VARESOL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (600, 600, '60399326', 'granules');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (601, 'ACTONEL 35 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (601, 601, '60399454', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (602, 'PHLOROGLUCINOL EG 80 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (602, 602, '60399956', 'comprimé dispersible et orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (603, 'LENALIDOMIDE MYLAN 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (603, 603, '60401186', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (604, 'NICOTINELL TTS 7 mg/24 H', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (604, 604, '60401745', 'dispositif');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (605, 'GALANTAMINE CRISTERS LP 8 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (605, 605, '60401898', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (606, 'AMOXICILLINE/ACIDE CLAVULANIQUE BIOGARAN 500 mg/62', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (606, 606, '60403714', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (607, 'CABAZITAXEL EVER PHARMA 10 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (607, 607, '60406016', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (608, 'ATRACURIUM KALCEKS 10 mg/mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (608, 608, '60406781', 'solution injectable ou pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (609, 'CANTALENE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (609, 609, '60406856', 'comprimé à  sucer');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (610, 'ACETATE DE CYPROTERONE SANDOZ 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (610, 610, '60406938', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (613, 'PHYTACIS. Trousse pour la préparation de la solution injectable de phytate de technétium [99m Tc]', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (613, 613, '60408405', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (614, 'MUSE 250 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (614, 614, '60415442', 'bà¢ton pour usage urétral');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (615, 'METRONIDAZOLE ARROW 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (615, 615, '60416081', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (616, 'ACICLOVIR EG 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (616, 616, '60418673', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (617, 'OTEZLA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (617, 617, '60418716', 'comprimé pelliculé et  comprimé pelliculé et  comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (618, 'LAMIDERM 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (618, 618, '60418851', 'émulsion pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (619, 'PERIKABIVEN', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (619, 619, '60420681', 'solution et  émulsion et  solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (620, 'INSULATARD PENFILL 100 unités internationales/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (620, 620, '60423446', 'suspension injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (621, 'VITAMINE B12 DELAGRANGE 1000 microgrammes/2 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (621, 621, '60423791', 'solution injectable et buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (622, 'AMOXICILLINE VIATRIS 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (622, 622, '60424338', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (623, 'PULMOTEC', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (623, 623, '60424605', 'trousse pour préparation radiopharmaceutique');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (624, 'ORALAIR 100 IR & 300 IR', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (624, 624, '60425707', 'comprimé et  comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (625, 'RAMIPRIL TEVA SANTE 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (625, 625, '60427163', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (626, 'SITAGLIPTINE/METFORMINE ZYDUS 50 mg/1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (626, 626, '60427398', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (627, 'LITAK 2 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (627, 627, '60427957', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (628, 'THIOCOLCHICOSIDE SANDOZ 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (628, 628, '60427989', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (629, 'AVODART 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (629, 629, '60429851', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (630, 'MILNACIPRAN ARROW 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (630, 630, '60430095', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (631, 'NEVIRAPINE SANDOZ LP 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (631, 631, '60433166', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (632, 'TADALAFIL TEVA 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (632, 632, '60433344', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (633, 'FARESTON 60 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (633, 633, '60433369', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (634, 'NEURODORON', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (634, 634, '60433629', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (636, 'RIZATRIPTAN EG 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (636, 636, '60434834', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (637, 'TIGREAT 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (637, 637, '60435263', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (638, 'BETADINE 10 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (638, 638, '60436479', 'solution pour gargarisme ou pour bain de bouche');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (639, 'SITAGLIPTINE/METFORMINE TEVA 50 mg/1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (639, 639, '60437225', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (640, 'NEBIVOLOL EVOLUGEN 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (640, 640, '60437428', 'comprimé quadrisécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (641, 'DESINTEX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (641, 641, '60438793', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (642, 'NITRIDERM TTS 10 mg/24 h', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (642, 642, '60439087', 'dispositif');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (643, 'FLOXYFRAL 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (643, 643, '60439525', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (644, 'TCAPS 88 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (644, 644, '60441558', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (645, 'AMIODARONE VIATRIS 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (645, 645, '60441622', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (646, 'CHAMPIX 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (646, 646, '60442838', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (648, 'B O P', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (648, 648, '60443192', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (649, 'TORISEL 30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (649, 649, '60443413', 'solution à  diluer et  diluant pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (650, 'LOSARTAN ZYDUS 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (650, 650, '60443477', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (651, 'XATRAL LP 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (651, 651, '60443609', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (653, 'BILASTINE EG 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (653, 653, '60443897', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (654, 'DIOVENOR 600 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (654, 654, '60445204', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (655, 'TAZOCILLINE 4 g/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (655, 655, '60445784', 'poudre pour solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (656, 'FULVESTRANT EG 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (656, 656, '60446306', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (657, 'CARBOPLATINE ARROW 10 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (657, 657, '60446612', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (658, 'MYALEPTA 3 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (658, 658, '60446726', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (659, 'BICARBONATE DE SODIUM COOPER 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (659, 659, '60446911', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (660, 'NORCHOLESTEROL IODE [131I] CIS BIO INTERNATIONAL 7', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (660, 660, '60447461', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (661, 'ARKOGELULES MILLEPERTUIS', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (661, 661, '60448702', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (662, 'TERIFLUNOMIDE TEVA 14 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (662, 662, '60448937', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (664, 'SPIRAMYCINE SANDOZ 3 M.U.I.', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (664, 664, '60450831', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (666, 'OLANZAPINE ARROW 7', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (666, 666, '60451762', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (667, 'ATEPADENE 30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (667, 667, '60453083', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (668, 'AMOXICILLINE BIOGARAN 500 mg/5 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (668, 668, '60453197', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (669, 'NATRIXAM 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (669, 669, '60453382', 'comprimé à  libération modifiée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (671, 'QUINAPRIL HYDROCHLOROTHIAZIDE EG 20 mg/12', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (671, 671, '60455586', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (672, 'PREXATE 17', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (672, 672, '60455789', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (673, 'ZYPREXA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (673, 673, '60456154', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (674, 'AGYRAX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (674, 674, '60456535', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (675, 'IPERTEN 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (675, 675, '60456948', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (676, 'IRESSA 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (676, 676, '60457263', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (677, 'YONDELIS 1 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (677, 677, '60457338', 'poudre pour solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (679, 'OLANZAPINE ACCORD 7', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (679, 679, '60457822', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (680, 'FULPHILA 6 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (680, 680, '60457929', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (681, 'ORFADIN 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (681, 681, '60459499', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (682, 'SUFENTANIL VIATRIS 5 microgrammes/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (682, 682, '60460398', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (683, 'TSOLUDOSE 175 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (683, 683, '60460996', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (684, 'GLUCOSE 5 % PROAMP', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (684, 684, '60461105', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (685, 'TARGOCID 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (685, 685, '60462328', 'poudre et  solvant pour solution injectable pour perfusion ou buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (686, 'ZOLMITRIPTAN CRISTERS 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (686, 686, '60462513', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (687, 'MACROGOL BIOGARAN 10 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (687, 687, '60462538', 'poudre pour solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (688, 'LAMIVUDINE/ZIDOVUDINE ARROW 150 mg/300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (688, 688, '60462659', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (689, 'BOSULIF 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (689, 689, '60462965', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (690, 'TAGRISSO 80 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (690, 690, '60463095', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (691, 'ACIDE ZOLEDRONIQUE MEDAC 4 mg/100 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (691, 691, '60463323', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (692, 'DILTIAZEM BIOGARAN 60 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (692, 692, '60463871', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (693, 'SPIRONOLACTONE VIATRIS 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (693, 693, '60464076', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (694, 'UMULINE NPH KWIKPEN 100 UI/1 mL', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (694, 694, '60464222', 'suspension injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (695, 'EFFENTORA 600 microgrammes', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (695, 695, '60466515', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (696, 'NOVOPULMON NOVOLIZER 200 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (696, 696, '60468092', 'poudre pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (697, 'DONEPEZIL SANDOZ 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (697, 697, '60468103', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (698, 'GLYCEROL/VASELINE/PARAFFINE TEVA 15 %/8 %/2 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (698, 698, '60468320', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (699, 'EPLERENONE ZENTIVA 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (699, 699, '60470015', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (700, 'ZYLORIC 300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (700, 700, '60470499', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (701, 'RINGER LACTATE LAVOISIER', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (701, 701, '60470798', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (702, 'FRAXIPARINE 5 700 U.I. Axa/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (702, 702, '60470990', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (703, 'LEVODOPA/CARBIDOPA/ENTACAPONE VIATRIS 150 mg/37', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (703, 703, '60472849', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (704, 'TELMISARTAN ACTAVIS 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (704, 704, '60473157', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (705, 'COVERAM 10 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (705, 705, '60473812', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (706, 'SEROPLEX 15 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (706, 706, '60474889', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (707, 'PARACETAMOL CHLORPHENAMINE VITAMINE C CLARIX', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (707, 707, '60475749', 'poudre pour solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (709, 'ATROPINE ALCON 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (709, 709, '60476979', 'collyre');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (710, 'ACEBUTOLOL ZYDUS 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (710, 710, '60477038', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (711, 'CONTRAMAL 100 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (711, 711, '60477650', 'solution buvable en gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (712, 'AMLODIPINE/VALSARTAN ARROW 5 mg/160 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (712, 712, '60478097', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (713, 'PERINDOPRIL TOSILATE TEVA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (713, 713, '60479345', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (714, 'GALANTAMINE TEVA SANTE LP 24 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (714, 714, '60480212', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (715, 'METRONIDAZOLE BIOGARAN 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (715, 715, '60480276', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (716, 'XULTOPHY 100 unités/ml + 3', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (716, 716, '60480810', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (717, 'LIPOROSA 10 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (717, 717, '60481517', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (718, 'IPRATROPIUM ARROW 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (718, 718, '60482665', 'solution pour inhalation par nébuliseur');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (719, 'LERCAN 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (719, 719, '60483685', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (720, 'SEPTANEST 40 mg/mL ADRENALINEE AU 1/100 000', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (720, 720, '60484221', 'solution injectable pour usage dentaire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (721, 'ZOVIRAX 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (721, 721, '60485234', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (722, 'OXYCODONE SANDOZ 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (722, 722, '60485572', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (724, 'SUMATRIPTAN SUN 6 mg/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (724, 724, '60486090', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (726, 'IFIRMASTA 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (726, 726, '60488216', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (727, 'RAMIPRIL ZYDUS FRANCE 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (727, 727, '60489617', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (728, 'PONAXEM 1 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (728, 728, '60489738', 'poudre pour solution injectable ou pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (729, 'CLOBETASOL SUBSTIPHARM 500 microgrammes/g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (729, 729, '60490256', 'shampooing');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (730, 'QUETIAPINE EG LP 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (730, 730, '60490893', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (731, 'DAFLON 500 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (731, 731, '60491130', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (732, 'CORTANCYL 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (732, 732, '60492702', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (733, 'VIREAD 163 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (733, 733, '60493359', 'comprimé pelliculé');


INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (735, 'KETOPROFENE ZENTIVA LP 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (735, 735, '60494614', 'comprimé sécable à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (738, 'COMIRNATY 30 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (738, 738, '60495328', 'dispersion à  diluer pour dispersion injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (739, 'HEPTAMINOL H2 PHARMA 30', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (739, 739, '60496348', 'solution buvable en gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (740, 'GLIBENCLAMIDE SANDOZ 2', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (740, 740, '60497140', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (741, 'DEPRENYL 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (741, 741, '60498751', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (742, 'ERLOTINIB BIOGARAN 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (742, 742, '60500519', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (743, 'DONEPEZIL ZYDUS 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (743, 743, '60502559', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (744, 'KETOCONAZOLE EG 2 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (744, 744, '60502840', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (745, 'DEXTRION G 10 LAVOISIER', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (745, 745, '60503789', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (746, 'BUDESONIDE ARROW 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (746, 746, '60505950', 'suspension pour inhalation par nébuliseur');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (747, 'FEBUXOSTAT CRISTERS 120 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (747, 747, '60506358', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (748, 'OLANZAPINE BIOGARAN 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (748, 748, '60507086', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (749, 'HYDROXYZINE ARROW 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (749, 749, '60507271', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (750, 'FERRIPROX 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (750, 750, '60508302', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (751, 'DOLODENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (751, 751, '60508430', 'solution');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (752, 'TRIMEBUTINE PFIZER 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (752, 752, '60508697', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (753, 'TAXOTERE 160 mg/8 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (753, 753, '60509781', 'solution à  diluer pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (754, 'ALOFISEL 5 millions de cellules/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (754, 754, '60511177', 'suspension injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (755, 'OMACOR', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (755, 755, '60511953', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (756, 'CANDESARTAN/HYDROCHLOROTHIAZIDE SANDOZ 16 mg/12', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (756, 756, '60512090', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (757, 'SIMVASTATINE MYLAN 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (757, 757, '60512336', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (758, 'BUDESONIDE ZENTIVA 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (758, 758, '60512521', 'suspension pour inhalation par nébuliseur');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (759, 'ALFUZOSINE VIATRIS L.P. 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (759, 759, '60513032', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (760, 'NITISINONE MDK 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (760, 760, '60513598', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (761, 'HIDONAC 5 g/25 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (761, 761, '60513655', 'solution injectable pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (762, 'AMIODARONE ARROW 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (762, 762, '60514006', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (763, 'ZARZIO 48 MU/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (763, 763, '60514839', 'solution injectable ou pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (764, 'AZITHROMYCINE CRISTERS PHARMA 250 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (764, 764, '60514878', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (765, 'PERINDOPRIL/INDAPAMIDE SANDOZ 2 mg/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (765, 765, '60514928', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (766, 'AMOXICILLINE/ACIDE CLAVULANIQUE ZENTIVA LAB 500 mg/62', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (766, 766, '60516765', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (767, 'TARKA LP 240 mg/4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (767, 767, '60516982', 'comprimé pelliculé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (768, 'AMISULPRIDE SANDOZ 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (768, 768, '60517664', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (769, 'ZYMAFLUOR 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (769, 769, '60517707', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (770, 'SERECOR 300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (770, 770, '60518136', 'gélule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (771, 'DIACTANE 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (771, 771, '60518378', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (772, 'ATORVASTATINE ALMUS PHARMA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (772, 772, '60519117', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (773, 'IRBESARTAN CRISTERS 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (773, 773, '60519505', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (774, 'ECONAZOLE TEVA SANTE 1 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (774, 774, '60521470', 'poudre pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (775, 'FRAGMINE 18 000 U.I. anti-Xa/0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (775, 775, '60521926', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (776, 'LEUSTATINE 1 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (776, 776, '60522572', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (777, 'PAROXETINE CRISTERS 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (777, 777, '60524064', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (778, 'GLUCOSE 5 % COOPER', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (778, 778, '60524573', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (779, 'RETROVIR 100 mg/10 ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (779, 779, '60524598', 'solution buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (780, 'BISOPROLOL TEVA 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (780, 780, '60524826', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (781, 'ROXITHROMYCINE TEVA 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (781, 781, '60526880', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (782, 'GYNO-PEVARYL LP 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (782, 782, '60527320', 'ovule à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (783, 'FILSUVEZ', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (783, 783, '60528073', 'gel');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (784, 'CLOMIPRAMINE SANDOZ 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (784, 784, '60528874', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (785, 'NEPEXTO 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (785, 785, '60529218', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (786, 'CHLORHEXIDINE/CHLOROBUTANOL SANDOZ 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (786, 786, '60529613', 'solution pour bain de bouche');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (787, 'ESMYA 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (787, 787, '60529816', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (788, 'ZOPHREN 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (788, 788, '60530882', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (789, 'OLANZAPINE CRISTERS 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (789, 789, '60530925', 'comprimé orodispersible');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (791, 'LYSANXIA 15 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (791, 791, '60534076', 'solution buvable gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (792, 'FLEBOGAMMA DIF 50 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (792, 792, '60534795', 'solution pour perfusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (793, 'ESTRING 2 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (793, 793, '60535331', 'système de diffusion');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (794, 'BECOZYME', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (794, 794, '60535623', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (795, 'LENALIDOMIDE MYLAN 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (795, 795, '60535915', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (796, 'ENALAPRIL/HYDROCHLOROTHIAZIDE TEVA 20 mg/12', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (796, 796, '60536209', 'comprimé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (797, 'RUPATADINE ARROW 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (797, 797, '60539130', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (798, 'DRILL MIEL ROSAT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (798, 798, '60539301', 'pastille');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (799, 'BRONCHODERMINE ENFANTS', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (799, 799, '60542703', 'suppositoire');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (800, 'ATAZANAVIR MYLAN 150 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (800, 800, '60542735', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (801, 'RAMIPRIL EG 1', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (801, 801, '60542920', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (802, 'VOCABRIA 30 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (802, 802, '60543082', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (803, 'LERCAPRESS 20 mg/10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (803, 803, '60543292', 'comprimé pelliculé');


INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (805, 'GELSEMIUM COMPLEXE Numéro 70', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (805, 805, '60545343', 'solution buvable en gouttes');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (806, 'UVECAPS 20 000 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (806, 806, '60545966', 'capsule molle');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (807, 'MONTELUKAST ZENTIVA LAB 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (807, 807, '60546299', 'comprimé à  croquer');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (808, 'BETADINE 10 POUR CENT', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (808, 808, '60546502', 'gel pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (809, 'PAROXETINE VIATRIS 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (809, 809, '60546662', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (810, 'NOZINAN 25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (810, 810, '60548802', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (811, 'TEMGESIC 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (811, 811, '60549391', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (812, 'FOSTIMONKIT 150 UI', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (812, 812, '60549797', 'poudre et  solvant pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (813, 'IVABRADINE ACCORD 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (813, 813, '60549911', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (814, 'CEFTAZIDIME PANPHARMA 2 g', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (814, 814, '60550493', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (815, 'EUPANTOL 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (815, 815, '60550568', 'poudre pour solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (816, 'IBUPROFENE EG 400 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (816, 816, '60550988', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (817, 'KETREL 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (817, 817, '60552619', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (818, 'BOSENTAN ZENTIVA 62', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (818, 818, '60552925', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (819, 'KETOPROFENE CRISTERS 100 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (819, 819, '60554125', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (820, 'ETHINYLESTRADIOL/DROSPIRENONE CRISTERS 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (820, 820, '60555469', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (821, 'PERINDOPRIL/AMLODIPINE ZENTIVA 4 mg/5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (821, 821, '60555889', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (822, 'AMOXICILLINE/ACIDE CLAVULANIQUE ZENTIVA LAB 1 g/125 mg ADULTES', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (822, 822, '60556852', 'poudre pour suspension buvable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (823, 'PARACETAMOL BIOGARAN CONSEIL 1000 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (823, 823, '60557071', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (824, 'KETODERM 2 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (824, 824, '60557096', 'crème');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (825, 'RIVASTIGMINE VIATRIS 3 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (825, 825, '60557826', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (826, 'FENTANYL ZENTIVA 75 microgrammes/heure', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (826, 826, '60558248', 'dispositif');


INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (828, 'TRANDATE 5 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (828, 828, '60558554', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (829, 'SEVELAMER CARBONATE BIOGARAN 800 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (829, 829, '60558629', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (830, 'PANFUREX 200 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (830, 830, '60558682', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (831, 'VALSARTAN HYDROCHLOROTHIAZIDE ZENTIVA LAB 160 mg/25 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (831, 831, '60560046', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (832, 'PRITOR 40 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (832, 832, '60560224', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (833, 'FLUCONAZOLE EVOLUGEN 50 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (833, 833, '60560861', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (834, 'MEMANTINE RANBAXY 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (834, 834, '60561269', 'comprimé pelliculé sécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (835, 'FENUGRENE', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (835, 835, '60561333', 'comprimé enrobé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (836, 'DOXAZOSINE VIATRIS LP 4 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (836, 836, '60562606', 'comprimé à  libération prolongée');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (837, 'ROSUVASTATINE BGR 10 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (837, 837, '60562734', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (838, 'PLAVIX 300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (838, 838, '60562855', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (839, 'FIXORINOX 50 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (839, 839, '60564219', 'suspension pour pulvérisation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (840, 'EPHEDRINE ARROW 30 mg/ml', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (840, 840, '60565310', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (841, 'TOBI PODHALER 28 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (841, 841, '60565723', 'poudre pour inhalation en gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (842, 'ENALAPRIL RANBAXY 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (842, 842, '60565730', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (843, 'TEMERIT 5 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (843, 843, '60566686', 'comprimé quadrisécable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (845, 'ALAIRGIX RHINITE ALLERGIQUE CROMOGLICATE DE SODIUM 2 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (845, 845, '60568235', 'solution pour pulvérisation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (846, 'QUINAPRIL TEVA 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (846, 846, '60568559', 'comprimé pelliculé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (847, 'ANAGRELIDE SANDOZ 0', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (847, 847, '60569173', 'gélule');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (848, 'SERETIDE DISKUS 500 microgrammes/50 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (848, 848, '60569419', 'poudre pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (849, 'IBUPROFENE CHEMINEAU 5 %', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (849, 849, '60569860', 'solution pour application');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (850, 'PRALUENT 75 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (850, 850, '60570108', 'solution injectable');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (851, 'MICARDISPLUS 40 mg/12', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (851, 851, '60570229', 'comprimé');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (852, 'BECLOJET 250 microgrammes/dose', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (852, 852, '60571391', 'solution pour inhalation');

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (854, 'TADALAFIL ZENTIVA 20 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (854, 854, '60572746', 'comprimé pelliculé');


insert into gsb.stock (nom, categorie, quantite_disponible) values ('Agitateur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Autoclave', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Balance', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Bioréacteur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Machine d''emballage sous blister', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Machine de remplissage de bouteilles', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Machine de remplissage de capsules', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Centrifugeuse', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Système de chromatographie', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Tambour de revêtement', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Moulin colloïdal', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Tapis roulant', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Appareil de test de dissolution', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Appareil de distillation', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Four de séchage', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Émulsifiant', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Évaporateur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Fermenteur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Sécheur à  lit fluidisé', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Lyophilisateur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Chromatographe en phase gazeuse', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Système d''électrophorèse sur gel', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Homogénéisateur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Plaque chauffante', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Incubateur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Lyophilisateur', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Agitateur magnétique', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Spectromètre de masse', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Lecteur de microplaques', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Microscope', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Fraiseuse', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Vaisseau de mélange', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Analyseur d''humidité', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Mortier et pilon', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Cylceur thermique PCR', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Pompe péristaltique', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('pH-mètre', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Pipette', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Vaisseau sous pression', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Réfractomètre', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Évaporateur rotatif', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Spectrophotomètre', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Tige d''agitation', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Testeur de dureté des comprimés', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Presse à  comprimés', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Appareil de titrage', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Mètre de turbidité', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Nettoyeur ultrasonique', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Machine de remplissage de flacons', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Viscosimètre', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Mélangeur vortex', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Bain-marie', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Système de purification d''eau', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Balance de pesée', 'Materiel', 6);
insert into gsb.stock (nom, categorie, quantite_disponible) values ('Diffractomètre à  rayons X', 'Materiel', 6);




insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3000,'ANASTROZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (1, 3000, '60002283', 'comprimé', '1,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3001,'RANITIDINE (CHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (2, 3001, '60002504', 'comprimé', '168 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3002,'ACTAEA RACEMOSA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (3, 3002, '60002746', 'granules', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3003,'DIPROPIONATE DE BÉCLOMÉTASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (4, 3003, '60003620', 'suspension', '800 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3004,'FÉNOFIBRATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (5, 3004, '60004277', 'gélule', '100,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3005,'TRAMADOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (6, 3005, '60004487', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3006,'CABAZITAXEL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (7, 3006, '60004505', 'solution', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3007,'METFORMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (8, 3007, '60004932', 'comprimé', '780 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3008,'FAMOTIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (9, 3008, '60005856', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3009,'RHODODENDRON FERRUGINEUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (10, 3009, '60005952', 'granules', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3010,'ATORVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (11, 3010, '60007437', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3011,'SULFATE DE ZINC', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (12, 3011, '60007960', 'gel', '0,5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3012,'DUTASTÉRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (13, 3012, '60008724', 'capsule', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3013,'GLUCOSE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (14, 3013, '60008845', 'solution', '15 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3014,'RIVASTIGMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (15, 3014, '60008927', 'gélule', '1,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3015,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (16, 3015, '60009573', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3016,'THIOPENTAL ET CARBONATE SODIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (17, 3016, '60010084', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3017,'CHLORURE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (18, 3017, '60010166', 'solution', '5,85 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3018,'CIPROFLOXACINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (19, 3018, '60010885', 'comprimé', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3019,'NITRATE DE FENTICONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (20, 3019, '60010967', 'capsule', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3020,'NUX VOMICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (21, 3020, '60014894', 'comprimé', '5 mg (4 DH)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3021,'GELSÉMIUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (22, 3021, '60015448', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3022,'CARVÉDILOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (23, 3022, '60016308', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3023,'LÉVOCARNITINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (24, 3023, '60016589', 'solution', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3024,'PRÉGABALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (25, 3024, '60018088', 'gélule', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3025,'ENTÉCAVIR MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (26, 3025, '60018444', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3026,'TOSILATE DE PÉRINDOPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (27, 3026, '60018896', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3027,'CROMOGLICATE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (28, 3027, '60019101', 'collyre', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3028,'HYDROGÉNOSUCCINATE DE DOXYLAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (29, 3028, '60019329', 'comprimé', '15 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3029,'ARNICA MONTANA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (30, 3029, '60019350', 'gel', '7 g (Teinture mère)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3030,'LÉNALIDOMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (31, 3030, '60019813', 'gélule', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3031,'AMISULPRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (32, 3031, '60019927', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3032,'FICUS CARICA MACÉRAT GLYCÉRINÉ POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (33, 3032, '60020616', 'granules', '4DH à 6DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3033,'SPIRONOLACTONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (34, 3033, '60021127', 'comprimé', '75,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3034,'DIPYRIDAMOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (35, 3034, '60021216', 'comprimé', '75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3035,'PROPIONATE DE CLOBÉTASOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (36, 3035, '60021312', 'mousse', '500 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3036,'TÉTRADÉCYL SULFATE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (37, 3036, '60021771', 'solution', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3037,'SILODOSINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (38, 3037, '60021928', 'gélule', '8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3038,'TRINITRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (39, 3038, '60022275', 'dispositif', '15,70 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3039,'DORZOLAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (40, 3039, '60023270', 'collyre', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3040,'RIOCIGUAT', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (41, 3040, '60025054', 'comprimé', '1,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3041,'MACROGOL 3350', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (42, 3041, '60025314', 'poudre', '8,5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3042,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (43, 3042, '60025403', 'comprimé', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3043,'PÉLARGONIUM (EXTRAIT FLUIDE DE RACINE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (44, 3043, '60026494', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3044,'GLIBENCLAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (45, 3044, '60026957', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3045,'PENTOSANE POLYSULFATE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (46, 3045, '60027685', 'gélule', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3046,'GABAPENTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (47, 3046, '60028050', 'gélule', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3047,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (48, 3047, '60028495', 'comprimé jour', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3048,'BÉSILATE D''ATRACURIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (49, 3048, '60028552', 'solution', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3049,'TADALAFIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (50, 3049, '60029394', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3050,'UROKINASE (MAMMIFERE/HUMAIN/URINE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (51, 3050, '60030699', 'poudre', '100 000 U.I.');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3051,'SÉNÉ (FEUILLE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (52, 3051, '60030980', 'mélange de plantes', '0,72 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3052,'ARIPIPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (53, 3052, '60031071', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3053,'SULFATE DE BLÉOMYCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (54, 3053, '60033389', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3054,'CHLORHYDRATE DE VANCOMYCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (55, 3054, '60033510', 'poudre', '125 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3055,'MIDAZOLAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (56, 3055, '60034085', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3056,'CHLORURE DE ZINC', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (57, 3056, '60034644', 'suspension', '2,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3057,'KÉTOCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (58, 3057, '60034936', 'gel', '120 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3058,'CHLORHYDRATE D''AMBROXOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (59, 3058, '60035461', 'pastille', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3059,'GOLIMUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (60, 3059, '60035714', 'solution', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3060,'OXOMÉMAZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (61, 3060, '60035924', 'solution', '0,033 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3061,'SULFATE DE PROTAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (62, 3061, '60037327', 'solution', '1 000 Unités Antihéparine');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3062,'VALSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (63, 3062, '60037380', 'comprimé', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3063,'LAMOTRIGINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (64, 3063, '60038468', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3064,'BUDÉSONIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (65, 3064, '60038525', 'poudre', '320 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3065,'OXYDE DE ZINC', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (66, 3065, '60040145', 'pommade', '5,00 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3066,'CÉTHEXONIUM (BROMURE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (67, 3066, '60040469', 'collyre', '0,1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3067,'ALBUMINE HUMAINE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (68, 3067, '60040572', 'solution', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3068,'GLONOINUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (69, 3068, '60041165', 'granules', '3CH à 30CH et 6DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3069,'CHLORHYDRATE DE TRAMADOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (70, 3069, '60041560', 'comprimé', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3070,'CHLORHYDRATE D''ÉPIRUBICINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (71, 3070, '60042349', 'solution', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3071,'CACTUS GRANDIFLORUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (72, 3071, '60042395', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3072,'OXYGÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (73, 3072, '60043038', 'gaz', '50 % mole/mole');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3073,'OXCARBAZÉPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (74, 3073, '60043077', 'comprimé', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3074,'OCIMUM BASILICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (75, 3074, '60044161', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3075,'CHLORHYDRATE DE DONÉPÉZIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (76, 3075, '60044492', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3076,'LÉVÉTIRACÉTAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (77, 3076, '60044784', 'comprimé', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3077,'ACIDE URSODÉOXYCHOLIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (78, 3077, '60044841', 'gélule', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3078,'CAPÉCITABINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (79, 3078, '60044987', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3079,'LÉVOSIMENDAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (80, 3079, '60045217', 'solution', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3080,'CUPRUM METALLICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (81, 3080, '60045288', 'poudre', '6 DH 33%');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3081,'PHOLCODINE MONOHYDRATÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (82, 3081, '60046529', 'sirop', '131 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3082,'ALMITRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (83, 3082, '60047143', 'lyophilisat', '0,015 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3083,'CHLORHYDRATE DE MÉTHYLPHÉNIDATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (84, 3083, '60047182', 'comprimé', '54 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3084,'DARATUMUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (85, 3084, '60047225', 'solution', '1 800 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3085,'LATANOPROST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (86, 3085, '60047271', 'collyre', '50 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3086,'DICHLORHYDRATE DE BÉTAHISTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (87, 3086, '60048672', 'comprimé', '24 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3087,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (88, 3087, '60049895', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3088,'ARGENTUM NITRICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (89, 3088, '60051024', 'granules', '3CH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3089,'DUTASTÉRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (90, 3089, '60051234', 'capsule', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3090,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (91, 3090, '60051704', 'comprimé', '1,25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3091,'NICOTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (92, 3091, '60052222', 'solution', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3092,'SODIUM (PHÉNYLBUTYRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (93, 3092, '60052254', 'granulés', '940 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3093,'GLUCONATE DE COBALT', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (94, 3093, '60053064', 'comprimé', '0,240 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3094,'LEUPRORÉLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (95, 3094, '60054077', 'poudre', '1,79 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3095,'SILODOSINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (96, 3095, '60054312', 'gélule', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3096,'DACARBAZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (97, 3096, '60054376', 'poudre', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3097,'DIOSMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (98, 3097, '60056815', 'comprimé', '600 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3098,'VALSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (99, 3098, '60058008', 'comprimé', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3099,'SPIRONOLACTONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (100, 3099, '60058378', 'comprimé', '75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3100,'CHLORHYDRATE DE TIAGABINE MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (101, 3100, '60058517', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3101,'OLAPARIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (102, 3101, '60058620', 'comprimé', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3102,'CHLORHYDRATE DE MÉTHYLPHÉNIDATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (103, 3102, '60059081', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3103,'LYMÉCYCLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (104, 3103, '60061171', 'gélule', '226 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3104,'OXYGÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (105, 3104, '60061449', 'gaz', 'q.s. (sous une pression de 10 à 12 bar, à -150 Â°C)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3105,'PRÉGABALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (106, 3105, '60061602', 'gélule', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3106,'SIMVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (107, 3106, '60061709', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3107,'ARTERE POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (108, 3107, '60063973', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3108,'BROMHYDRATE DE GALANTAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (109, 3108, '60064872', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3109,'CHLORHYDRATE DE CÉLIPROLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (110, 3109, '60065198', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3110,'PANTOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (111, 3110, '60065294', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3111,'FUMARATE DE FÉSOTÉRODINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (112, 3111, '60065390', 'comprimé', '8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3112,'KETOTIFÈNE (FUMARATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (113, 3112, '60067562', 'solution', '0,0276 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3113,'OXALATE D''ESCITALOPRAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (114, 3113, '60068002', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3114,'MILNACIPRAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (115, 3114, '60068034', 'gélule', '21,77 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3115,'AMLODIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (116, 3115, '60068251', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3116,'AMLODIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (117, 3116, '60068333', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3117,'NITISINONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (118, 3117, '60069307', 'gélule', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3118,'MONTÉLUKAST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (119, 3118, '60069339', 'granulés', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3119,'CLOTRIMAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (120, 3119, '60070359', 'capsule', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3120,'MÉTHOXY POLYÉTHYLÈNE GLYCOL-ÉPOÉTINE BÊTA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (121, 3120, '60070665', 'solution', '200 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3121,'SIMVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (122, 3121, '60071190', 'comprimé', '10,0 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3122,'DARUNAVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (123, 3122, '60071233', 'comprimé', '600 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3123,'BÊTA-ESTRADIOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (124, 3123, '60071379', 'comprimé', '2,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3124,'PANTOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (125, 3124, '60071952', 'comprimé', '40,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3125,'THUYA OCCIDENTALIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (126, 3125, '60072050', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3126,'NAFTAZONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (127, 3126, '60073451', 'comprimé', '30,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3127,'DICHLORHYDRATE DE LÉVOCÉTIRIZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (128, 3127, '60073608', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3128,'CHLORHYDRATE DE DONÉPÉZIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (129, 3128, '60073907', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3129,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (130, 3129, '60073914', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3130,'PRASTÉRONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (131, 3130, '60073960', 'ovule', '6,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3131,'PALMIER DE FLORIDE (SERENOA REPENS (W.BARTRAM) SMALL.) (EXTRAIT DU FRUIT DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (132, 3131, '60074432', 'gélule', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3132,'PROTÉINES PLASMATIQUES HUMAINES ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (133, 3132, '60074795', 'solution', '45 - 70 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3133,'CHLORHYDRATE D''ÉTHAMBUTOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (134, 3133, '60074934', 'solution', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3134,'DIOXYDE DE TITANE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (135, 3134, '60075064', 'pâte', '0,20 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3135,'CHLORHYDRATE DE VENLAFAXINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (136, 3135, '60075192', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3136,'CITRATE DE FENTANYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (137, 3136, '60075370', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3137,'PRÉGABALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (138, 3137, '60075452', 'gélule', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3138,'LÉNALIDOMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (139, 3138, '60076860', 'gélule', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3139,'ASCLEPIAS TUBEROSA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (140, 3139, '60077460', 'comprimé', '3CH à 30CH et 5DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3140,'FUMARATE DE BISOPROLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (141, 3140, '60077574', 'comprimé', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3141,'LÉVONORGESTREL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (142, 3141, '60078078', 'comprimé', '1,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3142,'QUÉTIAPINE (HÉMIFUMARATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (143, 3142, '60078765', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3143,'PALMIER DE FLORIDE (SERENOA REPENS (W.BARTRAM) SMALL.) (EXTRAIT DU FRUIT DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (144, 3143, '60079721', 'gélule', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3144,'MÉSALAZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (145, 3144, '60080218', 'suppositoire', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3145,'COMPLEXE D''HYDROXYDE FERRIQUE - SACCHAROSE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (146, 3145, '60080232', 'solution', '540 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3146,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (147, 3146, '60082023', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3147,'ACÉTATE DE GLATIRAMÈRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (148, 3147, '60082062', 'solution', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3148,'LATANOPROST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (149, 3148, '60082233', 'collyre', '50 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3149,'MÉTHOTREXATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (150, 3149, '60082450', 'solution', '12,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3150,'LAPIS ALBUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (151, 3150, '60082895', 'comprimé', '3CH à 30CH et 5DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3151,'CHLORHYDRATE D''AMITRIPTYLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (152, 3151, '60082938', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3152,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (153, 3152, '60083132', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3153,'CHLORHYDRATE DE GLUCAGON ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (154, 3153, '60084049', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3154,'AMBRISENTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (155, 3154, '60085553', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3155,'PODOPHYLLUM PELTATUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (156, 3155, '60088834', 'solution', '250 mg (6 DH)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3156,'AFLIBERCEPT ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (157, 3156, '60089217', 'solution', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3157,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (158, 3157, '60091086', 'gélule', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3158,'LÉVODOPA', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (159, 3158, '60092590', 'comprimé', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3159,'TRIPTORÉLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (160, 3159, '60092811', 'poudre', '11,25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3160,'CHLORHYDRATE DE ROPINIROLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (161, 3160, '60093639', 'comprimé', '9,121 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3161,'TRANDOLAPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (162, 3161, '60094125', 'gélule', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3162,'HEXÉTIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (163, 3162, '60095056', 'pâte', '0,100 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3163,'CHLORHYDRATE DE LOPÉRAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (164, 3163, '60095095', 'capsule', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3164,'FOSINOPRIL SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (165, 3164, '60095526', 'comprimé', '10,0 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3165,'ALFA-AMYLASE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (166, 3165, '60095729', 'comprimé', '3000 U.CEIP');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3166,'PRAVASTATINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (167, 3166, '60097203', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3167,'CLOBÉTASOL (PROPIONATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (168, 3167, '60097833', 'gel', '0,05 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3168,'AMOXICILLINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (169, 3168, '60099738', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3169,'BÉTAXOLOL (CHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (170, 3169, '60100877', 'collyre', '0,56 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3170,'HEKLA LAVA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (171, 3170, '60101299', 'granules', '3CH à 30CH et 6DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3171,'AMOXICILLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (172, 3171, '60101406', 'comprimé', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3172,'QUERCUS, DÉCOCTÉ POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (173, 3172, '60104893', 'crème', '2CH à 30CH et 4DH à 60DH (crème à 4 %)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3173,'GABAPENTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (174, 3173, '60105162', 'comprimé', '600 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3174,'MOROCTOCOG ALFA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (175, 3174, '60106606', 'poudre', '250 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3175,'ÉTHINYLESTRADIOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (176, 3175, '60106848', 'comprimé', '0,02 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3176,'IRBÉSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (177, 3176, '60106862', 'comprimé', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3177,'ACIDE LACTIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (178, 3177, '60107747', 'solution', '16,7 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3178,'CHARBON ACTIVÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (179, 3178, '60107932', 'gélule', '162 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3179,'CHLORHYDRATE D''OXYCODONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (180, 3179, '60108518', 'gélule', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3180,'CHLORHYDRATE DE TERBINAFINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (181, 3180, '60108678', 'comprimé', '281,25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3181,'CAPTOPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (182, 3181, '60108870', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3182,'MUPIROCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (183, 3182, '60109303', 'pommade', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3183,'EAU POUR PRÉPARATIONS INJECTABLES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (184, 3183, '60110031', 'solution', '100 ml');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3184,'ENTÉCAVIR MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (185, 3184, '60110896', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3185,'CHLORHYDRATE DE PYRIDOXINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (186, 3185, '60111101', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3186,'ACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (187, 3186, '60111197', 'comprimé', '800 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3187,'RACÉCADOTRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (188, 3187, '60111471', 'suspension', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3188,'URAPIDIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (189, 3188, '60111553', 'solution', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3189,'MEDULOSS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (190, 3189, '60111603', 'crème', '2CH à 30CH et 4DH à 60DH (crème à 4 %)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3190,'MALÉATE D''ÉNALAPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (191, 3190, '60111813', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3191,'ATORVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (192, 3191, '60113814', 'comprimé', '80,000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3192,'PROGESTERONUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (193, 3192, '60114485', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3193,'GLIMÉPIRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (194, 3193, '60116447', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3194,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (195, 3194, '60116810', 'comprimé', '0,625 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3195,'PULSATILLA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (196, 3195, '60117638', 'comprimé', '3CH à 30CH et 6DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3196,'PREDNISONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (197, 3196, '60118715', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3197,'ALLOPURINOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (198, 3197, '60120709', 'comprimé', '200,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3198,'IRINOTÉCAN (CHLORHYDRATE TRIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (199, 3198, '60120812', 'solution', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3199,'AMYLIUM NITROSUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (200, 3199, '60121234', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3200,'CANDÉSARTAN CILEXÉTIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (201, 3200, '60122628', 'comprimé', '8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3201,'DÉFÉRASIROX', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (202, 3201, '60122699', 'comprimé', '90 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3202,'CARBONATE DE SÉVÉLAMER', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (203, 3202, '60122717', 'poudre', '2,4 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3203,'FINASTÉRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (204, 3203, '60123363', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3204,'HEPAR SULFUR POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (205, 3204, '60123598', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3205,'EPTIFIBATIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (206, 3205, '60124020', 'solution', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3206,'TERT-BUTYLAMINE DE PÉRINDOPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (207, 3206, '60124472', 'comprimé', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3207,'HYDROGÉNOSULFATE DE CLOPIDOGREL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (208, 3207, '60124999', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3208,'URÉE POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (209, 3208, '60125332', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3209,'TARTRATE DE CYAMÉMAZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (210, 3209, '60125777', 'comprimé', '146,400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3210,'ACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (211, 3210, '60126377', 'crème', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3211,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (212, 3211, '60126594', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3212,'NUX VOMICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (213, 3212, '60126612', 'comprimé', '4 DH 5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3213,'SUCCINATE DE SOLIFÉNACINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (214, 3213, '60126982', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3214,'DIMÉTICONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (215, 3214, '60127671', 'capsule', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3215,'SUCCINATE DE SOLIFÉNACINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (216, 3215, '60128339', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3216,'ADALIMUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (217, 3216, '60129099', 'solution', '80 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3217,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (218, 3217, '60129665', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3218,'MÉTHOTREXATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (219, 3218, '60129957', 'solution', '17,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3219,'DIPROPIONATE DE BÉCLOMÉTASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (220, 3219, '60130062', 'solution', '100 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3220,'BENJOIN DU LAOS, DIT DU SIAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (221, 3220, '60130386', 'pommade', '0,100 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3221,'OXALATE ACIDE DE NAFTIDROFURYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (222, 3221, '60130742', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3222,'LOSARTAN POTASSIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (223, 3222, '60130906', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3223,'SITAGLIPTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (224, 3223, '60131132', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3224,'LÉVÉTIRACÉTAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (225, 3224, '60132330', 'solution', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3225,'GLYCÉROL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (226, 3225, '60132572', 'suppositoire', '0,690 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3226,'RANUNCULUS SCELERATUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (227, 3226, '60132654', 'comprimé', '4CH à 30CH et 7DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3227,'ZIDOVUDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (228, 3227, '60132743', 'solution', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3228,'BROMHYDRATE DE DEXTROMÉTHORPHANE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (229, 3228, '60133432', 'comprimé', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3229,'CHLORHYDRATE DE TAMSULOSINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (230, 3229, '60133973', 'gélule', '0,4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3230,'BIMATOPROST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (231, 3230, '60135981', 'collyre', '0,3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3231,'GOSSYPIUM HERBACEUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (232, 3231, '60136275', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3232,'ARIPIPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (233, 3232, '60136439', 'comprimé', '15 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3233,'LACOSAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (234, 3233, '60137021', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3234,'RACÉCADOTRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (235, 3234, '60139257', 'gélule', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3235,'OXALATE D''ESCITALOPRAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (236, 3235, '60139563', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3236,'CASPOFUNGINE BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (237, 3236, '60140010', 'poudre', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3237,'ARIPIPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (238, 3237, '60140882', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3238,'FÉBUXOSTAT', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (239, 3238, '60141614', 'comprimé', '120 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3239,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (240, 3239, '60142043', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3240,'CHLORHYDRATE D''ERLOTINIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (241, 3240, '60143654', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3241,'DIFÉLIKÉFALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (242, 3241, '60144119', 'solution', '50 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3242,'CHLORHYDRATE DE ROPINIROLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (243, 3242, '60144464', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3243,'SIMVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (244, 3243, '60145580', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3244,'PANTOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (245, 3244, '60145801', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3245,'METFORMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (246, 3245, '60148110', 'comprimé', '780 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3246,'PLÉRIXAFOR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (247, 3246, '60148167', 'solution', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3247,'CARBONATE DE LANTHANE HYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (248, 3247, '60148893', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3248,'CHLORHYDRATE D''ÉPHÉDRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (249, 3248, '60149276', 'solution', '3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3249,'PHÉNYLBUTYRATE DE GLYCÉROL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (250, 3249, '60150015', 'liquide', '1,1 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3250,'FOSFOMYCINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (251, 3250, '60150232', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3251,'BORAX', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (252, 3251, '60150435', 'comprimé', '3CH à 30CH et 5DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3252,'CHLORHYDRATE DE DONÉPÉZIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (253, 3252, '60150467', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3253,'RILPIVIRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (254, 3253, '60150638', 'suspension', '900 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3254,'GLICLAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (255, 3254, '60150830', 'comprimé', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3255,'CHLORHYDRATE DE MÉMANTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (256, 3255, '60151124', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3256,'AMOXICILLINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (257, 3256, '60151544', 'comprimé', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3257,'MYRRHA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (258, 3257, '60151601', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3258,'OFLOXACINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (259, 3258, '60151697', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3259,'ACIDE TRANEXAMIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (260, 3259, '60151843', 'solution', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3260,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (261, 3260, '60152411', 'comprimé', '325 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3261,'VIRUS DE L''HÉPATITE A SOUCHE HM175 INACTIVÉ ADSORBÉ ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (262, 3261, '60152436', 'suspension', '720 U');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3262,'BÉTAMÉTHASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (263, 3262, '60152607', 'solution', '4,0 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3263,'ALPHA-1 ANTITRYPSINE HUMAINE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (264, 3263, '60153239', 'poudre', '33,33 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3264,'RÉPAGLINIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (265, 3264, '60154017', 'comprimé', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3265,'DICHLORHYDRATE DE TRIMÉTAZIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (266, 3265, '60154024', 'comprimé', '35 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3266,'CALENDULA OFFICINALIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (267, 3266, '60154309', 'crème', '0,88 g (TM)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3267,'TADALAFIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (268, 3267, '60154743', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3268,'LACTULOSE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (269, 3268, '60155329', 'solution', '10 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3269,'ÉTOPOSIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (270, 3269, '60155667', 'solution', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3270,'SERTRALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (271, 3270, '60155788', 'gélule', '25,000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3271,'BICALUTAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (272, 3271, '60156089', 'comprimé', '50,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3272,'MALÉATE D''ÉNALAPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (273, 3272, '60156413', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3273,'KREOSOTUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (274, 3273, '60156662', 'comprimé', '5CH à 30CH et 10DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3274,'DICLOFÉNAC SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (275, 3274, '60158147', 'gel', '1 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3275,'APIS MELLIFICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (276, 3275, '60158193', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3276,'MALÉATE D''ÉNALAPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (277, 3276, '60159128', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3277,'IVABRADINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (278, 3277, '60160479', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3278,'CHLORHYDRATE DE PAROXÉTINE HÉMIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (279, 3278, '60160707', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3279,'CARBONATE DE SÉVÉLAMER', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (280, 3279, '60160835', 'comprimé', '800 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3280,'SOLVATE DE CABAZITAXEL 2-PROPANOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (281, 3280, '60160881', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3281,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (282, 3281, '60161143', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3282,'DEXKÉTOPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (283, 3282, '60162494', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3283,'FERRUM PHOSPHORICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (284, 3283, '60165234', 'granules', '6 DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3284,'PRÉGABALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (285, 3284, '60165394', 'gélule', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3285,'MANIDIPINE (DICHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (286, 3285, '60165857', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3286,'ROSUVASTATINE ZINCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (287, 3286, '60167235', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3287,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (288, 3287, '60168465', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3288,'ÉPOÉTINE BÊTA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (289, 3288, '60168515', 'solution', '30000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3289,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (290, 3289, '60170046', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3290,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (291, 3290, '60170224', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3291,'CHLORHYDRATE DE LERCANIDIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (292, 3291, '60171874', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3292,'AESCULUS HIPPOCASTANUM MACÉRAT GLYCÉRINÉ POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (293, 3292, '60172307', 'granules', '4DH à 6DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3293,'DINITRATE D''ISOSORBIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (294, 3293, '60172339', 'solution', '0,20 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3294,'ROSUVASTATINE CALCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (295, 3294, '60173715', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3295,'DIMENHYDRINATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (296, 3295, '60173964', 'gélule', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3296,'LUSPATERCEPT ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (297, 3296, '60175591', 'poudre', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3297,'IPRATROPIUM (BROMURE MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (298, 3297, '60175716', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3298,'NITRATE DE PILOCARPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (299, 3298, '60175972', 'collyre', '8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3299,'GLUCARPIDASE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (300, 3299, '60176597', 'poudre', '1000 unités');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3300,'CHLORHYDRATE D''AMIODARONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (301, 3300, '60177044', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3301,'GRES ROSE POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (302, 3301, '60177158', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3302,'HAMAMELIS VIRGINIANA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (303, 3302, '60177628', 'solution', '3 mL (TM)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3303,'THIOTÉPA', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (304, 3303, '60177724', 'poudre', '15 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3304,'BULBINUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (305, 3304, '60178281', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3305,'MALÉATE DE TIMOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (306, 3305, '60178609', 'collyre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3306,'CITRATE DE FENTANYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (307, 3306, '60179839', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3307,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (308, 3307, '60180720', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3308,'ÉPOPROSTÉNOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (309, 3308, '60181231', 'poudre', '1,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3309,'TARTRATE DE NORADRÉNALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (310, 3309, '60181402', 'solution', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3311,'BICARBONATE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (312, 3311, '60182486', 'solution', '1,4 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3312,'NADROPARINE CALCIQUE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (313, 3312, '60182657', 'solution', '11400 UI anti-Xa');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3313,'MERCAPTOACÉTYLTRIGLYCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (314, 3313, '60183061', 'poudre', '0,2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3314,'SODIUM (VALPROATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (315, 3314, '60184188', 'comprimé', '500,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3315,'ISAVUCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (316, 3315, '60184590', 'poudre', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3316,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (317, 3316, '60185201', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3317,'GÉLATINE FLUIDE MODIFIÉE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (318, 3317, '60186552', 'solution', '4 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3318,'LORMÉTAZÉPAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (319, 3318, '60186584', 'comprimé', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3319,'AMLODIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (320, 3319, '60187348', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3320,'FÉNOFIBRATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (321, 3320, '60187501', 'gélule', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3321,'LÉVOTHYROXINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (322, 3321, '60188119', 'capsule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3322,'FUROSÉMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (323, 3322, '60192594', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3323,'CIPROFLOXACINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (324, 3323, '60195010', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3324,'PIPOBROMAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (325, 3324, '60195398', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3325,'AMOXICILLINE BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (326, 3325, '60196176', 'poudre', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3326,'RISPÉRIDONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (327, 3326, '60196945', 'comprimé', '3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3327,'FLUCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (328, 3327, '60196977', 'solution', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3328,'OXALATE D''ESCITALOPRAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (329, 3328, '60197011', 'comprimé', '19,155 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3329,'AVÉLUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (330, 3329, '60199966', 'solution', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3330,'ROTIGOTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (331, 3330, '60200500', 'dispositif', '13,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3331,'PALMIER DE FLORIDE (SERENOA REPENS (W.BARTRAM) SMALL.) (EXTRAIT DU FRUIT DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (332, 3331, '60200678', 'gélule', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3332,'ÉPOÉTINE ZÊTA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (333, 3332, '60200938', 'solution', '4000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3333,'NUX VOMICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (334, 3333, '60202031', 'solution', '3 DH (3ml)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3334,'BILASTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (335, 3334, '60202750', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3335,'RASAGILINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (336, 3335, '60203418', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3336,'PRÉGABALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (337, 3336, '60203546', 'gélule', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3337,'RIOCIGUAT', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (338, 3337, '60203795', 'comprimé', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3338,'CHLORHYDRATE DE BUPRÉNORPHINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (339, 3338, '60204573', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3339,'BÉLIMUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (340, 3339, '60205159', 'solution', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3340,'DEXKÉTOPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (341, 3340, '60205458', 'solution', '50,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3341,'CODÉINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (342, 3341, '60206154', 'solution', '0,0800 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3342,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (343, 3342, '60206332', 'comprimé blanc', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3343,'EXÉMESTANE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (344, 3343, '60207459', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3344,'MEDULLINE POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (345, 3344, '60207594', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3345,'ALLOPURINOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (346, 3345, '60208251', 'comprimé', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3346,'ASPARTIQUE (ACIDE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (347, 3346, '60208447', 'solution', '1,26 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3347,'PÉRINDOPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (348, 3347, '60208511', 'comprimé', '6,790 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3348,'RÉPAGLINIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (349, 3348, '60209531', 'comprimé', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3349,'CHLORHYDRATE D''OXYCODONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (350, 3349, '60209645', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3350,'ZUCLOPENTHIXOL (DICHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (351, 3350, '60209937', 'solution', '2,38 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3351,'CARBONATE DE CALCIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (352, 3351, '60210697', 'comprimé', '1250,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3352,'LÉVOTHYROXINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (353, 3352, '60210811', 'capsule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3353,'AZATHIOPRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (354, 3353, '60211183', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3354,'PROGESTERONUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (355, 3354, '60211678', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3355,'JOSAMYCINE (PROPIONATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (356, 3355, '60212424', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3356,'IBERIS AMARA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (357, 3356, '60213704', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3357,'MISOPROSTOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (358, 3357, '60213914', 'comprimé', '25 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3358,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (359, 3358, '60214350', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3359,'CROCUS SATIVUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (360, 3359, '60214464', 'comprimé', '4CH à 30CH et 7DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3360,'GUAIACUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (361, 3360, '60214902', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3361,'BUROSUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (362, 3361, '60215018', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3362,'VIRUS DE LA VACCINE VIVANT MODIFIÉ, SOUCHE ANKARA-BAVARIAN NORDIC (MVA-BN) ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (363, 3362, '60215623', 'suspension', '5 x 10 000 000 U. Inf');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3363,'ALBUTRÉPÉNONACOG ALFA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (364, 3363, '60216127', 'poudre', '2000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3364,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (365, 3364, '60217108', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3365,'MERCURIUS DULCIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (366, 3365, '60217542', 'poudre', '7 DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3366,'SULFATE DE VINCRISTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (367, 3366, '60219803', 'solution', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3367,'FINASTÉRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (368, 3367, '60221042', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3368,'CALCIUM (CARBONATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (369, 3368, '60222137', 'comprimé', '1498 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3369,'FELBAMATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (370, 3369, '60223278', 'comprimé', '600 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3370,'ÉVÉROLIMUS', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (371, 3370, '60223417', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3371,'MÉTHYLPREDNISOLONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (372, 3371, '60224316', 'comprimé', '100,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3372,'CISATRACURIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (373, 3372, '60224800', 'solution', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3373,'CHLORHYDRATE DE TRAMADOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (374, 3373, '60225681', 'gélule', '200,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3374,'MARBRE SACCHAROIDE POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (375, 3374, '60226406', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3375,'MINOXIDIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (376, 3375, '60226897', 'solution', '2,0 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3376,'CARBOCISTÉINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (377, 3376, '60226915', 'solution', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3377,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (378, 3377, '60226979', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3378,'PITOLISANT', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (379, 3378, '60227166', 'comprimé', '17,8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3379,'CITRATE DE TAMOXIFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (380, 3379, '60230550', 'comprimé', '30,40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3380,'PANTOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (381, 3380, '60231339', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3381,'BRASSICA OLERACEA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (382, 3381, '60231702', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3382,'HYDROXYDE DE MAGNÉSIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (383, 3382, '60232074', 'poudre', '90 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3383,'HYDROXOCOBALAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (384, 3383, '60232334', 'poudre', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3384,'VALSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (385, 3384, '60232359', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3385,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (386, 3385, '60233913', 'gel', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3386,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (387, 3386, '60234100', 'comprimé', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3387,'CHLORHYDRATE DE VENLAFAXINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (388, 3387, '60234214', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3388,'CICLÉTANINE (CHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (389, 3388, '60234221', 'gélule', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3389,'CEFTRIAXONE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (390, 3389, '60235330', 'poudre', '596,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3390,'DARUNAVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (391, 3390, '60235768', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3391,'AMLODIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (392, 3391, '60236546', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3392,'CHLORHYDRATE D''ÉPHÉDRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (393, 3392, '60237858', 'solution', '30,0 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3393,'SOUFRE PRÉCIPITÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (394, 3393, '60238376', 'comprimé', '11,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3394,'PANTOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (395, 3394, '60238853', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3395,'ESTRIOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (396, 3395, '60239706', 'ovule', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3396,'ÉTHINYLESTRADIOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (397, 3396, '60239802', 'comprimé', '20 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3397,'CHLORHYDRATE DE PYRIDOXINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (398, 3397, '60240181', 'solution', '0,040 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3398,'IXÉKIZUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (399, 3398, '60241034', 'solution', '80 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3399,'DIPROPIONATE DE BÉCLOMÉTASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (400, 3399, '60241874', 'solution', '200 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3400,'PRUNUS SPINOSA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (401, 3400, '60242264', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3401,'TOXINE BOTULINIQUE TYPE A ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (402, 3401, '60242321', 'poudre', '500 U Speywood');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3402,'BENZYLPÉNICILLINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (403, 3402, '60243544', 'poudre', '1 000 000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3403,'CHLORURE DE CALCIUM DIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (404, 3403, '60244525', 'solution', '0,2573 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3404,'LÉNALIDOMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (405, 3404, '60245253', 'gélule', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3405,'MALÉATE DE TRIMÉBUTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (406, 3405, '60246750', 'comprimé', '100,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3406,'OXALATE D''ESCITALOPRAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (407, 3406, '60247432', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3407,'TÉNOFOVIR DISOPROXIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (408, 3407, '60247507', 'comprimé', '245 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3408,'LÉVÉTIRACÉTAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (409, 3408, '60248000', 'comprimé', '750 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3409,'DABRAFÉNIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (410, 3409, '60248840', 'gélule', '75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3410,'PALIPÉRIDONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (411, 3410, '60249796', 'suspension', '350 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3411,'DASATINIB MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (412, 3411, '60249903', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3412,'MÉTHOTREXATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (413, 3412, '60250567', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3413,'ROSUVASTATINE CALCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (414, 3413, '60251135', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3414,'PIPÉRACILLINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (415, 3414, '60251352', 'poudre', '1,042 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3415,'TRINITRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (416, 3415, '60251516', 'dispositif', '31,37 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3417,'ACÉPONATE D''HYDROCORTISONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (418, 3417, '60252422', 'crème', '0,127 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3418,'MAGNÉSIUM (GLUCONATE DE) DIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (419, 3418, '60252447', 'comprimé', '0,220 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3419,'THYM (HUILE ESSENTIELLE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (420, 3419, '60253606', 'émulsion', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3420,'LÉVOTHYROXINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (421, 3420, '60254754', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3421,'ROSUVASTATINE CALCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (422, 3421, '60254779', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3422,'EFTRÉNONACOG ALFA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (423, 3422, '60256036', 'poudre', '3000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3423,'CALENDULA OFFICINALIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (424, 3423, '60258521', 'crème', '5 g (TM)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3424,'TRINITRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (425, 3424, '60259242', 'solution', '0,150000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3425,'FACTEUR II DE COAGULATION HUMAIN ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (426, 3425, '60259993', 'poudre', '280 - 760 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3426,'CHARBON ACTIVÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (427, 3426, '60260166', 'suspension', '20 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3427,'RISPÉRIDONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (428, 3427, '60260497', 'comprimé', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3428,'DIPROPIONATE DE BÉCLOMÉTASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (429, 3428, '60260910', 'suspension', '400 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3429,'CAMSYLATE DE RUCAPARIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (430, 3429, '60261656', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3430,'PALMIER DE FLORIDE (EXTRAIT LIPIDO-STÉROLIQUE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (431, 3430, '60263461', 'gélule', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3431,'ACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (432, 3431, '60264410', 'crème', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3432,'ATÉNOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (433, 3432, '60264830', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3433,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (434, 3433, '60265252', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3434,'ATORVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (435, 3434, '60265932', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3435,'GABAPENTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (436, 3435, '60266144', 'gélule', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3436,'CHLORURE DE GALLIUM (68GA)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (437, 3436, '60266265', 'éluat', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3437,'PRAMIPEXOLE (DICHLORHYDRATE DE) MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (438, 3437, '60267171', 'comprimé', '1,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3438,'CHLORHYDRATE DE METFORMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (439, 3438, '60267506', 'comprimé', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3439,'CALOTROPIS GIGANTEA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (440, 3439, '60268348', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3440,'FUROATE DE MOMÉTASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (441, 3440, '60268519', 'poudre', '400 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3441,'TRIMÉTAZIDINE (DICHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (442, 3441, '60269037', 'comprimé', '20,000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3442,'PENICILLINE V', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (443, 3442, '60270114', 'suspension', '250 000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3443,'BOSENTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (444, 3443, '60270395', 'comprimé', '125 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3444,'PRAVASTATINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (445, 3444, '60270452', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3445,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (446, 3445, '60270712', 'comprimé', '0,625 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3446,'AMOXICILLINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (447, 3446, '60271045', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3447,'TARTRATE DE CYAMÉMAZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (448, 3447, '60271248', 'comprimé', '146,400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3448,'SOMATOSTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (449, 3448, '60272948', 'poudre', '3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3449,'SPIRITUS QUERCUS GLANDIUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (450, 3449, '60273263', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3450,'FOSFOMYCINE TROMÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (451, 3450, '60273765', 'granulés', '5,631 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3451,'ACIDE ASPARTIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (452, 3451, '60274212', 'émulsion', '2,10 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3452,'CHLORHYDRATE DE TERBINAFINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (453, 3452, '60274536', 'comprimé', '281,30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3453,'CHLORHYDRATE DE ROPINIROLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (454, 3453, '60274618', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3454,'DICLOFÉNAC SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (455, 3454, '60275086', 'gel', '1,000 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3455,'CRATAEGUS OXYACANTHA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (456, 3455, '60275136', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3456,'DICHLORHYDRATE D''HISTAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (457, 3456, '60275467', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3457,'CADMIUM SULFURICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (458, 3457, '60276708', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3458,'SULFATE DE TERBUTALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (459, 3458, '60277824', 'solution', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3459,'GABAPENTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (460, 3459, '60279775', 'comprimé', '800 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3460,'FENTANYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (461, 3460, '60281114', 'dispositif', '12,375 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3461,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (462, 3461, '60281210', 'gélule', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3462,'CHLORHYDRATE D''ACÉBUTOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (463, 3462, '60281598', 'comprimé', '443,3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3463,'SUCCINATE DE SOLIFÉNACINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (464, 3463, '60282629', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3464,'VALSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (465, 3464, '60282789', 'comprimé', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3465,'RIVASTIGMINE BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (466, 3465, '60282814', 'gélule', '4,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3466,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (467, 3466, '60282846', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3467,'CITRATE DE FENTANYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (468, 3467, '60282999', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3468,'CUPRUM ACETICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (469, 3468, '60283161', 'granules', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3469,'PIPÉRACILLINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (470, 3469, '60284142', 'poudre', '4,168 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3470,'LATANOPROST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (471, 3470, '60284377', 'collyre', '0,005 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3471,'CHLORHYDRATE DE NÉBIVOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (472, 3471, '60284516', 'comprimé', '5,45 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3472,'SIMVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (473, 3472, '60286296', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3473,'CITRATE DE SILDÉNAFIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (474, 3473, '60286346', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3474,'CÉTHEXONIUM (BROMURE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (475, 3474, '60286556', 'collyre', '0,1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3475,'NONACOG GAMMA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (476, 3475, '60287206', 'poudre', '3000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3476,'DULOXÉTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (477, 3476, '60287277', 'gélule', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3477,'GINKGO (EXTRAIT DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (478, 3477, '60287373', 'comprimé', '40 mg titré à 24 % d''hétérosides de ginkgo et 6 % de Ginkgolides-bilobalide');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3478,'IMATINIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (479, 3478, '60288137', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3479,'CHLORHYDRATE DE MÉMANTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (480, 3479, '60288443', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3480,'LANSOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (481, 3480, '60288817', 'comprimé', '15 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3481,'HORMONE FOLLICULO STIMULANTE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (482, 3481, '60290273', 'poudre', '900 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3482,'DIAZÉPAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (483, 3482, '60290800', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3483,'MÉTILSULFATE DE MÉFÉNIDRAMIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (484, 3483, '60291795', 'crème', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3484,'CHLORHYDRATE DE SOTALOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (485, 3484, '60291941', 'comprimé', '80,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3485,'IFOSFAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (486, 3485, '60292267', 'solution', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3486,'ACITRÉTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (487, 3486, '60292349', 'gélule', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3487,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (488, 3487, '60292573', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3488,'LÉTROZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (489, 3488, '60293216', 'comprimé', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3489,'COCCULUS INDICUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (490, 3489, '60293376', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3490,'BILE DE BOEUF (EXTRAIT DE) (FLUIDE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (491, 3490, '60293846', 'gel', '0,0975 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3491,'ZOLMITRIPTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (492, 3491, '60294713', 'comprimé', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3492,'BILE DE BOEUF (EXTRAIT DE) (FLUIDE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (493, 3492, '60295046', 'suppositoire', '0,200 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3493,'PLANTAGO MAJOR POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (494, 3493, '60295135', 'solution', '2 mL');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3494,'NICOTINE (RÉSINATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (495, 3494, '60295320', 'gomme', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3495,'BENDAMUSTINE (CHLORHYDRATE DE) MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (496, 3495, '60295427', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3496,'ÉPLÉRÉNONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (497, 3496, '60296511', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3497,'DINOPROSTONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (498, 3497, '60297517', 'système de diffusion', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3498,'ACIDE UNDÉCYLÉNIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (499, 3498, '60298028', 'poudre', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3499,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (500, 3499, '60298455', 'suppositoire', '80 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3500,'FORMICA RUFA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (501, 3500, '60298850', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3501,'ÉVÉROLIMUS', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (502, 3501, '60298932', 'comprimé', '0,75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3502,'DULOXÉTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (503, 3502, '60299831', 'gélule', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3503,'GLICLAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (504, 3503, '60300340', 'comprimé', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3504,'NIFUROXAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (505, 3504, '60300408', 'gélule', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3505,'PORACTANT ALFA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (506, 3505, '60301200', 'suspension', '120 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3506,'FÉNOFIBRATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (507, 3506, '60302512', 'gélule', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3507,'TOPIRAMATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (508, 3507, '60303404', 'comprimé', '50,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3508,'NERF OPTIQUE POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (509, 3508, '60303863', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3509,'BACLOFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (510, 3509, '60304050', 'comprimé', '10,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3510,'CHLORHYDRATE DE TRAMADOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (511, 3510, '60304591', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3511,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (512, 3511, '60305960', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3512,'CHLORHYDRATE D''IRINOTÉCAN TRIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (513, 3512, '60306813', 'solution', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3513,'NITRATE D''ÉCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (514, 3513, '60307032', 'poudre', '1,00 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3514,'IODURE DE POTASSIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (515, 3514, '60307630', 'solution', '166 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3515,'AMIODARONE (CHLORHYDRATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (516, 3515, '60308369', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3516,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (517, 3516, '60310861', 'suppositoire', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3517,'VALACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (518, 3517, '60311269', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3518,'ACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (519, 3518, '60311803', 'crème', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3519,'ENTÉCAVIR MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (520, 3519, '60313672', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3520,'ROSUVASTATINE CALCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (521, 3520, '60314183', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3521,'OXYDE DE GADOLINIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (522, 3521, '60314272', 'solution', '0,453 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3522,'VORTIOXÉTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (523, 3522, '60316362', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3523,'LANSOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (524, 3523, '60316818', 'gélule', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3524,'ARUNDO DONAX POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (525, 3524, '60318954', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3525,'CHLORHYDRATE DE DILTIAZEM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (526, 3525, '60319789', 'gélule', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3526,'LÉVOTHYROXINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (527, 3526, '60320656', 'capsule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3527,'PALBOCICLIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (528, 3527, '60321676', 'gélule', '125 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3528,'CHLORHYDRATE D''HYDROXYZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (529, 3528, '60322461', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3529,'PHÉNOBARBITAL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (530, 3529, '60323481', 'comprimé', '100,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3530,'CANDÉSARTAN CILEXÉTIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (531, 3530, '60323969', 'comprimé', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3531,'GLYCÉROL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (532, 3531, '60324658', 'suppositoire', '2,10 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3532,'CHLORHYDRATE DE NÉFOPAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (533, 3532, '60325201', 'solution', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3533,'LÉVOFLOXACINE HÉMIHYDRATÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (534, 3533, '60326538', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3534,'DICHLORHYDRATE DE BÉTAHISTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (535, 3534, '60327056', 'comprimé', '8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3535,'RAXTOZINAMÉRAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (536, 3535, '60327063', 'dispersion', '10 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3536,'BÉNAZÉPRIL (CHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (537, 3536, '60327266', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3537,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (538, 3537, '60327615', 'comprimé', '325 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3538,'SULFATE DE MORPHINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (539, 3538, '60328261', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3539,'TAMOXIFÈNE (CITRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (540, 3539, '60328432', 'comprimé', '30,4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3540,'MANNITOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (541, 3540, '60329242', 'solution', '20 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3541,'CÉFOXITINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (542, 3541, '60329598', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3542,'EXTRAIT FLUIDE DES PARTIES AÉRIENNES FLEURIES DE SALICAIRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (543, 3542, '60329609', 'solution', '66,66 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3543,'TÉICOPLANINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (544, 3543, '60330180', 'poudre', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3544,'MÉLOXICAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (545, 3544, '60330522', 'comprimé', '15 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3545,'FUSIDIQUE (ACIDE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (546, 3545, '60330586', 'crème', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3546,'PRASUGREL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (547, 3546, '60330636', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3547,'HYDROXYDE D''ALUMINIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (548, 3547, '60330700', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3548,'GLICLAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (549, 3548, '60331738', 'comprimé', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3549,'CALCIUM (CARBONATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (550, 3549, '60332103', 'comprimé', '2500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3550,'LINÉZOLIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (551, 3550, '60335124', 'comprimé', '600 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3551,'RISÉDRONATE MONOSODIQUE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (552, 3551, '60335291', 'comprimé', '35 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3552,'GLIMÉPIRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (553, 3552, '60337328', 'comprimé', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3553,'SPIRONOLACTONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (554, 3553, '60337762', 'comprimé', '75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3554,'CHLORHYDRATE DE FLUOXÉTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (555, 3554, '60338857', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3555,'DESMOPRESSINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (556, 3555, '60338978', 'comprimé', '120 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3556,'ESTERS ÉTHYLIQUES 90 D''ACIDES OMÉGA-3 ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (557, 3556, '60339254', 'capsule', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3557,'CHLORHYDRATE DE MORPHINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (558, 3557, '60339717', 'solution', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3558,'CINACALCET', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (559, 3558, '60340413', 'comprimé', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3559,'COCA (P P H) POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (560, 3559, '60341255', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3560,'PANCRÉAS (POUDRE DE) (PORCINE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (561, 3560, '60341508', 'gélule', '137,025 - 164,938 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3561,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (562, 3561, '60342439', 'comprimé', '1,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3562,'LÉVÉTIRACÉTAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (563, 3562, '60344066', 'comprimé', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3563,'CHLORHYDRATE DE TRAMADOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (564, 3563, '60344529', 'gélule', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3564,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (565, 3564, '60345218', 'comprimé', '1,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3565,'ATÉZOLIZUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (566, 3565, '60345905', 'solution', '1200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3566,'KÉTOCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (567, 3566, '60347710', 'crème', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3567,'FOSCARNET SODIQUE HEXAHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (568, 3567, '60347728', 'solution', '24 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3568,'VELPATASVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (569, 3568, '60348342', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3569,'DOXYCYCLINE MONOHYDRATÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (570, 3569, '60349519', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3570,'ACÉTATE D''ALPHA-TOCOPHÉROL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (571, 3570, '60349711', 'comprimé', '50,000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3571,'ADONIS VERNALIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (572, 3571, '60351662', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3572,'NONACOG GAMMA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (573, 3572, '60351694', 'poudre', '250 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3573,'OXAZÉPAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (574, 3573, '60351986', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3574,'VALSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (575, 3574, '60352006', 'comprimé', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3575,'MÉTHOTREXATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (576, 3575, '60353108', 'solution', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3576,'LACTATE DE MAGNÉSIUM DIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (577, 3576, '60355027', 'granulés', '18,605 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3577,'GLIMÉPIRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (578, 3577, '60355600', 'comprimé', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3578,'LAMOTRIGINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (579, 3578, '60355931', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3579,'CALCAREA SILICICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (580, 3579, '60356339', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3580,'FENTANYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (581, 3580, '60356727', 'dispositif', '8,25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3581,'ÉSOMÉPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (582, 3581, '60357359', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3582,'CEFTAZIDIME PENTAHYDRATÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (583, 3582, '60360608', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3583,'STREPTOZOCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (584, 3583, '60361959', 'lyophilisat', '1 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3584,'ORIGANUM MAJORANA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (585, 3584, '60363508', 'crème', '2CH à 30CH et 4DH à 60DH (crème à 4 %)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3585,'TIOTROPIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (586, 3585, '60363967', 'gélule', '18 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3586,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (587, 3586, '60364161', 'comprimé', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3587,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (588, 3587, '60365078', 'comprimé', '325 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3588,'ALENDRONATE MONOSODIQUE TRIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (589, 3588, '60365142', 'comprimé', '91,363 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3589,'ZOPICLONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (590, 3589, '60365740', 'comprimé', '7,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3590,'AMOXICILLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (591, 3590, '60366319', 'poudre', '125,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3591,'ROSUVASTATINE CALCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (592, 3591, '60366689', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3592,'AMLODIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (593, 3592, '60367022', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3593,'PAMOATE DE PASIRÉOTIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (594, 3593, '60368028', 'poudre', '82,26 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3594,'SULFATE DE VINCRISTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (595, 3594, '60368099', 'solution', '1,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3595,'CINA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (596, 3595, '60368423', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3596,'MÉSYLATE D''OSIMERTINIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (597, 3596, '60368512', 'comprimé', '47,7 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3597,'CYTARABINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (598, 3597, '60369984', 'solution', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3598,'CHLORHYDRATE DE NALTREXONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (599, 3598, '60370919', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3599,'OXYDE D''ALUMINIUM HYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (600, 3599, '60371120', 'suspension', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3600,'SIMVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (601, 3600, '60371679', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3601,'CHLORHYDRATE DE ROPINIROLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (602, 3601, '60371992', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3602,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (603, 3602, '60372197', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3603,'MÉTOCLOPRAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (604, 3603, '60372215', 'comprimé', '13,37 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3604,'IRIS VERSICOLOR POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (605, 3604, '60373089', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3605,'KALIUM CARBONICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (606, 3605, '60373178', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3606,'CHLORURE D''AMBÉNONIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (607, 3606, '60374821', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3607,'CYTARABINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (608, 3607, '60375001', 'poudre', '1g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3608,'AMOXICILLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (609, 3608, '60375058', 'poudre', '250,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3609,'GLUCOSE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (610, 3609, '60375720', 'solution', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3610,'VALSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (611, 3610, '60375880', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3611,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (612, 3611, '60375930', 'comprimé', '0,625 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3612,'VINORELBINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (613, 3612, '60376637', 'capsule', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3613,'TÉRAZOSINE BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (614, 3613, '60376815', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3614,'KÉTOPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (615, 3614, '60377116', 'gélule', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3615,'ALPRAZOLAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (616, 3615, '60377803', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3616,'CÉFUROXIME SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (617, 3616, '60378168', 'poudre', '52,6 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3617,'GLUCOSE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (618, 3617, '60378182', 'solution', '10 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3618,'CHLORHYDRATE DE TRIHEXYPHÉNIDYLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (619, 3618, '60379544', 'comprimé', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3619,'CHINA RUBRA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (620, 3619, '60380201', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3620,'AMINOSALICYLATE DE SODIUM DIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (621, 3620, '60382608', 'poudre', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3621,'RAPHANUS SATIVUS NIGER POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (622, 3621, '60384057', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3622,'RHUS TOXICODENDRON POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (623, 3622, '60385248', 'solution', '0,950 mg (6 DH)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3623,'DOCÉTAXEL TRIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (624, 3623, '60385433', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3624,'IODE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (625, 3624, '60385522', 'solution', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3625,'DANTROLÈNE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (626, 3625, '60385682', 'gélule', '0,100 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3626,'ÉNOXAPARINE SODIQUE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (627, 3626, '60385789', 'solution', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3627,'VIRUS DE L''HÉPATITE A SOUCHE HM175 INACTIVÉ ADSORBÉ ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (628, 3627, '60386414', 'suspension', '1440 U');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3628,'CÉFOTAXIME SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (629, 3628, '60386439', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3629,'ATORVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (630, 3629, '60386460', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3630,'AGNUS CASTUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (631, 3630, '60386574', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3631,'ABELMOSCHUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (632, 3631, '60386663', 'comprimé', '4CH à 30CH et 7DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3632,'PÉRINDOPRIL TERT-BUTYLAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (633, 3632, '60386859', 'comprimé', '8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3633,'MÉTHOTREXATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (634, 3633, '60390455', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3634,'BÉVACIZUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (635, 3634, '60391646', 'solution', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3635,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (636, 3635, '60392513', 'comprimé', '325 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3636,'RIVAROXABAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (637, 3636, '60393661', 'comprimé 15 mg', '15 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3637,'HEXÉTIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (638, 3637, '60394998', 'solution', '0,1 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3638,'ÉFAVIRENZ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (639, 3638, '60396426', 'gélule', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3639,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (640, 3639, '60396465', 'comprimé', '325 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3640,'MALÉATE DE TIMOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (641, 3640, '60396928', 'collyre', '0,342 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3641,'MONTMORILLONITE BEIDELLITIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (642, 3641, '60397122', 'poudre', '3 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3642,'LÉVONORGESTREL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (643, 3642, '60397542', 'comprimé rose', '100 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3643,'AGALSIDASE ALFA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (644, 3643, '60397909', 'solution', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3644,'SERTRALINE BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (645, 3644, '60398167', 'gélule', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3645,'RHUS TOXICODENDRON POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (646, 3645, '60399326', 'granules', '0,013 ml (15 CH)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3646,'RISÉDRONATE MONOSODIQUE HÉMIPENTAHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (647, 3646, '60399454', 'comprimé', '35 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3647,'PHLOROGLUCINOL HYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (648, 3647, '60399956', 'comprimé', '80 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3648,'LÉNALIDOMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (649, 3648, '60401186', 'gélule', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3649,'NICOTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (650, 3649, '60401745', 'dispositif', '17,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3650,'BROMHYDRATE DE GALANTAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (651, 3650, '60401898', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3651,'AMOXICILLINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (652, 3651, '60403714', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3652,'CABAZITAXEL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (653, 3652, '60406016', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3653,'BÉSILATE D''ATRACURIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (654, 3653, '60406781', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3654,'ACÉTATE DE CHLORHEXIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (655, 3654, '60406856', 'comprimé', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3655,'ACÉTATE DE CYPROTÉRONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (656, 3655, '60406938', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3656,'IODE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (657, 3656, '60407463', 'solution', '25,0000 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3657,'PROTOXYDE D''AZOTE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (658, 3657, '60408330', 'gaz', 'qs (gaz liquéfié sous une pression de 20 bar à -18Â°C)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3658,'PHYTATE DE SODIUM ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (659, 3658, '60408405', 'poudre', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3659,'CEREBELLUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (660, 3659, '60414689', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3660,'ALPROSTADIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (661, 3660, '60415442', 'bâton', '250 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3661,'MÉTRONIDAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (662, 3661, '60416081', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3662,'CUPRUM METALLICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (663, 3662, '60417646', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3663,'DULCAMARA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (664, 3663, '60418577', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3664,'ACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (665, 3664, '60418673', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3665,'APRÉMILAST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (666, 3665, '60418716', 'comprimé 10 mg', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3666,'TROLAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (667, 3666, '60418851', 'émulsion', '0,670 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3667,'ACIDE ASPARTIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (668, 3667, '60420681', 'compartiment 1 : acides aminés et électrolytes', '1 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3668,'INSULINE HUMAINE RECOMBINANTE ISOPHANE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (669, 3668, '60423446', 'suspension', '100 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3669,'CYANOCOBALAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (670, 3669, '60423791', 'solution', '1000 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3670,'AMOXICILLINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (671, 3670, '60424338', 'gélule', '500,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3671,'GRAPHITE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (672, 3671, '60424605', 'solide', '1,340 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3672,'EXTRAIT ALLERGÉNIQUE DE POLLEN DE FLOUVE ODORANTE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (673, 3672, '60425707', 'comprimé 100 IR', 'qsp 100 IR');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3673,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (674, 3673, '60427163', 'comprimé', '1,25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3674,'SITAGLIPTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (675, 3674, '60427398', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3675,'CLADRIBINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (676, 3675, '60427957', 'solution', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3676,'THIOCOLCHICOSIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (677, 3676, '60427989', 'comprimé', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3677,'ARGENTUM METALLICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (678, 3677, '60429075', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3678,'LOBELIA CARDINALIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (679, 3678, '60429310', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3679,'DUTASTÉRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (680, 3679, '60429851', 'capsule', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3680,'MILNACIPRAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (681, 3680, '60430095', 'gélule', '21,77 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3681,'NÉVIRAPINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (682, 3681, '60433166', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3682,'TADALAFIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (683, 3682, '60433344', 'comprimé', '2,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3683,'CITRATE DE TORÉMIFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (684, 3683, '60433369', 'comprimé', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3684,'AURUM METALLICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (685, 3684, '60433629', 'comprimé', '83,3 mg (10 DH)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3685,'ÉNOXAPARINE SODIQUE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (686, 3685, '60434745', 'solution', '80 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3686,'RIZATRIPTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (687, 3686, '60434834', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3687,'FROVATRIPTAN BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (688, 3687, '60435263', 'comprimé', '2,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3688,'POVIDONE IODÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (689, 3688, '60436479', 'solution', '1,00 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3689,'SITAGLIPTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (690, 3689, '60437225', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3690,'CHLORHYDRATE DE NÉBIVOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (691, 3690, '60437428', 'comprimé', '5,45 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3691,'MAGNÉSIUM (THIOSULFATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (692, 3691, '60438793', 'comprimé', '50,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3692,'TRINITRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (693, 3692, '60439087', 'dispositif', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3693,'MALÉATE DE FLUVOXAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (694, 3693, '60439525', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3694,'LÉVOTHYROXINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (695, 3694, '60441558', 'capsule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3695,'CHLORHYDRATE D''AMIODARONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (696, 3695, '60441622', 'comprimé', '200,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3696,'VARÉNICLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (697, 3696, '60442838', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3697,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (698, 3697, '60442980', 'comprimé', '1 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3698,'OLIVIER (EXTRAIT SEC DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (699, 3698, '60443192', 'comprimé', '65,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3699,'TEMSIROLIMUS', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (700, 3699, '60443413', 'solution', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3700,'LOSARTAN POTASSIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (701, 3700, '60443477', 'comprimé', '50,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3701,'CHLORHYDRATE D''ALFUZOSINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (702, 3701, '60443609', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3702,'RABÉPRAZOLE BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (703, 3702, '60443801', 'comprimé', '18,85 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3703,'BILASTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (704, 3703, '60443897', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3704,'DIOSMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (705, 3704, '60445204', 'poudre', '600 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3705,'CINABRE POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (706, 3705, '60445250', 'crème', '4CH à 30CH et 7DH à 60DH (crème à 4 %)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3706,'PIPÉRACILLINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (707, 3706, '60445784', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3707,'FULVESTRANT', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (708, 3707, '60446306', 'solution', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3708,'CARBOPLATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (709, 3708, '60446612', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3709,'MÉTRÉLEPTINE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (710, 3709, '60446726', 'poudre', '3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3710,'BICARBONATE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (711, 3710, '60446911', 'solution', '1,40 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3711,'6-IODOMÉTHYLNORCHOLESTÉROL [131 I]', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (712, 3711, '60447461', 'solution', '7,5 à 15 MBq à la date de calibration');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3712,'EXTRAIT SEC DE LA SOMMITÉ FLEURIE DE MILLEPERTUIS', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (713, 3712, '60448702', 'gélule', '175 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3713,'TÉRIFLUNOMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (714, 3713, '60448937', 'comprimé', '14 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3714,'T.R.E. POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (715, 3714, '60449124', 'crème', '4CH à 30CH et 8DH à 60DH (crème à 4 %)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3715,'LANSOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (716, 3715, '60449672', 'gélule', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3716,'SPIRAMYCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (717, 3716, '60450831', 'comprimé', '3 M.U.I.');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3717,'ÉNOXAPARINE SODIQUE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (718, 3717, '60451456', 'solution', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3718,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (719, 3718, '60451762', 'comprimé', '7,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3719,'TRIPHOSPHATE D''ADÉNOSINE DISODIQUE TRIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (720, 3719, '60453083', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3720,'AMOXICILLINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (721, 3720, '60453197', 'poudre', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3721,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (722, 3721, '60453382', 'comprimé', '1,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3722,'ÉSOMÉPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (723, 3722, '60454662', 'gélule', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3723,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (724, 3723, '60455586', 'comprimé', '12,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3724,'MÉTHOTREXATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (725, 3724, '60455789', 'solution', '17,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3725,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (726, 3725, '60456154', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3726,'MÉCLOZINE (DICHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (727, 3726, '60456535', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3727,'CHLORHYDRATE DE MANIDIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (728, 3727, '60456948', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3728,'GÉFITINIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (729, 3728, '60457263', 'comprimé', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3729,'TRABECTÉDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (730, 3729, '60457338', 'poudre', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3730,'DULOXÉTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (731, 3730, '60457719', 'gélule', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3731,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (732, 3731, '60457822', 'comprimé', '7,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3732,'PEGFILGRASTIM ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (733, 3732, '60457929', 'solution', '6 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3733,'NITISINONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (734, 3733, '60459499', 'gélule', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3734,'SUFENTANIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (735, 3734, '60460398', 'solution', '5 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3735,'LÉVOTHYROXINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (736, 3735, '60460996', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3736,'GLUCOSE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (737, 3736, '60461105', 'solution', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3737,'CÉFAZOLINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (738, 3737, '60461151', 'poudre', '2,097 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3738,'TÉICOPLANINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (739, 3738, '60462328', 'poudre', '100 mg équivalents à au moins 100 000 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3739,'ZOLMITRIPTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (740, 3739, '60462513', 'comprimé', '2,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3740,'MACROGOL 4000', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (741, 3740, '60462538', 'poudre', '10,000 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3741,'ZIDOVUDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (742, 3741, '60462659', 'comprimé', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3742,'BOSUTINIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (743, 3742, '60462965', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3743,'MÉSYLATE D''OSIMERTINIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (744, 3743, '60463095', 'comprimé', '95,4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3744,'ACIDE ZOLÉDRONIQUE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (745, 3744, '60463323', 'solution', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3745,'CHLORHYDRATE DE DILTIAZEM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (746, 3745, '60463871', 'comprimé', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3746,'SPIRONOLACTONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (747, 3746, '60464076', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3747,'INSULINE HUMAINE RECOMBINANTE ISOPHANE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (748, 3747, '60464222', 'suspension', '100 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3748,'FENTANYL (CITRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (749, 3748, '60466515', 'comprimé', '0,943 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3749,'BUDÉSONIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (750, 3749, '60468092', 'poudre', '200 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3750,'CHLORHYDRATE DE DONÉPÉZIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (751, 3750, '60468103', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3751,'GLYCÉROL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (752, 3751, '60468320', 'crème', '15 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3752,'ÉPLÉRÉNONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (753, 3752, '60470015', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3753,'ALLOPURINOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (754, 3753, '60470499', 'comprimé', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3754,'CHLORURE DE POTASSIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (755, 3754, '60470798', 'solution', '0,04 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3755,'NADROPARINE CALCIQUE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (756, 3755, '60470990', 'solution', '5700 UI AXa');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3756,'LÉVODOPA', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (757, 3756, '60472849', 'comprimé', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3757,'TELMISARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (758, 3757, '60473157', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3758,'AMLODIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (759, 3758, '60473812', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3759,'OXALATE D''ESCITALOPRAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (760, 3759, '60474889', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3760,'ACIDE ASCORBIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (761, 3760, '60475749', 'poudre', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3761,'CHLORHYDRATE DE RANITIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (762, 3761, '60476630', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3762,'ATROPINE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (763, 3762, '60476979', 'collyre', '0,5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3763,'CHLORHYDRATE D''ACÉBUTOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (764, 3763, '60477038', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3764,'CHLORHYDRATE DE TRAMADOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (765, 3764, '60477650', 'solution', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3765,'VALSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (766, 3765, '60478097', 'comprimé', '160 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3766,'HELONIAS DIOICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (767, 3766, '60478229', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3767,'TOSILATE DE PÉRINDOPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (768, 3767, '60479345', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3768,'BROMHYDRATE DE GALANTAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (769, 3768, '60480212', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3769,'MÉTRONIDAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (770, 3769, '60480276', 'comprimé', '250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3770,'INSULINE DÉGLUDEC ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (771, 3770, '60480810', 'solution', '100 Unités');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3771,'ROSUVASTATINE ZINCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (772, 3771, '60481517', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3772,'BROMURE D''IPRATROPIUM MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (773, 3772, '60482665', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3773,'CHLORHYDRATE DE LERCANIDIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (774, 3773, '60483685', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3774,'ADRÉNALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (775, 3774, '60484221', 'solution', '0,010 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3775,'ACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (776, 3775, '60485234', 'poudre', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3776,'CHLORHYDRATE D''OXYCODONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (777, 3776, '60485572', 'gélule', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3777,'LÉVODOPA', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (778, 3777, '60485953', 'gélule', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3778,'SUCCINATE DE SUMATRIPTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (779, 3778, '60486090', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3779,'CO-CRISTAL D''AGOMÉLATINE-ACIDE CITRIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (780, 3779, '60486279', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3780,'IRBÉSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (781, 3780, '60488216', 'comprimé', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3781,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (782, 3781, '60489617', 'comprimé', '10,000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3782,'MÉROPÉNEM TRIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (783, 3782, '60489738', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3783,'PROPIONATE DE CLOBÉTASOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (784, 3783, '60490256', 'shampooing', '500 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3784,'FUMARATE DE QUÉTIAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (785, 3784, '60490893', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3785,'PREDNISONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (786, 3785, '60492702', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3786,'TÉNOFOVIR DISOPROXIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (787, 3786, '60493359', 'comprimé', '163 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3787,'ACIDE ACÉTYLSALICYLIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (788, 3787, '60493619', 'comprimé', '500,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3788,'PULSATILLA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (789, 3788, '60493811', 'granules', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3789,'KÉTOPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (790, 3789, '60494614', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3790,'RABÉPRAZOLE SODIQUE MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (791, 3790, '60494895', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3791,'IODE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (792, 3791, '60495132', 'solution', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3792,'TOZINAMÉRAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (793, 3792, '60495328', 'dispersion', '30 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3793,'CHLORHYDRATE D''HEPTAMINOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (794, 3793, '60496348', 'solution', '30,500 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3794,'GLIBENCLAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (795, 3794, '60497140', 'comprimé', '2,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3795,'HYPERICUM PERFORATUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (796, 3795, '60498317', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3796,'CHLORHYDRATE DE SÉLÉGILINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (797, 3796, '60498751', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3797,'CHLORHYDRATE D''ERLOTINIB', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (798, 3797, '60500519', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3798,'CHLORHYDRATE DE DONÉPÉZIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (799, 3798, '60502559', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3799,'KÉTOCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (800, 3799, '60502840', 'gel', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3800,'CHLORURE DE POTASSIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (801, 3800, '60503789', 'solution', '0,15 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3801,'BUDÉSONIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (802, 3801, '60505950', 'suspension', '0,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3802,'FÉBUXOSTAT HÉMIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (803, 3802, '60506358', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3803,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (804, 3803, '60507086', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3804,'CHLORHYDRATE D''HYDROXYZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (805, 3804, '60507271', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3805,'PIX LIQUIDA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (806, 3805, '60507702', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3806,'DÉFÉRIPRONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (807, 3806, '60508302', 'comprimé', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3807,'AMYLÉINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (808, 3807, '60508430', 'solution', '0,75 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3808,'MALÉATE DE TRIMÉBUTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (809, 3808, '60508697', 'comprimé', '100,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3809,'DOCÉTAXEL TRIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (810, 3809, '60509781', 'solution', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3810,'CENCHRIS CONTORTRIX POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (811, 3810, '60510431', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3811,'DARVADSTROCEL ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (812, 3811, '60511177', 'suspension', '5 millions de cellules');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3812,'ESTERS ÉTHYLIQUES D''ACIDES OMÉGA-3 ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (813, 3812, '60511953', 'capsule', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3813,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (814, 3813, '60512090', 'comprimé', '12,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3814,'SIMVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (815, 3814, '60512336', 'comprimé', '10,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3815,'BUDÉSONIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (816, 3815, '60512521', 'suspension', '0,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3816,'CHLORHYDRATE D''ALFUZOSINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (817, 3816, '60513032', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3817,'NITISINONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (818, 3817, '60513598', 'gélule', '2 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3818,'ACÉTYLCYSTÉINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (819, 3818, '60513655', 'solution', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3819,'CHLORHYDRATE D''AMIODARONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (820, 3819, '60514006', 'comprimé', '200,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3820,'HEDERA HELIX POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (821, 3820, '60514013', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3821,'FILGRASTIM ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (822, 3821, '60514839', 'solution', '48 MU');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3822,'AZITHROMYCINE MONOHYDRATÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (823, 3822, '60514878', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3823,'INDAPAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (824, 3823, '60514928', 'comprimé', '0,625 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3824,'AMOXICILLINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (825, 3824, '60516765', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3825,'CHLORHYDRATE DE VÉRAPAMIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (826, 3825, '60516982', 'comprimé', '240 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3826,'AMISULPRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (827, 3826, '60517664', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3827,'FLUORURE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (828, 3827, '60517707', 'comprimé', '0,553 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3828,'HYDROQUINIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (829, 3828, '60518136', 'gélule', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3829,'HYDROGÉNOOXALATE DE NAFTIDROFURYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (830, 3829, '60518378', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3830,'ATORVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (831, 3830, '60519117', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3831,'IRBÉSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (832, 3831, '60519505', 'comprimé', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3832,'MURIATICUM ACIDUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (833, 3832, '60520315', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3833,'NITRATE D''ÉCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (834, 3833, '60521470', 'poudre', '1 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3834,'DALTÉPARINE SODIQUE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (835, 3834, '60521926', 'solution', '18 000 UI anti-Xa');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3835,'CLADRIBINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (836, 3835, '60522572', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3836,'DISCI THORACALES POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (837, 3836, '60522953', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3837,'CHLORHYDRATE DE PAROXÉTINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (838, 3837, '60524064', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3838,'GLUCOSE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (839, 3838, '60524573', 'solution', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3839,'ZIDOVUDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (840, 3839, '60524598', 'solution', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3840,'BISOPROLOL (FUMARATE ACIDE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (841, 3840, '60524826', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3841,'ROXITHROMYCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (842, 3841, '60526880', 'comprimé', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3842,'ÉCONAZOLE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (843, 3842, '60527320', 'ovule', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3843,'EXTRAIT SEC RAFFINÉ D''ÉCORCE DE BOULEAU', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (844, 3843, '60528073', 'gel', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3844,'CHLORHYDRATE DE CLOMIPRAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (845, 3844, '60528874', 'comprimé', '75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3845,'ÉTANERCEPT ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (846, 3845, '60529218', 'solution', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3846,'CHLOROBUTANOL HÉMIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (847, 3846, '60529613', 'solution', '0,5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3847,'ACÉTATE D''ULIPRISTAL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (848, 3847, '60529816', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3848,'CHLORHYDRATE D''ONDANSÉTRON DIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (849, 3848, '60530882', 'comprimé', '5,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3849,'OLANZAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (850, 3849, '60530925', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3850,'ADRÉNALINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (851, 3850, '60533348', 'solution', '0,05 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3851,'PRAZÉPAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (852, 3851, '60534076', 'solution', '1,5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3852,'IMMUNOGLOBULINE HUMAINE NORMALE (PLASMATIQUE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (853, 3852, '60534795', 'solution', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3853,'ESTRADIOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (854, 3853, '60535331', 'système de diffusion', '1,94 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3854,'RIBOFLAVINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (855, 3854, '60535623', 'comprimé', '15,000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3855,'LÉNALIDOMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (856, 3855, '60535915', 'gélule', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3856,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (857, 3856, '60536209', 'comprimé', '12,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3857,'MERCURIALIS PERENNIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (858, 3857, '60536789', 'comprimé', '4CH à 30CH et 7DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3858,'ABIES CANADENSIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (859, 3858, '60538772', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3859,'RUPATADINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (860, 3859, '60539130', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3860,'DIGLUCONATE DE CHLORHEXIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (861, 3860, '60539301', 'pastille', '3,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3861,'ATAZANAVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (862, 3861, '60542735', 'gélule', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3862,'RAMIPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (863, 3862, '60542920', 'comprimé', '1,25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3863,'CABOTÉGRAVIR SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (864, 3863, '60543082', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3864,'MALÉATE D''ÉNALAPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (865, 3864, '60543292', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3865,'RÉSINATE DE NICOTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (866, 3865, '60545083', 'gomme', '26,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3866,'NUX VOMICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (867, 3866, '60545343', 'solution', '3 mL (3 DH)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3867,'CHOLÉCALCIFÉROL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (868, 3867, '60545966', 'capsule', '500 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3868,'MONTÉLUKAST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (869, 3868, '60546299', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3869,'POVIDONE IODÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (870, 3869, '60546502', 'gel', '10 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3870,'CHLORHYDRATE DE PAROXÉTINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (871, 3870, '60546662', 'comprimé', '22,22 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3871,'LÉVOMÉPROMAZINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (872, 3871, '60548802', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3872,'BUPRÉNORPHINE (CHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (873, 3872, '60549391', 'comprimé', '0,250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3873,'UROFOLLITROPINE ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (874, 3873, '60549797', 'poudre', '150 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3874,'IVABRADINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (875, 3874, '60549911', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3875,'THERIDION CURRASSAVICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (876, 3875, '60550212', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3876,'THUYA OCCIDENTALIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (877, 3876, '60550237', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3877,'CEFTAZIDIME PENTAHYDRATÉE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (878, 3877, '60550493', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3878,'PANTOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (879, 3878, '60550568', 'poudre', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3879,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (880, 3879, '60550988', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3880,'BOSENTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (881, 3880, '60552925', 'comprimé', '62,50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3881,'KÉTOPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (882, 3881, '60554125', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3882,'CAJUPUTUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (883, 3882, '60554513', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3883,'STAPHYSAGRIA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (884, 3883, '60555191', 'granules', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3884,'ÉTHINYLESTRADIOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (885, 3884, '60555469', 'comprimé', '0,02 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3885,'PÉRINDOPRIL TERT-BUTYLAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (886, 3885, '60555889', 'comprimé', '4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3886,'AMOXICILLINE ANHYDRE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (887, 3886, '60556852', 'poudre', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3887,'PARACÉTAMOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (888, 3887, '60557071', 'comprimé', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3888,'KÉTOCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (889, 3888, '60557096', 'crème', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3889,'RIVASTIGMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (890, 3889, '60557826', 'gélule', '3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3890,'FENTANYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (891, 3890, '60558248', 'dispositif', '12,375 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3891,'LANSOPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (892, 3891, '60558294', 'gélule', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3892,'LABÉTALOL (CHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (893, 3892, '60558554', 'solution', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3893,'CARBONATE DE SÉVÉLAMER', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (894, 3893, '60558629', 'comprimé', '800 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3894,'NIFUROXAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (895, 3894, '60558682', 'gélule', '200,0 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3895,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (896, 3895, '60560046', 'comprimé', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3896,'TELMISARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (897, 3896, '60560224', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3897,'FLUCONAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (898, 3897, '60560861', 'gélule', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3898,'CHLORHYDRATE DE MÉMANTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (899, 3898, '60561269', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3899,'FENUGREC (EXTRAIT SEC DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (900, 3899, '60561333', 'comprimé', '147,0 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3900,'MÉSILATE DE DOXAZOSINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (901, 3900, '60562606', 'comprimé', '4,85 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3901,'ROSUVASTATINE CALCIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (902, 3901, '60562734', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3902,'CLOPIDOGREL (HYDROGÉNOSULFATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (903, 3902, '60562855', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3903,'PROPIONATE DE FLUTICASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (904, 3903, '60564219', 'suspension', '50 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3904,'CHLORHYDRATE D''ÉPHÉDRINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (905, 3904, '60565310', 'solution', '30 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3905,'MERCURIUS CORROSIVUS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (906, 3905, '60565463', 'comprimé', '4CH à 30CH et 7DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3906,'TOBRAMYCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (907, 3906, '60565723', 'poudre', '28 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3907,'MALÉATE D''ÉNALAPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (908, 3907, '60565730', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3908,'CHLORHYDRATE DE NÉBIVOLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (909, 3908, '60566686', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3909,'IODE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (910, 3909, '60567418', 'solution', '32,000 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3910,'CROMOGLICATE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (911, 3910, '60568235', 'solution', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3911,'CHLORHYDRATE DE QUINAPRIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (912, 3911, '60568559', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3912,'CHLORHYDRATE D''ANAGRÉLIDE MONOHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (913, 3912, '60569173', 'gélule', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3913,'PROPIONATE DE FLUTICASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (914, 3913, '60569419', 'poudre', '500 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3914,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (915, 3914, '60569860', 'solution', '5 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3915,'ALIROCUMAB ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (916, 3915, '60570108', 'solution', '75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3916,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (917, 3916, '60570229', 'comprimé', '12,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3917,'LEMNA MINOR POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (918, 3917, '60570396', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3918,'DIPROPIONATE DE BÉCLOMÉTHASONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (919, 3918, '60571391', 'solution', '250 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3919,'BISACODYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (920, 3919, '60572618', 'comprimé', '5,0 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3920,'TADALAFIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (921, 3920, '60572746', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3921,'TUBERCULINUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (922, 3921, '60573175', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3922,'APRÉPITANT', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (923, 3922, '60574505', 'gélule', '125 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3923,'SINAPIS NIGRA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (924, 3923, '60574804', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3924,'BRIMONIDINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (925, 3924, '60574868', 'collyre', '1,3 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3925,'LACOSAMIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (926, 3925, '60575525', 'comprimé', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3926,'PAEONIA OFFICINALIS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (927, 3926, '60575991', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3927,'ANTIMONIATE DE MÉGLUMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (928, 3927, '60576634', 'solution', '1,500 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3928,'MORPHINE (SULFATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (929, 3928, '60576901', 'comprimé', '60 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3929,'HYDROCHLOROTHIAZIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (930, 3929, '60577565', 'comprimé', '6,25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3930,'MÉTHYLDOPA SESQUIHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (931, 3930, '60578560', 'comprimé', '282,5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3931,'SODIUM (IODURE [123 I] DE) (SOLUTION DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (932, 3931, '60578852', 'solution', '18,5 MBq à la date et heure de calibration');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3932,'BRIVARACÉTAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (933, 3932, '60579228', 'solution', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3933,'CÉFOXITINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (934, 3933, '60580134', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3934,'FINASTÉRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (935, 3934, '60580369', 'comprimé', '1,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3935,'FUMARATE DE QUÉTIAPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (936, 3935, '60581115', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3936,'OXYGÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (937, 3936, '60581211', 'gaz', '50 % mole/mole');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3937,'RISÉDRONATE MONOSODIQUE HÉMIPENTAHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (938, 3937, '60582021', 'comprimé', '75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3938,'ÉBASTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (939, 3938, '60582092', 'comprimé', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3939,'IRBÉSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (940, 3939, '60582498', 'comprimé', '300 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3940,'FILGRASTIM ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (941, 3940, '60583187', 'solution', '300 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3941,'SIMVASTATINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (942, 3941, '60583269', 'comprimé', '40 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3942,'ARNICA, TEINTURE DE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (943, 3942, '60584638', 'gel', '20,00 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3943,'MÉTHACHOLINE (CHLORURE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (944, 3943, '60586094', 'poudre', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3944,'VILDAGLIPTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (945, 3944, '60586660', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3945,'CHLORHYDRATE DE LERCANIDIPINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (946, 3945, '60587100', 'comprimé', '20 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3946,'SULFUR POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (947, 3946, '60587591', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3947,'TRIMÉBUTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (948, 3947, '60588704', 'granulés', '0,7870 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3948,'IMMUNOGLOBULINE ÉQUINE ANTI-LYMPHOCYTE T HUMAIN ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (949, 3948, '60589496', 'solution', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3949,'CUPRUM ACETICUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (950, 3949, '60589592', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3950,'CHLORHYDRATE DE BUPRÉNORPHINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (951, 3950, '60590630', 'comprimé', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3951,'LÉVÉTIRACÉTAM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (952, 3951, '60591091', 'granulés', '1000 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3952,'RISPÉRIDONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (953, 3952, '60591814', 'poudre', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3953,'BROMURE DE MÉTHYLNALTREXONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (954, 3953, '60594326', 'solution', '12 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3954,'IRBÉSARTAN', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (955, 3954, '60595232', 'comprimé', '150 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3955,'SITAGLIPTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (956, 3955, '60595727', 'comprimé', '50 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3956,'LÉVOCABASTINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (957, 3956, '60596010', 'collyre', '0,05 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3957,'PRAVASTATINE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (958, 3957, '60596494', 'comprimé', '20,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3958,'HÉMIFUMARATE DE BISOPROLOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (959, 3958, '60598673', 'comprimé', '3,75 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3959,'STICTA PULMONARIA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (960, 3959, '60598844', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3960,'ARIPIPRAZOLE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (961, 3960, '60599533', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3961,'NUX VOMICA POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (962, 3961, '60600074', 'comprimé', '0,625 mg (4 CH)');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3962,'AMISULPRIDE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (963, 3962, '60600156', 'comprimé', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3963,'SODIUM (N-ACÉTYL L-ASPARTYL L-GLUTAMATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (964, 3963, '60600334', 'collyre', '4,9 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3964,'COLLAGÉNASE DE CLOSTRIDIUM HISTOLYTICUM ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (965, 3964, '60601728', 'poudre', '0,9 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3965,'SUCRALFATE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (966, 3965, '60602431', 'suspension', '2 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3966,'EFMOROCTOCOG ALFA ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (967, 3966, '60602449', 'poudre', '750 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3967,'DICLOFÉNAC SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (968, 3967, '60603444', 'gel', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3968,'CARBONATE DE CALCIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (969, 3968, '60605000', 'comprimé', '1250 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3969,'RISPÉRIDONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (970, 3969, '60605064', 'comprimé', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3970,'SERTRALINE BASE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (971, 3970, '60606586', 'gélule', '25 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3971,'MÉTHOXYFLURANE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (972, 3971, '60607503', 'liquide', '99,9 % m/m');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3972,'BIMATOPROST', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (973, 3972, '60607955', 'collyre', '0,1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3973,'SUCCINATE DE SOLIFÉNACINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (974, 3973, '60608174', 'suspension', '1 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3974,'RISPÉRIDONE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (975, 3974, '60608384', 'comprimé', '1,00 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3975,'SULFATE DE GLUCOSAMINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (976, 3975, '60609568', 'comprimé', '1500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3976,'IBUPROFÈNE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (977, 3976, '60610595', 'suspension', '400 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3977,'ABSINTHIUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (978, 3977, '60612094', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3978,'STRAMONIUM POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (979, 3978, '60612443', 'comprimé', '2CH à 30CH et 4DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3979,'CHLORHYDRATE DE TRAMADOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (980, 3979, '60613075', 'comprimé', '200 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3980,'CHLORURE DE SODIUM', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (981, 3980, '60613157', 'solution', '20 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3981,'OXYTOCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (982, 3981, '60613673', 'solution', '5 UI');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3982,'ANIDULAFUNGINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (983, 3982, '60614273', 'poudre', '100 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3983,'STREPTOCOCCUS PNEUMONIAE SÉROTYPE 23F (POLYOSIDES DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (984, 3983, '60614280', 'solution', '25 microgrammes');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3984,'VÉRAPAMIL (CHLORHYDRATE DE)', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (985, 3984, '60614889', 'solution', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3985,'MONILIA ALBICANS POUR PRÉPARATIONS HOMÉOPATHIQUES', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (986, 3985, '60614939', 'comprimé', '4CH à 30CH et 8DH à 60DH');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3986,'PROPOFOL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (987, 3986, '60616445', 'émulsion', '10 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3987,'FENTANYL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (988, 3987, '60616751', 'dispositif', '8,4 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3988,'VALACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (989, 3988, '60616840', 'comprimé', '500 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3989,'GLUCOSE-1 PHOSPHATE DISODIQUE TÉTRAHYDRATÉ', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (990, 3989, '60617020', 'solution', '250,8 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3990,'CEFTRIAXONE SODIQUE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (991, 3990, '60617052', 'poudre', 'nan');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3991,'ACICLOVIR', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (992, 3991, '60618154', 'suspension', '8 g');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3992,'CHLORHYDRATE DE DONÉPÉZIL', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (993, 3992, '60618161', 'comprimé', '5 mg');
insert into gsb.stock(id_stock, nom, categorie, quantite_disponible) values (3993,'DAPTOMYCINE', 'Subtance active', 6);
insert into gsb.subtance_active (id_subtance_active, id_stock, CIS, type, masse) values (994, 3993, '60618229', 'poudre', '500 mg');
