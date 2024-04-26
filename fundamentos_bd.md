# Fundamentos de Bases de Datos

Las bases de datos entran cuando hacemos la transición a medios digitales.

**Tipos de bases de datos:**

Relacionales: En la industria hay varias compañías dedicadas a ser manejadoras de bases de datos relacionales como SQL Server, Oracle, MariaDB, entre otras.
No relacionales: Todavía están avanzando y existen ejemplos muy distintos como cassandra, elasticsearch, neo4j, MongoDB, entre otras.

Servicios:

- Auto administrados: Es la base de datos que instalas tú y te encargas de actualizaciones, mantenimiento, etc.
- Administrados: Servicios que ofrecen las nubes modernas como Azure y no debes preocuparte por mantenimiento o actualizaciones.

## 1. Introducción a las bases de datos relacionales

### 1.1. Historia de las bases de datos relacionales

Las bases de datos surgen de la necesidad de conservar la información más allá de lo que existe en la memoria RAM.

Las bases de datos basadas en archivos eran datos guardados en texto plano, fáciles de guardar pero muy difíciles de consultar y por la necesidad de mejorar esto nacen las bases de datos relacionales. Su inventor Edgar Codd dejó ciertas reglas para asegurarse de que toda la filosofía de las bases de datos no se perdiera, estandarizando el proceso.

### 1.2. Qué son entidades y atributos

En bases de datos, una entidad es la representación de un objeto o concepto del mundo real que se describe en una base de datos. Las entidades se describen en la estructura de la base de datos empleando un modelo de datos.

#### 1.2.1. ¿Qué es una entidad?

Una entidad es algo similar a un objeto (programación orientada a objetos) y representa algo en el mundo real, incluso algo abstracto. Tienen atributos que son las cosas que los hacen ser una entidad y por convención se ponen en plural.

Ejemplo de entidad en bases de datos

En la imagen puedes observar como ejemplo que la enidad Laptops posee diferentes atributos como colo, pantalla, año, modelo, etc.

![ejemplo de entidad.png](./images/ejem_entidad.webp)

#### 1.2.2. ¿Qué es un atributo?

Son las características o propiedades que describen a la entidad (se encierra en un óvalo). Los atributos se componen de:

Los atributos compuestos son aquellos que tienen atributos ellos mismos.

Los atributos llave son aquellos que identifican a la entidad y no pueden ser repetidos. Existen:

- Naturales: son inherentes al objeto como el número de serie
- Clave artificial: no es inherente al objeto y se asigna de manera arbitraria.

**Tipos de entidades:**

- Entidades fuertes: son entidades que pueden sobrevivir por sí solas.

- Entidades débiles: no pueden existir sin una entidad fuerte y se representan con un cuadrado con doble línea.

Identidades débiles por identidad: no se diferencian entre sí más que por la clave de su identidad fuerte.
Identidades débiles por existencia: se les asigna una clave propia.

**Cómo representar las entidades en bases de datos:**

Existen varios tipos de notaciones para los modelos entidad relacionamiento. Chen es uno de los más utilizados para diagramar lógicamente la base de datos. Aquí te mostramos un ejemplo.

![ejemplo-notacion-chen-entidades.png](./images/notacion_chen.webp)