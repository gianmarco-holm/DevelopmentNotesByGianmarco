# Introducción a AWS: Fundamentos de Cloud Computing

## 1. Introducción al Cloud Computing

### 1.1 Visión general de las TI tradicionales

Un servidor está compuesto de un

* Cómputo: CPU
* Memoria: RAM
* Almadenamiento: datos
* Base de datos: información almacenada de forma estructurada
* Redes: routers, switch, servidor DNS

Terminología de IT

* Redes: cables, routers y servidores conectados unos a otros.
* Router: un dispositivo de red que reenvía paquetes de datos entre redes informáticas.
* Switch: toma un paquete y lo envía al servidor/cliente correcto en la red.

Diseño de infraestructura "tradicional"

* Garage, con un servidor, dos servidores -> oficinas -> data centers

Problemas del enfoque de IT Tradicional

* Renta
* Mantenimiento
* Reemplazar y agregar hardware
* Escalamiento limitado
* Contratar 24/7 para monitorear
* Desastres naturales

### 1.2 Qué es la computacion en la nube

La computación en la nube es la entrega bajo demanda de recursos de IT como computación, almacenamiento y otros servicios a través de internet. En pocas palabras, es como si alquiláramos la computadora de otra persona.

Esta tecnología permite acceso instantáneo a los recursos que necesites, así como la adquisición del tipo y tamaño exacto de estos recursos. Algunos servicios que seguramente has usado son Gmail (proveedor de email), Dropbox (proveedor de almacenamiento) y Netflix (proveedor de video bajo demanda).

#### 1.2.1 Modelos de computación en la nube

A continuación, conocerás las distintas plataformas en la nube que utilizamos cuando trabajamos en proyectos personales o en nuestra empresa.

##### 1.2.1.1 Nube pública

La nube pública se refiere a los recursos de proveedores que utilizamos a través de internet y algunos ejemplos son Google Cloud Platform (GCP), Azure y AWS.

Además, posee estas ventajas:

* Elimina los gastos de capital comercial (CapEx) y reduce el gasto operativo (OpEx).
* Reduce los precios en economías de escala
* Despliega aplicaciones a nivel global en cuestión de minutos

##### 1.2.1.2 Nube privada

La nube privada es un servicio empleado por una organización que no está abierto al público. Permite un control total de la infraestructura y es útil para aplicaciones con requerimientos específicos de seguridad o comerciales.

##### 1.2.1.3 Nube híbrida

La nube híbrida consiste en mantener nuestra infraestructura y extender sus capacidades mediante la nube pública. Posibilita el control sobre activos sensibles en tu infraestructura privada, aprovechando la flexibilidad y rentabilidad de la nube pública.

### 1.2.2 Características de la computación en la nube

Ahora que conoces los distintos modelos de tecnología en la nube, es importante que hablar sobre sus propiedades de computación.

* Este modelo genera un autoservicio en demanda (con registros en la plataforma ya se pueden proveer recursos)
* Tiene un amplio acceso a la red
* Proporciona un espacio donde los clientes pueden compartir infraestructura y recursos de manera segura

### 1.2.3 Problemas resueltos por la nube

Por último, es crucial que conozcas las cualidades que trae implementar un sistema de computación en la nube.

* La nube aporta flexibilidad (puedes cambiar los tipos de recursos cuando sea necesario)
* Brinda rentabilidad y un servicio medido pues pagas solo por lo que usas
* Trae escalabilidad al agregar capacidad para hardware o equipos que necesitan acomodar cargas grandes
* Ofrece elasticidad al dar capacidad de escalar automáticamente cuando sea necesario
* Tiene alta disponibilidad y tolerancia a fallos
* Proporciona agilidad (puedes desarrollar, probar y ejecutar rápidamente aplicaciones en la nube)

## 1.3 Los diferentes tipos de cómputo: IaaS vs. PaaS vs. SaaS

Ahora que conoces más sobre la tecnología en la nube, es importante introducir sus distintos tipos de servicio en la industria para identificar sus diferencias.

Estos modelos varían de acuerdo al tipo de servicio informático que pueda ofrecer, como servidores, almacenamiento, software o bases de datos.

### 1.3.1 Infrastructure as a Service (IAAS)

La infraestructura como servicio (IAAS) proporciona componentes básicos de IT en la nube, es decir, redes, computación, almacenamiento, etc. A su vez, provee el máximo nivel de flexibilidad para adaptarlo a tus necesidades.

Ejemplos:

Azure Virtual Machines
Linode
Digital ocean
S2 AWS

### 1.3.2 Platform as a Service (PAAS)

Los modelos que ofrecen una plataforma como servicio (PAAS) eliminan la necesidad de que administremos la infraestructura y proveen una plataforma para gestionar aplicaciones.

