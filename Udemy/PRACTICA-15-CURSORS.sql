SET SERVEROUTPUT ON

DECLARE
    CURSOR EMPL_CURR IS
        SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID FROM EMPLOYEES;
BEGIN
    FOR i IN EMPL_CURR LOOP
        IF i.job_id='AD_PRES' THEN
            RAISE_APPLICATION_ERROR(-20300,'No se puede ver el salario del Jefe, pa que quieres saber eso?');
        ELSE
            DBMS_OUTPUT.PUT_LINE(i.first_name ||' ' || i.last_name || ': '|| i.salary || 'DLS');
        END IF;
    END LOOP;
END;
/

DECLARE
    CURSOR EMPL_CURR IS
        SELECT * FROM EMPLOYEES;
        
    CURSOR DEPT_CURR(m departments.manager_id%TYPE) IS
        SELECT * FROM departments where manager_id=m;
        
    d departments%ROWTYPE;
        
BEGIN
    FOR e IN EMPL_CURR LOOP
        OPEN DEPT_CURR(e.employee_id);
        FETCH DEPT_CURR into d;
        IF DEPT_CURR%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE(e.first_name || ' ' || e.last_name || ' No es vinculo de nada carnal');
        ELSE
            DBMS_OUTPUT.PUT_LINE(e.first_name || ' ' || e.last_name || ' es jefe del departamento ' || d.department_name);
        END IF;
        CLOSE DEPT_CURR;
    END LOOP;
END;
/

DECLARE
    CURSOR EMPL_CURR(d departments.department_id%TYPE) IS
        SELECT COUNT(*) FROM employees WHERE department_id=d;
        
    CODIGO departments.department_id%TYPE;
    RES number;
BEGIN
    CODIGO:= 10;
    OPEN EMPL_CURR(CODIGO);
    FETCH EMPL_CURR INTO RES;
    DBMS_OUTPUT.PUT_LINE('Numero de empleasedo en el departamento numero ' || CODIGO || ' es ' || RES);
END;
/

BEGIN
    FOR e IN (SELECT * FROM EMPLOYEES WHERE JOB_ID='ST_CLERK') LOOP
        DBMS_OUTPUT.PUT_LINE(e.FIRST_NAME);
    END LOOP;
END;
/

DECLARE
    CURSOR EMPL_CURR IS
        SELECT * FROM employees FOR UPDATE;
BEGIN
    FOR e IN EMPL_CURR LOOP
        IF e.SALARY > 8000 THEN
            UPDATE EMPLOYEES SET SALARY=SALARY*1.02 WHERE CURRENT OF EMPL_CURR;
        ELSE
            UPDATE EMPLOYEES SET SALARY=SALARY*1.03 WHERE CURRENT OF EMPL_CURR;
        END IF;
    END LOOP;
    COMMIT;
END;


