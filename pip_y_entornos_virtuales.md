# 🐍 Apuntes de PIP y Entornos Virtuales

**Tabla de Contenido**

[TOC]

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
    pip install virtualenv
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

10. **Exportar requisitos de un entorno:**
    ```bash
    pip freeze > requirements.txt
    ```

11. **Instalar requisitos desde un archivo:**
    ```bash
    pip install -r requirements.txt
    ```

12. **Crear un entorno virtual con requisitos:**
    ```bash
    virtualenv nombre_entorno && source nombre_entorno/bin/activate && pip install -r requirements.txt
    ```

## 📚 Manejo Avanzado de Entornos Virtuales

13. **Crear un entorno virtual con Python específico:**
    ```bash
    virtualenv -p /ruta/a/python nombre_entorno
    ```

14. **Clonar un entorno virtual:**
    ```bash
    virtualenv --relocatable nombre_entorno
    ```

15. **Eliminar un entorno virtual:**
    ```bash
    rm -r nombre_entorno
    ```

## 🌐 Uso de Pipenv

16. **Instalar Pipenv (si no está instalado):**
    ```bash
    pip install pipenv
    ```

17. **Crear un entorno virtual con Pipenv:**
    ```bash
    pipenv install
    ```

18. **Activar un entorno virtual con Pipenv:**
    ```bash
    pipenv shell
    ```

19. **Desactivar un entorno virtual con Pipenv:**
    ```bash
    exit
    ```

20. **Instalar un paquete con Pipenv:**
    ```bash
    pipenv install nombre_paquete
    ```

## 🛠️ Otras Herramientas

21. **pyenv: **Gestor de versiones de Python.
    ```bash
    pyenv install version
    ```

22. **venv: **Módulo incorporado para entornos virtuales (Python 3.3+).
    ```bash
    python3 -m venv nombre_entorno
    ```

23. **conda: **Gestor de entornos y paquetes para Python y otros lenguajes.
    ```bash
    conda create --name nombre_entorno
    ```

24. **pipx: **Instala y ejecuta aplicaciones Python independientes.
    ```bash
    pipx install nombre_aplicacion
    ```