Ejemplos:

Heroku
Google App Engine
AWS Elastic Beanstalk

### 1.3.3 Software as a Service (SAAS)

El Software como servicio (SAAS) brinda un producto de software terminado que es ejecutado y administrado por el proveedor del servicio.

Ejemplos:

Amazon Rekognition
Dropbox
Zoom
Gmail

### 1.3.4 On -premises

On-premises se refiere a una forma tradicional de cómputo en la cual nos encargamos de gestionar nuestra propia infraestructura.

### 1.3.5 Responsabilidades según el tipo de cómputo

En la siguiente tabla se muestra qué componentes de IT están administrados según el tipo de cómputo en la nube. “Sí” indica que el componente está administrado por el proveedor de nube, “No” indica que nosotros somos responsables del componente.

| Componente      | On-premises         | IAAS               | PAAS               | SAAS               |
|-----------------|---------------------|--------------------|--------------------|--------------------|
| Aplicaciones    | <span style="color:red">No</span>          | <span style="color:red">No</span>   | <span style="color:red">No</span>   | <span style="color:green">Sí</span>   |
| Data            | <span style="color:red">No</span>          | <span style="color:red">No</span>   | <span style="color:red">No</span>   | <span style="color:green">Sí</span>   |
| Runtime         | <span style="color:red">No</span>          | <span style="color:red">No</span>   | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   |
| Middleware      | <span style="color:red">No</span>          | <span style="color:red">No</span>   | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   |
| O/S             | <span style="color:red">No</span>          | <span style="color:red">No</span>   | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   |
| Virtualización  | <span style="color:red">No</span>          | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   |
| Servidores      | <span style="color:red">No</span>          | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   |
| Almacenamiento   | <span style="color:red">No</span>          | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   |
| Redes           | <span style="color:red">No</span>          | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   | <span style="color:green">Sí</span>   |

## 2. Introduccion a AWS

### 2.1 Una pequeña historia de AWS

Benjamin Black y Chris Pinkham son los principales desarrolladores de Amazon Web Services y crearon esta compañía a partir de la necesidad de impulsar nuevas tecnológicas en momentos de mayor tráfico y demanda.

La historia de AWS está repleta de hitos, pues es una de las plataformas más utilizadas en distintas startups y compañías que están transformando su industria. ¡No te preocupes! Aquí te resumimos fácil su línea del tiempo.

#### 2.1.1 Línea del tiempo de AWS

Hace veinte años nació esta promesa tecnológica y en la actualidad ¡tiene clientes en más de 245 países y territorios!

* 2002 → Se lanza internamente la plataforma
* 2003 → Comienza a comercializarse la idea de AWS
* 2004 → Llega al público el servicio SQS
* 2006 → Vuelve a lanzarse al público SQS, S3 y EC2
* 2007 → Abren operaciones en Europa
* 2009 → Lanzan el servicio RDS (Relational Database)
* 2010 → Sale al mercado el servicio Route 53
* 2012 → Lanzan DynamoDB (una base de datos no relacional)

#### 2.1.2 AWS en números

Quizás sean un gran seguidor y fiel cliente de esta compañía, pero… ¿Conocías estos datos?

En 2019, AWS logró $35.02 mil millones de dólares en ingresos anuales
AWS representó el 47% del mercado en 2019
Esta plataforma posee más de un millón de usuarios activos

### 2.2 Una visión global: regiones y zonas de disponibilidad

La infraestructura de AWS está compuesta por regiones, zonas de disponibilidad, data centers y puntos de presencia. Además, se distribuye en diferentes regiones alrededor del mundo. Algunas de ellas son Ohio, Oregon, Norte de California, e incluso lugares exclusivos del gobierno de EE. UU. como GovCloud Este.

Si quieres conocer una lista completa con más sitios, puedes visitar esta página de AWS.

#### 2.2.1 Cómo escoger una región de AWS

Podemos escoger la región de nuestra aplicación basada en distintos aspectos que mencionaremos a continuación.

Por ejemplo:

* El cumplimiento de los requisitos legales y de gobernanza de datos, pues los datos nunca abandonan una región sin su permiso explícito

* La proximidad con los clientes porque lanzan en una región cercana en donde estén para reducir latencia. Puedes revisar esta característica desde tu ubicación a cada región en cloudping.info.

* Los servicios disponibles dentro de una región debido a que muchos no funcionan en todas partes. Algunos servicios globales o regionales son…

  * Globales
    * IAM
    * Route 53
    * Cloudfront
    * WAF
  * Regionales
    * EC2
    * Beanstalk
    * Lambda
    * Rekognition

Los precios varían de región a región y son transparentes en la página de precios del servicio

#### 2.2.2 Zonas de disponibilidad

