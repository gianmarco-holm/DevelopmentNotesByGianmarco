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
> 👉🏻 Tambien se sabe que el escalamiento vertical es más facil de implementar pero a lo largo del tiempo es más costoso, sin emabrgo, el escalamiento horizontal es más dificil de implementar, pero tiene un menor costo a lo largo del tiempo.

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
- En este caso escogí M0 o pan free, le coloque como nombres Cluster0, proveedore de nube AWS, region Sao Paulo, luego agregamos el nombre de usuario y contraseña (holm0101)

    Como conectarse:

    ```python
        # mongodb+srv://holm0101:<password>@cluster0.homdcvg.mongodb.net/
        # python -m pip install "pymongo[srv]"

        from pymongo.mongo_client import MongoClient
        from pymongo.server_api import ServerApi

        uri = "mongodb+srv://Usuario:Contraseña@cluster0.homdcvg.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

        # Create a new client and connect to the server
        client = MongoClient(uri, server_api=ServerApi('1'))

        # Send a ping to confirm a successful connection
        try:
            client.admin.command('ping')
            print("Pinged your deployment. You successfully connected to MongoDB!")
        except Exception as e:
            print(e)
    ```
