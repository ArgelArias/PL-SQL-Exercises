SET SERVEROUTPUT ON

DECLARE
    CONTROL_REGIONES EXCEPTION;
    clave_region regions.region_id%TYPE;
BEGIN
    clave_region:=250;
    IF clave_region >= 200 THEN
        RAISE CONTROL_REGIONES;
    ELSE
        insert into regions VALUES (clave_region, 'Antarctica');
        commit;
    END IF;
EXCEPTION
    WHEN CONTROL_REGIONES THEN
        dbms_output.put_line('El codigo de la region debe ser menor a 200');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Exception');
        DBMS_OUTPUT.PUT_LINE('SQLCODE: '|| SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQLERRM: '|| SQLERRM);
END;
/
