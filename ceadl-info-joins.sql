--JOINS

--Join reports

DROP FUNCTION IF EXISTS activity_report(smallint, character varying);

CREATE OR REPLACE FUNCTION activity_report(
    p_id_activity smallint DEFAULT NULL,
    p_name_user character varying DEFAULT NULL
)
RETURNS TABLE (
    name_proyect character varying,
    presentation date,
    activity character varying,
    date_start character varying,
    date_end character varying,
    place character varying,
    objetive text,
    expected smallint,
    quantitatives jsonb,
    issues text,
    description text,
    results text,
    obstacle text,
    conclusions text,
    anexos text,
    signature character varying,
    name_user character varying
)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        a.name_proyect,
        r.presentation,
        a.activity,
        a.date_start,
        a.date_end,
        a.place,
        a.objetive,
        a.expected,
        (
          SELECT jsonb_agg(jsonb_build_object(
            'achieved', q.achieved,
            'day', q.day,
            'sp_female', q.sp_female,
            'sp_male', q.sp_male,
            'sp_total', q.sp_female + q.sp_male,
            'f_female', q.f_female,
            'f_male', q.f_male,
            'f_total', q.f_female + q.f_male,
            'na_female', q.na_female,
            'na_male', q.na_male,
            'na_total', q.na_female + q.na_male,
            'p_female', q.p_female,
            'p_male', q.p_male,
            'p_total', q.p_female + q.p_male,
            'total_participants', q.sp_female + q.sp_male + q.f_female + q.f_male + q.na_female + q.na_male + q.p_female + q.p_male
          ))
          FROM quantitatives q
          WHERE q.id_report = r.id_report
        ) AS quantitatives,
        r.issues,
        a.description,
        r.results,
        r.obstacle,
        r.conclusions,
        r.anexos,
        r.signature,
        r.name_user
    FROM activities a
    JOIN reports r ON a.id_activity = r.id_activity
    WHERE (a.id_activity = p_id_activity OR p_id_activity IS NULL)
        AND (r.name_user = p_name_user OR p_name_user IS NULL)
        AND EXISTS (
          SELECT 1
          FROM quantitatives q
          WHERE q.id_report = r.id_report
        );
END;
$$ LANGUAGE plpgsql;






--Join application

DROP FUNCTION IF EXISTS activity_application(smallint);

