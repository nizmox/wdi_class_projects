DROP TABLE plants;

CREATE TABLE plants (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  latin_name TEXT,
  region TEXT,
  photo TEXT
);

INSERT INTO plants (name, latin_name, region, photo) VALUES ('Milkweed','','','http://www.mgonlinestore.com/milkweed/milkweed02.jpg');
INSERT INTO plants (name, latin_name, region, photo) VALUES ('Common Dog-violet','','','http://gallery.nen.gov.uk/assets/0603/0000/0044/violets0001_mid.jpg');
INSERT INTO plants (name, latin_name, region, photo) VALUES ('Blackthorn','','','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT_c6gDlTrSzfAkdFYpjQpUu22QDHDRoaMNHHeowEVSBp9pZ29A');
INSERT INTO plants (name, latin_name, region, photo) VALUES ('Field Mustard','','','http://wdfw.wa.gov/conservation/island_marble_butterfly/graphics/t_fieldmustard.jpg');

DROP TABLE butterflies;

CREATE TABLE butterflies (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  family TEXT,
  photo TEXT,
  plant_id INTEGER
);

INSERT INTO butterflies (name, family, photo, plant_id) VALUES ('Speyeria aphrodite','Nymphalidae','http://butterflywebsite.com/images/buttrfly/Greg.Pas/greg007.gif',(SELECT id FROM plants WHERE name = 'Milkweed'));
INSERT INTO butterflies (name, family, photo, plant_id) VALUES ('Silver-washed','Nymphalidae','http://butterflywebsite.com/images/buttrfly/Mario.Maier/PaphiaM.jpg',(SELECT id FROM plants WHERE name = 'Common Dog-Violet'));
INSERT INTO butterflies (name, family, photo, plant_id) VALUES ('Scarce Swallowtail','Papilionidae','http://butterflywebsite.com/images/buttrfly/Mario.Maier/pod.jpg',(SELECT id FROM plants WHERE name = 'Blackthorn'));
INSERT INTO butterflies (name, family, photo, plant_id) VALUES ('Large Marble','Pieridae','http://butterflywebsite.com/images/buttrfly/Corel/but001.gif',(SELECT id FROM plants WHERE name = 'Field Mustard'));

