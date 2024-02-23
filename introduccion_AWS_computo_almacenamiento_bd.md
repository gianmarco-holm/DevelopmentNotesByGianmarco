# Introducción a AWS: Cómputo, Almacenamiento y Bases de Datos

---

## 1. Cómputo

---

### 1.1 Cómputo en AWS

AWS describe su capacidad de cómputo como “cómputo para cualquier carga de trabajo”. Cómputo se refiere a usar una computadora para procesamiento, ya sea sumar dos números o alojar un sitio web. Entre los servicios de cómputo se encuentran:

#### 1.1.1 Instancias o máquinas virtuales

Una máquina virtual es un software que simula un sistema operativo, y que puede ejecutar programas dentro de dicho sistema como si fuera una computadora real. Los servicios de máquinas virtuales (o instancias) en AWS son:

* Amazon EC2: máquinas virtuales seguras y redimensionables.
* Amazon EC2 Spot: cargas de trabajo tolerante a fallas, por hasta el 90% del precio normal (nota: Amazon puede reclamar estas instancias en cualquier momento con solo dos minutos de anticipación).
* Amazon EC2 AutoScaling: agrega o elimina automáticamente la capacidad informática para satisfacer tus necesidades bajo demanda.
* Amazon EC2 LightSail: plataforma en la nube fácil de usar para crear una aplicación o un sitio web.

#### 1.1.2 Contenedores

Un contenedor es una unidad de software que empaca un software en específico junto con sus dependencias. Se diferencian de las máquinas virtuales en que estas virtualizan el hardware, mientras que los contenedores virtualizan el sistema operativo. Los servicios de contenedores de AWS son:

* Amazon Elastic Container Services (ECS): servicio para correr contenedores confiables y escalables.
* Amazon Elastic Container Registry (ECR): servicio para almacenar, administrar e implementar imágenes de contenedores.
* Amazon Elastic Kubernetes Service (EKS): servicio de Kubernetes administrado por AWS.

#### 1.1.3 Serverless

La computación serverless se refiere a que la responsabilidad de administrar servidores o máquinas virtuales se le delega al proveedor de nube, por lo que sólo debemos precuparnos por el código de nuestras aplicaciones. **Amazon Lambda** nos permite ejecutar piezas de código sin servidores.

#### 1.1.4 Servicios de borde (Edge)

El Edge Computing se refiere al cómputo y procesamiento de datos en una ubicación cercana a la necesaria para el negocio. Los servicios de borde o edge computing de AWS son:

* Amazon Outposts: permite ejecutar los servicios de AWS en nuestros propios servidores en lugar de Amazon.
Amazon Snow Family: es una familia de dispositivos desde un disco duro portátil hasta un semi-remolque completo lleno de discos de almacenamiento. Estos dispositivos te permiten cargar archivos en ellos, para luego ser enviados a Amazon y cargados en sus servidores.
* AWS Wavelength: permite acceder a los servicios AWS desde dispositivos 5G sin pasar por Internet.
* VMWare AWS: permite migrar cargas de trabajo de VMWare a AWS.
* AWS Local Zones: permite ejecutar las aplicaciones más cerca de los usuarios finales, a una menor latencia.

---

### 1.2 Conoce qué es Amazon EC2

**EC2 permite alquilar máquinas virtuales, llamadas instancias EC2.** Puedes elegir diferentes tipos de EC2 con diferente CPU, RAM y almacenamiento. Hay instancias optimizadas para cómputo, memoria y almacenamiento, entre otras.

En EC2, el sistema de pago más común es por hora o por segundo, dependiendo el tipo de instancia. Por ejemplo, para una instancia que cueste $0.1 la hora, puedes pagar, ya sea una instancia por 24 horas o 24 instancias por una hora. En ambos casos pagas lo mismo (24 * 0.10 = $2.4).

#### 1.2.1 Opciones y precios bajo demanda

Las instancias pueden redimiensionarse. Puedes empezar por una instancia de bajo costo, y si necesitas aumenta su capacidad, apagas la instancia y seleccionas un nuevo tipo de instancia. Cuando enciendas de nuevo la instancia, verás su capacidad aumentada. La siguiente tabla muestra algunos tipos de instancias.

| Nombre      | Especificaciones                                    | Precio           |
|-------------|-----------------------------------------------------|------------------|
| t3.nano     | 2 vCPU’s, 0.5 GiB RAM                               | $0.0052/hora     |
| t3.xlarge   | 4 vCPU’s, 16 GiB RAM                                | $0.1664/hora     |
| c6g.8xlarge | 32 vCPU’s, 64 GiB RAM                               | $1.088/hora      |
| X1e.xlarge  | 128 vCPU’s, 3904 GiB RAM, 2x 1920 GB SSD            | $26,688/hora     |

