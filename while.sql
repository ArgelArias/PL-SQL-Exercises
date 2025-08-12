SET SERVEROUT ON SIZE 1000000;

DECLARE
    counter INTEGER := 0;
BEGIN
    counter := counter + 1;
    IF counter IS NULL THEN
        dbms_output.put_line('counter is still unitialized');
    ELSE
        while counter <= 10 LOOP
            dbms_output.put_line('counter : ' || counter);
            counter := counter + 1;
        END LOOP;
    END IF;

END;
/