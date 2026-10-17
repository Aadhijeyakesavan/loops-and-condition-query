DO $$
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Madurai %', i;
    END LOOP;
END $$;


DO $$
BEGIN
    FOR i IN 1..5 LOOP
        RAISE INFO 'chennai %', i;
    END LOOP;
END $$;




DO $$
BEGIN
    FOR i IN 1..5 LOOP
        RAISE WARNING 'india %', i;
    END LOOP;
END $$;








Whileloop

DO $$
DECLARE
    i INT := 10;
BEGIN
    WHILE i <= 20 LOOP
        RAISE NOTICE 'CSK %', i;
        i := i + 1;
    END LOOP;
END $$;



DO $$
DECLARE
    i INT := 10;
BEGIN
    WHILE i <= 40 LOOP
        RAISE INFO 'MI %', i;
        i := i + 1;
    END LOOP;
END $$;




DO $$
DECLARE
    i INT := 10;
BEGIN
    WHILE i <= 40 LOOP
        RAISE WARNING 'KKR%', i;
        i := i + 1;
    END LOOP;
END $$;




basicloop



DO $$
DECLARE
    i INT := 10;
BEGIN
    LOOP
        RAISE INFO 'thala %', i;
        i := i + 1;
        EXIT WHEN i > 20;
    END LOOP;
END $$;





DO $$
DECLARE
    i INT := 10;
BEGIN
    LOOP
        RAISE NOTICE 'ruthuraj %', i;
        i := i + 1;
        EXIT WHEN i > 15;
    END LOOP;
END $$;



DO $$
DECLARE
    i INT := 10;
BEGIN
    LOOP
        RAISE WARNING 'rohit sharma %', i;
        i := i + 1;
        EXIT WHEN i > 15;
    END LOOP;
END $$;






----Conditions------


--if else---

1.
    
do $$
  declare 
     marks int := 50;
begin
	if marks >= 40 then
    raise notice 'pass';
     else
    raise notice 'fail';
   end if;
end $$

2.

do $$
  declare 
     marks int := 12;
begin
	if marks >= 35 then
    raise info 'pass';
     else
    raise info'fail';
   end if;
end $$

3.
 
do $$
  declare 
     marks int := 100;
begin
	if marks <= 35 then
    raise warning 'pass';
     else
    raise warning'fail';
   end if;
end $$

---elsif---

1.

 do $$
declare
    marks int := 75;
begin
    if marks >= 90 then
        raise notice 'grade a';
    elsif marks >= 60 then
        raise notice 'grade b';
    elsif marks >= 35 then
        raise notice 'pass';
    else
        raise notice 'fail';
    end if;
end $$;

2.

  do $$
declare
    marks int := 50;
begin
    if marks >= 90 then
        raise info 'grade a';
    elsif marks >= 60 then
        raise info 'grade b';
    elsif marks >= 35 then
        raise info 'pass';
    else
        raise info 'fail';
    end if;
end $$;

3.
  
do $$
declare
    marks int := 29;
begin
    if marks >= 90 then
        raise warning 'excellent';
    elsif marks >= 60 then
        raise warning ' good';
    elsif marks >= 35 then
        raise warning 'Average';
    else
        raise warning 'fail';
    end if;
end $$;

----case-----

1.
  DO $$
DECLARE
    month_no INT := 1;
BEGIN
    CASE
        WHEN month_no = 1 THEN
            RAISE NOTICE 'January';
        WHEN month_no = 2 THEN
            RAISE NOTICE 'February';
        WHEN month_no = 3 THEN
            RAISE NOTICE 'March';
        WHEN month_no = 4 THEN
            RAISE NOTICE 'April';
        WHEN month_no = 5 THEN
            RAISE NOTICE 'May';
        WHEN month_no = 6 THEN
            RAISE NOTICE 'June';
        WHEN month_no = 7 THEN
            RAISE NOTICE 'July';
        WHEN month_no = 8 THEN
            RAISE NOTICE 'August';
        WHEN month_no = 9 THEN
            RAISE NOTICE 'September';
        WHEN month_no = 10 THEN
            RAISE NOTICE 'October';
        WHEN month_no = 11 THEN
            RAISE NOTICE 'November';
        WHEN month_no = 12 THEN
            RAISE NOTICE 'December';
        ELSE
            RAISE NOTICE 'Invalid month';
    END CASE;
    END $$;



	
2.

  do $$
declare
    price int := 400;
begin
    case
        when price >= 5000 then
            raise notice 'expensive';
        when price >= 2000 then
            raise notice 'moderate';
        when price >= 1000 then
            raise notice 'affordable';
        else
            raise notice 'cheap';
    end case;
end $$;

3.

do $$
declare
    salary int := 25000;
begin
    case
        when salary >= 50000 then
            raise notice 'high ';
        when salary >= 30000 then
            raise notice 'medium ';
        when salary >= 15000 then
            raise notice 'basic';
        else
            raise notice 'low ';
    end case;
end $$;
