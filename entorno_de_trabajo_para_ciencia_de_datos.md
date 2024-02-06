# Configuración Profesional de Entorno de Trabajo para Ciencia de Datos

## 1. Plantillas de Proyectos

Las plantillas de proyectos son un medio que posibilita portar o construir un diseño predefinido. Estas te permiten definir carpetas, notebooks, scripts, archivos de configuración, etc.

Algunas razones para usar plantillas en proyectos se debe a que:

* Agiliza tu trabajo y reduce la fatiga por decisión.
* Es más fácil de personalizar un proyecto hecho con plantillas que hecho desde cero.
* La reproducibilidad de un proyecto es más viable.
* Es más fácil encontrar algo entre los componentes del proyecto.

### 1.1 Instalar Cookiecutter

Es un manejador de plantillas multiplataforma (Windows, Mac OS, Linux) que te permite hacer plantillas en lenguaje de programación o formato de marcado. Puede ser usado como herramienta de línea de comandos o como librería de Python.

Cookiecutter funciona con Jinja, un motor de plantillas extensible con el cual puedes crear plantillas como si estuvieras escribiendo código en Python.

**¿Cómo funciona?**

Hay 3 pasos para entender la manera en que funciona:

* Detectará una sintaxis especial en los documentos y carpetas de tu proyecto.
* Buscará variables y valores a reemplazar.
* Finalmente, entregará un proyecto con la estructura definida en la plantilla.

#### 1.1.1 Sintaxis de Jinja

Existen 3 tipos diferentes de bloques:

* **Bloques de expresión:** se usan para incluir variables en la plantilla:

```bash
    {{ cookiecutter.saluda }}
```

* **Bloques de declaración:** se usan para el uso de condicionales, ciclos, etc.:

```bash
    {% if coockiecutter.eres_asombroso %}
    . . .
    {% endif %}
```

* **Bloques de comentario:** se usan para dejar comentarios o recomendaciones a los propios desarrolladores:

```bash
    {# Esto es un comentario #}
```

#### 1.1.2 Instalación de Cookiecutter

**Importante:** Todos los pasos son vía consola y con Anaconda instalado.

1. Crea una carpeta un entrar en ella:

    ```bash
    mkdir <nombre_carpeta>
    cd <nombre_carpeta>
    ```

2. Agrega el canal Conda-Forge a tu configuración global:

    ```bash
    conda config --add channels conda-forge
    ```

3. Crea un ambiente virtual que contenga a Coockiecutter:

    ```bash
    conda create --name <nombre_ambiente> coockiecutter=1.7.3
    ```

4. Activa el ambiente virtual:

    ```bash
    conda activate <nombre_ambiente>
    ```

5. Definir en dónde estará tu ambiente:

    ```bash
    conda env export --from-history --file environment.yml
    ```

6. Para desactivar el ambiente virtual:

    ```bash
    conda deactivate
    ```

##### 1.1.3 Ejemplo de Uso de Cookiecutter

1. Plantilla de ciencia de datos

    ```bash
    cookiecutter https://github.com/platzi/curso-entorno-avanzado-ds --checkout cookiecutter-personal-platzi
    ```

### 1.2 Crear una plantilla

#### 1.2.1 Estructura inicial de la plantilla

1. Dentro de la carpeta principal crea la carpeta que contendrá todo lo que necesitarás en tu proyecto con el nombre:

    > {{ cookiecutter.project.slug }}

2. En la carpeta {{ cookiecutter.project.slug }} recién creada agrega los siguientes archivos:

    > README.md
    > environment.yml

    También crea las carpetas que necesitará tu proyecto:

    > /data
    > /notebooks

3. Afuera de la carpeta, pero dentro de la carpeta principal, crea el siguiente archivo:

    > environment.yml
    > coockiecutter.json

    Hay dos archivos environment.yml, el de configuración de entorno (dentro de la carpeta que creaste) y el que configura las dependencias y paquetes (en la carpeta principal).

#### 1.2.2 Información de README.md