#### 1.2.2 Hosts dedicados

Los hosts dedicados en Amazon Web Services (AWS) son infraestructuras de servidores físicos que ofrecen un nivel exclusivo de recursos computacionales para las cargas de trabajo de los clientes. En lugar de compartir estos servidores con otros usuarios, los hosts dedicados permiten a los clientes tener un control más granular sobre la ubicación y asignación de sus instancias de Amazon EC2. Esto puede ser beneficioso para aplicaciones que requieren una mayor seguridad, cumplimiento normativo o rendimiento constante.

Los hosts dedicados también brindan la flexibilidad de llevar licencias de software existentes a la nube sin incurrir en costos adicionales. Al utilizar hosts dedicados, los principiantes en AWS pueden garantizar una mayor aislación de recursos y una mayor predictibilidad en el rendimiento de sus aplicaciones, al tiempo que aprovechan la escala y la elasticidad de la nube de AWS.

---

### 1.3 Contenedores de software

El propósito de un contenedor es crear un paquete de tu programa y todas sus librerías y dependencias con las versiones específicas con las que has trabajado, para producir una imagen que pueda ser ejecutada en cualquier máquina.

Un problema común del desarrollo de software es utilizar distintas versiones de diferentes librerías/lenguajes de programación/programas. Docker nos permite crear contenedores para resolver este problema.

#### 1.3.1 Amazon ECS

Amazon ECS es un servicio de contenedores, donde puedes implementar tus imágenes en contenedores en AWS. Cuando corras tus contenedores en AWS, no notarás diferencia entre tu máquina local y el entorno de AWS.

---

### 1.4 AWS Lambda

*AWS Lambda* es un servicio **serverless** que nos permite **ejecutar código en respuesta a eventos, sin preocuparnos por servidores o infraestructura**. Estos eventos pueden ser temporizadores, visitas a alguna sección de nuestra aplicación, solicitudes HTTP, entre otros.

Entre sus casos de uso encontramos el (pre)procesamiento de datos a escala, y la ejecución de backends web, móviles y de IoT interactivos. Lambda se puede combinar con otros servicios de AWS para crear experiencias en línea seguras, estables y escalables.

#### 1.4.1 ¿Cómo se factura Lambda?

Lambda se factura por milisegundos, y el precio depende del uso de RAM. Por ejemplo, 128MB RAM x 30 millones de eventos por mes resultan en un costo de $11.63 al mes.

---

## 2. Almacenamiento

---

### 2.1 Almacenamiento de datos en AWS

El almacenamiento de datos en la nube consiste en **subir tus datos a dicha red de servidores, donde se te proporcionan herramientas para que puedas acceder a ellos de diferentes maneras.**

#### 2.1.1 Tipos de almacenamiento y sus servicios

Podemos utilizar distintos tipos almacenamiento datos, y para estos hay servicios de AWS. Los tipos de almacenamiento son:

* Basado en archivos: el más conocido por todos. Archivos organizados por carpetas y subcarpetas (sistema de ficheros). En esta categoría encontramos a "Amazon Elastic File System (EFS)" y "Amazon FSx for Windows File Server".

* Bloque: los archivos se almacenan en volúmenes por fragmentos de datos de igual tamaño, sin procesar. Este tipo de almacenamiento es utilizado como disco duro de nuestros servidores o máquinas virtuales. En esta categoría está "Amazon Elastic Block Store (EBS)".

* Objetos: la información almacenada se almacena como objetos, de manera que cada objeto recibe un identificador único y se almacena en un modelo de memoria plana. Un ejemplo de esto es "Amazon Simple Storage Service (S3)".

#### 2.1.2 Respaldo de datos

"Amazon Backup" administra y automatiza de forma centralizada las copias de seguridad en los servicios de AWS.

#### 2.1.3 Servicios de transferencia de datos

¿Qué pasa si necesitamos transferir datos de nuestros servidores hacia AWS (o viceversa)? AWS ofrece distintos servicios para la transferencia de datos.

* **AWS Storage Gateway:** un conjunto de servicios de almacenamiento en la nube híbrida que brinda acceso en las instalaciones al almacenamiento en la nube.

* **AWS DataSync:** acelera el traslado de datos desde y hacia AWS hasta diez veces más rápido de lo normal.

* **AWS Transfer Family:** escala de forma segura tus transferencias recurrentes de archivos de Amazon S3 y Amazon EFS con los protocolos FTP, SFTP y FTPS.

#### 2.1.4 Conclusión

Exploramos de manera breve los distintos servicios de almacenamiento de AWS, así como los tipos de almacenamiento que podemos utilizar.

---
