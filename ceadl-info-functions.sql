--FUNCTIONS
--PROFILE
--Create profile
CREATE OR REPLACE FUNCTION create_profile (_profile character varying, _nick character varying)
RETURNS void
AS $$ BEGIN
    INSERT INTO profiles (profile, nick)
	VALUES (_profile, _nick);
	EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE EXCEPTION 'No fue posible crear el perfil';
END
$$
LANGUAGE plpgSQL;

--Update profile
CREATE OR REPLACE FUNCTION update_profile (_id_profile smallint, _profile character varying, _nick character varying)
RETURNS void
AS $$ BEGIN
    IF _id_profile IS NOT NULL THEN
            UPDATE profiles SET profile = _profile, nick = _nick
            WHERE id_profile = _id_profile;
        ELSE RAISE EXCEPTION 'No fue posible actualizar el perfil';
    END IF;
END;
$$ LANGUAGE plpgsql;

--Delete profile
CREATE OR REPLACE FUNCTION delete_profile(_id_profile smallint)
RETURNS void
AS $$ BEGIN
	IF _id_profile IS NOT NULL THEN
		DELETE FROM profiles WHERE id_profile = _id_profile;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el perfil';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_profile ('Administrador', 'ceadl');
SELECT update_profile(7::smallint, 'Coordinador'::character varying, 'ceadl'::character varying);
SELECT delete_profile(7::smallint);
SELECT * FROM profiles;

--FOUNDER
--Create founder
CREATE OR REPLACE FUNCTION create_founder (_cod_founder character varying, _name_founder character varying, _nick_user character varying)
RETURNS void
AS $$ BEGIN
    INSERT INTO founders (cod_founder, name_founder, nick_user)
	VALUES (_cod_founder, _name_founder, _nick_user);
	EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE EXCEPTION 'No fue posible crear el perfil';
END
$$
LANGUAGE plpgSQL;

--Update founder
CREATE OR REPLACE FUNCTION update_founder (_id_founder smallint, _cod_founder character varying, _name_founder character varying, _nick_user character varying)
RETURNS void
AS $$ BEGIN
    IF _id_founder IS NOT NULL THEN
            UPDATE founders SET cod_founder = _cod_founder, name_founder = _name_founder, nick_user = _nick_user
            WHERE id_founder = _id_founder;
        ELSE RAISE EXCEPTION 'No se pudo actualizar el financiador';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete Founder
CREATE OR REPLACE FUNCTION delete_founder(_id_founder smallint)
RETURNS void
AS $$ BEGIN
	IF _id_founder IS NOT NULL THEN
		DELETE FROM founders WHERE id_founder = _id_founder;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el financiador';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_founder ('tdh001C', 'TDH', 'jcbalderas');
SELECT update_founder (6::smallint, 'tdh001'::character varying, 'TDH-Holanda'::character varying, 'jcbalderas'::character varying);
SELECT delete_founder (6::smallint);
SELECT * FROM founders;

--PROYECT
--Create proyect
CREATE OR REPLACE FUNCTION create_proyect (
    _cod_proyect character varying,
    _name_proyect character varying,
    _objetive text,
    _cod_founder character varying,
    _nick_user character varying
)
RETURNS void
AS $$ BEGIN
    INSERT INTO proyects (cod_proyect, name_proyect, objetive, cod_founder, nick_user)
	VALUES (_cod_proyect, _name_proyect, _objetive, _cod_founder, _nick_user);
	EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE EXCEPTION 'No fue posible crear el proyecto';
END
$$
LANGUAGE plpgSQL;

--Update proyect
CREATE OR REPLACE FUNCTION update_proyect (
    _id_proyect smallint,
    _cod_proyect character varying,
    _name_proyect character varying,
    _objetive text,
    _cod_founder character varying,
    _nick_user character varying
)
RETURNS void
AS $$ BEGIN
    IF _id_proyect IS NOT NULL THEN
        UPDATE proyects SET 
            cod_proyect = _cod_proyect,
            name_proyect = _name_proyect,
            objetive = _objetive,
            cod_founder = _cod_founder,
            nick_user = _nick_user
        WHERE id_proyect = _id_proyect;
	    ELSE 
            RAISE EXCEPTION 'No fue posible actualizar el proyecto';
    END IF;
END;
$$
LANGUAGE plpgSQL;

