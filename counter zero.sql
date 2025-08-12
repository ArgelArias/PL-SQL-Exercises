SET SERVEROUT ON SIZE 1000000;
--exec DBMS_OUTPUT.ENABLE(1000);

DECLARE
    counter INTEGER := 0;
BEGIN
    counter := counter + 1;
    IF counter IS NULL THEN
        dbms_output.put_line('counter is still unitialized');
    ELSE
        LOOP
            EXIT WHEN counter > 10;
            dbms_output.put_line('counter : ' || counter);
            counter := counter + 1;
        END LOOP;
    END IF;

END;
/