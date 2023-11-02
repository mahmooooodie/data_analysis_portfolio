--CONTSTANT VARIABLES

do $$
declare
	kdv constant numeric:= 0.1;
	gross numeric:= 26; 
begin
	raise notice 'the price is $%', gross*(1 + kdv);
		
end $$;

do $$
declare
	start_time constant time := now();
begin
raise notice 'the code block started at: %', start_time;
end $$;

-- IF STATEMENTS

if condition then
	statement
	
do $$

declare
 	selected_film film%rowtype;
	input_film_id film.id%type := 0;
begin
	select * from film
	into selected_film
	where id = input_film_id;
	
	if found then
	raise notice 'the movie for the id % is : % and its type is %', input_film_id, selected_film.title, selected_film.type;
	end if;
	
	if not found then
	raise notice 'No movie has been found with the film id %', input_film_id;
	end if;
	
end $$;

do $$
declare
	selected_film film%rowtype;
	len_description varchar(20);
	input_film_id film.id%type:= 3;
	
begin
	select * from film
	into selected_film
	where id = input_film_id;
	
	if not found then
		raise notice 'Film not found';
		
	else if
		selected_film.length > 0. and selected_film.length < 50 then
		len_description := 'Short';
		
	elseif 
		selected_film.length > 50. and selected_film.length < 120 then
		len_description := 'Medium';
		
	elseif 
		selected_film.length > 120. then
		len_description := 'Long';
	else
		len_description := 'undefined';
end if;
	raise notice '% movies length is %', selected_film.title, len_description;
end if;
		
end $$;
	
-- CASE STATEMENT

do $$
declare 
	film_type film.type%type;
	warning varchar(50);
begin
select type from film
into film_type
where id = 1;
if found then
	case film_type
		when 'Horror' then
			warning := 'NOT FOR KIDS';
		WHEN 'Adventure' then
			warning := 'KIDS CAN WATCH';
else
	warning := 'Undefined';
end case;
	raise notice '%', warning;
end if;
end $$;

-- FOR LOOPS
do $$
begin
	for counter in 1..5 loop
	raise notice 'counter %', counter;
	end loop;
end $$;

do $$
begin
	for counter in reverse 1000..1 by 5 loop
	raise notice 'counter: %', counter;
	end loop;
end $$;


do $$
declare 
	film_length record;
begin
	for film_length in
		select title, length
		from film
		order by length desc
		limit 2
	loop
	raise notice '% (% minutes)', film_length.title, film_length.length;
end loop;
end $$

do $$

declare 
	film_uzunlugu record;
	
begin
	for film_uzunlugu in select title, length  from film order by length desc limit 2 loop
		raise notice '% %', film_uzunlugu.title,film_uzunlugu.length;
	end loop;

end $$

