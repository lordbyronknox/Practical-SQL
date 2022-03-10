Are you ready to test yourself on the concepts covered in this chapter? Consider
the following two tables from a database you’re making to keep track of your
vinyl LP collection. Start by reviewing these CREATE TABLE statements:

CREATE TABLE albums (
 album_id bigserial CONSTRAINT album_id_key PRIMARY KEY,	-- primary key for albums.
 album_catalog_code varchar(100) CONSTRAINT catalog_unique UNIQUE (album_catalog_code), --albums can't share a catalog code.
 album_title text,
 album_artist text,
 album_release_date date,
 album_genre varchar(40),
 album_description text
);

CREATE TABLE songs (
 song_id bigserial,
 song_title text,
 song_artist text NOT NULL,						-- artist cannot be NULL
 album_id bigint REFERENCES albums (album_id),	-- foreign key to reference the albums table 'album_id' column.
);

The albums table includes information specific to the overall collection of
songs on the disc. The songs table catalogs each track on the album. Each
song has a title and its own artist column, because each song might feature its
own collection of artists.
Use the tables to answer these questions:

1. Modify these CREATE TABLE statements to include primary and foreign keys
plus additional constraints on both tables. Explain why you made your
choices.

-- see above



2. Instead of using album_id as a surrogate key for your primary key, are
there any columns in albums that could be useful as a natural key? What
would you have to know to decide?

--album_catalog_code can be used as the primary key. We would need toknow if all
-- album catalog codes are unique to each album/artist.



3. To speed up queries, which columns are good candidates for indexes?

-- In the 'albums' table 'album_title text' and 'album_artist', and in the 'songs' table song_title and
-- song_artist would be good candidates for indexing as they would be searched often.

