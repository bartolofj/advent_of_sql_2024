select 
	c."name",
	wl.wishes->>'first_choice' as primary_wish,
	wl.wishes->>'second_choice' as backup_wish,
	wl.wishes->'colors'->>0 as favorite_color,
	json_array_length(wl.wishes->'colors') as color_count,
	case tc.difficulty_to_make 
		when 1 then 'Simple Gift'
		when 2 then 'Moderate Gift'
		else 'Complex Gift' end as gift_complexity,
	case tc.category 
		when 'outdoor' then 'Outside Workshop'
		when 'educational' then 'Learning Workshop'
		else 'General Workshop' end as workshop_assignment
from children c 
inner join wish_lists wl on c.child_id = wl.child_id 
inner join toy_catalogue tc on wl.wishes->>'first_choice' = tc.toy_name 
order by 1 asc 
limit 5
;
