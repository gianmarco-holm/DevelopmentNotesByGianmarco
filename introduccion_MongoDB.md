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

**Desventajas de BSON:**

No es estándar.
Es un formato para la máquina.

> Nostros insertamos datos en JSON pero mongoDB internamente lo transforma y lo maneja como BSON

## 2. CRUD

### 2.1. Insertando un documento

```JSON
    use('store')

    // Se puede insertar sin especificar el ID
    // JSON le da un ID
    db.products.insertOne({
        name: "Product 4",
        price: 1500
    })

    db.products.insertOne({
        _id: 3,
        name: "Product 3",
        price: 1400
    })

    db.products.find()
```

### 2.2. Insertando varios documentos

```JSON
    use('store')

    // Eliminados la colección existente
    db.products.drop()

    // Inserto varios documentos
    db.products.insertMany([
        {
            _id: 1,
            product: "Producto 1",
            price: 1000
        },
        {
            _id: 2,
            product: "Producto 2",
            price: 1200
        },
        {
            _id: 3,
            product: "Producto 3",
            price: 1300
        },
        {
            _id: 1,
            product: "Producto 1",
            price: 1400
        },
        {
            _id: 4,
            product: "Producto 4",
            price: 1400
        }
    ],
    // Se utiliza ordered en false para que siga agregando documentos y llega a encontrar algún conflicto, este se saltee el conflicto.
    {
        ordered: false
    })

    db.products.find()
```

### 2.3. Actualizando un documento

Aca haremos mención de 3 operadores:

1. set: Establece el valor de un campo de un documento
2. inc: Incremente el valor de un campo númeico de un documento
3. ObjectId: Cuando queremos hacer mension a un ID creado por mongodb, debemos utilizar este operador.

```JSON
    use('store')

    db.products.updateOne({
        // buscamos el documento con el siguiente ID
        _id: ObjectId("66183f89d15de766b53554c5")
    }, {
        // Incrementamos el valor +2000
        $inc: {
            price: 2000
        }
    })
```

```JSON
    use('store')

    db.products.updateOne(
        {_id: 2},
        // establecemos los valores qe queremos actualizar con set
        {$set: {
            product: "Televisor",
            tag: ['A', 'B', 'C']
        }}
    )
```

### 2.4. Actualizando varios documentos

Aca haremos mención de 2 operadores:

1. rename: Que renombre el campo del documento
2. unset: Elimina un campo de un documento

```JSON
    // Todos los documentos de CLEVELAND le agregamos el campo myAtrib: hola
    use('sample_training')

    //Agrego un nuevo atributo
    db.zips.updateMany({
        city: 'CLEVELAND'
    }, {
        $set: {
            myAtrib: 'Hola'
        }
    })

    db.zips.find({city: 'CLEVELAND'})
```

```JSON
    // Le cambiamos de nombre al campo myAtrib a my_atrib
    use('sample_training')

    //Cambio el nombre del atributo
    db.zips.updateMany({
        city: 'CLEVELAND'
    }, {
        $rename: {
            myAtrib: 'my_atrib'
        }
    })

    db.zips.find({city: 'CLEVELAND'})
```

```JSON
    // eliminamos el campo my_atrib con unset
    use('sample_training')

    //Elimino un atributo
    db.zips.updateMany({
        city: 'CLEVELAND'
    }, {
        $unset: {
            my_atrib: ''
        }
    })

    db.zips.find({city: 'CLEVELAND'})
```

### 2.5. Array Update Operators

Aca haremos mención de 3 operadores:

1. push: Inserta elemento en un array de un documento

    ```JSON
        use("store")

        //Voy a insertar un elemento a un atributo de tipo array
        db.inventory.updateOne({
            _id: 2
        }, {
            $push: {
                tags:'headphone'
            }
        })

        db.inventory.find()
    ```

2. pull: Quita un elemento de un array de un documento

    ```JSON
        use("store")

        //Voy a quitar un elemento a un array en todos los documentos
        db.inventory.updateMany({}, {
            $pull: {
                tags:'book'
            }
        })

        db.inventory.find()
    ```

3. in: coincide con cualquier elemento de un array

    ```JSON
        use("store")

        //Voy a eliminar 2 elementos a un array, para ello se usa in
        db.inventory.updateMany({}, {
            $pull: {
                tags: {
                    $in: ['bag', 'book']
                }
            }
        })

        db.inventory.find()
    ```