CREATE OR REPLACE FUNCTION activity_application(p_id_activity smallint)
RETURNS TABLE (
  name_founder character varying,
  presentation date,
  name_proyect character varying,
  name_user character varying,
  especific text,
  result_expected text,
  expected smallint,
  activity character varying,
  description text,
  date_start character varying,
  place character varying,
  amount smallint,
  quantity smallint,
  code character varying,
  budget_description character varying,
  import_usd smallint,
  import_bob smallint,
  signature character varying
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
      a.name_founder,
      ap.presentation,
      a.name_proyect,
      ap.name_user,
      a.especific,
      a.result_expected,
      a.expected,
      a.activity,
      a.description,
      a.date_start,
      a.place,
      ap.amount,
      b.quantity,
      b.code,
      b.description AS budget_description,
      b.import_usd,
      b.import_bob,
      ap.signature
    FROM activities a
    JOIN applications ap ON a.id_activity = ap.id_activity
    LEFT JOIN budgets b ON ap.id_application = b.id_application
    WHERE a.id_activity = p_id_activity AND b.description IS NOT NULL;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM activity_application(7::smallint);

--Join accountabilities

DROP FUNCTION IF EXISTS activity_accountability(smallint);

CREATE OR REPLACE FUNCTION activity_accountability(p_id_activity smallint)
RETURNS TABLE (
  name_founder character varying,
  presentation date,
  name_proyect character varying,
  name_user character varying,
  activity character varying,
  reception character varying,
  amount smallint,
  date_invoice character varying,
  invoice_number smallint,
  code character varying,
  description text,
  inport_usd smallint,
  inport_bob smallint,
  signature character varying
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
      a.name_founder,
      ac.presentation,
      a.name_proyect,
      ac.name_user,
      a.activity,
      ac.reception,
      ac.amount,
      s.date_invoice,
      s.invoice_number,
      s.code,
      s.description,
      s.inport_usd,
      s.inport_bob,
      ac.signature
    FROM activities a
    JOIN accountabilities ac ON a.id_activity = ac.id_activity
    LEFT JOIN surrenders s ON ac.id_accountability = s.id_accountability
    WHERE a.id_activity = p_id_activity AND s.description IS NOT NULL;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM activity_accountability(7::smallint);

--Search activities
DROP FUNCTION IF EXISTS list_activities();

CREATE OR REPLACE FUNCTION list_activities()
RETURNS TABLE (id_activity smallint, activity character varying, name_proyect character varying, name_founder character varying, name_user character varying)
AS $$
BEGIN
    RETURN QUERY
    SELECT a.id_activity, a.activity, a.name_proyect, a.name_founder, r.name_user
    FROM activities a
    JOIN reports r ON a.id_activity = r.id_activity;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM list_activities();

--Search by name_user
CREATE OR REPLACE FUNCTION list_by_name_user (_name_user character varying)
RETURNS TABLE (id_activity smallint, activity character varying, name_proyect character varying, name_founder character varying, name_user character varying)
AS $$
BEGIN
    RETURN QUERY
    SELECT a.id_activity, a.activity, a.name_proyect, a.name_founder, r.name_user
    FROM activities a
    JOIN reports r ON a.id_activity = r.id_activity
    WHERE r.name_user = _name_user;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM list_by_name_user('Juan Carlos Balderas'::character varying);

--Search activities
DROP FUNCTION IF EXISTS list_activities();

CREATE OR REPLACE FUNCTION list_activities()
RETURNS TABLE (id_activity smallint, activity character varying, name_proyect character varying, name_founder character varying, name_user character varying)
AS $$
BEGIN
    RETURN QUERY
    SELECT a.id_activity, a.activity, a.name_proyect, a.name_founder, r.name_user
    FROM activities a
    JOIN reports r ON a.id_activity = r.id_activity;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM list_activities();

--Search by name_user
CREATE OR REPLACE FUNCTION list_by_name_user (_name_user character varying)
RETURNS TABLE (id_activity smallint, activity character varying, name_proyect character varying, name_founder character varying, name_user character varying)
AS $$
BEGIN
    RETURN QUERY
    SELECT a.id_activity, a.activity, a.name_proyect, a.name_founder, r.name_user
    FROM activities a
    JOIN reports r ON a.id_activity = r.id_activity
    WHERE r.name_user = _name_user;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM list_by_name_user('Juan Carlos Balderas'::character varying);

--Search super user

CREATE OR REPLACE FUNCTION validate_super_user(_nick character varying, _password character varying) RETURNS text
AS $$ DECLARE
  user_nick super_user.nick%TYPE;
  user_password super_user.password%TYPE;
BEGIN
  SELECT nick, password INTO user_nick, user_password FROM super_user;
  IF _nick = user_nick AND _password = user_password THEN
    RETURN 'El usuario si existe';
  ELSE RAISE EXCEPTION 'El usuario no existe';
  END IF;
END;
$$ LANGUAGE plpgSQL;

SELECT validate_super_user('ceadl'::character varying, 'a1b2c3d4c0'::character varying);

--Search users

DROP FUNCTION IF EXISTS validate_user(character varying, character varying)

CREATE OR REPLACE FUNCTION validate_user (_nick_user character varying, _password_user character varying) RETURNS TABLE (name_user character varying, profile character varying)
AS $$ DECLARE
  user_nick users.nick_user%TYPE;
  user_password users.password_user%TYPE;
BEGIN
  SELECT nick_user, pgp_sym_decrypt(password_user::bytea,'AES_KEY') INTO user_nick, user_password FROM users
  WHERE nick_user = _nick_user;
  IF _password_user = user_password THEN
    RETURN QUERY
    SELECT
      u.name_user,
      u.profile
    FROM users u
    WHERE u.nick_user = _nick_user;
  ELSE RAISE EXCEPTION 'El usuario no existe';
  END IF;
END;
$$ LANGUAGE plpgSQL;


SELECT * FROM validate_user ('jcbalderasg'::character varying, 'a1b2c3d4c0'::character varying);

SELECT nick_user, pgp_sym_decrypt(password_user::bytea,'AES_KEY') from USERS;

SELECT validate_user ('rquispe'::character varying, 'ceadl_2023'::character varying);
SELECT validate_user ('saalcazar'::character varying, '07071984-Wap'::character varying);
