DECLARE
    last_dept_id departments.department_id%TYPE;
BEGIN
    select max(department_id) into last_dept_id
        from departments;
        
    insert into departments VALUES (last_dept_id+1, 'INFORMATICA', 100, 1000);
    commit;
END;
/

DECLARE
    last_dept_id departments.department_id%TYPE;
BEGIN
    select max(department_id) into last_dept_id
        from departments;
        
    --update departments set location_id=1700 where department_id=(select max(department_id) from departments);
    update departments set location_id=1700 where department_id=last_dept_id;
    commit;
END;
/

DECLARE
    last_dept_id departments.department_id%TYPE;
BEGIN
    select max(department_id) into last_dept_id
        from departments;
        
    --delete departments where department_id=(select max(department_id) from departments);
    delete departments where department_id=last_dept_id;
    commit;
END;
/
