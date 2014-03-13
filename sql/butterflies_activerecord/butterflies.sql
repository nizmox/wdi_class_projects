DROP TABLE butterflies;

CREATE TABLE butterflies (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  family TEXT,
  photo TEXT
);

INSERT INTO butterflies (name, family, photo) VALUES ('Speyeria aphrodite','Nymphalidae','http://butterflywebsite.com/images/buttrfly/Greg.Pas/greg007.gif');
INSERT INTO butterflies (name, family, photo) VALUES ('Silver-washed','Nymphalidae','http://butterflywebsite.com/images/buttrfly/Mario.Maier/PaphiaM.jpg');
INSERT INTO butterflies (name, family, photo) VALUES ('Scarce Swallowtail','Papilionidae','http://butterflywebsite.com/images/buttrfly/Mario.Maier/pod.jpg');
INSERT INTO butterflies (name, family, photo) VALUES ('Large Marble','Pieridae','http://butterflywebsite.com/images/buttrfly/Corel/but001.gif');
