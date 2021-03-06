TRUNCATE TABLE shows;
TRUNCATE TABLE seasons;
TRUNCATE TABLE episodes;

/* Shows */
INSERT INTO shows(id, title) VALUES('b013pqnm', 'The Great British Bake-Off');
INSERT INTO shows(id, title) VALUES('b0071b63', 'The Apprentice');
INSERT INTO shows(id, title) VALUES('b062r9t5', 'People Just Do Nothing');

/* Seasons */
INSERT INTO seasons(id, title, number, show_id) VALUES(
  'b07r2pr0', 'Series 7', 7, 'b013pqnm'
);
INSERT INTO seasons(id, title, number, show_id) VALUES(
  'b07ynzxd', 'Series 12', 12, 'b0071b63'
);
INSERT INTO seasons(id, title, number, show_id) VALUES(
  'p043m8g0', 'Series 3', 3, 'b062r9t5'
);

/* Episodes */
INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'b07r246c', 'Cake Week', 1, 'b013pqnm', 'b07r2pr0'
);
INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'b07tj10j', 'Biscuit Week', 2, 'b013pqnm', 'b07r2pr0'
);
INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'b07v324h', 'Bread Week', 3, 'b013pqnm', 'b07r2pr0'
);

INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'b07ynzyc', 'Collectables', 1, 'b0071b63', 'b07ynzxd'
);
INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'b07zfh1b', 'Advertising - Jeans', 2, 'b0071b63', 'b07ynzxd'
);
INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'b0806vqc', 'Corporate Candy', 3, 'b0071b63', 'b07ynzxd'
);

INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'p043m903', 'Dubplate', 1, 'b062r9t5', 'p043m8g0'
);
INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'b07tl80w', 'Record Deal', 2, 'b062r9t5', 'p043m8g0'
);
INSERT INTO episodes(id, title, number, show_id, season_id) VALUES(
  'p045280q', 'Court Case', 3, 'b062r9t5', 'p043m8g0'
);
