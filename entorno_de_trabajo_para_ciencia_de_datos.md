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

## 2. Manejo de Archivos con Python

### 2.1 Manejo de rutas: problemática

Un problema común en el manejo de rutas es la incompatibilidad entre los sistemas de archivos de los sistemas operativos, ya sea Windows, Mac, Linux o WSL. Por ejemplo, Windows utiliza el “backslash” en sus rutas de archivos, mientras que el resto usa el “foward slash”.

**Solución al manejo de rutas**
Esto hace que, cuando inicies un nuevo proyecto, tengas que hacerte varias preguntas, por ejemplo:

* ¿Habrá más personas involucradas?
* ¿Habrá más de un ordenador involucrado?
* ¿Cuál será la ubicación del proyecto, dentro del sistema de archivos de cada ordenador?
* ¿Cómo se vería afectado un proyecto si reestructuras su contenido, en una fase intermedia de desarrollo?

Deberías poder trabajar en tu proyecto y no tener que preocuparte por nada más que eso.

### 2.2 Manejo de rutas del sistema: OS

#### 2.2.1 Objetivo

Crear la ruta “./data/raw/” independiente del sistema operativo. En este caso usaremos os, un módulo de Python que sirve para manejar rutas.

IMPORTANTE: cerciórate de que estás trabajando en el entorno correcto.

#### 2.2.2 Implementación

Dentro del notebook de jupyter:

```python
import os

CURRENT_DIR = os.getcwd()  # Ruta actual de trabajo
DATA_DIR = os.path.join(CURRENT_DIR, os.pardir, "data", "raw")
# este codigo une varias rutas, comenzando con
#la ruta actual, luego usa os.pardir que significa
#directorio del padre o .., haciendo retroceder una
#carpeta, luego une a la ruta data y por ultimo a raw

os.path.exists(DATA_DIR)  # Revisa si el path existe
os.path.isdir(DATA_DIR)  # Revisa si es un directorio

os.listdir(DATA_DIR)  # Itera por los archivos dentro del directorio

os.mkdir(os.path.join(DATA_DIR, "os"))  # Crea la carpeta *"os"*
```

### 2.3 Manejo de rutas del sistema: Pathlib

#### 2.3.1 Objetivo

Crear la ruta “./data/raw/” independiente del sistema operativo. Ahora usaremos pathlib, otro módulo de Python.

#### 2.3.2 Implementación

Dentr del notebook de jupyter:

```python
import pathlib

pathlib.Path()  # Genera un objeto Unix Path o 

CURRENT_DIR = pathlib.Path().resolve()  # Path local completo
DATA_DIR = CURRENT_DIR.parent.joinpath("data", "raw")  # Directorio objetivo

DATA_DIR.exists()  # Revisa si el directorio existe
DATA_DIR.is_dir()  # Revisa si es un directorio
```

Utiliza el método “parent” para obtener el directorio padre y de ahí concatenar el path de las carpetas “data” y “raw”.

Puedes crear una carpeta dentro de un directorio, usando el método “mkdir”:

```python
DATA_DIR.joinpath("<nombre_carpeta>").mkdir()
```

Para buscar la ruta de un archivo dentro del proyecto, usando regex:

```python
list(DATA_DIR.glob("<nombre_archivo>"))
```

### 2.4 Manejo de rutas del sistema: PyFilesystem2

#### 2.4.1 Objetivo

Crear la ruta “./data/raw/” independiente del sistema operativo. Ahora usaremos PyFilesystem2.

#### 2.4.2 Implementación

Dentro del notebook de jupyter:

```python
import fs

fs.open_fs(".")  # Abre una conexión con el path actual (OSFS)

CURRENT_DIR = fs.open_fs(".")

CURRENT_DIR.exists(".")  # Revisa si el directorio existe
DATA_DIR.listdir(".")  # Muestra el contenido dentro de la ruta.
```

* PyFilesystem2 genera un objeto OSFS (Operating System Filesystem).

* El inconveniente con este módulo es que el objeto OSFS solo detecta los objetos que existen en la ruta actual, por lo que si intentas acceder a un archivo ubicado en el directorio padre “…” te saltará un IndexError.

