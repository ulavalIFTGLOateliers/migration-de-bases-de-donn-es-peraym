USE atelier_bd;

ALTER TABLE musician RENAME TO singer;

ALTER TABLE singer DROP COLUMN role, DROP COLUMN bandName;

ALTER TABLE singer ADD COLUMN singerName varchar(50) FIRST;
UPDATE singer SET singerName = musicianName WHERE musicianName IS NOT NULL;
ALTER TABLE album DROP FOREIGN KEY FK_A_musicianName;
ALTER TABLE singer DROP PRIMARY KEY, DROP COLUMN musicianName;
ALTER TABLE singer ADD PRIMARY KEY (singerName);
ALTER TABLE album ADD CONSTRAINT FK_A_singerName FOREIGN KEY (singerName) REFERENCES singer(singerName);

DROP TABLE IF EXISTS band ;