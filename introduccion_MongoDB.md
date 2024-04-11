# Introducción a MongoDB

## 1. Fundamentos de MongoDB

### 1.1. ¿Qué es Mongo DB?

MongoDB es parte de la familia documentales de bases de datos NoSQL y es una forma de alamacenar datos para lectura y escritura con una forma particular de guardar los datos.

### 1.2. Bases de datos NoSQL

Son las bases de datos no relacionales:

1. **Documentales:** En estas bases de datos se empareja cada clave con una estructura de datos compleja que se denomina 'documento'.

    Aca tenemos:

    - Cloud  Firestore
    - Couchbase
    - mongoDB

2. **Grafos:** Se utilizan para almacenar información sobre redes de datos, como las conexiones sociales.

    Aca tenemos:

    - neo4j

3. **Clave - Valor:** Son las bases de datos NoSQL más simples. Cada elemento de la base de datos se almacena
como un nombre de atributo (o «clave»), junto con su valor.

    Aca tenemos:

    - redis

4. **Orientadas a Columnas:** Estas bases de datos, como Cassandra o HBase, permiten realizar consultas en grandes
conjuntos de datos y almacenan los datos en columnas, en lugar de filas.

    Aca tenemos:

    - Cassandra

#### Escalamiento

El escalamiento es una de las características más importantes que tienen las bases de datos NoSQL.

> Recordemos que hay dos tipos de escalamientos:
>
> ✨Escalamiento Vertical: Es cuando se aumenta las características de una maquina para aumentar su rendimiento.
>
> ✨Escalamiento Horizonal: Aca se copia la maquina en varias maquinas, lo que asegura la alta disponibilidad, tener sistemas de replicación, o tener un sistema que responda en simultaneo.
>
> 👉🏻 Tambien se sabe que el escalamiento vertical es más facil de implementar pero a lo largo del tiempo es más costoso, sin embargo, el escalamiento horizontal es más dificil de implementar, pero tiene un menor costo a lo largo del tiempo.

#### Replicación

Es cuando distribuimos nuestra base de datos en varios nodos haciendo escalamiento horizontal, en donde el punto central load balancer, asigna las consultas a los nodos.

### 1.3. ¿Qué son los documentos y colecciones?

1. **Document:** Una forma de organizar y almacernar información con un conjunto de pares clave-valor

    Ejemplos:

    ```JSON
    {
        name: "sue",
        age:26,
        status: "A",
        groups: ["newa", "sports"],
    }
    ```

    ```JSON
    {
        " _ id" : "5c8eccc1caa187d17ca6ed16",
        "City " : "ALPINE" ,
        "zip" : "35014",
        "loc" : {
            "y" : 33.331165,
            "x" : 86.238934
        },
        "pop" : 3062,
        "state" : "AL"
    }
    ```

    👉🏻 Esto nos ayuda a que si debemos agregar un campo mas, con solo agregarlo al elemento sería suficiente, en cambio en una base de dato relacional tendriamos que crear una nueva columna teniendo muchos valores faltantes.

2. **Colecciones:** Es donde se almacena documentos que usualmente comparten campos comunes entre sí.

### 1.4. Creando tu primer BD

Vamos a usar un servicio en la nube llamado Mongo Atlas y además vamos a realizarlo de manera local, Mongo Atlas ya tiene la funcionalidad de clusters, en cambio de manera local sería complejo lograrlo.

#### Free cluster

- 512MB to 5GB of storage.
- Shared RAM.
- Upgrade to dedicated clusters for full functionality.
- No credit card required to start.

#### Cluster

Dentro de las Tecnologías de la Información (TI), Cluster significa integrar dos o más computadoras para que trabajen simultáneamente en el procesamiento de una determinada tarea. . Saber qué es un Cluster consiste en entender que se trata de la conexión entre dos o más computadoras con el propósito de mejorar el rendimiento de los sistemas en la ejecución de diferentes tareas. . En el Cluster, cada computadora se llama “nodo”, y no hay límites sobre cuántos nodos se pueden interconectar. . Con esto, las computadoras comienzan a actuar dentro de un solo sistema, trabajando juntas en el procesamiento, análisis e interpretación de datos e información, y/o realizando tareas simultáneas.

#### Pasos para crear una base de datos

- Ingresar y regsitrarse en https://www.mongodb.com/es
- En MongoAtlas hay Organizaciones que esta en la parte superior izquierda, y estas pueden tener muchos proyectos, y cada proyecto puede tener varias bases de datos.
- Escogemos la organización y proyecto y creamos nuestro cluster
- En este caso escogí M0 o pan free, le coloque como nombres Cluster0, proveedore de nube AWS, region Sao Paulo, luego agregamos el nombre de usuario y contraseña (holm0101).
- En proveedor sobre donde quiero usar esta base de datos, en este caso escogí AWS.
- Escogo la region de la nube.
- Coloco el nombre del cluster.
- Crear cluster.
- Coloco el usuario y contraseña para la base de datos.
- En direcciones IP coloco 0.0.0.0/0 y en descripción localhost ya que me voy a conectar desde el local host.
- Ahora vamos a cargar los dataset que tienen por defecto Mongo Atlas, para ello, vamos a Database, luego en cluster le damos los 3 puntos y colocamos ``Load Sample Dataset``

### 1.5. Usando Mongo Compass

Es una interfaz visual para hacer consulta y conectarnos a nuestra base de datos, y tambien nos sirve para hacer conexión a bases de datos en local.

#### Pasos para usar Mongo Compass

