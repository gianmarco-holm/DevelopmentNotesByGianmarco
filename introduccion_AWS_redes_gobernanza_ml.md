# Introducción a AWS: Redes, Gobernanza y Machine Learning

---

## 1. Redes

---

### 1.1 Que son las redes

Las redes son cómo están conectadas las computadoras (y otros dispositivos tecnológicos) entre sí, y los servicios que permiten esto.

Una muy conocida es el Internet, que consiste en una red de computadoras abierta al mundo. Para que Internet funcione es necesario contar con direcciones IP, enrutadores, DNS y seguridad. AWS provee servicios que permiten la creación de redes y la entrega de contenido a los usuarios de manera rápida.

#### Redes en la nube

Entre los servicios de AWS para implementar redes en la nube encontramos:

* ``Amazon Virtual Private Cloud (Amazon VPC):`` permite definir y aprovisionar una red privada para nuestros recursos de AWS
* ``AWS Transit Gateway:`` Permite conectar VPC con los recursos locales (on-premises) mediante un hub central
* ``AWS PrivateLink:`` proporciona conectividad privada entre las VPC y aplicaciones locales, sin exponer el tráfico al Internet público
* ``Amazon Route 53:`` permite alojar nuestro propio DNS administrado

#### Redes a escala

Estos servicios nos permiten escalar el tráfico de red según las necesidades:

* ``Elastic Load Balancing:`` permite distribuir automáticamente el tráfico de red a través de un grupo de recursos, con el fin de mejorar la escalabilidad
* ``AWS Global Accelerator:`` redirige el tráfico a través de la red global de AWS para mejorar el rendimiento de las aplicaciones globales
* ``Amazon CloudFront:`` entrega de forma segura datos, videos y aplicaciones a clientes de todo el mundo con baja latencia.

---

### 1.2 Qué es una VPC

Una VPC es una red virtual privada. Cada computadora que está conectada a otra computadora por medio de un cable, enrutador o antena de wifi, requiere de una interfaz de red para ser conectada. La interfaz de red es el puente entre nuestra computadora y la tecnología ya utilizada para conectarse a la otra computadora.

Una vez que conectamos las computadoras, debemos configurar la red, para lo cual necesitamos un rango de direcciones IP.

#### Qué es el rango de direcciones IP

El rango de direcciones IP es como una comunidad cerrada local, donde los equipos se podrán comunicar solo con otros equipos dentro de la misma red. A cada equipo se le asigna una dirección IPv4. Es decir, se le dan 4 números que varían del 0 al 255 separados por un punto. Para redes privadas ya se tienen especificados los rangos de IP:

* 10.0.0.1
* 172.16.0.1
* 192.168.0.1

#### Para qué sirve Amazon VPC

``Amazon VPC`` permite crear una red virtual para poder conectarnos a todos los servicios de AWS que existan en un rango de direcciones IP locales (por ejemplo, 10.0.0.0/24, que representa del rango de IP entre 10.0.0.0 y 10.0.0.255). Esta red virtual será como una pequeña comunidad cerrada para nuestras máquinas virtuales y todos los servicios que tengamos dentro de AWS.

##### Componentes de Amazon VPC

Amazon VPC posee los siguientes componentes para controlar el tráfico interno y externo de nuestras VPC

* ``Nat Gateway``: si deseamos que nuestras máquinas virtuales puedan acceder a internet, debemos utilizar este componente
* ``Internet Gateway:`` permite que Internet pueda acceder a nuestra instancia de EC2
* ``ACL Control List:`` controla el tráfico que vamos a permitir dentro y fuera de la VPC

![VPC](/images/vpc.webp)

---

### 1.3 Escogiendo CloudFront

Antes de hablar de CloudFront, recordemos cómo funciona AWS ElastiCache. ElastiCache es un servicio que almacena en memoria caché las solicitudes a la base de datos, para evitar el consultar la base de datos cada vez que se necesite acceder a información. Este servicio se ubica entre el sitio web y la base de datos

CloudFront funciona de manera similar, solo que este es un servicio intermedio entre el navegador (o el cliente) y el sitio web. El propósito de CloudFront es entregar datos, aplicaciones y sitios web en todos el mundo con baja latencia. Para esto, AWS cuenta con edge locations (o ubicaciones de borde), es decir, múltiples ubicaciones en el mundo desde las cuales CloudFront puede servir contenido.

#### Casos de uso de CloudFront

Supongamos que un cliente accede a nuestro sitio web. En realidad, el cliente primero accede a CloudFront. Entonces CloudFront redirige automáticamente la solicitud de archivo desde el edge location más cercano. Los archivos se almacenan en la caché de la ubicación de borde primero, durante un periodo de tiempo limitado que nosotros necesitemos.

Si un cliente solicita el contenido que está almacenado en caché por más tiempo que el vencimiento especificado, CloudFront verifica en el servidor de origen para ver si hay una nueva versión del archivo disponible. Si el archivo ha sido modificado, se retorna la nueva versión del archivo. En caso contrario, se entrega la versión que estaba en caché.

Cualquier cambio que realicemos en los archivos se replicará en las ubicaciones de borde a medida que sus visitantes están entrando y solicitando el contenido. Esto es lo que mantiene a los sitios web rápidos sin importar la ubicación del usuario.

#### Características de CloudFront

* CloudFront es seguro: ofrece protección contra ataques DDOS, ya que los primeros servidores en recibir estos ataques serán los de CloudFront y no los tuyos. Además, CloudFront está protegido ante picos de tráfico.
* CloudFront también permite ejecutar funciones de AWS Lambda en las ubicaciones de borde.
* CloudFront ofrece múltiples métricas en tiempo real, y es rentable.

