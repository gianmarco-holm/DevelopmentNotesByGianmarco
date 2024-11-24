# PostgreSQL

## 1. Configurar PostgreSQL

### 1.1. Que es PostgreSQL

- Motor de base de datos: Un motor de base de datos es un software que se encarga de gestionar el almacenamiento, recuperación y manipulación de datos en una base de datos. Proporciona funcionalidades para crear, modificar y consultar datos de manera eficiente y segura.

- Base de datos: Una base de datos es un conjunto estructurado de datos organizados para almacenar, administrar y recuperar información de manera eficiente. Puede contener tablas, índices, vistas y otros objetos que permiten almacenar y manipular datos de manera estructurada.

- PostgreSQL: PostgreSQL es un sistema de gestión de bases de datos relacional (RDBMS es decir es un motor de base de datos) de código abierto y gratuito. Es uno de los sistemas de bases de datos más avanzados y potentes disponibles, conocido por su robustez, escalabilidad y capacidad para manejar grandes volúmenes de datos. PostgreSQL soporta una amplia gama de características avanzadas, incluyendo consultas complejas, transacciones ACID, integridad referencial, procedimientos almacenados y funciones definidas por el usuario, entre otras.

- ACID: ACID es un acrónimo que se refiere a las propiedades fundamentales de las transacciones en una base de datos:
  - Atomicidad: Garantiza que todas las operaciones de una transacción se completen con éxito o que ninguna de ellas se realice. Si una operación falla, la transacción se revierte completamente.
  - Consistencia: Garantiza que una transacción lleva la base de datos de un estado válido a otro estado válido. Cada transacción debe preservar la integridad y coherencia de los datos.
  - Aislamiento: Garantiza que los efectos de una transacción no sean visibles para otras transacciones hasta que se haya completado. Cada transacción se ejecuta como si fuera la única en el sistema, aislada de las demás transacciones.
  - Durabilidad: Garantiza que los cambios realizados por una transacción persistan incluso en caso de fallo del sistema. Una vez que una transacción se ha confirmado, sus cambios deben ser permanentes y accesibles incluso en el caso de un fallo del sistema.

### 1.2. Instalación y configuración de la Base de Datos

Puedes instalarlo normal o usando docker como muestra este archivo: [enlace](docker-compose.yml)

### 1.3. Interacción con Postgres desde la Consola

1. ENTRAR A LA CONSOLA DE POSTGRES `psql -U postgres -W`
2. VER LOS COMANDOS DE POSTGRES `\?`
3. LISTAR TODAS LAS BASES DE DATOS `\l`
4. VER LAS TABLAS DE UNA BASE DE DATOS `\dt`
5. CAMBIAR A OTRA BD `\c nombre_BD`
6. DESCRIBIR UNA TABLA `\d nombre_tabla`
7. VER TODOS LOS COMANDOS SQL `\h`
8. VER COMO SE EJECTUA UN COMANDO SQL `\h nombre_de_la_funcion`
9. CANCELAR TODO LO QUE HAY EN PANTALLA `Ctrl + C`
10. VER LA VERSION DE POSTGRES INSTALADA, IMPORTANTE PONER EL ';' `SELECT version();`
11. VOLVER A EJECUTAR LA FUNCION REALIADA ANTERIORMENTE `\g`
12. INICIALIZAR EL CONTADOR DE TIEMPO PARA QUE LA CONSOLA TE DIGA EN CADA EJECUCION ¿CUANTO DEMORO EN EJECUTAR ESA FUNCION? `\timing`
13. LIMPIAR PANTALLA DE LA CONSOLA PSQL `Ctrl + L`

### 1.4. Archivos de Configuración

A través de la sentencia ``show config_file`` se nos muestra donde están los archivos de configuración. En mi caso la ruta es: /Library/PostgreSQL/12/data/postgresql.conf

Algo a tener en cuenta es que en la ruta por default de instalación no se puede acceder debido a falta de permisos. Para ingresar basta con un:

``sudo cd /Library/PostgreSQL/12/data/``

1. Postgresql.conf: Configuración general de postgres, múltiples opciones referentes a direcciones de conexión de entrada, memoria, cantidad de hilos de pocesamiento, replica, etc.