Una zona de disponibilidad es un grupo de data centers donde cada uno está lleno de servidores. Estos data centers poseen energía, redes y conectividad redundante, están separados entre sí, conectados con un gran ancho de banda y redes de latencia ultra baja.

#### 2.2.3 Modelo de responsabilidad compartida

Ahora es crucial determinar las responsabilidades de AWS y del cliente dentro del servicio tecnológico que ofrece la compañía.

**AWS se hace responsable de:**

* Hardware y la infraestructura global
* Regiones
* Zonas de disponibilidad
* Ubicaciones de AWS Edge / puntos de presencia
* Software
* Cómputo
* Almacenamiento
* Bases de datos
* Redes

**El cliente se responsabiliza de:**

* Actualizaciones de S.O.
* Protección de los datos que se almacenan
* Manejo de aplicaciones
* Accesos
* Administración de usuarios y grupos

## 3. Roles, seguridad e identidad

### 3.1 Seguridad e identidad

Uno de los aspectos más importantes al trasladar aplicaciones en la nube es la seguridad. Es crucial que nuestros datos estén protegidos contra amenazas para así permitir que los usuarios accedan a nuestro sistema y encuentren solo los recursos que necesitan.

#### 3.1.1 Servicios de protección de datos

A continuación, conocerás algunos servicios de protección de AWS y sus funciones para mover nuestras plataformas en la nube:

* Amazon Macie: descubre y protege datos sensibles
* AWS Key Management Service: almacena y administra claves de cifrado
* AWS CloudHSM: proporciona almacenamiento de claves basado en hardware
* AWS Certificate Manager: provee, administra e implementa certificados SSL/TLS
* AWS Secrets Manager: traslada, gestiona y recupera datos (contraseñas, por ejemplo)

#### 3.1.2 Servicios de protección de la infraestructura

Es fundamental que cuides de la infraestructura de tu sitio web y AWS ofrece los siguientes servicios de seguridad:

* AWS Shield: protege contra ataques de Denegación de Servicio (DDOS)
* AWS Web Aplication Firewall (WAF): filtra el tráfico de sitios web maliciosos
* AWS Firewall Manager: administra las reglas del firewall de forma centralizada

#### 3.1.3 Servicios de detección de amenazas

En todo momento nuestra plataforma está expuesta a grandes amenazas y por eso AWS desarrolló los siguientes servicios:

* Amazon GuarDuty: detecta automáticamente las amenazas
* Amazon Inspector: analiza la seguridad de la aplicación
* Amazon Config: registra y evalúa configuraciones de nuestros recursos
* Amazon CloudTrail: rastrea la actividad del usuario y el uso de las API que ocupamos en nuestra cuenta.

#### 3.1.4 Servicios de gestión de identidad

Por último, existen distintas herramientas de gestión de identidad que provee AWS:

* AWS Identity and Access Management (IAM): administra de forma segura el acceso a una cuenta, servicios y recursos
* AWS Inicio de sesión único: implementa el inicio de sesión único (Single Sign On/SSO)
* Amazon Cognito: permite a los usuarios administrar la identidad dentro de las aplicaciones
* AWS Servicio de Directorio: implementa y administra un Active Directory service
* AWS Organizaciones: funciona para gobernar y administrar de distintas cuentas de AWS de forma centralizada

### 3.2 IAM ilustrado

Identity and Access Management (IAM) es un servicio gratuito que nos ayuda a administrar los accesos a los servicios y recursos de tu cuenta en AWS. A su vez, puedes crear usuarios, grupos y establecer permisos de acceso a los recursos mediante el uso de políticas.

#### 3.2.1 Usuarios y grupos de usuarios de IAM

Los usuarios y grupos de usuarios son de los principales componentes de IAM. Al crear tu cuenta de AWS te proporcionan un usuario Root que tiene acceso a todos los recursos,

Este usuario puede generar otros perfiles y cada uno con un acceso único a distintos recursos de AWS. Además, Root también puede configurar grupos de usuarios, donde cada miembro tiene y puede compartir permisos de acceso.

#### 3.2.2 Ejemplos de políticas de IAM

El acceso a recursos se otorga mediante políticas. Este es un ejemplo de una política que otorga acceso de administrador.

```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
También está este ejemplo de políticas de acceso a un bucket de S3 (almacenamiento)

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": "arn:aws:53 ::: bucket-name"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3: GetObject",
                "s3: PutObject",
            ],
            "Resource": "arn:aws:53 ::: bucket-name /*"
        }
    ]
}
```

#### 3.2.3 IAM Roles

Además de todas estas funciones, IAM de AWS permite asumir roles y otorgar permisos a otras tecnologías. Por ejemplo, podemos conceder a una máquina virtual el acceso a una base de datos mediante un rol de IAM.