![cloudFront](/images/cloudfront.jpeg)

---

### 1.4 Qué es Route 53

DNS es un sistema que asigna direcciones IP a nombres de dominio. Route 53 es un servicio de alojamiento de DNS, que cuesta tan solo $0.5 por nombre de dominio por mes. Route 53 cuenta con distintas opciones de política de enrutamiento.

#### 1.4.1 Políticas de enrutamiento

Las políticas de enrutamiento nos permiten determinar a dónde se dirigirá un usuario cuando acceda a nuestro dominio. Estas políticas son:

##### 1.4.1.1 Ruteo simple

El ruteo simple utiliza el servicio de DNS estándar. Es decir, el tráfico en un dominio se enruta hacia un recurso muy específico.

##### 1.4.1.2 Política ponderada

La política ponderada (o weighted routing) te permite asociar múltiples recursos con un solo nombre de dominio, y ver qué tanto tráfico es dirigido a cada recurso. Esto se determina con un número del 0 al 255, donde el cero representa que el recurso no recibe ningún tráfico, y el 255 indica que el recurso recibe todo el tráfico.

Mediante la política ponderada podemos probar distintas versiones de nuestro sitio web con un número reducido de usuarios. Luego podemos realizar una transición lenta de nuestros usuarios hacia la nueva versión del sitio.

##### 1.4.1.3 Política de geolocalización

Usando la política de geolocalización podemos escoger qué recursos servir en función de la ubicación geográfica de nuestros usuarios. Esto permite servir contenido específico según la región, así como restringir la distribución del mismo solo a las regiones permitidas.

##### 1.4.1.4 Política de latencia

La política de latencia se trata de entregar los recursos desde la región de AWS que esté más cercana a la ubicación del usuario, a fin de reducir el tiempo de respuesta.

##### 1.4.1.5 Política de conmutación por error

La política de conmutación por error redirige el tráfico a un recurso cuando este está en buen estado, o a uno diferente cuando el primer recurso no está en buen estado.

##### 1.4.1.6 Política de respuesta de múltiples valores

La respuesta de múltiples valores permite devolver varios valores, como direcciones IP a los servidores web, en respuesta a las consultas de DNS. Se pueden especificar varios valores para casi cualquier registro, pero este direccionamiento también permite verificar el estado de cada recurso, por lo que Route 53 devuelve los valores únicamente para los recursos en buen estado.

Esta política no es sustituto de un balanceador de carga, pero la capacidad de devolver varias direcciones IP (cuyo estado sea comprobable) permite usar el DNS para mejorar la disponibilidad y el equilibrio de la carga.

##### 1.4.2 Conclusión

Route 53 es un servicio complejo, pero útil para mantener nuestros sitios web rápidos y altamente disponibles. Es rentable, seguro, escalable, y posee distintas opciones de enrutamiento para distintos casos.

---

## 2. Componentes Básicos de una VPC

---

### 2.1 Cómo crear el diagrama de una VPC

Aprendámos a crear los componentes básicos de una VPC desde cero. Primero necesitamos hacer un diagrama para entender cómo están divididos estos componentes básicos.

Para originar el diagrama nos dirigimos a esta herramienta de diagramas de flujo Draw.io y escogemos dónde guardaremos el diagrama (en esta clase se escoge Google Drive, pero puedes guardarlo donde prefieras). Entonces le damos a “Create New Diagram” -> “Blank Diagram”.

#### Creando el diagrama de la VPC

En el recuadro de búsqueda podemos poner “AWS VPC”. Escogemos la siguiente figura.

Luego, buscamos las siguientes figuras: “AWS Internet Gateway”, “User”, “network access control”, “router” y “subnet”. Entonces las ordenamos de la siguiente manera
Diagrama de VPC
Este es el diagrama final. Muestra que cuando un usuario intenta acceder al VPC se encontrará con el Internet Gateway. Luego, el tráfico será dirigido al router, que se encargará de redirigirlo a una de las dos subnets las cuales contienen un Network Access Control List. Este se encargará de validar que el usuario pueda acceder al contenido.

---

### 2.2 Cómo crear la VPC y el internet gateway

Una vez creado nuestro diagrama de vpc, iniciamos sesión en AWS para crear los primeros componentes de nuestra VPC.

#### Pasos para crear la VPC

1. En la caja de búsqueda de AWS buscamos VPC y seleccionamos el primer resultado.
2. Nos dirigimos a “Sus VPC” y le damos a “Crear VPC”.
3. Colocamos las siguientes opciones, y dejamos el resto de valores por defecto:

* Etiqueta de nombre - opcional: DemoVPCLaboratorio.
* Bloque de CIDR IPv4: Entrada manual de CIDR IPv4.
* CIDR IPv4: 10.0.0.0/24.
* Configuración de la VPC

Entonces le damos a Crear VPC.

#### Pasos para crear el Internet Gateway

1. Nos dirigimos a “Gateways de Internet” -> “Crear gateway de Internet”.
2. En “Etiqueta de nombre”, colocamos “DemoIGWLaboratorio”, y le damos a “Crear gateway de Internet”.
3. Nos aparecerá nuestro nuevo Internet Gateway con un estado “Detached”, ya que no está ligado a ninguna VPC.
4. Para conectar el Intenet Gateway a nuestra VPC, simplemente le damos clic en “Acciones” -> “Conectar a la VPC”.
5. Aquí seleccionamos nuestra VPC, y le damos clic a “Concetar gateway de Internet”. Ojo, el Internet Gatway y la VPC deben estar en la misma región.

Ya con esto creamos dos de los componentes de nuestra VPC.

---