### 2.6. Update or insert

Aca haremos mención de 1 operador

1. pop: remueve el primer o el ultimo elemento de un array

```JSON
    // Eliminamos el ultimo elemento agregado
    // Para eliminar el primer elemento es -1
    db.iot.updateOne({
        sensor: 'A001',
        date: '2022-01-03'
    }, {
        $pop: {
            reading: 1
        }
    })
```

Sabiendo esto, usaremos upsert:

```JSON
// Ahora usaremos UPSERT, que sirve para verificar si el documento existe
// Si no existe crea uno y si ya existe lo actualiza
db.iot.updateOne({
    sensor: 'A001',
    date: '2022-01-03'
}, {
    $push: {
        reading: 2025
    }
}, {
    upsert: true
})

db.iot.find()
```

### 2.7. Elimando documentos

```JSON
    use('store')

    // Elimina un documento
    db.products.deleteOne({_id: 1})

    // Elimina varios documentos
    db.products.deleteMany({price: 100})

    // Eliminar toda una coleccion
    db.products.drop()
```

## 3. Operadores

### 3.1. Usando $eq y $ne

```JSON
    use('store')

    // eq que es equals ya viene implicito
    db.inventory.find({'qty':15})

    // de manera explicita seria
    db.inventory.find({'qty': {$eq: 15}})

    // ne o not equals si se debe realizar de manera explicita
    db.inventory.updateMany({
        'item.name': { $ne: 'ab' }
    }, {
        $inc: {
            'qty': 10
        }
    })

    db.inventory.find()
```

### 3.2. Usando $gt, $gte, $lt, $lte

```JSON
    use('store')

    // Usaremos $gt (>) y $gte (>=)
    db.inventory.find({'qty': {$gt: 20}})
    db.inventory.find({'qty': {$gte: 20}})

    // Usaremos $lt (<) y $lte (<=)
    db.inventory.find({'qty': {$lt: 20}})
    db.inventory.find({'qty': {$lte: 20}})

    // Join
    db.inventory.find({
        'item.code': '123',
        'qty': {$gte: 20, $lte: 35}
    })
```

### 3.3. Usando $regex

Nos permite encontrar patrones en nuestra busqueda de elementos.

```JSON
use('store')

// Buscamos todas las expresiones que tienen line
db.inventory.find({
    // Para buscar un subdocumento los campos se colocan en comillas
    "item.description": { $regex: /line/ }
})

// Para buscar line sin importar la mayuscula sera /LINE/i
// Para buscar las frases que terminen en line sería /line$/i
// Para que inicien en line /^line/i
// Para buscar en textos que tienen multilinea se usa la m al final
// por ejemplo para buscar los que inician con s /^s/im
```

### 3.4. Projection

Es una opción que nos da mongo compas mostrando solo los campos que queremos ver, para realizar esto en mongo Compas, en la parte de consulta dice `Options` ahí se desplega unas opciones y en project colocas el campo que quieres ver `{'product': 1}`, se coloca 1 para mostrar solo ese campo lo demas se oculta, excepto el id, para ocultar el id, se usa lo siguiente `{'producto':1, _id:0}`.

Esto tambien se puede realizar en vscode

```JSON
    use('sample_training')

    db.trips.find(
        // query
        {tripduration: {$gte: 200}},
        // proyection
        // 1 para msotrar y 0 para ocultar (solo sirve para el id)
        { tripduration: 1, usertype: 1, _id: 0}
    )
```

### 3.5. Operadores para Arrays

```JSON
    use('store')

    // $in
    db.inventory.find({qty: {$in: [20,25]}})

    // buscamos los campos que tengan book y electronics
    db.inventory.find({tags: { $in: ['book', 'electronics'] }})

    // nin busca campos que no tengan books o electronics
    db.inventory.find({tags: { $nin: ['book', 'electronics'] }})

    // all es como un Y, que tenga book y electronics al mismo tiempo
    db.inventory.find({tags: { $all: ['book', 'electronics'] }})

    // Buscar elementos que tengan 2 elementos en el array
    db.inventory.find({tags: { $size: 2 }})

    // elemMatch El operador $elemMatch en MongoDB se utiliza para especificar criterios de selección de documentos donde al menos un elemento en un array cumple con las condiciones especificadas.
    db.survey.find({ results: { $elemMatch: {
        product: 'xyz',
        score: {$gte: 7}
        }}
    })

```