### 3.3 Secrets Manager

Secrets Manager es un servicio de AWS que nos ayuda a proteger los datos secretos (contraseñas, claves y tokens) necesarios para acceder a nuestras aplicaciones, servicios y recursos.

También nos permite compartir automáticamente esta información cuando queramos. Además, este servicio evita que tengamos que copiar y pegar los secretos directamente en nuestro código.

### 3.4 Demostración del servicio de directorio

Un directorio es una base de datos que contiene información de inicio de sesión de todos los usuarios de una red y puede implementar políticas de seguridad.

Dado que Windows es el sistema operativo más usado a nivel mundial, Microsoft lanzó **Active Directory**. Este servicio permite que las empresas gestionen los inicios de sesión de sus empleados.

#### 3.4.1 AWS Directory Service

Es una oferta de servicio administrado de AWS que posibilita que sus recursos utilicen Active Directory y ofrecen:

* Un directorio activo administrado sin tener que ejecutar servidores manualmente
* La opción de directorio activo simple
* El conector AD que brinda a usuarios inicio de sesión en aplicaciones de AWS con sus credenciales
* Un Servicio distribuido con error automático que funciona si hay fallas en los servidores
* El AWS Directory Service ss compatible con otros servicios de AWS

### 3.5 Laboratorio: crea usuarios y grupos en AWS

Para crear usuarios y grupos inicia sesión en la consola de AWS. En la barra de búsqueda, coloca “IAM” y haz clic en el primer resultado.

#### 3.5.1 Crear un nuevo usuario

A la izquierda verás el siguiente menú:
IAM Menu

1. Haz clic en “Users” (o Usuarios). Allí vas ver listados los usuarios.

2. Luego haz clic en “Add Users” (o Agregar Usuarios) para añadir uno nuevo.

3. A continuación, escribe el nombre de usuario y selecciona “Password - AWS Management Console access”, “Autogenerated Password” y “Require password reset”.

4. Haz clic en “Next” hasta llegar al paso 4 - Review.

5. Finalmente, haz clic en “Create user”. No olvides guardar la contraseña generada al final.

#### 3.5.2 Cómo crear un grupo de usuarios administradores

1. En el menú de la primera imagen, dirígete a “User groups” y haz clic en “Create group”.

2. Escribe el nombre del grupo, “administrator” en este caso. Mira que en este menú puedes añadir usuarios allí, pero en esta clase añadiremos el usuario al equipo después de su creación.

3. Más abajo encontramos la parte de las políticas de permisos. Aquí buscamos “administrator” y revisamos el “AdministratorAccess” para asignarle permisos de administración al grupo. Hacemos clic en “Create Group” al finalizar.

#### 3.5.3 Cómo añadir el usuario al grupo de administrador

Para esto es necesario que vuelvas a la sección de “Users”, luego haces clic en nuestro usuario, clic en la pestaña de Groups y en el botón de “Add user to groups”.
Añadir usuario a grupos
Al final, simplemente escogemos los grupos a los que queremos añadir el usuario y hacemos clic en “Add to Groups”.

### 3.6 Laboratorio: crea una alerta de facturación

Para crear una alerta de facturación ve a tu nombre de usuario en la plataforma de AWS. Haz clic en la opcion “Billing Dashboard” > “Budgets” > “Create a budget”.

Aquí veremos los Budget Types. Marca la opción por defecto “Cost budget - Recommended” y haz clic en el botón superior: “Enable cost Explorer” para habilitar el seguimiento de gastos.

#### Sigue los pasos para crear una alerta de facturación

##### Paso 1

De nuevo en la página de Budget Types, haz clic en “Next”. Verás la página Set Your Budget. Aquí oprime la opción “budget” y selecciona su frecuencia: daily, monthly, etc. Escoge desde cuando quieres empezar a hacer el monitoreo en “Start Date”.

En Budgeting method escoge “Fixed”. Esta opción implica que se va a monitorear el presupuesto cuando se gasta más de la cantidad indicada. Después completa la casilla “Enter your budgeted amount” según el tiempo.

##### Paso 2 (opcional)

Adicionalmente, en la sección “Budget Scope” podemos delimitar nuestro presupuesto con algún servicio específico u otras opciones. De momento, seleccionamos All AWS Services y hacemos clic en “Next”.

##### Paso 3

Oprimimos el botón “Add an alert threshold”. En la sección: Alert #1, configuramos cómo se debe ejecutar la alerta, si es por el valor absoluto o algún porcentaje, en ese caso seleccionamos valor absoluto o “Absolute Value” y colocamos la cifra que queremos que encienda la alerta.

Luego en Email recipients indicamos el correo electrónico al que llegara la alerta. Finalmente, hacemos clic en “Next” y en “Create budget”.