Adentro del archivo README.md agrega las siguientes líneas que lo harán un archivo dinámico:

```bash
    # {{ cookiecutter.project_name }} 

    By: {{ cookiecutter.project_author_name }}.

    Version: {{ cookiecutter.project_version }}

    {{ cookiecutter.project_description }}

    ## Prerequisites

    - [Anaconda](https://www.anaconda.com/download/) >=4.x
    - Optional [Mamba](https://mamba.readthedocs.io/en/latest/)

    ## Create environment

    ```bash
    conda env create -f environment.yml
    activate {{ cookiecutter.project_slug }}
    ```

    or

    ```bash
    mamba env create -f environment.yml
    activate {{ cookiecutter.project_slug }}
    ```

    ## Project organization

        {{ cookiecutter.project_slug }}
            ├── data
            │   ├── processed      <- The final, canonical data sets for modeling.
            │   └── raw            <- The original, immutable data dump.
            │
            ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
            │                         the creator's initials, and a short `-` delimited description, e.g.
            │                         `1.0-jvelezmagic-initial-data-exploration`.
            │
            ├── .gitignore         <- Files to ignore by `git`.
            │
            ├── environment.yml    <- The requirements file for reproducing the analysis environment.
            │
            └── README.md          <- The top-level README for developers using this project.
```

Estas líneas, hechas en Jinja, permitirán a tu archivo acceder a las variables que contienen la información del título, autor y descripción del proyecto.

#### 1.2.3 Información de environment.yml (entorno)

Es decir el enviroment que esta afuera, en la carpeta principal

```bash
# conda env create --file environment.yml
name: cookiecutter-personal-platzi
channels:
  - anaconda
  - conda-forge
  - defaults
dependencies:
  - cookiecutter
```

#### 1.2.4 Información de environment.yml (configuración)

Se refiere al enviroment que esta dentro de la carpeta {{ cookiecutter.project_slug}}

```bash
# conda env create --file environment.yml
name: {{ cookiecutter.project_slug }}
channels:
  - anaconda
  - conda-forge
  - defaults
dependencies:
  {% if cookiecutter.project_packages == "All" -%}
  - fs
  - jupyter
  - jupyterlab
  - pathlib
  {% endif -%}
  - pip
  {% if cookiecutter.project_packages == "All" -%}
  - pyprojroot
  {% endif -%}
  - python={{ cookiecutter.python_version }}
  - pip:
    {% if cookiecutter.project_packages == "All" -%}
    - pyhere
    {% endif -%}
```

#### 1.2.5 Agregando información a coockiecutter.json

Dentro de este archivo configurarás todos los valores de las variables que utilizas en los demás archivos:

``` bash
{
    "project_name": "Cookiecutter Personal",
    "project_slug": "{{ cookiecutter.project_name.lower().replace(' ', '_').replace('-', '_') }}",
    "project_author_name": "Your name (or your organization/company/team)",
    "project_author_email": "Yout email (or your organization/company/team)",
    "project_description": "A short description of the project.",
    "project_packages": ["All", "Minimal"],
    "python_version": "3.7",
    "project_version": "0.1.0"
}
```

Ejecuta el proyecto

``` bash
cookiercutter .
```

### 1.3 Implementar Hooks

Los Hooks son sentencias que se van a ejecutar antes o después de generar la plantilla de datos. Por ejemplo, puedes usarlos para verificar el nombre de una carpeta, actualizar git, etc.

#### 1.3.1 Implementación de Hooks

* Se crea la carpeta “hooks”, adentro de la carpeta principal de tu proyecto.
* Dentro de la carpeta se agregan los archivos “pre_gen_project.py” (lo que se ejecuta antes de generar la plantilla) y “post_gen_project.py” (lo que se ejecuta después de generar la plantilla).

#### 1.3.2 pre_gen_project.py

Por ejemplo, en “pre_gen_project.py” se puede inicializar git o validar nombres y archivos para evitar errores.

