CREATE TABLE tbl_player_info(
	registration_code CHAR(4) PRIMARY KEY,
	name VARCHAR2(18),
	birth_day VARCHAR2(18),
	height NUMBER(3),
	weight NUMBER(3)
);

INSERT INTO tbl_player_info VALUES('A001', '김길동', '19900101', '180', '82');
INSERT INTO tbl_player_info VALUES('A005', '이길동', '20000101', '190', '85');
INSERT INTO tbl_player_info VALUES('B002', '홍길동', '19950101', '175', '75');
INSERT INTO tbl_player_info VALUES('B006', '조길동', '19990101', '185', '80');

CREATE TABLE tbl_hitter_info(
	registration_code CHAR(4) PRIMARY KEY,
	game_numbers NUMBER(3),
	appearance NUMBER(3),
	hit_numbers NUMBER(3),
	home_runs NUMBER(3),
	put_out NUMBER(3),
	double_play NUMBER(3),
	error_count NUMBER(3)
);


INSERT INTO tbl_hitter_info VALUES('A001', '120', '330', '100', '20', '80', '27', '1');
INSERT INTO tbl_hitter_info VALUES('A005', '110', '300', '110', '30', '60', '5', '2');
INSERT INTO tbl_hitter_info VALUES('B002', '100', '270', '90', '5', '100', '10', '3');

SELECT registration_code, name, game_numbers, appearance, hit_numbers, home_runs, ((((hit_numbers+home_runs)/appearance)*100) + home_runs), double_play, double_play, (put_out + (double_play*2) - (error_count*5)) FROM tbl_hitter_info NATURAL JOIN tbl_player_info WHERE registration_code = 'A001';

SELECT registration_code, name, birth_day, height, weight, ROUND(((((hit_numbers+home_runs)/appearance)*100+home_runs) + (put_out + (double_play*2) - (error_count*5)))/2) FROM tbl_player_info NATURAL JOIN tbl_hitter_info;