2. pg_hba.conf: Muestra los roles así como los tipos de acceso a la base de datos.

3. pg_ident.conf: Permite realizar el mapeo de usuarios. Permite definir roles a usuarios del sistema operativo donde se ejecuta postgres.

### 1.5. Tipos de datos

Principales:

- Numéricos
- Monetarios
- texto
- Binarios
- Fecha / Hora
- Boolean
- Especiales:

Geométricos y propios de portgreSQL:

- Dirección de Red
- Texto tipo bit
- XML, JSON
- Arreglos

### 1.6. Jerarquía de Bases de Datos

Toda jerarquía de base de datos se basa en los siguientes elementos:

Servidor de base de datos: Computador que tiene un motor de base de datos instalado y en ejecución.

Motor de base de datos: Software que provee un conjunto de servicios encargados de administrar una base de datos.

Base de datos: Grupo de datos que pertenecen a un mismo contexto.

Esquemas de base de datos en PostgreSQL: Grupo de objetos de base de datos que guarda relación entre sí (tablas, funciones, relaciones, secuencias).

Tablas de base de datos: Estructura que organiza los datos en filas y columnas formando una matriz.

## 2. Gestión de información en la base de datos

### 2.1. Particiones

Cuando se realiza una consulta a una tabla segpun una condición, este motor busca en toda la tabla y cuando tiene muchos datos puede haber problema con el rendimiento, es por eso que se particiona la tabla, un ejemplo es particionar por fecha para asi buscar en la tabla particionada y tener un mayor rendimiento.

Forma 1:

1. Cuando creas una tabla tienes que colocar `Nombre: nombre_tabla` y además colocar la opcion de `tabla particionada`, creas las columnas, .
2. Luego te vas a la pestaña `Particiones`, en clave de particiones colocas la columna que quieres para hacer los rangos, en mi caso fecha, en sql sería lo siguiente.

    ```sql
    CREATE TABLE public."Estudiante"
        (
            nombre character varying,
            direccion text,
            fecha_matricula date
        ) PARTITION BY RANGE (fecha_matricula);
    ```

3. Cuando insertemos datos no nos va a dejar porque todavía no hay datos y no hay particiones, pra crear una partición sería lo siguiente.

    ```sql
    CREATE TABLE fecha_matricula_enero PARTITION OF Estudiante FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');
    ```

Forma 2:

```sql
    DROP TABLE IF EXISTS public."ventas";

    CREATE TABLE ventas (
        id_venta SERIAL,
        descripcion_venta TEXT,
        fecha_venta DATE,
        vendedor TEXT,
        monto_venta NUMERIC,
        PRIMARY KEY (id_venta, fecha_venta) -- Asegúrate de incluir la columna de particionamiento en la clave primaria
    ) PARTITION BY RANGE (fecha_venta);

    -- Paso 2: Crear las particiones para cada mes
    CREATE TABLE ventas_enero PARTITION OF public."ventas" 
        FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');
    CREATE TABLE ventas_febrero PARTITION OF public."ventas" 
        FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');
    -- ... Repite este paso para los demás meses ...

    -- Paso 3: Cargar datos en las particiones
    INSERT INTO ventas_enero SELECT * FROM ventas WHERE fecha_venta >= '2024-01-01' AND fecha_venta < '2024-02-01';
    INSERT INTO ventas_febrero SELECT * FROM ventas WHERE fecha_venta >= '2024-02-01' AND fecha_venta < '2024-03-01';
    -- ... Repite este paso para los demás meses ...
```

> Las consultas de datos lo puedes realizar directamente a la tabla ventas y postgresql enrutara a la partición indicada pero para un mejor rendimiento tambien puedes hacerla directamente a la partición.

### 2.2. Creación de Roles

Que puede hacer un ROLE:

- Crear y Eliminar
- Asignar atributos
- Agrupar con otros roles
- Roles predeterminados

Estos roles lo crearemos con la consola