--Delete proyect
CREATE OR REPLACE FUNCTION delete_proyect(_id_proyect smallint)
RETURNS void
AS $$ BEGIN
	IF _id_proyect IS NOT NULL THEN
		DELETE FROM proyects WHERE id_proyect = _id_proyect;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el proyecto';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_proyect ('p007'::character varying, 'Eliminación de la violencia'::character varying, 'Aquí va el objetivo del proyecto'::text, 'educo001C'::character varying, 'jcbalderas'::character varying);
SELECT update_proyect (6::smallint, 'p017'::character varying, 'Eliminación y castigo de la vilencia'::character varying, 'Aquí va el objetivo del proyecto FINAL'::text, 'educo001C'::character varying, 'jcbalderas'::character varying);
SELECT delete_proyect (6::smallint);
SELECT * FROM proyects;

--ESPECIFICS
--Create especific
CREATE OR REPLACE FUNCTION create_especific(
    _num_especific smallint,
    _especific text,
    _nick_user character varying,
    _cod_proyect character varying
)
RETURNS void
AS $$ BEGIN
    INSERT INTO especifics (
        num_especific,
        especific,
        nick_user, 
        cod_proyect
    )
    VALUES (
        _num_especific,
        _especific,
        _nick_user,
        _cod_proyect
    );
    EXCEPTION
 	WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'No fue posible crear el objetivo específico';
END;
$$ LANGUAGE plpgSQL;

--Update especific
CREATE OR REPLACE FUNCTION update_especific(
    _id_especific smallint,
    _num_especific smallint,
    _especific text,
    _nick_user character varying,
    _cod_proyect character varying
)
RETURNS void
AS $$ BEGIN
    IF _id_especific IS NOT NULL THEN
        UPDATE especifics SET 
            num_especific = _num_especific,
            especific = _especific,
            nick_user = _nick_user,
            cod_proyect = _cod_proyect
        WHERE id_especific = _id_especific;
        ELSE RAISE EXCEPTION 'No se pudo actualizar el objetivo específico';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete especific
CREATE OR REPLACE FUNCTION delete_especific(_id_especific smallint)
RETURNS void
AS $$ BEGIN
	IF _id_especific IS NOT NULL THEN
		DELETE FROM especifics WHERE id_especific = _id_especific;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el proyecto';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_especific(5::smallint, 'Aqui va todo el objetivo específico Número 5'::text, 'jcbalderas'::character varying, 'p006'::character varying);
SELECT update_especific(3::smallint, 3::smallint, 'Aqui va todo el objetivo específico Número 3'::text, 'jcbalderas'::character varying, 'p006'::character varying);
SELECT delete_especific(7::smallint);
SELECT * FROM especifics;

--USERS
--Create user
CREATE OR REPLACE FUNCTION create_user(
    _name_user character varying,
    _nick_user character varying,
    _password_user character varying,
	_charge_user character varying,
    _signature character varying,
	_profile character varying,
    _nick character varying
) RETURNS void
AS $$ BEGIN
	INSERT INTO users (name_user, nick_user, password_user, charge, signature, profile, nick)
	VALUES (_name_user,	_nick_user, PGP_SYM_ENCRYPT(_password_user,'AES_KEY'), _charge_user, _signature, _profile, _nick);
	EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE EXCEPTION 'No fue posible crear el usuario';
END
$$
LANGUAGE plpgSQL;

--Update user
CREATE OR REPLACE FUNCTION update_user(
    _id_user smallint,
    _name_user character varying,
    _nick_user character varying,
    _password_user character varying,
	_charge_user character varying,
    _signature character varying,
	_profile character varying,
    _nick character varying
) RETURNS void
AS $$ BEGIN
    IF _id_user IS NOT NULL THEN
        UPDATE users
        SET id_user = _id_user, name_user = _name_user, nick_user = _nick_user, password_user = PGP_SYM_ENCRYPT(_password_user,'AES_KEY'), charge = _charge_user, signature = _signature, profile = _profile, nick = _nick
        WHERE id_user = _id_user;
    ELSE RAISE EXCEPTION 'No fue posible actualizar el usuario';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete user
