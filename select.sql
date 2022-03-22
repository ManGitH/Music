select album_name, date from albums where date=2018;
select song_name, song_time from songs order by song_time desc limit 1;
select song_name, song_time from songs where song_time >= 350 order by song_time;
select pl_name from playlist where pl_date between 2018 and 2020;
select alias from singers where alias not like '% %';
select song_name from songs where song_name like '%My%';


--1 ���������� ������������ � ������ �����
select count(distinct singer_id), genre_id from singergenre
	group by genre_id;
--2 ���������� ������, �������� � ������� 2019-2020 �����
select s.id, s.song_name, a.album_name, a."date" 
	from songs as s inner join albums as a
	on s.album_id = a.id 
	where a."date" in (select date from albums 
	where date between 2010 and 2020);
--3 ������� ����������������� ������ �� ������� �������
select avg(s.song_time), a.album_name 
	from songs as s inner join albums as a
	on s.album_id = a.id
	group by a.album_name;
--4 ��� �����������, ������� �� ��������� ������� � 2020 ����
select als.singer_id, a.date 
	from albumsinger as als inner join albums as a
	on als.album_id = a.id 
	where a.date != 2010;
--5 �������� ���������, � ������� ������������ ���������� ����������� (�������� ����)
select pl.pl_name, sg.alias 
	from 
		playlist pl inner join plsongs p on pl.id = p.pl_id
					inner join songs s on p.song_id = s.id 
					inner join singers sg on s.son_sing_id = sg.id 
	where sg.alias ilike '%%emin%%';
--6 �������� ��������, � ������� ������������ ����������� ����� 1 �����
select al.album_name, sg.singer_id 
	from
		albums al inner join albumsinger asg on al.id = asg.album_id 
				inner join singers s on asg.singer_id = s.id
				inner join singergenre sg on s.id = sg.singer_id 
	where genre_id > 1;
--7 ������������ ������, ������� �� ������ � ��������
select s.song_name 
	from songs s left join plsongs p on s.id = p.song_id 
	where p.song_id is null;
--8 �����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������)
select s.alias, sg.song_time
	from singers s inner join songs sg on s.id = sg.son_sing_id
	order by  sg.song_time limit 1;
--9 �������� ��������, ���������� ���������� ���������� ������
select a.album_name, min(s.song_name) 
	from albums a join songs s on a.id = s.album_id
	group by a.album_name;