```sql
-- Ver las funciones del comando CREATE ROLE (help)
\h CREATE ROLE;

-- Creamos un ROLE (consultas -&gt; lectura, insertar, actualizar)
CREATE ROLE usuario_consulta;

-- Mostrar todos los usuarios junto a sus atributos
\dg

-- Agregamos atributos al usuario o role
ALTER ROLE  usuario_consulta WITH LOGIN;
ALTER ROLE  usuario_consulta WITH SUPERUSER;
ALTER ROLE  usuario_consulta WITH PASSWORD'1234';

-- Elimanos el usuario o role
DROP ROLE usuario_consulta;

-- La mejor forma de crear un usuario o role por pgadmin
CREATE ROLE usuario_consulta WITH
  LOGIN
  NOSUPERUSER
  NOCREATEDB
  NOCREATEROLE
  INHERIT
  NOREPLICATION
  CONNECTION LIMIT -1
  PASSWORD'1234';

--Para obtorgar privilegios a nuestro usuario_consulta
GRANT INSERT, SELECT, UPDATE ON TABLE public.estacion TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.pasajero TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.trayecto TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.tren TO usuario_consulta;
GRANT INSERT, SELECT, UPDATE ON TABLE public.viaje TO usuario_consulta;
```

- LOGIN: Permite al usuario iniciar sesión en la base de datos.
- NOSUPERUSER: Evita que el usuario tenga privilegios de superusuario, lo que limita su capacidad para realizar ciertas operaciones de administración.
- NOCREATEDB: Evita que el usuario tenga permiso para crear nuevas bases de datos.
- NOCREATEROLE: Evita que el usuario tenga permiso para crear nuevos roles de usuario.
- INHERIT: Permite que el rol de usuario herede los permisos de los roles de usuario a los que está asignado.
- NOREPLICATION: Indica que el usuario no tiene permisos para configurar la replicación de datos.
- CONNECTION LIMIT -1: Establece un límite ilimitado en el número de conexiones simultáneas que el usuario puede tener.
- PASSWORD '1234': Establece una contraseña para el usuario. En este caso, la contraseña es "1234".

> Cuando creas un usuario el peude acceder a postgresql pero no a la base de datos, para darle acceso a las tablas de la base de datos en pgadmin, tienes que entrar a `tables > grant wizard o asistente de permisos> escoger > entregas privilegios`, despues de esto el usuario va a poder realizar lso privilegios como insert, select y update.

### 2.3. Llaves foraneas

```sql
-- Agregamos llave foranea de id_estacion a la tabla trayecto
ALTER TABLE public.trayecto
    ADD CONSTRAINT trayecto_estacion_fkey FOREIGN KEY (id_estacion)
    REFERENCES public.estacion (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
    NOT VALID;
```

### 2.3. Inserción y consulta de datos

Para insertar datos en una tabla dependiente tenemos que asegurarnos en la tabla independiente este el id correcto.

## 3. Consultas avanzadas

### 3.1. Cruzar tablas: SQL JOIN

Este tema ya esta msotrado en [Fundamentos de base de datos](fundamentos_bd.md)

### 3.2. Funciones Especiales Principales

#### ON CONFLICT DO

Esta cláusula se usa en las instrucciones INSERT y UPDATE para manejar conflictos de clave única. Puedes especificar acciones que se realizarán en caso de que ocurra un conflicto, como actualizar una fila existente o ignorar la nueva fila.

```sql
-- Para actualizar si hay conflicto
INSERT INTO tabla (id, nombre)
VALUES (1, 'Ejemplo')
ON CONFLICT (id) DO UPDATE SET nombre = EXCLUDED.nombre;

-- Para ignorar la nueva fila
INSERT INTO tabla (id, nombre)
VALUES (1, 'Ejemplo')
ON CONFLICT DO NOTHING
```

#### RETURNING

Esta cláusula se utiliza para devolver los valores de las filas afectadas por una operación INSERT, UPDATE, o DELETE. Es útil cuando necesitas recuperar los valores de las filas que han sido modificadas.

```sql
-- Ejemplo de uso de RETURNING en una instrucción INSERT
INSERT INTO tabla (nombre) VALUES ('Ejemplo') RETURNING id, nombre;
-- para verlo todo se coloca despues del returning *
```

#### LIKE / ILIKE

