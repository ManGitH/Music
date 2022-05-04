create table if not exists singers(
	id serial primary key,
	alias varchar(60) not null
);

create table if not exists albums(
	id serial primary key,
	album_name varchar(128) not null,
	date integer not null
);

create table if not exists albumsinger(
	album_id integer references albums(id),
	singer_id integer references singers(id),
	constraint aspk primary key(album_id, singer_id)
);

create table if not exists songs(
	id serial primary key,
	song_name varchar(80) not null,
	song_time integer not null,
	album_id integer references albums(id)
);

create table if not exists genres(
	id serial primary key,
	genre_name varchar(60)
);

create table if not exists singergenre(
	singer_id integer references singers(id),
	genre_id integer references genres(id),
	constraint sgpk primary key(singer_id, genre_id)
);

create table if not exists playlist(
	id serial primary key,
	song_id integer references songs(id),
	album_id integer references albums(id),
	pl_name varchar(80) not null,
	pl_date integer not null
);

alter table playlist drop column album_id;
alter table playlist alter column pl_date drop not null;

create table if not exists plsongs(
	song_id integer references songs(id),
	pl_id integer references playlist(id),
	constraint pls primary key(song_id, pl_id)
);

alter table playlist drop column song_id;
alter table songs drop column son_sing_id;