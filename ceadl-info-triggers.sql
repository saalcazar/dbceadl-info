--TRIGERS
--AUDIT-PROFILE
--Audit create profile
CREATE OR REPLACE FUNCTION tg_create_profile()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_profile (nick, action_audit_profile, table_audit_profile, last_audit_profile, new_audit_profile)
    SELECT NEW.nick, 'INSERTAR', 'PROFILE', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_profile
AFTER INSERT ON profiles
FOR EACH ROW EXECUTE PROCEDURE tg_create_profile();

--Audit update profile
CREATE OR REPLACE FUNCTION tg_update_profile()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_profile (nick, action_audit_profile, table_audit_profile, last_audit_profile, new_audit_profile)
    SELECT NEW.nick, 'ACTUALIZAR', 'PROFILE', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_profile
AFTER UPDATE ON profiles
FOR EACH ROW EXECUTE PROCEDURE tg_update_profile();

--Audit delete profile
CREATE OR REPLACE FUNCTION tg_delete_profile()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_profile (nick, action_audit_profile, table_audit_profile, last_audit_profile, new_audit_profile)
    SELECT OLD.nick, 'ELIMINAR', 'PROFILE', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_profile
AFTER DELETE ON profiles
FOR EACH ROW EXECUTE PROCEDURE tg_delete_profile();

--Audit create user
CREATE OR REPLACE FUNCTION tg_create_user()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_profile (nick, action_audit_profile, table_audit_profile, last_audit_profile, new_audit_profile)
    SELECT NEW.nick, 'INSERTAR', 'USER', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_user
AFTER INSERT ON users
FOR EACH ROW EXECUTE PROCEDURE tg_create_user();

--Audit update user
CREATE OR REPLACE FUNCTION tg_update_profile()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_profile (nick, action_audit_profile, table_audit_profile, last_audit_profile, new_audit_profile)
    SELECT NEW.nick, 'ACTUALIZAR', 'USER', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_profile
AFTER UPDATE ON users
FOR EACH ROW EXECUTE PROCEDURE tg_update_profile();

--Audit delete user
CREATE OR REPLACE FUNCTION tg_delete_profile()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_profile (nick, action_audit_profile, table_audit_profile, last_audit_profile, new_audit_profile)
    SELECT OLD.nick, 'ELIMINAR', 'USER', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_profile
AFTER DELETE ON users
FOR EACH ROW EXECUTE PROCEDURE tg_delete_profile();



--AUDIT
--Audit create founder
CREATE OR REPLACE FUNCTION tg_create_founder()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT NEW.nick_user, 'INSERTAR', 'FOUNDERS', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_founder
AFTER INSERT ON founders
FOR EACH ROW EXECUTE PROCEDURE tg_create_founder();

--Audit update founder
CREATE OR REPLACE FUNCTION tg_update_founder()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'FOUNDERS', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_founder
AFTER UPDATE ON founders
FOR EACH ROW EXECUTE PROCEDURE tg_update_founder();

--Audit delete founder
CREATE OR REPLACE FUNCTION tg_delete_founder()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT OLD.nick_user, 'ELIMINAR', 'FOUNDERS', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_founder
AFTER DELETE ON founders
FOR EACH ROW EXECUTE PROCEDURE tg_delete_founder();

--Audit create proyect
CREATE OR REPLACE FUNCTION tg_create_proyect()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT NEW.nick_user, 'INSERTAR', 'PROYECTS', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_proyect
AFTER INSERT ON proyects
FOR EACH ROW EXECUTE PROCEDURE tg_create_proyect();

--Audit update proyect
CREATE OR REPLACE FUNCTION tg_update_proyect()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'PROYECTS', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_proyect
AFTER UPDATE ON proyects
FOR EACH ROW EXECUTE PROCEDURE tg_update_proyect();

--Audit delete proyect
CREATE OR REPLACE FUNCTION tg_delete_proyect()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT OLD.nick_user, 'ELIMINAR', 'PROYECTS', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_proyect
AFTER DELETE ON proyects
FOR EACH ROW EXECUTE PROCEDURE tg_delete_proyect();

--Audit create especifics
CREATE OR REPLACE FUNCTION tg_create_especifics()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT NEW.nick_user, 'INSERTAR', 'ESPECIFICS', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_especifics
AFTER INSERT ON especifics
FOR EACH ROW EXECUTE PROCEDURE tg_create_especifics();

--Audit update especifics
CREATE OR REPLACE FUNCTION tg_update_especifics()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'ESPECIFICS', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_especifics
AFTER UPDATE ON especifics
FOR EACH ROW EXECUTE PROCEDURE tg_update_especifics();

--Audit delete especifics
CREATE OR REPLACE FUNCTION tg_delete_especifics()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit (nick_user, action_audit, table_audit, last_audit, new_audit)
    SELECT OLD.nick_user, 'ELIMINAR', 'ESPECIFICS', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_especifics
AFTER DELETE ON especifics
FOR EACH ROW EXECUTE PROCEDURE tg_delete_especifics();

--AUDIT ACTIVITIES
--Audit create activity
CREATE OR REPLACE FUNCTION tg_create_activity()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'INSERTAR', 'ACTIVITIES', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_activity
AFTER INSERT ON activities
FOR EACH ROW EXECUTE PROCEDURE tg_create_activity();

--Audit update activities
CREATE OR REPLACE FUNCTION tg_update_activity()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'ACTIVITIES', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_activity
AFTER UPDATE ON activities
FOR EACH ROW EXECUTE PROCEDURE tg_update_activity();

--Audit delete activities
CREATE OR REPLACE FUNCTION tg_delete_activity()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT OLD.nick_user, 'ELIMINAR', 'ACTIVITIES', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;