* Si necesitas que el objeto OSFS también detecte el directorio padre, además de las carpetas “data” y “raw”, vuelve a generar el objeto de la siguiente forma:

```python
fs.open_fs("../data/raw/")  # Ruta objetivo
```

### 2.5 Crear referencias relativas de archivos

#### 2.5.1 Objetivo

Necesitamos encontrar una forma de evitar que nuestro proyecto se rompa cuando movamos de lugar un archivo dentro del proyecto, para esto usaremos Referencias Relativas.

#### 2.5.2 Implementación

Usando PyProjRoot:

```python
import pyprojroot

pyprojroot.here()  # Esto es un Posix Path (pathlib)
pyprojroot.here().joinpath("data", "raw")
```

* El path en pyprojroot se construye desde la raíz, no desde el path del archivo que lo ejecuta.
* Puedes mover el archivo a cualquier parte de la carpeta del proyecto, pero los paths no se romperán.

Usando PyHere:

```python
import pyhere

pyhere.here()  # También regresa un Posix Path
```

* El directorio que regresa es el directorio padre del directorio actual.

#### 2.5.3 Comparación

Estas dos líneas de código regresan el mismo resultado:

```python
pyprojroot.here("data").joinpath("raw")
pyhere.here().resolve() / "data" / "raw"
```

Estas dos librerías sirven para crear shortcuts. Para esto, se puede usar la siguiente función:
Estos shorcuts nos va ayudar a encontrar rutas mas rapido, además solo tendriamos que colocar el directorio principal y luego lo que queremos buscar.

```python
def make_dir_function(dir_name):
    def dir_function(*args):
        return pyprojroot.here()joinpath(dir_name, *args)
    return dir_function

data_dir = make_dir_function("data")
data_dir("raw", "pathlib")  # Devuelve el path personalizado
```

* Puedes crear la cantidad de shortcuts que tu proyecto necesite.

## 3. Caso Práctico

### 3.1 Descarga de plantilla y configuración de ambiente virtual

#### 3.1.1 Descarga e Instalación

En el buscador de github, con solo colocar [cookiecutter](https://github.com/search?q=cookiecutter&type=repositories) te va aparecer muchas plantillas, la mas usada para siencia de dato es de [drivedata](https://github.com/drivendata/cookiecutter-data-science), sin embargo, solo funciona con pip, asi que el siguiente ejemplo es con otra plantilla que usa conda.

Para instalar y ejecutar la plantilla a usar, en el caso práctico, en una terminal escribir:

```python
conda config --add channels conda-forge
conda create --name <nombre_ambiente> coockiecutter=1.7.3 coockiecutter
conda activate <nombre_ambiente>
cookiecutter https://github.com/jvelezmagic/cookiecutter-conda-data-science
```

Durante la instalación de la plantilla y para que puedas reproducir el proyecto del profesor, elige las siguientes opciones:

* Select project packages: Minimal
* Python version: 3.9

#### 3.1.2 Activación

Para activar el proyecto, ejecutar lo siguiente en consola:

```python
cd <nombre_carpeta_proyecto>
conda env create --file environment.yml
conda list python
code .
```

### 3.2 uso de scripts en notebooks

Una vez descargado, puedes instalar un proyecto como módulo de Python usando el siguiente comando en la terminal:

```python
pip install --editable .
```

Para que se reinicie el kernel, cada vez que reimportes los módulos después de hacer un cambio en estos, agrega esto en la primera celda:

```python
%load_ext autoreload
%autoreload 2
```

El hacer el autoreload te ayuda a externalizar trozos de código en archivos .py, como la creación de gráficos.
Los notebooks son buenos para hacer exploración, pero no para producción.

### 3.3 Flujo de trabajo de los notebooks

Recomendaciones:

* Crear subcarpetas dentro de la carpeta de notebooks para mayor organización del código.

* Se recomienda utilizar un sistema de nombrado de los notebooks, como el siguiente:
>
><número_notebook>-<nombre_programador>-<nombre_notebook>.ipynb

>0.0-ghm-transformacion_de_datos.ipynb
>

El número de notebook es para saber el orden en que se van a ejecutar las notebooks
También puedes exportar el notebook a texto plano (archivo .py).
