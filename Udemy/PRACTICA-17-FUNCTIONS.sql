CREATE OR REPLACE FUNCTION SUMA_SALARIOS(DEPT employees.department_id%TYPE, NUM_EMPL OUT NUMBER) RETURN NUMBER AS
    SAL NUMBER;
    BEGIN
        SELECT COUNT(*) INTO NUM_EMPL  FROM EMPLOYEES WHERE DEPARTMENT_ID=DEPT;
        SELECT SUM(SALARY) INTO SAL FROM EMPLOYEES WHERE DEPARTMENT_ID=DEPT;
        IF SAL IS NULL THEN
            RAISE_APPLICATION_ERROR(-20300, 'El departamento no existe o no tiene empleados en el');
        END IF;
        RETURN SAL;
    END;
/

SET SERVEROUTPUT ON

DECLARE
    SAL NUMBER;
    DEPT employees.department_id%TYPE:=100;
    NUM_EMPL NUMBER;
BEGIN
    SAL:=suma_salarios(DEPT, NUM_EMPL);
    DBMS_OUTPUT.PUT_LINE('El numero de empleados del departamento ' || DEPT || ' es de ' || NUM_EMPL);
    DBMS_OUTPUT.PUT_LINE('La suma de los salarios del departamento ' || DEPT || ' es de ' || SAL);
END;
/

SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION CREAR_REGION(REG_NAME regions.region_name%TYPE) RETURN regions.region_id%TYPE AS
    REG_ID REGIONS.region_id%TYPE;
    BEGIN
        SELECT REGION_ID INTO REG_ID FROM REGIONS WHERE REGION_NAME=REG_NAME;
        RAISE_APPLICATION_ERROR(-20300, 'La region ' || reg_name || ' ya existe con el ID ' || reg_id);
        --DBMS_OUTPUT.PUT_LINE('La region ' || reg_name || ' ya existe con el ID ' || reg_id);
        RETURN reg_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT MAX(REGION_ID) INTO REG_ID FROM REGIONS;
            INSERT INTO REGIONS VALUES (REG_ID+1, REG_NAME);
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Region ' || REG_NAME || ' registrada con exito con ID ' || (REG_ID+1));
            RETURN reg_id;
    END;   
/

DECLARE
    REG_NAME regions.region_name%TYPE;
    REG_ID regions.region_id%TYPE;
BEGIN
    reg_name:='MEXICO';
    reg_id:=crear_region(reg_name);
END;
/

