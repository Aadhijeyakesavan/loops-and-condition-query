CREATE OR REPLACE PROCEDURE count_absent_days()
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
    total_absent INT;
BEGIN
    FOR rec IN
        SELECT DISTINCT emp_id FROM attendance
    LOOP
        SELECT COUNT(*)
        INTO total_absent
        FROM attendance
        WHERE emp_id = rec.emp_id
          AND status = 'Absent';

        RAISE NOTICE 'Employee ID: %, Absent Days: %',
            rec.emp_id, total_absent;
    END LOOP;
END;
$$;




CREATE OR REPLACE FUNCTION update_late_status()
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE attendance
    SET status = 'Present'
    WHERE status = 'Late';

    RAISE NOTICE 'Attendance status updated';
END;
$$;





SELECT emp_id,
       COUNT(*) FILTER (WHERE status = 'Absent') AS absent_days,
       CASE
           WHEN COUNT(*) FILTER (
               WHERE status = 'Absent'
           ) <= 2 THEN 'Good'

           WHEN COUNT(*) FILTER (
               WHERE status = 'Absent'
           ) BETWEEN 3 AND 5 THEN 'Average'

           ELSE 'Poor'
       END AS attendance_summary
FROM attendance
GROUP BY emp_id;








2: Library Book Management


CREATE OR REPLACE FUNCTION issue_book(p_book_id INT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE books
    SET copies = copies - 1
    WHERE book_id = p_book_id
      AND copies > 0;

    IF FOUND THEN
        RETURN 'Book issued successfully';
    ELSE
        RETURN 'Book unavailable';
    END IF;
END;
$$;





CREATE OR REPLACE PROCEDURE update_book_status()
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM books
    LOOP
        IF rec.copies = 0 THEN
            UPDATE books
            SET status = 'Out of Stock'
            WHERE book_id = rec.book_id;
        ELSE
            UPDATE books
            SET status = 'Available'
            WHERE book_id = rec.book_id;
        END IF;
    END LOOP;

    RAISE NOTICE 'Book status updated';
END;
$$;







SELECT book_id, title, copies,
       CASE
           WHEN copies > 5 THEN 'Available'
           WHEN copies BETWEEN 1 AND 5 THEN 'Limited'
           WHEN copies = 0 THEN 'Out of Stock'
       END AS availability_status
FROM books;