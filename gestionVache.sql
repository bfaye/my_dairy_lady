CREATE TABLE compte (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  com_password_hash VARCHAR(255) NULL,
  com_email VARCHAR(255) NULL,
  com_role VARCHAR(64) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE fermier (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  veterinaire_id INTEGER UNSIGNED NOT NULL,
  compte_id INTEGER UNSIGNED NOT NULL,
  ville_id_ville INTEGER UNSIGNED NOT NULL,
  fer_nom VARCHAR(64) NULL,
  fer_prenom VARCHAR(64) NULL,
  fer_nom_ferme TEXT NULL,
  fer_adresse VARCHAR(255) NULL,
  fer_tel TEXT NULL,
  fer_label_bio BOOL NULL,
  fer_historique TEXT NULL,
  fer_photo TEXT NULL,
  fer_email TEXT NULL,
  fer_site_web TEXT NULL,
  PRIMARY KEY(id),
  INDEX fermier_FKIndex1(ville_id_ville),
  INDEX fermier_FKIndex2(compte_id),
  INDEX fermier_FKIndex3(veterinaire_id)
);

CREATE TABLE like_vache_has_vache (
  vache_id INTEGER UNSIGNED NOT NULL,
  visiteur_id INTEGER UNSIGNED NOT NULL,
  like_nb INTEGER UNSIGNED NULL,
  PRIMARY KEY(vache_id),
  INDEX like_vache_has_vache_FKIndex2(vache_id),
  INDEX like_vache_has_vache_FKIndex2(visiteur_id)
);

CREATE TABLE pays (
  id_pays INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nom_pays VARCHAR(64) NULL,
  PRIMARY KEY(id_pays)
);

CREATE TABLE productionLait (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  pro_date DATE NULL,
  pro_quantite FLOAT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE race (
  id_race INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nom_race INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_race)
);

CREATE TABLE typeZone (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  typ_nom VARCHAR(64) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE vaccin (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  vac_nom VARCHAR(64) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE vache (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  fermier_id INTEGER UNSIGNED NOT NULL,
  zone_id INTEGER UNSIGNED NOT NULL,
  race_id_race INTEGER UNSIGNED NOT NULL,
  vac_nom VARCHAR(64) NULL,
  vac_identification TEXT NULL,
  vac_date_naissance DATE NULL,
  vac_description TEXT NULL,
  vac_photo INTEGER UNSIGNED NULL,
  vac_poids FLOAT NULL,
  PRIMARY KEY(id),
  INDEX vache_FKIndex2(race_id_race),
  INDEX vache_FKIndex3(zone_id),
  INDEX vache_FKIndex4(fermier_id)
);

CREATE TABLE vache_has_commentaire (
  vache_id INTEGER UNSIGNED NOT NULL,
  visiteur_id INTEGER UNSIGNED NOT NULL,
  vac_commentaire TEXT NULL,
  PRIMARY KEY(vache_id),
  INDEX vache_has_commentaire_FKIndex1(vache_id),
  INDEX vache_has_commentaire_FKIndex2(visiteur_id)
);

CREATE TABLE vache_has_productionLait (
  vache_id INTEGER UNSIGNED NOT NULL,
  productionLait_id INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(vache_id, productionLait_id),
  INDEX vache_has_productionLait_FKIndex1(vache_id),
  INDEX vache_has_productionLait_FKIndex2(productionLait_id)
);

CREATE TABLE vache_has_vaccin (
  vache_id INTEGER UNSIGNED NOT NULL,
  vaccin_id INTEGER UNSIGNED NOT NULL,
  vac_date_effectue DATE NULL,
  vac_date_prevu DATE NULL,
  PRIMARY KEY(vache_id, vaccin_id),
  INDEX vache_has_vaccin_FKIndex1(vache_id),
  INDEX vache_has_vaccin_FKIndex2(vaccin_id)
);

CREATE TABLE veterinaire (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  vet_nom VARCHAR(64) NULL,
  vet_prenom VARCHAR(64) NULL,
  vet_adresse VARCHAR(255) NULL,
  vet_tel TEXT NULL,
  vet_num_agregation VARCHAR(255) NULL,
  PRIMARY KEY(id)
);

CREATE TABLE ville (
  id_ville INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  pays_id_pays INTEGER UNSIGNED NOT NULL,
  nom_ville VARCHAR(64) NULL,
  PRIMARY KEY(id_ville),
  INDEX ville_FKIndex1(pays_id_pays)
);

CREATE TABLE visiteur (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  compte_id INTEGER UNSIGNED NOT NULL,
  vis_pseudo INTEGER UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX visiteur_FKIndex1(compte_id)
);

CREATE TABLE zone (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  typeZone_id INTEGER UNSIGNED NOT NULL,
  fermier_id INTEGER UNSIGNED NOT NULL,
  ville_id_ville INTEGER UNSIGNED NOT NULL,
  zon_nom VARCHAR(64) NULL,
  zon_adresse VARCHAR(255) NULL,
  PRIMARY KEY(id),
  INDEX zone_FKIndex1(ville_id_ville),
  INDEX zone_FKIndex2(fermier_id),
  INDEX zone_FKIndex3(typeZone_id)
);