Estos operadores se utilizan en las cláusulas WHERE para realizar comparaciones de patrones en cadenas de texto. LIKE realiza una coincidencia de patrones sensible a mayúsculas y minúsculas, mientras que ILIKE realiza una coincidencia de patrones insensible a mayúsculas y minúsculas.

```sql
-- Ejemplo de uso de LIKE en una instrucción SELECT
SELECT * FROM tabla WHERE columna LIKE '%patron%';

-- Ejemplo de uso de ILIKE en una instrucción SELECT
SELECT * FROM tabla WHERE columna ILIKE '%patron%';
```

#### IS / IS NOT

Estos operadores se utilizan para verificar si un valor es igual a NULL o no es igual a NULL.

```sql
-- Ejemplo de uso de IS en una instrucción SELECT
SELECT * FROM tabla WHERE columna IS NULL;

-- Ejemplo de uso de IS NOT en una instrucción SELECT
SELECT * FROM tabla WHERE columna IS NOT NULL;
```

### 3.3. Funciones Especiales Avanzadas

#### COALESCE

Esta función devuelve el primer valor no nulo de una lista de argumentos.

```sql
-- Ejemplo de uso de COALESCE
SELECT COALESCE(columna1, columna2, 'No aplica') AS valor_no_nulo
FROM tabla;
```

#### NULLIF

Esta función devuelve NULL si los dos argumentos son iguales; de lo contrario, devuelve el primer argumento.

```sql
-- Ejemplo de uso de NULLIF
SELECT NULLIF(columna1, columna2) AS resultado
FROM tabla;
```

#### GREATEST

Esta función devuelve el mayor valor de una lista de argumentos.

```sql
-- Ejemplo de uso de GREATEST
SELECT GREATEST(columna1, columna2, columna3) AS mayor_valor
FROM tabla;
```

#### LEAST

Esta función devuelve el menor valor de una lista de argumentos.

```sql
-- Ejemplo de uso de LEAST
SELECT LEAST(columna1, columna2, columna3) AS menor_valor
FROM tabla;
```

#### Bloques anónimos

En PostgreSQL, los bloques anónimos no están disponibles como en algunos otros sistemas de bases de datos. Sin embargo, puedes usar bloques DO para ejecutar una serie de sentencias SQL.

```sql
-- Ejemplo de uso de un bloque DO anónimo
DO $$
DECLARE
    variable_entera INT := 5;
BEGIN
    RAISE NOTICE 'El valor de la variable es %', variable_entera;
END;
$$;
```

### 3.4. Vistas

1. Vista volatil: Tengo la información actualizada
2. Vista materializada: La información aparece tal cual como la dejaste, no se actualzia

Para ello se puede usar la msima interfaz de pgadmin o se puede crear con sql

```sql
-- Vista volatil
CREATE OR REPLACE VIEW vista_volatil AS
SELECT columna1, columna2
FROM tabla
WHERE condicion;

-- Vista materializada
CREATE MATERIALIZED VIEW vista_materializada AS
SELECT columna1, columna2
FROM tabla
WHERE condicion;

-- Refrescar vista materializada
REFRESH MATERIALIZED VIEW vista_materializada;
```

### 3.5. PL/SQL

PL o procedimientos almacenados, nos ayudan a crear codigos directamente a la base de datos.

```sql
CREATE OR REPLACE FUNCTION consulta_usuarios()
-- si no deseas retornar nada puedes colocar void en lugar de integer
RETURNS integer
LANGUAGE plpgsql
AS $BODY$
DECLARE
    rec pasajero%ROWTYPE;
    contador integer := 0;
BEGIN
    --recorre la tabla pasajero y guarda cada fila en la variable rec
    FOR rec IN SELECT * FROM pasajero LOOP 
        RAISE NOTICE 'id: %, Nombre: %', rec.id, rec.nombre;
        contador := contador + 1;
    END LOOP;

    RAISE NOTICE 'Cantidad de registros: %', contador;
    RETURN contador;
END
$BODY$;
```

### 3.6. Triggers

Son acciones que se lanzan cuando sucede un insert, update o delete.

Crearemos un ejemplo de ejecutando una PL cada vez que se inserte un registro.

