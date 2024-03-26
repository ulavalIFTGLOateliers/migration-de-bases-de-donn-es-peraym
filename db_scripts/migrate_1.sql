USE atelier_bd;

CREATE TABLE IF NOT EXISTS band(bandName varchar(50),
                                        creation YEAR,
                                        genre varchar(50),
                                        PRIMARY KEY (bandName));
INSERT INTO band VALUES ('Crazy Duo', 2015, 'rock'), ('Luna', 2009, 'classical'),
                        ('Mysterio', 2019, 'pop');


ALTER TABLE singer ADD COLUMN musicianName varchar(50) FIRST;
UPDATE singer SET musicianName = singerName;
ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;
ALTER TABLE singer DROP PRIMARY KEY, DROP COLUMN singerName;
ALTER TABLE singer ADD PRIMARY KEY (musicianName);
ALTER TABLE album ADD CONSTRAINT FK_A_musicianName FOREIGN KEY (singerName) REFERENCES singer(musicianName);


ALTER TABLE singer
    ADD COLUMN role varchar(50),
    ADD COLUMN bandName varchar(50);

UPDATE singer SET role = 'vocals', bandName = 'Crazy Duo' WHERE musicianName = 'Alina';
UPDATE singer SET role = 'guitar', bandName = 'Mysterio' WHERE musicianName = 'Mysterio';
UPDATE singer SET role = 'percussion', bandName = 'Crazy Duo' WHERE musicianName = 'Rainbow';
UPDATE singer SET role = 'piano', bandName = 'Luna' WHERE musicianName = 'Luna';

ALTER TABLE singer RENAME TO musician;

