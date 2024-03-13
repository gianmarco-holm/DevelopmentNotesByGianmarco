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