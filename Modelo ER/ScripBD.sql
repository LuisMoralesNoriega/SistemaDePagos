-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2017-05-25 18:39:40 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE Alumno
  (
    id_alumno INTEGER ,
    Nombre TEXT NOT NULL ,
    Alumno_ID                      NUMBER NOT NULL ,
    Grado_Seccion_Grado_Seccion_ID NUMBER NOT NULL
  ) ;
ALTER TABLE Alumno ADD CONSTRAINT Alumno_PK PRIMARY KEY ( Alumno_ID ) ;


CREATE TABLE Grado
  ( id_grado INTEGER NOT NULL , Nombre TEXT NOT NULL
  ) ;
ALTER TABLE Grado ADD CONSTRAINT Grado_PK PRIMARY KEY ( id_grado ) ;


CREATE TABLE Grado_Pago
  (
    id_GP INTEGER NOT NULL ,
    Descripcion TEXT NOT NULL ,
    Monto        NUMBER NOT NULL ,
    Fecha_limite DATE NOT NULL ,
    Mes TEXT NOT NULL ,
    Grado_id_grado INTEGER NOT NULL ,
    Pago_id_pago   INTEGER NOT NULL
  ) ;
ALTER TABLE Grado_Pago ADD CONSTRAINT Grado_Pago_PK PRIMARY KEY ( id_GP ) ;


CREATE TABLE Grado_Seccion
  (
    Seccion_id_Seccion INTEGER NOT NULL ,
    Grado_id_grado     INTEGER NOT NULL ,
    Grado_Seccion_ID   NUMBER NOT NULL
  ) ;
ALTER TABLE Grado_Seccion ADD CONSTRAINT Grado_Seccion_PK PRIMARY KEY ( Grado_Seccion_ID ) ;


CREATE TABLE Pago
  ( id_pago INTEGER NOT NULL , Nombre TEXT NOT NULL
  ) ;
ALTER TABLE Pago ADD CONSTRAINT Pago_PK PRIMARY KEY ( id_pago ) ;


CREATE TABLE Pago_Efectuado
  (
    Mora             NUMBER ,
    Recibo_id_recibo INTEGER NOT NULL ,
    Grado_Pago_id_GP INTEGER NOT NULL
  ) ;


CREATE TABLE Recibo
  (
    id_recibo        INTEGER NOT NULL ,
    Fecha            DATE NOT NULL ,
    Total            NUMBER NOT NULL ,
    Alumno_Alumno_ID NUMBER NOT NULL
  ) ;
ALTER TABLE Recibo ADD CONSTRAINT Recibo_PK PRIMARY KEY ( id_recibo ) ;


CREATE TABLE Seccion
  ( id_Seccion INTEGER NOT NULL , Nombre TEXT NOT NULL
  ) ;
ALTER TABLE Seccion ADD CONSTRAINT Seccion_PK PRIMARY KEY ( id_Seccion ) ;


CREATE TABLE Usuario
  (
    id_usuario INTEGER NOT NULL ,
    Nombre TEXT NOT NULL ,
    DPI TEXT NOT NULL ,
    Usuario TEXT NOT NULL ,
    Contrasenia TEXT NOT NULL
  ) ;
ALTER TABLE Usuario ADD CONSTRAINT Usuario_PKv1 PRIMARY KEY ( id_usuario ) ;


ALTER TABLE Alumno ADD CONSTRAINT Alumno_Grado_Seccion_FK FOREIGN KEY ( Grado_Seccion_Grado_Seccion_ID ) REFERENCES Grado_Seccion ( Grado_Seccion_ID ) ;

ALTER TABLE Grado_Pago ADD CONSTRAINT Grado_Pago_Grado_FK FOREIGN KEY ( Grado_id_grado ) REFERENCES Grado ( id_grado ) ;

ALTER TABLE Grado_Pago ADD CONSTRAINT Grado_Pago_Pago_FK FOREIGN KEY ( Pago_id_pago ) REFERENCES Pago ( id_pago ) ;

ALTER TABLE Grado_Seccion ADD CONSTRAINT Grado_Seccion_Grado_FK FOREIGN KEY ( Grado_id_grado ) REFERENCES Grado ( id_grado ) ;

ALTER TABLE Grado_Seccion ADD CONSTRAINT Grado_Seccion_Seccion_FK FOREIGN KEY ( Seccion_id_Seccion ) REFERENCES Seccion ( id_Seccion ) ;

ALTER TABLE Pago_Efectuado ADD CONSTRAINT Pago_Efectuado_Grado_Pago_FK FOREIGN KEY ( Grado_Pago_id_GP ) REFERENCES Grado_Pago ( id_GP ) ;

ALTER TABLE Pago_Efectuado ADD CONSTRAINT Pago_Efectuado_Recibo_FK FOREIGN KEY ( Recibo_id_recibo ) REFERENCES Recibo ( id_recibo ) ;

ALTER TABLE Recibo ADD CONSTRAINT Recibo_Alumno_FK FOREIGN KEY ( Alumno_Alumno_ID ) REFERENCES Alumno ( Alumno_ID ) ;

--CREATE SEQUENCE Alumno_Alumno_ID_SEQ START WITH 1 NOCACHE ORDER ;
--CREATE OR REPLACE TRIGGER Alumno_Alumno_ID_TRG BEFORE
  --INSERT ON Alumno FOR EACH ROW WHEN (NEW.Alumno_ID IS NULL) BEGIN :NEW.Alumno_ID := Alumno_Alumno_ID_SEQ.NEXTVAL;
--END;
--/

--CREATE SEQUENCE Grado_Seccion_Grado_Seccion_ID START WITH 1 NOCACHE ORDER ;
--CREATE OR REPLACE TRIGGER Grado_Seccion_Grado_Seccion_ID BEFORE
  --INSERT ON Grado_Seccion FOR EACH ROW WHEN (NEW.Grado_Seccion_ID IS NULL) BEGIN :NEW.Grado_Seccion_ID := Grado_Seccion_Grado_Seccion_ID.NEXTVAL;
--END;
--/


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          2
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