CREATE OR REPLACE FUNCTION delete_user(_id_user smallint)
RETURNS void
AS $$ BEGIN
	IF _id_user IS NOT NULL THEN
		DELETE FROM users WHERE id_user = _id_user;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el proyecto';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_user(
    'Samuel Alcazar'::character varying,
    'saalcazar'::character varying,
    '07071984-Wap'::character varying,
    'Software'::character varying,
    'ruta de la firma Sam'::character varying,
    'Director'::character varying,
    'ceadl'::character varying
);
SELECT update_user(7::smallint, 'Rosmery Quispe'::character varying, 'rquispe'::character varying, 'ros_ros'::character varying, 'Coordinación'::character varying, 'ruta de la firma ros'::character varying, 'Director'::character varying, 'ceadl'::character varying);
SELECT delete_user(7::smallint);
SELECT * FROM users;

--ACTIVITIES
--Create activitie
CREATE OR REPLACE FUNCTION create_activity (
    _activity character varying,
    _date_start character varying,
    _date_end character varying,
    _place character varying,
    _expected smallint,
    _objetive text,
    _result_expected text,
    _description text,
    _name_proyect character varying,
    _name_founder character varying,
    _especific text,
    _nick_user character varying
) RETURNS void
AS $$ BEGIN
    INSERT INTO activities (
        activity,
        date_start,
        date_end,
        place,
        expected,
        objetive,
        result_expected,
        description,
        name_proyect,
        name_founder,
        especific,
        nick_user
    )
    VALUES (
        _activity,
        _date_start,
        _date_end,
        _place,
        _expected,
        _objetive,
        _result_expected,
        _description,
        _name_proyect,
        _name_founder,
        _especific,
        _nick_user
    );
    EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE EXCEPTION 'No fue posible crear la actividad';
END;
$$ LANGUAGE plpgSQL;

--Update activity
CREATE OR REPLACE FUNCTION update_activity (
    _id_activity smallint,
    _activity character varying,
    _date_start character varying,
    _date_end character varying,
    _place character varying,
    _expected smallint,
    _objetive text,
    _result_expected text,
    _description text,
    _name_proyect character varying,
    _name_founder character varying,
    _especific text,
    _nick_user character varying
) RETURNS void
AS $$ BEGIN
    IF _id_activity IS NOT NULL THEN
        UPDATE activities SET
            activity = _activity,
            date_start = _date_start,
            date_end = _date_end,
            place = _place,
            expected = _expected,
            objetive = _objetive,
            result_expected = _result_expected,
            description = _description,
            name_proyect = _name_proyect,
            name_founder = _name_founder,
            especific = _especific,
            nick_user = _nick_user
        WHERE id_activity = _id_activity;
    ELSE RAISE EXCEPTION 'No se pudo actualizar la actividad';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete activity
CREATE OR REPLACE FUNCTION delete_activity(_id_activity smallint)
RETURNS void
AS $$ BEGIN
	IF _id_activity IS NOT NULL THEN
		DELETE FROM activities WHERE id_activity = _id_activity;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el proyecto';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_activity (
    'Taller teatro'::character varying,
    '2023-05-29'::character varying,
    '2023-05-31'::character varying,
    'Unidad Educativa San Javier'::character varying,
    35::smallint,
    'Socializar la ley del concejo municipal de jóvenes'::text,
    'Jóvenes concientes de sus derechos'::text,
    'Taller con técnicas del TDO'::text,
    'Por los DDHH de los NNA`s'::character varying,
    'EDUCO'::character varying,
    'Aqui va todo el objetivo específico Número 3'::text,
    'jcbalderas'::character varying
);
SELECT update_activity (
    8::smallint,
    'Taller teatro'::character varying,
    '2023-05-29'::character varying,
    '2023-05-31'::character varying,
    'Unidad Educativa CHE'::character varying,
    50::smallint,
    'Socializar la ley del concejo municipal de jóvenes'::text,
    'Jóvenes concientes de sus derechos'::text,
    'Taller con técnicas del TDO'::text,
    'Por los DDHH de los NNA`s'::character varying,
    'EDUCO'::character varying,
    'Aqui va todo el objetivo específico Número 3'::text,
    'jcbalderas'::character varying
);
SELECT delete_activity(8::smallint);
SELECT * FROM activities;

