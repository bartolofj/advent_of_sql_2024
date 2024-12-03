with t as (
	select id, chr(value) as value
	from letters_a a
	union all
	select id, chr(value) 
	from letters_b b
	order by id asc 
) 
select string_agg(value, '') from t
where value between 'a' and 'z'
or value in (' ', '!', '"', '(', ')', ',', '-', '.', ':', ';', '?', '''')
-- ALTERNATIVE FILTER where value ~* '[a-zA-Z\s,.!]'
;