``` bash
# Importar el módulo os para interactuar con el sistema operativo
import os

# Importar el módulo sys para interactuar con el intérprete de Python
import sys

# Obtener el valor del proyecto desde la plantilla usando cookiecutter
project_slug = "{{ cookiecutter.project_slug }}"

# Código de escape ANSI para establecer el color del texto siguiente en rojo
ERROR_COLOR = "\x1b[31m"

# Código de escape ANSI para establecer el color del texto siguiente en azul
MESSAGE_COLOR = "\x1b[34m"

# Código de escape ANSI para restablecer todos los formatos de texto a los valores predeterminados
RESET_ALL = "\x1b[0m"

# Verificar si el nombre del proyecto comienza con "x"
if project_slug.startswith("x"):
    # Imprimir un mensaje de error en rojo y salir del script con código de error 1
    print(f"{ERROR_COLOR}ERROR: {project_slug=} no es un nombre válido para esta plantilla.{RESET_ALL}")
    sys.exit(1)

# Imprimir un mensaje en azul alentando al usuario y mostrando el directorio de trabajo actual
print(f"{MESSAGE_COLOR}¡Vamos allá! ¡Estás a punto de crear algo increíble!")
print(f"Creando el proyecto en { os.getcwd() }{RESET_ALL}")
```

#### 1.3.3 post_gen_project.py

En el archivo “post_gen_project.py” se puede hacer el primer commit en git o mostrar la finalización de la instalación de dependencias.

``` bash
# Importar el módulo subprocess para ejecutar comandos de shell
import subprocess

# Código de escape ANSI para establecer el color del texto siguiente en azul
MESSAGE_COLOR = "\x1b[34m"

# Código de escape ANSI para restablecer todos los formatos de texto a los valores predeterminados
RESET_ALL = "\x1b[0m"

# Imprimir un mensaje en azul indicando el progreso
print(f"{MESSAGE_COLOR}¡Casi terminado!")

# Imprimir un mensaje indicando la inicialización de un repositorio git
print(f"Inicializando un repositorio git...{RESET_ALL}")

# Ejecutar el comando 'git init' para inicializar un nuevo repositorio Git
subprocess.call(['git', 'init'])

# Ejecutar el comando 'git add *' para agregar todos los archivos al área de preparación
subprocess.call(['git', 'add', '*'])

# Ejecutar el comando 'git commit -m "Initial commit"' para realizar un commit inicial
subprocess.call(['git', 'commit', '-m', 'Commit inicial'])

# Imprimir un mensaje en azul indicando la finalización y alentando al usuario
print(f"{MESSAGE_COLOR}¡La estructura de tu proyecto esta definido! ¡Crea y diviértete!{RESET_ALL}")
```

### 1.4 Distribuir Plantilla de Proyecto

Almacenar tu plantilla te permite poder compartirla con los demás y poder acceder a ella cuando necesites crear un nuevo proyecto.

#### 1.4.1 Distribución de tu plantilla (GitHub)

* Crea un nuevo repositorio vacío en GitHub. Puedes no agregar ninguna información sobre tu repositorio por el momento.
* Dentro de la carpeta que contiene tu proyecto inicializa git y haz tu primer commit:

```bash
git init .
git add .
git commit -m "Initial commit"
```

* Ahora, para subir a GitHub tu proyecto, ejecuta lo siguiente:

```bash
git remote add origin https://github.com/<usuario>/<repositorio>.git
git branch -M main
git push -u origin main
```

* No olvides eliminar cualquier carpeta innecesaria (por ejemplo, la carpeta que se genera cuando ejecutas Coockiecutter).
* Para evitar que git ignore las carpetas vacías, agrega un archivo “.gitkeep” dentro de cada carpeta vacía.
* Para ejecutarlo se usa lo siguiente

```bash
cookiecutter https://github.com/<usuario>/<repositorio>.git
```

Cuando usas “cookiecutter” como parte del nombre de tu proyecto, este puede ser encontrado por otras personas en GitHub. De esta forma podrás ayudar a otros científicos de datos, facilitándoles el trabajo.