### 3.6. Operadores Lógicos

```JSON
    use ("sample_training")

    // and de forma implicita
    db.inspections.find({
        sector: "Tax Preparers - 891",
        result: "Unable to Locate"
    }).count()

    // and de forma exlicita
    // $and va dentro de un array [{}, {}, {}]
    db.inspections.find({
        $and: [
            {sector: "Tax Preparers - 891"},
            {result: "Unable to Locate"}
        }]
    }).count()


    // operadores de aca en adelante tienen que ser de forma explicita, no vienen incorporados como and
    // or [{}, {}, {}]
    db.inspections.find({
        $or: [
            {sector: "Tax Preparers - 891"},
            {result: "Unable to Locate"}
        ]
    }).count()

    // $nor [{}, {}, {}] para que no incluya ciertos valores
    db.inspections.find({
        $nor: [
            {sector: "Tax Preparers - 891"},
            {result: "Unable to Locate"}
        ]
    }).count()

    db.inspections.find({
        $nor: [
            {result: "No Violation Issued"},
            {result: "Unable to Locate"}
        ]
    }   ,{ // projection para que solo traiga los resultados deseados
        result: 1,
        _id: 0
    }
    )

    // not no recibe un array directamente como parte de su ejecucion, se aplic hahcia un atributo
    db.inspections.find({
        result: { $not: {$regex: /Unable to Locate/} }
    })
```

### 3.7. Expresive operator

Es un operador que permite el uso de expresiones de agregación dentro del lenguaje de consulta

```JSON
    use('store')

    // Gastos mayores a 100
    db.monthlyBudget.find({spent: {$gte: 100}})

    gastos mayores a 100 con expr
    db.monthlyBudget.find({
        $expr: {
            $gte: ['$spent', 100]
        }
    })

    // Gastos superiores a presupuesto
    db.monthlyBudget.find({
        $expr: {
            $gte: ['$spent', '$budget']
        }
    })

    // Viajes que comenzaron e iniciaron al mismo tiempo
    // y que tienen una duracion de 1200
    use('sample_training')

    db.trips.find({
        $expr: {
            $and: [
                {$eq: ['$start station id', '$end station id']},
                {$gte: ['$tripduration', 1200]}
            ]
        }
    })
```

### 3.8. Query in subdocs

```JSON
    use('sample_training')

    // Buscar la primera persona, osea posicion 0 que
    // se llame zuckerberg
    db.companies.find({
        'relationships.0.person.last_name': 'Zuckerberg'
    }, {
        name: 1,
        relationships: 1
    })

    // Buscar todas la spersonas que se llamen Mark

    db.companies.find({
        relationships: {
            $elemMatch: {
                'person.first_name': 'Mark'
            }
        }
    }, {
        name: 1,
        relationships: 1
    })
```

## 4. Herramientas comunes al trabajar con MongoDB

### 4.1. Aggregation Framework

Si bien es cierto que Mongo Query Language nos permite realizar consultas avanzadas, Aggregation nos ayuda a realizar analisis más avanzados para ciencia de datos.

Este es la diferencia entre una consulta normal y una agregación

```JSON
    use('sample_airbnb')

    db.listingsAndReviews.find({
    amenities: 'Wifi'
    }, {
    amenities: 1,
    price: 1,
    "address.country": 1,
    _id: 0
    })

    // Agregate trabaja con capas, cada capa es el input de la siguiente
    // [], [], []
    db.listingsAndReviews.aggregate(
    [
        {$match: {amenities: 'Wifi'}},
        {$project: {amenities: 1, price: 1, "address.country": 1}},
        { $group: {_id: '$address.country', count: {$sum: 1}}}
    ]
    )
```

### 4.2. Sort, limit y skip

```JSON
    use('sample_training')

    // sort
    // 1 = ASC
    // -1 = DESC

    // limit
    // limita a los 2 con mayor densis poblacional o pop
    db.zips
    .find({pop: {$gte: 100}})
    .sort({pop: -1})
    .limit(2)

    // skip
    // Para paginacion
```

```JSON
    use('store')

    // se juega con skip para pasar de pagina en pagina
    db.categories
    .find()
    .skip(2)
    .limit(2)
```