--REPORTS
--Create report
CREATE OR REPLACE FUNCTION create_report(
    _issues text,
    _results text,
    _obstacle text,
    _conclusions text,
    _anexos text,
    _name_user character varying,
    _name_proyect character varying,
    _signature character varying,
    _name_founder character varying,
    _nick_user character varying,
    _id_activity smallint
) RETURNS text
AS $$ BEGIN
    INSERT INTO reports (
        issues,
        results,
        obstacle,
        conclusions,
        anexos,
        name_user,
        name_proyect,
        signature,
        name_founder,
        nick_user,
        id_activity
    )
    VALUES (
        _issues,
        _results,
        _obstacle,
        _conclusions,
        _anexos,
        _name_user,
        _name_proyect,
        _signature,
        _name_founder,
        _nick_user,
        _id_activity
    );
    RETURN 'Succsesfuly';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'No fue posible crear el informe';
END;
$$ LANGUAGE plpgSQL;

--Update report
CREATE OR REPLACE FUNCTION update_report(
    _id_report smallint,
    _issues text,
    _results text,
    _obstacle text,
    _conclusions text,
    _anexos text,
    _name_user character varying,
    _name_proyect character varying,
    _signature character varying,
    _name_founder character varying,
    _nick_user character varying,
    _id_activity smallint
) RETURNS text
AS $$ BEGIN
    IF _id_report IS NOT NULL THEN
        UPDATE reports SET
            issues = _issues,
            results = _results,
            obstacle = _obstacle,
            conclusions = _conclusions,
            anexos = _anexos,
            name_user = _name_user,
            name_proyect = _name_proyect,
            signature = _signature,
            name_founder = _name_founder,
            nick_user = _nick_user,
            id_activity = _id_activity
        WHERE id_report = _id_report;
        RETURN 'Succsesfuly';
    ELSE RAISE EXCEPTION 'No se pudo actualizar el informe';
    END IF;
END
$$ LANGUAGE plpgSQL;

--Delete report
CREATE OR REPLACE FUNCTION delete_report(_id_report smallint)
RETURNS void
AS $$ BEGIN
	IF _id_report IS NOT NULL THEN
		DELETE FROM reports WHERE id_report = _id_report;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el proyecto';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_report(
    'DDHH, violencia'::text,
    'Jóvenes concientes de sus DDHH'::text,
    'La contínua desinformación de las RRSS'::text,
    'Se deben realizar más capacitaciones sobre RRSS'::text,
    'El link de la foto'::text,
    'Juan Carlos Balderas'::character varying,
    'Por los DDHH de los NNA`s'::character varying,
    'ruta de la firma'::character varying,
    'EDUCO'::character varying,
    'jcbalderas'::character varying,
    '7'::smallint
);
SELECT update_report(
    7::smallint,
    'DDHH, violencia, género'::text,
    'Jóvenes concientes de sus DDHH y Género'::text,
    'La contínua desinformación de las RRSS y FAKE NEWS y DDHH'::text,
    'Se deben realizar más capacitaciones sobre RRSS y DDHH'::text,
    'El link de la foto'::text,
    'Juan Carlos Balderas'::character varying,
    'Por los DDHH de los NNA`s'::character varying,
    'ruta de la firma'::character varying,
    'EDUCO'::character varying,
    'jcbalderas'::character varying,
    '7'::smallint
);
SELECT delete_report (7::smallint);
SELECT * FROM reports;

--QUANTITATIVE
--Create quantitative
CREATE OR REPLACE FUNCTION create_quantitative (
    _achieved smallint,
    _day character varying,
    _sp_female smallint,
    _sp_male smallint,
    _f_female smallint,
    _f_male smallint,
    _na_female smallint,
    _na_male smallint,
    _p_female smallint,
    _p_male smallint,
    _id_activity smallint,
    _nick_user character varying
) RETURNS text
AS $$ BEGIN
    INSERT INTO quantitatives (
        achieved,
        day,
        sp_female,
        sp_male,
        f_female,
        f_male,
        na_female,
        na_male,
        p_female,
        p_male,
        id_activity,
        nick_user
    )
    VALUES (
        _achieved,
        _day,
        _sp_female,
        _sp_male,
        _f_female,
        _f_male,
        _na_female,
        _na_male,
        _p_female,
        _p_male,
        _id_activity,
        _nick_user
    );
    RETURN 'Succesfuly';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'No fue posible crear los datos cuantitativos';
END;
$$ LANGUAGE plpgSQL;

