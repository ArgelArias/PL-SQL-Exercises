SET SERVEROUTPUT ON

DECLARE
    I NUMBER:= 100;
    TIPO_PRODUCTO CHAR(1):= 'D';
    
BEGIN
    IF I MOD 2 = 0 THEN
        dbms_output.put_line(I ||' ES NUMBERO PAR');
    END IF;
    
    tipo_producto:= UPPER(TIPO_PRODUCTO);
    IF tipo_producto = 'A' THEN
        DBMS_OUTPUT.put_line('ELECTRONICA');
    ELSIF tipo_producto = 'B' THEN
        DBMS_OUTPUT.put_line('INFORMATICA');
    ELSIF tipo_producto = 'C' THEN
        DBMS_OUTPUT.put_line('ROPA');
    ELSIF tipo_producto = 'D' THEN
        DBMS_OUTPUT.put_line('MUSICA');
    ELSIF tipo_producto = 'E' THEN
        DBMS_OUTPUT.put_line('LIBROS');
    ELSE
        DBMS_OUTPUT.put_line('ENTRADA INCORRECTA');
    END IF;
END;
