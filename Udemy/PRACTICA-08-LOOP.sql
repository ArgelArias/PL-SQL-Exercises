DECLARE
    x NUMBER:= 3;
    y NUMBER:= 1;
    texto VARCHAR2(100):= 'AL REVES';
    car number;
    nombre VARCHAR2(100):= 'CARLOS';
    inicio NUMBER:= 1;
    fin NUMBER:= 100;
    
BEGIN
    LOOP
        EXIT WHEN y = 11;
        dbms_output.put_line(x*y);
        y:= y+1;
    END LOOP;
    
    dbms_output.new_line();
    y:=1;
    WHILE y < 11 LOOP
        dbms_output.put_line(x*y);
        y:= y+1;
    END LOOP;
    
    dbms_output.new_line();
    FOR i in 1..10 LOOP
        dbms_output.put_line(x*i);
    END LOOP;
    
    dbms_output.new_line();
    car:= LENGTH(texto);
    WHILE car > 0 LOOP
        EXIT WHEN UPPER(SUBSTR(texto,car,1)) = 'X';
        dbms_output.put(SUBSTR(texto,car,1));
        car:= car-1;
    END LOOP;
    dbms_output.new_line();
    
    FOR i in 1..LENGTH(nombre) LOOP
        dbms_output.put('*');
    END LOOP;
    dbms_output.new_line();
    
    dbms_output.new_line();
    FOR i in inicio..fin LOOP
        IF i MOD 4 = 0 THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;
END;
