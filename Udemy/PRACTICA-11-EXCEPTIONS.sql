SET SERVEROUTPUT ON

DECLARE
    duplicado EXCEPTION;
    PRAGMA EXCEPTION_INIT(duplicado, -00001);
    nombre_empl employees.first_name%TYPE;
    resta number:=0;
BEGIN
    select first_name into nombre_empl from employees where employee_id=100;
    DBMS_OUTPUT.PUT_LINE(nombre_empl);
    --select (salary/0) into resta from employees where employee_id=100;
    insert into regions values (1,'Prueba');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Empleado con ese ID no existe');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Query regresa mas de un row');
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('No se puede dividir entre 0');
    WHEN duplicado THEN
        DBMS_OUTPUT.PUT_LINE('No se puede entrar un registo duplicado');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Exception');
        DBMS_OUTPUT.PUT_LINE('SQLCODE: '|| SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQLERRM: '|| SQLERRM);
END;
/
