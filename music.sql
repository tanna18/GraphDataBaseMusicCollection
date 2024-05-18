USE master;
DROP DATABASE IF EXISTS MusicCollection;
CREATE DATABASE MusicCollection;
USE MusicCollection;

CREATE TABLE Artist
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL
) AS NODE;

CREATE TABLE Song
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL,
release_year INT
) AS NODE;

CREATE TABLE Genre
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL
) AS NODE;

CREATE TABLE Performs AS EDGE;

CREATE TABLE BelongsTo AS EDGE;

CREATE TABLE RelatesTo AS EDGE;

CREATE TABLE Familiar AS EDGE;


ALTER TABLE Performs
ADD CONSTRAINT EC_Performs CONNECTION (Artist TO Song);

ALTER TABLE BelongsTo
ADD CONSTRAINT EC_BelongsTo CONNECTION (Song TO Genre);

ALTER TABLE RelatesTo
ADD CONSTRAINT EC_RelatesTo CONNECTION (Artist TO Genre);

ALTER TABLE Familiar
ADD CONSTRAINT EC_Familiar CONNECTION (Artist TO Artist);
GO

INSERT INTO Artist (id, name)
VALUES (1, N'���� ������'),
 (2, N'���� ��������'),
 (3, N'���� ���������'),
 (4, N'���� ������'),
 (5, N'���� ���������'),
 (6, N'���� ���������'),
 (7, N'ϸ�� �������'),
 (8, N'��� ���������'),
 (9, N'������ ��������'),
 (10, N'���� ��������'),
 (11, N'�������� ��������'),
 (12, N'������ ��������');
GO

INSERT INTO Song (id, name, release_year)
VALUES 
 (1, N'Greatest Hits', 1987),
 (2, N'Live Concert',2000 ),
 (3, N'First Album',2004 ),
 (4, N'7 Sinners', 1965),
 (5, N'8 Days of Christmas',2005),
 (6, N'2XS',2011),
 (7, N'Til Death Do Us Unite', 1977),
 (8, N'2 Years On',2023),
  (9, N'15 Big Ones', 1989),
 (10, N'7 Days of Funk',2020 );
GO


INSERT INTO Genre (id, name)
VALUES (1, N'���' ),
 (2, N'����'),
 (3, N'���'),
 (4, N'����'),
 (5, N'������'),
 (6, N'����-������'),
 (7, N'���-���'),
 (8, N'�����'),
 (9, N'����'),
 (10, N'�����');
GO