--Update quantitative
CREATE OR REPLACE FUNCTION update_quantitative (
    _id_quantitative smallint,
    _achieved smallint,
    _day character varying,
    _sp_female smallint,
    _sp_male smallint,
    _f_female smallint,
    _f_male smallint,
    _na_female smallint,
    _na_male smallint,
    _p_female smallint,
    _p_male smallint,
    _id_activity smallint,
    _nick_user character varying
) RETURNS text
AS $$ BEGIN
    IF _id_quantitative IS NOT NULL THEN
        UPDATE quantitatives SET 
            achieved = _achieved,
            day = _day,
            sp_female = _sp_female,
            sp_male = _sp_male,
            f_female = _f_female,
            f_male = _f_male,
            na_female = _na_female,
            na_male = _na_male,
            p_female = _p_female,
            p_male = _p_male,
            id_activity = _id_activity,
            nick_user = _nick_user
        WHERE id_quantitative = _id_quantitative;
        RETURN 'Succesfuly';
    ELSE RAISE EXCEPTION 'No se puedo actualizar los datos cuantitativos';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete quantitative
CREATE OR REPLACE FUNCTION delete_quantitative(_id_quantitative smallint)
RETURNS void
AS $$ BEGIN
	IF _id_quantitative IS NOT NULL THEN
		DELETE FROM quantitatives WHERE id_quantitative = _id_quantitative;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el proyecto';
	END IF;
END;
$$ LANGUAGE plpgsql;

--Delete quantitatives
CREATE OR REPLACE FUNCTION delete_quantitatives(_id_activity smallint)
RETURNS void
AS $$ BEGIN
	IF _id_quantitative IS NOT NULL THEN
		DELETE FROM quantitatives WHERE id_quantitative = _id_quantitative;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el proyecto';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_quantitative (
    '50'::smallint,
    '2023-05-30'::date,
    '12'::smallint,
    '5'::smallint,
    '10'::smallint,
    '8'::smallint,
    '5'::smallint,
    '9'::smallint,
    '7'::smallint,
    '4'::smallint,
    '4'::smallint,
    'jcbalderas'::character varying
);
SELECT update_quantitative (
    '7'::smallint,
    '56'::smallint,
    '2023-05-30'::date,
    '12'::smallint,
    '5'::smallint,
    '10'::smallint,
    '8'::smallint,
    '5'::smallint,
    '9'::smallint,
    '7'::smallint,
    '4'::smallint,
    '4'::smallint,
    'jcbalderas'::character varying
);
SELECT delete_quantitative(3::smallint);
SELECT * FROM quantitatives;

--APLICATIONS
--Create application
CREATE OR REPLACE FUNCTION create_application (
    _amount smallint,
    _name_proyect character varying,
    _signature character varying,
    _name_user character varying,
    _nick_user character varying,
    _id_activity smallint
) RETURNS text
AS $$ BEGIN
    INSERT INTO applications (
        amount,
        name_proyect,
        signature,
        name_user,
        nick_user,
        id_activity
    )
    VALUES (
        _amount,
        _name_proyect,
        _signature,
        _name_user,
        _nick_user,
        _id_activity
    );
    RETURN 'Succesfuly';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'No fue posible crear la solicitud de fondos';
END;
$$ LANGUAGE plpgSQL;

--Update application
CREATE OR REPLACE FUNCTION update_application (
    _id_application smallint,
    _amount smallint,
    _name_proyect character varying,
    _signature character varying,
    _name_user character varying,
    _nick_user character varying,
    _id_activity smallint
) RETURNS text
AS $$ BEGIN
    IF _id_application IS NOT NULL THEN
        UPDATE applications SET
            amount = _amount,
            name_proyect = _name_proyect,
            signature = _signature,
            name_user = _name_user,
            nick_user = _nick_user,
            id_activity = _id_activity
        WHERE id_application = _id_application;
        RETURN 'Succsesfuly';
        ELSE RAISE EXCEPTION 'No se pudo actualizar la solicitud de fondos';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete application
CREATE OR REPLACE FUNCTION delete_application(_id_application smallint)
RETURNS void
AS $$ BEGIN
	IF _id_application IS NOT NULL THEN
		DELETE FROM applications WHERE id_application = _id_application;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar la solicitud de fondos';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_application (
    '2500'::smallint,
    'Por los DDHH de los NNA`s'::character varying,
    'ruta de la firma'::character varying,
    'Juan Carlos Balderas'::character varying,
    'jcbalderas'::character varying,
    '7'::smallint
);
SELECT update_application (
    '4'::smallint,
    '2800'::smallint,
    'Por los DDHH de los NNA'::character varying,
    'ruta de la firma'::character varying,
    'Juan Carlos Balderas'::character varying,
    'jcbalderas'::character varying,
    '7'::smallint
)
SELECT delete_application(4::smallint);
SELECT * FROM applications;

