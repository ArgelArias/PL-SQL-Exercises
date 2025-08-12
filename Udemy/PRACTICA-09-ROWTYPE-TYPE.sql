SET SERVEROUTPUT ON

DECLARE
    salario_maximo employees.salary%TYPE;
    tipo_de_trabajo jobs.job_title%TYPE;
BEGIN
    select max(salary) into salario_maximo from employees where department_id=100;
    DBMS_OUTPUT.PUT_LINE(salario_maximo);
    
    select j.job_title into tipo_de_trabajo from employees e join jobs j
    on e.job_id=j.job_id
    where e.employee_id=100;
    DBMS_OUTPUT.PUT_LINE(tipo_de_trabajo);
END;
/

DECLARE
    dept_id employees.department_id%TYPE;
    nombre_dept departments.department_name%TYPE;
    no_empl number;
BEGIN
    dept_id:= 10;
    select d.department_name into nombre_dept FROM EMPLOYEES e join departments d 
        on e.department_id=d.department_id 
        where e.department_id=dept_id
        group by d.department_name;
    select COUNT(*) into no_empl FROM EMPLOYEES
        where department_id=dept_id;
    DBMS_OUTPUT.PUT_LINE('Departamento: ' || nombre_dept);
    DBMS_OUTPUT.PUT_LINE('Numero de empleados : ' || no_empl);
END;
/

DECLARE
    salario_max employees.salary%TYPE;
    salario_min employees.salary%TYPE;
    diferencia employees.salary%TYPE;
BEGIN
    select MAX(salary) into salario_max FROM employees;
    select MIN(salary) into salario_min FROM employees;
    DBMS_OUTPUT.PUT_LINE('El salario MAXIMO es: ' || salario_max);
    DBMS_OUTPUT.PUT_LINE('El salario MINIMO es: ' || salario_min);
    diferencia:=salario_max-salario_min;
    DBMS_OUTPUT.PUT_LINE('La diferencia es de: ' || diferencia);
    
END;
/