INSERT INTO Performs ($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Artist WHERE ID = 1),
 (SELECT $node_id FROM Song WHERE ID = 1)),
 ((SELECT $node_id FROM Artist WHERE ID = 2),
 (SELECT $node_id FROM Song WHERE ID = 1)),
 ((SELECT $node_id FROM Artist WHERE ID = 3),
 (SELECT $node_id FROM Song WHERE ID = 2)),
 ((SELECT $node_id FROM Artist WHERE ID = 4),
 (SELECT $node_id FROM Song WHERE ID = 3)),
 ((SELECT $node_id FROM Artist WHERE ID = 5),
 (SELECT $node_id FROM Song WHERE ID = 4)),
 ((SELECT $node_id FROM Artist WHERE ID = 6),
 (SELECT $node_id FROM Song WHERE ID = 5)),
 ((SELECT $node_id FROM Artist WHERE ID = 7),
 (SELECT $node_id FROM Song WHERE ID = 5)),
 ((SELECT $node_id FROM Artist WHERE ID = 8),
 (SELECT $node_id FROM Song WHERE ID = 6)),
 ((SELECT $node_id FROM Artist WHERE ID =9),
 (SELECT $node_id FROM Song WHERE ID = 7)),
 ((SELECT $node_id FROM Artist WHERE ID =10),
 (SELECT $node_id FROM Song WHERE ID = 8)),
 ((SELECT $node_id FROM Artist WHERE ID =11),
 (SELECT $node_id FROM Song WHERE ID = 9)),
 ((SELECT $node_id FROM Artist WHERE ID =12),
 (SELECT $node_id FROM Song WHERE ID = 10));

 INSERT INTO BelongsTo ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Song WHERE ID = 1),
 (SELECT $node_id FROM Genre WHERE ID = 1)),
 ((SELECT $node_id FROM Song WHERE ID = 2),
 (SELECT $node_id FROM Genre WHERE ID = 9)),
 ((SELECT $node_id FROM Song WHERE ID = 3),
 (SELECT $node_id FROM Genre WHERE ID = 2)),
 ((SELECT $node_id FROM Song WHERE ID = 4),
 (SELECT $node_id FROM Genre WHERE ID = 3)),
 ((SELECT $node_id FROM Song WHERE ID = 5),
 (SELECT $node_id FROM Genre WHERE ID = 4)),
 ((SELECT $node_id FROM Song WHERE ID = 6),
 (SELECT $node_id FROM Genre WHERE ID = 10)),
 ((SELECT $node_id FROM Song WHERE ID = 7),
 (SELECT $node_id FROM Genre WHERE ID = 5)),
 ((SELECT $node_id FROM Song WHERE ID =8),
 (SELECT $node_id FROM Genre WHERE ID = 6)),
 ((SELECT $node_id FROM Song WHERE ID =9),
 (SELECT $node_id FROM Genre WHERE ID = 7)),
 ((SELECT $node_id FROM Song WHERE ID =10),
 (SELECT $node_id FROM Genre WHERE ID = 8));
 
  INSERT INTO RelatesTo ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Artist WHERE ID = 1),
 (SELECT $node_id FROM Genre WHERE ID = 1)),
 ((SELECT $node_id FROM Artist WHERE ID = 2),
 (SELECT $node_id FROM Genre WHERE ID = 2)),
 ((SELECT $node_id FROM Artist WHERE ID = 3),
 (SELECT $node_id FROM Genre WHERE ID = 3)),
 ((SELECT $node_id FROM Artist WHERE ID = 4),
 (SELECT $node_id FROM Genre WHERE ID = 4)),
 ((SELECT $node_id FROM Artist WHERE ID = 5),
 (SELECT $node_id FROM Genre WHERE ID = 5)),
 ((SELECT $node_id FROM Artist WHERE ID = 6),
 (SELECT $node_id FROM Genre WHERE ID = 6)),
 ((SELECT $node_id FROM Artist WHERE ID = 7),
 (SELECT $node_id FROM Genre WHERE ID = 6)),
 ((SELECT $node_id FROM Artist WHERE ID =8),
 (SELECT $node_id FROM Genre WHERE ID = 7)),
 ((SELECT $node_id FROM Artist WHERE ID =9),
 (SELECT $node_id FROM Genre WHERE ID = 7)),
 ((SELECT $node_id FROM Artist WHERE ID =10),
 (SELECT $node_id FROM Genre WHERE ID = 8)),
  ((SELECT $node_id FROM Artist WHERE ID =11),
 (SELECT $node_id FROM Genre WHERE ID = 9)),
  ((SELECT $node_id FROM Artist WHERE ID =12),
 (SELECT $node_id FROM Genre WHERE ID = 10));

 INSERT INTO Familiar ($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Artist WHERE ID = 2), (SELECT $node_id FROM Artist WHERE ID = 3)),
