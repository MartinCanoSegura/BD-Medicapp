CREATE OR REPLACE FUNCTION fn_sequence (paciente INT)
	RETURNS TABLE (
		ultimo_r INT
	)
	AS '
		declare var_r record;		
		BEGIN
			IF ( select max(id_signos) as ultimo from signos where id_paciente = paciente ) IS NOT null
			THEN
			 FOR var_r IN ( select max(id_signos) as ultimo from signos where id_paciente = paciente )
			   loop
				  ultimo_r := var_r.ultimo;
				  return next;
			   end loop;
			ELSE
			 FOR var_r IN (SELECT 0 as aultimo)
			     loop
				ultimo_r := 1;
				return next;
			     end loop;
			END IF;
	       
	END; 
	'
	LANGUAGE 'plpgsql'