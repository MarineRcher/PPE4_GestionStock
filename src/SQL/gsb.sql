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




drop table if exists commandes;

CREATE TABLE `commandes` (
                             `id_commande` int(11) PRIMARY KEY auto_increment NOT NULL,
                             `id_utilisateur` int(11) DEFAULT NULL,
                             `date_commande` datetime DEFAULT current_timestamp(),
                             `statut` enum('en_attente','validee','invalidée') DEFAULT 'en_attente',
                             `date_disponibilite` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

drop table if exists mouvements;

CREATE TABLE `mouvements` (
                              `id_mouvement` int(11) PRIMARY KEY auto_increment NOT NULL,
                              `id_stock` int(11) DEFAULT NULL,
                              `type_mouvement` enum('entree','sortie','non catégorisé', 'demande') DEFAULT 'non catégorisé',
                              `quantite` int(11) ,
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

INSERT INTO stock (id_stock, nom, categorie, quantite_disponible) VALUES (292, 'ALVERINE/SIMETICONE MAYOLY SPINDLER 60 mg/300 mg', 'medicament', 6);
INSERT INTO medicaments (id_med, id_stock, CIS, type) VALUES (292, 292, '60182237', 'capsule molle');

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
