CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(70) NOT null);

CREATE TABLE IF NOT EXISTS Bands (
	id SERIAL PRIMARY KEY,
	name VARCHAR(70) NOT null);

create table if not exists GenreBand (
	genre_id INTEGER references Genres(ID),
	band_id INTEGER references Bands (ID),
	constraint pk_GenreBand primary key (genre_id,Band_id));

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	album_title VARCHAR(70) unique NOT NULL,
	year_of_issue INTEGER check(year_of_issue>1900));

CREATE TABLE IF NOT EXISTS AlbumBand (
	Album_id INTEGER REFERENCES Albums(ID),
	Band_id INTEGER REFERENCES Bands(ID),
	CONSTRAINT pk_AlbumBand PRIMARY KEY (Album_id, Band_id));

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	track_title VARCHAR(70) NOT NULL,
	duration INTEGER,
	album_ID INTEGER REFERENCES Albums(ID));

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	collection_title VARCHAR(70) unique NOT NULL,
	year_of_issue INTEGER check(year_of_issue>1900));

CREATE TABLE IF NOT EXISTS TracksCollection (
	track_ID INTEGER REFERENCES Tracks(ID),
	collection_ID INTEGER REFERENCES Collection(ID),
	CONSTRAINT pk_TracksCollection PRIMARY KEY (track_ID, collection_ID));

