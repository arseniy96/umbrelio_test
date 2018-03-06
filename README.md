# README

**SQL**

create temp table users(id bigserial, group_id bigint);
insert into users(group_id) values (1), (1), (1), (2), (1), (3);

SELECT * FROM users;

WITH tmp as
(
    SELECT *,
      row_number() OVER  (PARTITION BY group_id ORDER BY id) as rnd
    FROM users
)
SELECT min(id) as min, count(id), group_id
FROM tmp
GROUP BY
  id - rnd, group_id
ORDER BY group_id, min;