$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_activity
AFTER DELETE ON activities
FOR EACH ROW EXECUTE PROCEDURE tg_delete_activity();

--Audit create reports
CREATE OR REPLACE FUNCTION tg_create_report()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'INSERTAR', 'REPORTS', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_report
AFTER INSERT ON reports
FOR EACH ROW EXECUTE PROCEDURE tg_create_report();

--Audit update reports
CREATE OR REPLACE FUNCTION tg_update_report()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'REPORTS', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_report
AFTER UPDATE ON reports
FOR EACH ROW EXECUTE PROCEDURE tg_update_report();

--Audit delete reports
CREATE OR REPLACE FUNCTION tg_delete_reports()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT OLD.nick_user, 'ELIMINAR', 'REPORTS', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;

$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_reports
AFTER DELETE ON reports
FOR EACH ROW EXECUTE PROCEDURE tg_delete_reports();

--Audit create quantitative
CREATE OR REPLACE FUNCTION tg_create_quantitative()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'INSERTAR', 'QUANTITATIVES', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_quantitative
AFTER INSERT ON quantitatives
FOR EACH ROW EXECUTE PROCEDURE tg_create_quantitative();

--Audit update quantitative
CREATE OR REPLACE FUNCTION tg_update_quantitative()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'QUANTITATIVES', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_quantitative
AFTER UPDATE ON quantitatives
FOR EACH ROW EXECUTE PROCEDURE tg_update_quantitative();

--Audit delete quantitative
CREATE OR REPLACE FUNCTION tg_delete_quantitative()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT OLD.nick_user, 'ELIMINAR', 'QUANTITATIVES', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;

$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_quantitative
AFTER DELETE ON quantitatives
FOR EACH ROW EXECUTE PROCEDURE tg_delete_quantitative();

--Audit create application
CREATE OR REPLACE FUNCTION tg_create_application()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'INSERTAR', 'APPLICATIONS', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_application
AFTER INSERT ON applications
FOR EACH ROW EXECUTE PROCEDURE tg_create_application();

--Audit update application
CREATE OR REPLACE FUNCTION tg_update_application()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'APPLICATIONS', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_application
AFTER UPDATE ON applications
FOR EACH ROW EXECUTE PROCEDURE tg_update_application();

--Audit delete application
CREATE OR REPLACE FUNCTION tg_delete_application()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT OLD.nick_user, 'ELIMINAR', 'APPLICATIONS', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;

$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_application
AFTER DELETE ON applications
FOR EACH ROW EXECUTE PROCEDURE tg_delete_application();

--Audit create budget
CREATE OR REPLACE FUNCTION tg_create_budget()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'INSERTAR', 'BUDGETS', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_budget
AFTER INSERT ON budgets
FOR EACH ROW EXECUTE PROCEDURE tg_create_budget();

--Audit update budget
CREATE OR REPLACE FUNCTION tg_update_budget()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'BUDGETS', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_budget
AFTER UPDATE ON budgets
FOR EACH ROW EXECUTE PROCEDURE tg_update_budget();

--Audit delete budget
CREATE OR REPLACE FUNCTION tg_delete_budget()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT OLD.nick_user, 'ELIMINAR', 'BUDGETS', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;

$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_budget
AFTER DELETE ON budgets
FOR EACH ROW EXECUTE PROCEDURE tg_delete_budget();

--Audit create accountability
CREATE OR REPLACE FUNCTION tg_create_accountability()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'INSERTAR', 'ACCOUNTABILITIES', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_accountability
AFTER INSERT ON accountabilities
FOR EACH ROW EXECUTE PROCEDURE tg_create_accountability();

--Audit update accountability
CREATE OR REPLACE FUNCTION tg_update_accountability()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'ACCOUNTABILITIES', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_accountability
AFTER UPDATE ON accountabilities
FOR EACH ROW EXECUTE PROCEDURE tg_update_accountability();

--Audit delete accountability
CREATE OR REPLACE FUNCTION tg_delete_accountability()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT OLD.nick_user, 'ELIMINAR', 'ACCOUNTABILITIES', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;

$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_accountability
AFTER DELETE ON accountabilities
FOR EACH ROW EXECUTE PROCEDURE tg_delete_accountability();

--Audit create surrender
CREATE OR REPLACE FUNCTION tg_create_surrender()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'INSERTAR', 'SURRENDERS', row_to_json(NEW.*), null;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_create_surrender
AFTER INSERT ON surrenders
FOR EACH ROW EXECUTE PROCEDURE tg_create_surrender();

--Audit update surrender
CREATE OR REPLACE FUNCTION tg_update_surrender()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT NEW.nick_user, 'ACTUALIZAR', 'SURRENDERS', row_to_json(OLD.*), row_to_json(NEW.*);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_update_surrender
AFTER UPDATE ON surrenders
FOR EACH ROW EXECUTE PROCEDURE tg_update_surrender();

--Audit delete surrender
CREATE OR REPLACE FUNCTION tg_delete_surrender()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'DELETE' THEN
    INSERT INTO audit_activity (nick_user, action_audit_activity, table_audit_activity, last_audit_activity, new_audit_activity)
    SELECT OLD.nick_user, 'ELIMINAR', 'SURRENDERS', row_to_json(OLD.*), null;
  END IF;
  RETURN NEW;
END;

$$ LANGUAGE plpgSQL;

CREATE TRIGGER tg_delete_surrender
AFTER DELETE ON surrenders
FOR EACH ROW EXECUTE PROCEDURE tg_delete_surrender();

SELECT * FROM audit;