- Primero en Database se da click en ``Conectar > Compass > Descargar la app > copiar la url > abres el app > pegas la url > colocas la contraseña > conectar``
- Con esto ya nos podemos conectar a un entorno gráfico y realizar consultas, por ejemplo al entrar a la bd Zip, vemos que hay 29470 documentos, y si en busqueda colocamos {state: 'NY'} para sbaer cuando documentos hay de Nueva york sale que hay mas de 1500.

### 1.6. Mongo en VSCode

- Para poder usar MongoDB en Vscode se debe instalar la siguiente extensión `MongoDB for VS Code`
- Luego te va aparecer un simbolo a la izquierda en forma de una hoja.
- Le da en `Add Connection`
- Luego `Connection String` y se coloca el enlace de Mongo Atlas o detu base de datos local, tal cual en compass
- Puedes crear scripts, para ello se tendría que crear un archivo con la extension .mongodb

```js
// En mi caso llame al archivo query.mongodb
// Al colocar esta extensión te aparece el simbolo de run en la parte superior derecha
    use('sample_training')

    db.zips.find({'state': 'NY'}).count()
```

### 1.6. Instalando Docker

Según el sistema operativo que utilices puede variar la instalación, así que a continuación te daré las indicaciones base para la instalación según tu sistema operativo:

#### Instalación en Windows con WSL (Recomendada) 🐧

Debes descargar el instalador desde la página de [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/).

Cuando ya tienes instalado Docker Desktop dentro de tus programas debes abrirlo y debes asegurarte que la opción “Use the WSL 2 based engine” está habilitada:

Luego en la sección “Resources > WSL Integration”, asegurarate que la opcion “Enable integration with my default WSL distro”, este habilitada

Puedes ver más detalles de Docker con WLS 👉 Docker Desktop WSL 2 backend

#### Instalación en Windows 🪟

Debes descargar el instalador desde la página de Docker for Windows.

Cuando ya tienes instalado Docker Desktop dentro de tus programas, una de las cosas que debes tener en cuenta en la instalación con Windows es que debes contar con Windows 10 de 64 Bits o superior y debes habilitar el Hyper-V de Windows.

Si quieres conocer los detalles, aquí te dejo el detalle como habilitar Hyper-V desde la Interfaz de Windows

#### Instalación en macOS 🍎

En Mac tienes dos opciones. Todo dependerá si tienes los nuevos chips M1 o Intel, ya que hay un instalable apropiado para ambas arquitecturas de chip. Puedes escoger el instalable desde Install Docker Desktop on Mac.

Adicionalmente, si cuentas con los nuevos chips M1, debes ejecutar la siguiente instrucción en tu terminal softwareupdate --install-rosetta

Una vez descargues el instalador adecuado, solo debes seguir los pasos y pasar Docker Desktop a tus aplicaciones.

#### Instalación en Ubuntu 🐧

Estos son los pasos para instalarlo dentro de Ubuntu, sin embargo, también puedes ver directamente Install Docker Engine on Ubuntu

```sh
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world
```

### 1.7. Mongo con Docker

Es importante porque docker es un sistema que puede contener otros sistemas sin ensuciar neustra pc con muchos programas y que puede correr en cualquier pc

- Primero se crea `.gitignore` y se agrega mongodb_data/ adentro del archivo gitignore, esto para que no haga commit a esta carpeta que es donde se establecera la persistencia de datos del mongodb.
- Segundo se crea el archivo ``docker-compose``

    ```js
        version: '3.8'
        services:
        mongodb:
            image: mongo:5.0
            container_name: mongodb
            ports:
            - "27017:27017"
            volumes:
            - ./mongodb_data:/data/db
            environment:
            - MONGO_INITDB_ROOT_USERNAME=admin
        - MONGO_INITDB_ROOT_PASSWORD=admin
    ```

- Esto en windows se realiza teniendo abierta el app de Docker desktop
- Luego estos son los comandos para levantar docker

    ```bash
        # Para levantar
        docker-compose up -d mongodb
        # Para ver los contenedores levantados
        docker-compose ups
        # como este contenedor esta en nuestro localhost podemos conectarnos desde la extension de mongo db
        # con el siguiente link
        mongodb://admin:admin@localhost:27017
    ```

### 1.8. Conectándonos usando mongosh

Mongo SH es el cli de Mongo y sirve para conectarnos a mongo atlas o a nuestra base de datos local y no necesitamos instalar nada solo correr nuestro contenedor.

#### Connect to container

```sh
    docker-compose exec mongodb bash
```

#### Connect with mongosh

```sh
    mongosh "mongodb+srv://usuario:contraseña@cluster101.qk4sjo5.mongodb.net/"
    mongosh "mongodb://usuario:contraseña@@localhost:27017"
```

```sh
    show dbs
    show collections
```

Tambien puedo ejecutar scripts

```js
    use('sample_training')

    db.zips.find({'state': 'NY'}).count()
```

### 1.9. Json vs. Bson

>JSON

**Ventajas de JSON:**

Amigable.
Se puede leer.
Es un formato muy usado .

**Desventajas de JSON:**

Basado en texto.
Consume mucho espacio.
Es limitado: string, boolean, number, arrays.

>BSON

**Ventajas de BSON:**

Representación binaria de JSON.
No consume espacio.
Alto rendimiento.
Tipos de datos: +, date, raw binary, integer, long, float .

**Desventajas de BSON: **

No es estándar.
Es un formato para la máquina.

> Nostros insertamos datos en JSON pero mongoDB internamente lo transforma y lo maneja como BSON