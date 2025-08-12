DECLARE
    usuario VARCHAR2(40):=user;
    
BEGIN
    CASE usuario
    WHEN 'SYS' THEN
    dbms_output.put_line('Eres superadmin');
    WHEN 'SYSTEM' THEN
    dbms_output.put_line('Eres superadmin normal');
    WHEN 'HR' THEN
    dbms_output.put_line('Eres de Recursos Humanos');
    ELSE
    dbms_output.put_line('Usuario no autorizado');
    END CASE;
END;