```sql
-- tabla de ejemplo
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    salario NUMERIC(10, 2)
);

-- funcion plpgsql
CREATE OR REPLACE FUNCTION mostrar_cambios()
RETURNS TRIGGER AS
$$
BEGIN
    RAISE NOTICE 'Registro actualizado:';
    RAISE NOTICE 'ID antiguo: %, Nombre antiguo: %, Salario antiguo: %',
                 OLD.id, OLD.nombre, OLD.salario;
    RAISE NOTICE 'ID nuevo: %, Nombre nuevo: %, Salario nuevo: %',
                 NEW.id, NEW.nombre, NEW.salario;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- creacion de trigger
CREATE TRIGGER tr_actualizacion_empleados
AFTER UPDATE ON empleados
FOR EACH ROW
EXECUTE FUNCTION mostrar_cambios();
-- si quieres que el trigger se ejecute antes de la operacion cambiar
-- after update por BEFORE UPDATE
```

## 4. Integrar bases de datos con servicios externos

### 4.1. Simulando una conexión a Bases de Datos remotas

```sql
-- 1. Crear la extensión
CREATE EXTENSION dblink;

-- 2. Realizar la conexión remota
SELECT * FROM vip
JOIN 
dblink('dbname=transporte
  port=5432
  host=127.0.0.1
  user=xxxxxxx
  password=xxxxxxxxxxxx',
'SELECT id, name, address, birthdate FROM passenger;')
AS remote_passenger(id INTEGER, name CHARACTER VARYING, address CHARACTER VARYING, birthdate DATE)
USING(id);
-- using es como usar ON (passenger.id = datos_remotos.id);
```

### 4.2. Transacciones Begin, Commit y Rollback

Begin indica que tenemos que hacer lo siguiente en una sola transacción, commit es que si sale todo bien guarde todos los cambios y rollback es que si algo fallo rechase toda la transacción.

Para poder ejecutar este codigo se desactiva el auto commit de pgadmin que esta en la parte de arriba, al lado del boton de excute script

```sql
-- creamos una tabla de ejemplo
CREATE TABLE cuentas (
    n_cuenta INT PRIMARY KEY,
    nombre VARCHAR(100),
    balance NUMERIC(10, 2)
);

-- Desactiva el autocommit en tu cliente (como pgAdmin) antes de ejecutar este código.

-- Comenzamos la transacción
BEGIN;

-- Actualizamos el saldo de dos cuentas
UPDATE cuentas SET balance = balance - 100.00 WHERE n_cuenta = 0127365;
UPDATE cuentas SET balance = balance + 100.00 WHERE n_cuenta = 0795417;

-- Confirmamos que todas las sentencias son correctas
COMMIT;

-- Si algo falla, ejecutamos ROLLBACK para deshacer la transacción
-- ROLLBACK;
```

### 4.3. Otras Extensiones para Postgres

