
Respaldar BD postgres:
pg_dump -U usuario -W -h host basename > basename.sql
pg_dump -U postgres -W -h localhost mediappbd7 > mediaappbd7_backup.sql


Restaurar BD Postgres
psql -U username -W -h host basename < basename.sql




Vamos a explicar el comando al completo:

-U => Se refiere al Usuario, en este caso puede ser el usuario propietario de la base de datos o el usuario postgres

-W => Con este parámetro conseguiremos que nos solicite el password del usuario antes especificado

-h => Con este indicamos cuál es el servidor PostgreSQL al que nos conectaremos para obtener nuestro dump, 
		si estamos local podemos colocar localhost sino ponemos la IP del servidor PostgreSQL

basename => Este es el ultimo parámetro realmente en esta linea de comando, por esa razon no tiene alguna letra que indique 
			que el siguiente parámetro es el nombre de la base de datos

> basename.sql => Esta parte en realidad solo indica que la salida de nuestro comando pg_dump la guarde en un archivo basename.sql