# Curso Práctico de AWS: Cómputo con EC2

## 1. Principios

### 1.1 Configuración de Budget en AWS

Budget son alertas de costo que podemos crear en AWS, primero activamos la opción para que los usuarios y rol puedan tener acceso a estas alertas.

`perfil > cuenta > Acceso de usuario de IAM y rol a información de facturación > Editar > Activar`

Luego creamos un presupuesto mensual para poder visualizarlo en el panel de costo, ya que daily no se peude visualizar.

`Facturación y Gestión de Costos > Presupuestos > Crear presupuesto > Personalizar (Avanzado) > Colocar nombre > Periodo mensual > Presupuesto recurrente > Método de presupuesto Fijado > Monto 1.00 > Todos los servicios > Next > Establecemos la alerta con 1.00 > Valor absoluto > desencadenar : Actual > Colocamos correos`

### 1.2 Fundamentos de EC2

EC2: Elastic Compute Cloud = infraestructura como servicio. Consiste principalmente en la capacidad de computo:

* Alquilar maquinas virtuales
* almacenamiento de datos EBS (Elastick Block Store)
* Escalar servicios utilizando un ASG (Auto Scaling Group)
* Distribucion de carga entre maquinas con ELB (Elastick Load Balancer)

Opciones de configuracion:

* Linux
* Windows
* MacOS (Proximamente)

Opciones de tamaño:

* Potencia de computo: nucleos de CPU
* Memoria RAM
* Espacio de almacenamiento
* Tarjeta de red, velocidad de transferencia
* Reglas de firewall, bloquear entradas y salidas
* Acciones de arranque, scrips con preconfiguraciones., actualizaciones, descarga de archivos, software, etc. Script de arranque que prepara tu maquina con todo lo necesario, unicamente se puede ejecutar como usuario root.

### 1.3 Lab: Crear tu primera instancia EC2

```bash
    # Crear isntancia en AWS
    # Buscar EC2
    # Ingresar a instancias
    crear instancia > colocar nombre >
    # Escogemos la AMI o plantilla de sistema operativo y aplicaciones necesarias para lanzar la instancia
    escogemos Amazon Linux >
    # Escogemos el tipo de instancia que son las especificaciones que va a tener la maquina virtual en este caso escogeremos
    escogemos t2.micro
    # Creamos par de claves para la conexión SSH
    crear nuevo par de claves > RSA > .pem > crear par de clavez
    # Ingresamos a configuraciones de red
    creamos grupo de seguridad o escogemos uno existente > permitir el trafico de SSH desde 0.0.0.0/0
    # configuramos el almacenamiento en este caso colocaremos 8 gb
    colocamos 8gb de gp3
    # ingresamos a Detalles avanzados
    nos vamos hasta la parte de version de metadatos y colocamos V1 y V2 > en la parte de Datos de usuario colocamos el script bash de abajo > y por último lanzar instancia
    # luego nos vamos a instancias y veremos la instancia creada, y abajo en detalle veremos la dirección IPv4 pública y si queremos ingresar no nos va a dejar para ello tenemos que configurar un puerto de entrada y salida por el cual, cualquiera puede ingresar
```

```bash
#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
```

### 1.4 Lab: Configura tu grupo de Seguridad

```bash
    # Seleccionamos la instancia y nos vamos a la parte de seguridad
    damos click al grupo de seguridad > en reglas de entrada le damos en editar
    # Para que cualquiera pueda entrar le vamos a agregar reglas de hhtp
    agregar regla > http > Anywhere IPv4 y otra regla para Anywhere IPv6 > Guardar reglas
    # Ahora nos vamos a reglas de salida
    editar regla > Todo el trafico
    # Con eso ya podemos ingresar a la dirección IPv4 desde cualquier lado
    # Para que amazon nos deje de cobrar nos vamos a
    estado de instanacia > detener instancia
```

## 2. seguridad

### 2.3. Tipos de instancias en EC2

Los tipos de instancias tienen el siguiente formato

`c3.large`

c: Familia de instancia
3: la generación de instancia, es la versión de instancia
large: es el tamaño, a mayor tamaño, mayor recursos tendrá

* General Purpose:
  * Para proyectos como paginas web o repositorios de código.

* Compute Optimized:
  * Carga de trabajo de procesamiento por lotes
  * Transcodificación de medios
  * Servidores web de alto rendimiento
  * Informática de alto rendimiento (HPC)
  * Modelado científico y Machine Learning
  * Servidores de Juegos dedicados

* Memory Optimized:
  * Bases de datos
  * Cache Distribuido
  * Aplicaciones BI
  * Aplicaciones para procesamiento en tiempo real

* Storage optimized:
  * Procesamiento de transacciones (OLTP)
  * Bases de datos relaciones y NoSQL
  * Redis (Cache DB en memoria)
  * Almacenamiento de datos

Para ver las tipos de instancias, lo vemos en este [enlace](https://aws.amazon.com/es/ec2/instance-types/)

### 2.2. Grupos de seguridad y puertos clásicos

Grupos de Seguridad:

* Fundamentales para la seguridad.
* Reglas de permisos para trafico entrante/saliente (firewall)
* No es software, es un componente que se adjunta a las intancias EC2.
* Puedes referenciar grupos de seguridad entre si.

Puertos Clásicos:

* 21 ftp
* 22 ssh
* 22 sftp
* 80 http
* 443 https
* 3389 RDP

### 2.3. Lab: Crea nuevos grupos de seguridad para tu instancia

```bash
EC2 > Grupos de seguridad > crear grupo de seguridad > colocamos nombre y descripción
Colocamos las reglas de entrada y salida en este caso abrimos los puertos 80 para la entrada y colocamos todo el trafico para
las reglas de salida

# Para apuntar la isntancia al nuevo grupo de seguridad
EC2 > instancias > seleccionamos la instancia > acciones > seguridad > cambiar grupo de seguridad > eliminarmos el anterior grupo de seguridad > buscamos el grupo de seguridad creado y lo seleccionamos
```

## 3. Conexión

### 3.1. ¿Qué es SSH?

Uno de los protocolos más usados para conectarnos a nuestras instancias de manera remota. Protocolo de administración remota que nos permite conectarnos a los usuarios y controlar remotamente los servidores no sólo en AWS.

Requerimientos:

* Llave Pública
* Llave Privada

Cuando las llaves hacen match me puedo conectar al servidor desde mi computadora personal de manera remota

El servicio de AWS se llama Instance Connect y tambien puedes usar puttin

Problemas comunes

* Tiempos de espera de conexión (importante hace la configuración correcta de los grupos de seguridad)
* Pueden haber problemas con firewalls que tengamos configurados en nuestra red
* Hay conexión rechazada (depende de la instancia, puede crearse de nuevo y volver a asignar el grupo de seguridad)
* Permiso denegado (clave pública, gssapi-keyx, gassapi-with-mic) de los problemas más comunes debido a conexión con diferente llave a la adjuntada en la creación
