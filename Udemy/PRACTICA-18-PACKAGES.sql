CREATE OR REPLACE PACKAGE REGIONES AS
    PROCEDURE ALTA_REGION(REG_ID regions.region_id%TYPE, REG_NAME regions.region_name%TYPE);
    PROCEDURE BAJA_REGION(REG_ID regions.region_id%TYPE);
    PROCEDURE MOD_REGION(REG_ID regions.region_id%TYPE, REG_NAME regions.region_name%TYPE);
    FUNCTION NOM_REGION(REG_ID regions.region_id%TYPE) RETURN regions.region_name%TYPE;
END REGIONES;
/

--BODY

CREATE OR REPLACE PACKAGE BODY REGIONES AS
    FUNCTION EXISTE_REGION(REG_ID regions.region_id%TYPE) RETURN BOOLEAN AS
        CURSOR C1 IS SELECT REGION_ID FROM REGIONS WHERE REGION_ID=REG_ID;
        ROW regions.region_id%TYPE;
    BEGIN
        OPEN C1;
        FETCH C1 INTO ROW;
        IF C1%ROWCOUNT > 0 THEN
            CLOSE C1;
            RETURN TRUE;
        ELSE
            CLOSE C1;
            RETURN FALSE;
        END IF;
    END;
    
    FUNCTION NOM_REGION(REG_ID regions.region_id%TYPE) RETURN regions.region_name%TYPE AS
        REG_NAME regions.region_name%TYPE;
    BEGIN
        SELECT REGION_NAME INTO REG_NAME FROM REGIONS WHERE region_id=REG_ID;
        RETURN reg_name;
    END;
    
    PROCEDURE ALTA_REGION(REG_ID regions.region_id%TYPE, REG_NAME regions.region_name%TYPE) AS
    BEGIN
        IF EXISTE_REGION(REG_ID) THEN
            RAISE_APPLICATION_ERROR(-20300, 'La ID de region ' || REG_ID || ' ya existe');
        ELSE
            INSERT INTO REGIONS VALUES (REG_ID, REG_NAME);
            COMMIT;
            dbms_output.put_line('Region ' || REG_NAME || ' insertada con exito. ID: ' || REG_ID);
        END IF;
    END;
    
    PROCEDURE BAJA_REGION(REG_ID regions.region_id%TYPE) AS
    BEGIN
        IF EXISTE_REGION(REG_ID) THEN
            dbms_output.put_line('Region ' || NOM_REGION(REG_ID) || ' CON ID ' || REG_ID || ' borrada con exito.');
            DELETE FROM REGIONS WHERE REGION_ID=REG_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20301, 'La ID de region ' || REG_ID || ' no existe');
        END IF;
    END;
    
    PROCEDURE MOD_REGION(REG_ID regions.region_id%TYPE, REG_NAME regions.region_name%TYPE) AS
    BEGIN
        IF EXISTE_REGION(REG_ID) THEN
            UPDATE REGIONS SET REGION_NAME=REG_NAME WHERE REGION_ID=REG_ID;
            COMMIT;
            dbms_output.put_line('Region ' || REG_ID || ' actualizada a ' || REG_NAME || ' con exito.');
        ELSE
            RAISE_APPLICATION_ERROR(-20301, 'La ID de region ' || REG_ID || ' no existe');
        END IF;
    END;
    
    
END REGIONES;
/
