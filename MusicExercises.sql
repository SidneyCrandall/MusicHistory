-- Question 1 (List all genres)
SELECT * FROM Genre;

-- Question 2 (list all the artists in ABC order)
SELECT a.ArtistName
	FROM Artist a
	ORDER BY a.ArtistName ASC;

-- Question 3 (list song and artist)
-- order by used for keywords ASC/DESC
SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

-- Question 4 (list artist that have a pop album)
-- Select Distinct used to only return (different) values and have no repeats in the list
SELECT DISTINCT
		a.ArtistName
	FROM Album 
	LEFT JOIN Artist a on ArtistId = a.id
	LEFT JOIN Genre g on GenreId = g.id
	WHERE g.id = 7; 

-- Question 5 (list artists with jazz/rock)
SELECT DISTINCT
		a.ArtistName
	FROM Album 
	LEFT JOIN Artist a on ArtistId = a.id
	LEFT JOIN Genre g on GenreId = g.id
	WHERE g.id = 4 OR g.id = 2; 

-- Question 6 (list Album with no songs)
SELECT	DISTINCT
		 ab.Id,
		 ab.Title
	FROM Album ab
	LEFT JOIN Song s ON ab.Id = s.AlbumId
	WHERE s.AlbumId IS NULL;

/*-- Question 7 (Insert Artist of my choosing)
-- Data should match table of Artist. name and year must be accompanied
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('David Bowie', 1962);

-- Checking the id of new artist added
SELECT * FROM Artist;

-- Question 8 (Insert an album from artist)
-- Include values from table
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Aladdin Sane', '12/17/1971', 2510, 'RCA', 28, 2);

-- Checking that the album was added
SELECT * From Album;

-- Question 9 (Insert a Song from Artist)
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Drive-In Saturday', 276, '04/06/1973', 2, 28, 28);

-- Checking song was added
SELECT * FROM Song;*/

-- Question 10 (Left Join song titles, album title, and artist name. then use WHERE keyword to filter the results to the album and artist you added.)
SELECT s.Title as SongTitle, ab.Title as AlbumTitle, a.ArtistName
	FROM Song s 
	LEFT JOIN Artist a on ArtistId = a.id
	LEFT JOIN Album ab on AlbumId = ab.id
	WHERE a.ArtistName = 'David Bowie';

-- Question 11 (Display how many songs exist on each album)
-- Use COUNT() and Group By keywords
SELECT COUNT(s.id) as TrackList, ab.Title as AlbumTitle
	FROM Song s 
	LEFT JOIN Album ab on s.AlbumId = ab.id
	GROUP BY ab.Title;

-- Question 12 (Display number of songs an artist has.)
-- Use Count and Group again
SELECT COUNT(s.id) as TrackList, a.ArtistName 
	FROM Song s 
	LEFT JOIN Artist a on s.ArtistId = a.id
	GROUP BY a.ArtistName;

-- Question 13 (Display how many songs exist for each Genre.)
-- COUNT and GROUP BY
SELECT COUNT(s.id) as TrackList, g.id
	FROM Genre g
	LEFT JOIN Song s on s.GenreId = g.id
	GROUP BY g.id;

-- Question 14 (Display the lists of Artists that have put out records on more than one record label) 
-- Use HAVING Clause
SELECT COUNT(DISTINCT ab.Label) as AlbumLabels, a.ArtistName
	FROM Artist a
	LEFT JOIN Album ab on ab.ArtistId = a.id
	GROUP BY a.ArtistName
	HAVING COUNT(DISTINCT ab.Label) > 1;

-- Question 16/17 (Use MAX() to write a select statement to find song with longest duration.)
-- Display both Song title and duration
SELECT s.Title, ab.Title, s.SongLength
	FROM Song s
	INNER JOIN Album ab on s.AlbumId = ab.id
	WHERE s.SongLength = (
	SELECT MAX(s.SongLength)
	From Song s);

-- Question 15 (Use MAX to write a select statemnet to find album with longet duration.)
-- Display Album Title and duration
SELECT ab.Title, ab.AlbumLength
	FROM Album ab
	WHERE ab.AlbumLength = (
	SELECT MAX(ab.AlbumLength)
	FROM Album ab);

