-- Code during class exercise 

-- Display data in a table
SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song;

-- limit the table to id/title/releasdate
SELECT
    Id,
    Title,
    ReleaseDate
FROM Song;

-- Read all on info on Songs
SELECT * FROM Song;

-- Display songs that are 100 seconds in length
SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song
WHERE SongLength > 100;

-- READ song titles and match them to an artist
SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

-- CREATE: add a genre
INSERT INTO Genre (Name) VALUES ('Techno');

-- UPDATE: update the length of a song at id 18
update Song
set SongLength = 515
where Id = 18;

-- DELETE remove the song
delete from Song where Id = 18;

---------------- Exercises Start below --------------
-- 1) Query all of the entries in the Genre table
SELECT * FROM Genre;