Estas extensiones se descargan en el momento de la instalación pero no estan activa, la documentación de las extensiones se encuentran en [este documento](https://www.postgresql.org/docs/11/contrib.html).

```sql
CREATE EXTENSION fuzzystrmatch;

-- Nos muestra la cantidad de letras que debemos cambiar para que sean iguales
SELECT levenshtein ('oswaldo', 'osvaldo');

-- Devuelve entre 0 a 4, difference escucha las dos palabras en ingles
-- y determina que tan iguales suenan, retornando 4 cuando  suenan igual
SELECT difference('oswaldo', 'osvaldo');
```

## 5. Implementar mejores prácticas

### 5.1. Backups y Restauración

1. pg_dump: para hacer una copia de seguridad

    > Click derecho en la base de datos > backup > Format[custom(un formato solo para postgresql y pgadmin y el que tiene un mayor rendimiento), tar(archivo comprimido), plain(texto plano como sql), directory(estructura sin comprimir)] > En opciones de dump > en section [ podemos colocar datos antes de ser insertado o despues, lo recomendable es colocar "Data activado"] > en type of objects [podemos elegir si queremos solo el esquema, o solo la data o los dos con Blobs, recomendable blobs]

2. pg_restore: para realizar una restauración

    > Click derecho a la base de datos > Restore > elegimos el archivo.

### 5.2. Mantenimiento

PostgreSQL ya realiza un mantenimiento liviando en segundo plano a nuestra base de datos, un mantenimiento es limpiar las filas y columnas que ya no usamos de nuestro disco para optimizar el rendimiento. Luego tenemos un segundo nivel que bloquea todas las tablas para hacer la limpieza y luego las desbloquea otra vez, este mantenimiento lo hacemos nosotros.

> Para ingresar a la interface se tiene que hacer click derecho en la tabla o en lka base de datos y luego Maintenance

- Vacuum: La más importante, con tres opciones, Vacuum, Freeze y Analyze.
  - Full: la tabla quedará limpia en su totalidad, pero, en el proceso congelara todas las tablas.
  - Freeze: Realiz auna limpieza total, y nos da la opción de decidir si bloqueamos las tablas o no
  - Analyze: Solo revisa la tabla y me indica si esta mal o esta bien.

Analyze: No hace cambios en la tabla. Solo hace una revisión y la muestra.

Reindex: Aplica para tablas con numerosos registros con indices, como por ejemplo las llaves primarias.

Cluster: Especificamos al motor de base de datos que reorganice la información en el disco.

> Es recomendable no hacer estas limpieza y dejarlo qu elo haga el mismo postgreSQL en segundo plano.

### 5.3. Introducción a Réplicas

- Son mecánismos que permiten evitar problemas de entrada y salida en las bases de datos, normalmente ocurre cuando son muchas transacciones por segunda, ya que la base de datos o lee o escribe.
- "Existen 2 tipos de personas, los que ya usan réplicas y los que las van a usar..."
- - Piensa siempre en modo réplica.
- A medida que la DB crece encontraremos limitaciones físicas y de electrónica. si la DB aumenta tanto su tamaño, las limitaciones serán de procesamiento, RAM, almacenamiento.
- Hemos visto que las consultas en local son muy rápidas, sin embargo, cuando la aplicación ha sido desplegada pueden ocurrir multiples peticiones de lectura y escritura. Todos los motores de DB pueden hacer una ejecución a la vez, por lo que recibir tantas peticiones de consulta al mismo tiempo puede hacer que regresar una consulta se demore demasiado y eso puede ser catastrófico, pero las réplicas son la solución a este tipo de problemas.
- ¿Cuál es la estrategia? Tener una base de datos principal donde se realizan todas las modificaciones, y una base de datos secundaria dónde se realiza las lecturas. Separar las tareas es altamente beneficioso en cuanto al rendimiento de la aplicación, así, cuando se modifica una DB automáticamente se lleva el cambio a la DB de lectura. Todo lo que hay que hacer es configurar 2 servidores de postgres, uno como maestro y otro como esclavo. Se debe modificar la aplicación para que todas las modificaciones se hagan sobre el maestro y la lectura sobre la replica, o la DB en caliente. Es imposible realizar cambios en la DB de réplica.

### 5.4. Implementación de Réplicas en Postgres

Simulamos una replica con docker en este [articulo](https://platzi.com/tutoriales/1480-postgresql/6559-implementacion-de-replicas-en-postgres-con-docker-2/).

### 5.5. Otras buenas prácticas

Cuando se vuelve lenta la inserción o lectura de los datos, podemos ir a la solución de particiones, luego de replicas y otra solución es el renombre de tablas.

> Para realizar este metodo se hace lo siguiente:
> Tabla-para-consolidar-informacion
> Tabla-de-escritura-de-datos
> Tabla-con-el-mismo-esquema-que-de-escritura-de-datos
> esta tabla Tabla-con-el-mismo-esquema-que-de-escritura-de-datos se cambia a este nombre Tabla-de-escritura-de-datos
> Y esta tabla Tabla-de-escritura-de-datos se cambia a Tabla-antigua
> luego se extrae la información de Tabla-antigua y se coloca Tabla-para-consolidar-informacion
> para mas detalle es el siguiente [artículo](https://static.platzi.com/media/public/uploads/cambiar-nombres-de-tablas-y-particiones_32ca477a-a619-491e-a42d-aaa94dec5abd.pdf).