--BUDGETS
--Create budget
CREATE OR REPLACE FUNCTION create_budget (
    _quantity smallint,
    _code character varying,
    _description character varying,
    _import_usd smallint,
    _import_bob smallint,
    _id_activity smallint,
    _name_founder character varying,
    _nick_user character varying
) RETURNS text
AS $$ BEGIN
    INSERT INTO budgets (
        quantity,
        code,
        description,
        import_usd,
        import_bob,
        id_activity,
        name_founder,
        nick_user
    )
    VALUES (
        _quantity,
        _code,
        _description,
        _import_usd,
        _import_bob,
        _id_activity,
        _name_founder,
        _nick_user
    );
    RETURN 'Succesfuly';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'No fue posible crear el detalle de la solicitud de fondos';
END;
$$ LANGUAGE plpgSQL;

--Update budget
CREATE OR REPLACE FUNCTION update_budget (
    _id_budget smallint,
    _quantity smallint,
    _code character varying,
    _description character varying,
    _import_usd smallint,
    _import_bob smallint,
    _id_activity smallint,
    _name_founder character varying,
    _nick_user character varying
) RETURNS text
AS $$ BEGIN
    IF _id_budget IS NOT NULL THEN
        UPDATE budgets SET
            quantity = _quantity,
            code = _code,
            description = _description,
            import_usd = _import_usd,
            import_bob = _import_bob,
            id_activity = _id_activity,
            name_founder = _name_founder,
            nick_user = _nick_user
        WHERE id_budget = _id_budget;
        RETURN 'Succsesfuly';
        ELSE RAISE EXCEPTION 'No se pudo actualizar el detalle de la solicitud de fondos';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete budget
CREATE OR REPLACE FUNCTION delete_budget(_id_budget smallint)
RETURNS void
AS $$ BEGIN
	IF _id_budget IS NOT NULL THEN
		DELETE FROM budgets WHERE id_budget = _id_budget;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el detalle de la solicitud de fondos';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_budget (
    '2'::smallint,
    '5201.04.01'::character varying,
    'Transporte'::character varying,
    '0'::smallint,
    '860'::smallint,
    '3'::smallint,
    'EDUCO'::character varying,
    'jcbalderas'::character varying
)
SELECT update_budget (
    '4'::smallint,
    '3'::smallint,
    '5201.04.01.02'::character varying,
    'Transportessss'::character varying,
    '0'::smallint,
    '1500'::smallint,
    '3'::smallint,
    'EDUCO'::character varying,
    'jcbalderas'::character varying
)
SELECT delete_budget(5::smallint)
SELECT * FROM budgets;

--ACCOUNTABILITIES
CREATE OR REPLACE FUNCTION create_accountability (
    _amount smallint,
    _reception character varying,
    _name_founder character varying,
    _name_proyect character varying,
    _signature character varying,
    _name_user character varying,
    _nick_user character varying,
    _id_activity smallint
) RETURNS text
AS $$ BEGIN
    INSERT INTO accountabilities (
        amount,
        reception,
        name_founder,
        name_proyect,
        signature,
        name_user,
        nick_user,
        id_activity
    )
    VALUES (
        _amount,
        _reception,
        _name_founder,
        _name_proyect,
        _signature,
        _name_user,
        _nick_user,
        _id_activity
    );
    RETURN 'Succesfuly';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'No fue posible crear la rendición de cuentas';
END;
$$ LANGUAGE plpgSQL;

--Update accountability
CREATE OR REPLACE FUNCTION update_accountability (
    _id_accountability smallint,
    _amount smallint,
    _reception character varying,
    _name_founder character varying,
    _name_proyect character varying,
    _signature character varying,
    _name_user character varying,
    _nick_user character varying,
    _id_activity smallint
) RETURNS text
AS $$ BEGIN
    IF _id_accountability IS NOT NULL THEN
        UPDATE accountabilities SET
            amount = _amount,
            reception = _reception,
            name_founder = _name_founder,
            name_proyect = _name_proyect,
            signature = _signature,
            name_user = _name_user,
            nick_user = _nick_user,
            id_activity = _id_activity
        WHERE id_accountability = _id_accountability;
        RETURN 'Succsesfuly';
        ELSE RAISE EXCEPTION 'No se pudo actualizar la rendición de cuentas';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete accountability
