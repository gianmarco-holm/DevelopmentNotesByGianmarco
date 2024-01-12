# 🐍 Apuntes de PIP y Entornos Virtuales

**Tabla de Contenido**

[TOC]

## Teoría

`pip` es el sistema de gestión de paquetes de Python. Permite instalar y gestionar bibliotecas, módulos y herramientas escritos en Python. Con pip, puedes instalar paquetes desde el índice oficial de paquetes de Python, PyPI (Python Package Index), así como desde otras fuentes.

Un `entorno virtual` es un entorno de desarrollo Python aislado que permite gestionar las dependencias de un proyecto específico sin afectar al sistema global de Python. Esto es útil cuando trabajas en múltiples proyectos que pueden requerir versiones diferentes de las mismas bibliotecas o cuando quieres evitar conflictos entre las dependencias de diferentes proyectos.

## 🚀 Instalación de PIP

1. **Verificar si PIP está instalado:**
    ```bash
    pip --version
    ```

2. **Instalar PIP (si no está instalado):**
    ```bash
    # Para Python 2
    sudo apt-get install python-pip

    # Para Python 3
    sudo apt-get install python3-pip
    ```

## 📦 Manejo de Paquetes con PIP

3. **Instalar un paquete:**
    ```bash
    pip install nombre_paquete
    ```

4. **Instalar una versión específica de un paquete:**
    ```bash
    pip install nombre_paquete==version
    ```

5. **Desinstalar un paquete:**
    ```bash
    pip uninstall nombre_paquete
    ```

## 🌐 Entornos Virtuales

6. **Instalar virtualenv (si no está instalado):**
    ```bash
    # en PIP
    pip install virtualenv
    # en Linux
    sudo apt install python3-venv
    # en windows ya viene instalada cuando instalas python
    ```

7. **Crear un entorno virtual:**
    ```bash
    # Para Python 2
    virtualenv nombre_entorno

    # Para Python 3
    python3 -m venv nombre_entorno
    ```

8. **Activar un entorno virtual:**
    - En Linux/Mac:
        ```bash
        source nombre_entorno/bin/activate
        ```
    - En Windows:
        ```bash
        .\nombre_entorno\Scripts\activate
        ```

9. **Desactivar un entorno virtual:**
    ```bash
    deactivate
    ```

## ⚙ Gestión de Requisitos

> *VirtualEnv y Venv son herramientas para crear entornos virtuales, para python 2 es recomendable usar VirtualEnv y para pthon3 se usa Venv ya que tiene mejor rendimiento.*

> *Tambien existe Conda, pero es usado para ciencia de datos y además de crear un entorno virtual, tambien gestiona dependencias y no solo de python, sino de otros lenguajes tambien.*

10. **Exportar requisitos de un entorno:**
    ```bash
    pip freeze > requirements.txt
    # Para ver todas las librerías instaladas en el entorno
    pip freeze
    # Para ver todas las librerías instaladas en en el entorno global de python
    pip list
    ```

11. **Instalar requisitos desde un archivo:**
    ```bash
    pip install -r requirements.txt
    ```

12. **Crear un entorno virtual con requisitos:**
    ```bash
    # Para virtualenv
    virtualenv nombre_entorno && source nombre_entorno/bin/activate && pip install -r requirements.txt
    # Para venv
    python -m venv nombre_entorno && source nombre_entorno/bin/activate && pip install -r requirements.txt
    ```

13. **Eliminar un entorno virtual:**
    ```bash
    rm -r nombre_entorno
    ```

## 🌐 Uso de Pipenv

> *Es otra herramienta como venv o virtualenv, es mas popular para proyectos web y combina la gestión de dependencia con la gestión de entornos virtuales, 2 en 1, además permite bloquear la verción de las dependencias instaladas, permitiendo la creación de entornos exactos.*

14. **Instalar Pipenv (si no está instalado):**
    ```bash
    pip install pipenv
    ```

15. **Crear un entorno virtual con Pipenv:**
    ```bash
    pipenv install
    ```

16. **Activar un entorno virtual con Pipenv:**
    ```bash
    pipenv shell
    ```

17. **Desactivar un entorno virtual con Pipenv:**
    ```bash
    exit
    ```

18. **Instalar un paquete con Pipenv:**
    ```bash
    pipenv install nombre_paquete
    ```

## 🛠️ Docker

> *Docker y los entornos virtuales se usan juntos
+Los entornos virtuales son útiles para aislar las dependencias de tu proyecto en un espacio separado, evitando conflictos entre diferentes proyectos
+Docker se utiliza para encapsular aplicaciones en contenedores, siendo valioso cuando necesitas asegurarte de que tu aplicación se ejecute de la misma manera en diferentes entornos*

19. **Paso 1: **Se crea el archivo Dockerfile
    ```bash
    # Para scripts de python
    FROM python:3.10

    WORKDIR /app
    COPY requirements.txt /app/requirements.txt

    RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

    COPY . /app/

    CMD bash -c "while true; do sleep 1; done"

    FROM python:3.10

    # Para scripts de python de web service
    WORKDIR /app
    COPY requirements.txt /app/requirements.txt

    RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

    COPY . /app

    CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
    ```

20. **Paso 2: **Se crea el archivo docker-compose.yml
    ```bash
    # Para scripts de python
    services:
        aplicacion:
            build:
                context: .
                dockerfile: dockerfile
            volumes:
                - .:/app

    # Para scripts de python de web service
    services:
        web-server:
            build:
                context: .
                dockerfile: dockerfile
            volumes:
                - .:/app
            ports:
            - '80:80'
    ```

20. **Paso 3: **Luego se ejecuta los siguientes comandos en la terminal
    ```bash
    #Enciendes docker, entrando al app, para ello ya debe estar instalado docker y docker-compose
    #Para construir el contenedor
    docker-compose build
    #Para levantar el contenedor
    docker-compose up -d
    #Para ver el estado del contenedor
    docker-compose ps
    # Para ingresar al contenedor y poder interactuar como linux
    docker-compose exec aplicacion bash
    #Para salir del bash del contenedor
    exit
    ```




