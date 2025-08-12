SET SERVEROUTPUT ON

DECLARE
counter number:= 0;
first date:= to_date('2025/01/01','YYYY/MM/DD');
last date:= to_date('2025/04/17','YYYY/MM/DD');
day VARCHAR(5);

BEGIN
    WHILE first <= last LOOP
        select to_char(first,'DY') into day from dual;
        IF day = 'DOM' THEN
            counter:= counter+1;
        END IF;
        --DBMS_OUTPUT.PUT_LINE(first);
        --DBMS_OUTPUT.PUT_LINE(day);
        first := first +1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('There are ' || counter || ' Sundays between the given range of dates');
END;
