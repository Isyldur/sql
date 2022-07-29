create table if not exists music_genres (
	id SERIAL primary key,
	name VARCHAR(30) not null
);

create table if not exists performer (
	id SERIAL primary key,
	name VARCHAR(30) unique not null
);

create table if not exists performers_genres (
	id SERIAL primary key,
	performer_id INTEGER references performer(id),
	music_genre_id INTEGER references music_genres(id)
);

create table if not exists albums (
	id SERIAL primary key,
	name VARCHAR(30) not null,
	release_year INTEGER not null
);

create table if not exists performer_albums (
	id SERIAL primary key,
	albums_id INTEGER references albums(id),
	performer_id INTEGER references performer(id)
);

create table if not exists tracks (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	duration INTEGER not null,
	album_id INTEGER references albums(id)
);

create table if not exists collection (
	id SERIAL primary key,
	name VARCHAR(30) not null,
	release_year INTEGER not null
);

create table if not exists collection_tracks (
	id SERIAL primary key,
	collection_id INTEGER references collection(id),
	track_id INTEGER references tracks(id)
);