((SELECT $node_id FROM Artist WHERE ID = 1), (SELECT $node_id FROM Artist WHERE ID = 2)),
((SELECT $node_id FROM Artist WHERE ID = 3), (SELECT $node_id FROM Artist WHERE ID = 4)),
((SELECT $node_id FROM Artist WHERE ID = 3), (SELECT $node_id FROM Artist WHERE ID = 5)),
((SELECT $node_id FROM Artist WHERE ID = 4), (SELECT $node_id FROM Artist WHERE ID = 5)),
((SELECT $node_id FROM Artist WHERE ID = 5), (SELECT $node_id FROM Artist WHERE ID = 10)),
((SELECT $node_id FROM Artist WHERE ID = 10), (SELECT $node_id FROM Artist WHERE ID = 9)),
((SELECT $node_id FROM Artist WHERE ID = 9), (SELECT $node_id FROM Artist WHERE ID = 8)),
((SELECT $node_id FROM Artist WHERE ID = 8), (SELECT $node_id FROM Artist WHERE ID = 12)),
((SELECT $node_id FROM Artist WHERE ID = 12), (SELECT $node_id FROM Artist WHERE ID = 7)),
((SELECT $node_id FROM Artist WHERE ID = 7), (SELECT $node_id FROM Artist WHERE ID = 11)),
((SELECT $node_id FROM Artist WHERE ID = 11), (SELECT $node_id FROM Artist WHERE ID = 6)),
((SELECT $node_id FROM Artist WHERE ID = 6), (SELECT $node_id FROM Artist WHERE ID = 1)),
((SELECT $node_id FROM Artist WHERE ID = 6), (SELECT $node_id FROM Artist WHERE ID = 2));
--����� ����, � �������� ��������� ������ ���� ������
SELECT Artist.name AS ArtistName
 , Genre.name AS GenreName
FROM Artist 
 , RelatesTo
 , Genre 
WHERE MATCH(Genre<-(RelatesTo)-Artist)
 AND Artist.name = N'���� ������';
 --����� ���� ����� 15 Big Ones
 SELECT Song.name AS SongName
 , Genre.name AS GenreName
FROM Song 
 , BelongsTo
 , Genre 
WHERE MATCH(Genre<-(BelongsTo)-Song)
 AND Song.name = N'15 Big Ones';
 --����� ��� �����, ��� ������� ������� ����� 2000
 SELECT Song.name AS SongName
 , Genre.name AS GenreName
FROM Song 
 , BelongsTo
 , Genre 
WHERE MATCH(Genre<-(BelongsTo)-Song)
 AND Song.release_year < 2000;
 --����� ������������ ����� Greatest Hits
 SELECT Artist.name AS ArtistName
 , Song.name AS SongName
FROM Artist 
 , Performs
 , Song 
WHERE MATCH(Song<-(Performs)-Artist)
 AND Song.name = N'Greatest Hits';
 --����� ������������, ������� ��������� � ����� ���
 SELECT Artist.name AS ArtistName
 , Genre.name AS GenreName
FROM Artist 
 , RelatesTo
 , Genre 
WHERE MATCH(Genre<-(RelatesTo)-Artist)
 AND Genre.name = N'���';
 --����� �������� ����� ������� 
SELECT Artist1.name AS ArtistName
 , STRING_AGG(Artist2.name, '->') WITHIN GROUP (GRAPH PATH) AS Familiar
FROM Artist AS Artist1
 , Familiar FOR PATH AS f
 , Artist FOR PATH AS Artist2
WHERE MATCH(SHORTEST_PATH(Artist1(-(f)->Artist2){1,2}))
 AND Artist1.name = N'���� ������';

 --����� ����� �������� ����� ��  ���� ������ �� ���� ���������
DECLARE @PersonFrom AS NVARCHAR(30) = N'���� ������';
DECLARE @PersonTo AS NVARCHAR(30) = N'���� ���������';

WITH T1 AS (
    SELECT Artist1.name AS ArtistName,
           STRING_AGG(Artist2.name, '->') WITHIN GROUP (GRAPH PATH) AS Familiar,
           LAST_VALUE(Artist2.name) WITHIN GROUP (GRAPH PATH) AS LastNode
    FROM Artist AS Artist1
    , Familiar FOR PATH AS f
    , Artist FOR PATH AS Artist2
    WHERE MATCH(SHORTEST_PATH(Artist1(-(f)->Artist2)+))
    AND Artist1.name = @PersonFrom
)
SELECT ArtistName, Familiar
FROM T1
WHERE LastNode = @PersonTo;