CREATE OR REPLACE FUNCTION delete_accountability(_id_accountability smallint)
RETURNS void
AS $$ BEGIN
	IF _id_accountability IS NOT NULL THEN
		DELETE FROM accountabilities WHERE id_accountability = _id_accountability;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el detalle de la solicitud de fondos';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_accountability (
    '2800'::smallint,
    '2023-05-28'::character varying,
    'SAIH - Noruega'::character varying,
    'ICT for education and More'::character varying,
    'firma jcbalderasg'::character varying,
    'Juan Carlos Balderas Gamarra'::character varying,
    'jcbalderasg'::character varying,
    '3'::smallint
)
SELECT update_accountability (
    '4'::smallint,
    '5000'::smallint,
    '2023-05-27'::date,
    'EDUCO'::character varying,
    'Por los DDHH de los NNA'::character varying,
    'ruta de la firma'::character varying,
    'Juan Carlos Balderas'::character varying,
    'jcbalderas'::character varying,
    '7'::smallint
)
SELECT delete_accountability(4::smallint);
SELECT * FROM accountabilities;

--SURRENDERS
--Create surrender
CREATE OR REPLACE FUNCTION create_surrender (
    _date_invoice character varying,
    _invoice_number smallint ,
    _code character varying,
    _description text ,
    _inport_usd smallint,
    _inport_bob smallint,
    _id_activity smallint,
    _nick_user character varying
) RETURNS text
AS $$ BEGIN
    INSERT INTO surrenders (
        date_invoice,
        invoice_number,
        code,
        description,
        inport_usd,
        inport_bob,
        id_activity,
        nick_user
    )
    VALUES (
        _date_invoice,
        _invoice_number,
        _code,
        _description,
        _inport_usd,
        _inport_bob,
        _id_activity,
        _nick_user
    );
    RETURN 'Succesfuly';
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE EXCEPTION 'No fue posible crear el detalle de la rendición de cuentas';
END;
$$ LANGUAGE plpgSQL;

--Update surrender
CREATE OR REPLACE FUNCTION update_surrender (
    _id_surrender smallint,
    _date_invoice character varying,
    _invoice_number smallint ,
    _code character varying,
    _description text ,
    _inport_usd smallint,
    _inport_bob smallint,
    _id_activity smallint,
    _nick_user character varying
) RETURNS text
AS $$ BEGIN
    IF _id_surrender IS NOT NULL THEN
        UPDATE surrenders SET
            date_invoice = _date_invoice,
            invoice_number = _invoice_number,
            code = _code,
            description = _description,
            inport_usd = _inport_usd,
            inport_bob = _inport_bob,
            id_activity = _id_activity,
            nick_user = _nick_user
        WHERE id_surrender = _id_surrender;
        RETURN 'Succsesfuly';
        ELSE RAISE EXCEPTION 'No se pudo actualizar el detalle de la rendición de cuentas';
    END IF;
END;
$$ LANGUAGE plpgSQL;

--Delete surrender
CREATE OR REPLACE FUNCTION delete_surrender(_id_surrender smallint)
RETURNS void
AS $$ BEGIN
	IF _id_surrender IS NOT NULL THEN
		DELETE FROM surrenders WHERE id_surrender = _id_surrender;
	ELSE
		RAISE EXCEPTION 'No se pudo eliminar el detalle de la rendición de cuentas';
	END IF;
END;
$$ LANGUAGE plpgsql;

SELECT create_surrender (
    '29-05-2023'::character varying,
    '0002563'::smallint ,
    '5401.01.12'::character varying,
    'Refrigerios'::text ,
    '0'::smallint,
    '230'::smallint,
    '3'::smallint,
    'jcbalderas'::character varying
)
SELECT update_surrender (
    '4'::smallint,
    '30-05-2023'::character varying,
    '0035'::smallint ,
    '5401.01.12'::character varying,
    'Refrigerios y transportessssssss'::text ,
    '0'::smallint,
    '23000'::smallint,
    '3'::smallint,
    'jcbalderas'::character varying
)
SELECT delete_surrender(4::smallint);
SELECT * FROM surrenders;


--AUDITS
SELECT * FROM audit_profile;
SELECT * FROM audit;
SELECT * FROM audit_profile