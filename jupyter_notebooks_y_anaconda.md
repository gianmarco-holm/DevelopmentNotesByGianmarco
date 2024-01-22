# 📊 Apuntes de Jupyter Notebooks y Anaconda

## Tabla de Contenido

[TOC]

## Jupyter Notebooks

>Una notebooks a diferencia de un script, nos va a ayudar mas a experimentar, documentar que esta pasando y presentar nuestros descubrimientos.
>**Notebooks locales vs en la nube** Ambos son utiles, pero los de las nube nos va ahorrar tiempo en configuración del entorno, tiempo de ejecución y escalabilidad

### 🚀 Introducción a Jupyter

1. **Instalación de Jupyter:** Instala Jupyter Notebook usando pip.

    ```bash
    pip install jupyter
    ```

2. **Iniciar Jupyter Notebook:** Inicia el servidor Jupyter localmente.

    ```bash
    jupyter notebook
    ```

3. **Celdas:** Tipos de celdas (código, markdown) y su uso.

    ```python
    # Esto es una celda de código
    print("Hola, Jupyter!")

    ```

    ```markdown
    <!-- Esto es una celda de markdown -->
    # Título
    Texto *enfasis*
    ```

### 🚀 Introducción a Google Colab

1. **Ingreso:**

    ```bash
    # Se puede ingresar desde la web como google colaboratory
    # Tambien puedes ingresar desde Google Drive -> Nuevo -> Conectar
    # Ejemplo de uso
    https://drive.google.com/file/d/1j2W4ZZu1k20TXRqDdaHZ_FnOtumAWDxk/view?usp=sharing
    ```

### 🚀 Introducción a Notebook con VsCode

**Manejadores de codigo:**
    ![Editores vs IDE](./images/editores%20vs%20ide.png)

1. **Introducción:**

    ```bash
    # Descargo e instalo el editor de codigo VsCode
    # Instalar WSL con power shell
    wsl --install
    # Desde Microsoft Store instala Ubuntu
    # Luego abres la terminal o ubuntu y pedirá establecer un usuario y contraseña
    sudo apt update
    sudo apt upgrade
    sudo apt install build-essential
    # Ahora se debe revisar si python o el gestor de dependencia de python que es pip ya esta instalado
    python3 --version
    pip3 --version
    # Si no esta instalado, debemos instalarlo
    sudo apt update
    sudo apt install python3
    #Luego
    sudo apt install python3-pip
    # Luego se abre VsCode y se instala la extensión WSL
    # Luego en la terminal se abre con
    code .
    # Agregar las siguientes extenciones
    # WSL
    # Python
    # Magic Python
    # Material Icon Theme
    # Rainbow Brackets
    ```

### 📈 Uso Básico

1. **Guardar y Exportar:** Guardar y exportar el notebook.
    - Guardar: `Ctrl + S` o `File -> Save and Checkpoint`
    - Exportar: `File -> Download as -> [Formato]`

2. **Widgets Interactivos:** Crear widgets para interactividad.

    ```python
    from ipywidgets import interact

    def cuadrado(numero):
        return numero ** 2

    interact(cuadrado, numero=5)
    ```

3. **Extensiones:** Instalar y usar extensiones para mejorar la funcionalidad.

    ```bash
    pip install jupyter_contrib_nbextensions
    jupyter contrib nbextension install --user
    ```

## Anaconda

> Conda es el entorno virtual para aislar las dependencias no solo de python, tambien de otros lenguajes y es el mas usado para ciencia de datos
> Puedes instalar minicinda que viene con algunos paquetes y python o anaconda que viene con mas de 150 dependencias.

![Conda](./images/conda.jpeg){width:px}

### 🚀 Gestión de Entornos

1. **Instalación de Anaconda:** Descargar e instalar Anaconda desde el sitio oficial.

    ```bash
        # Si es Linux deberas copiar la liga o el link de descarga y ejecutar el siguiente comando
        wget -O anaconda.sh linkDeDescarga
        bash anaconda.sh
        # Para saber si esta instalado, puedes reiniciar tu terminal y ejecutando
        conda info
        # Recargala shel
        zsh o bash
        # SI no funciona puede ser que no se agrego correctamente la variable de entorno y puedes hacer lo siguiente
        vim .zshrc
        #Luego tecleas i para insertar, y colocas esta varias y luego le das esc y luego tecleas :wq para guardar y salir
        export PATH="$HOME/miniconda3/bin:$PATH"
        # Si luego hay algun error de inicialización ejecutas
        conda init zsh o bash
        # Luego recargas la shell
    ```

    ```bash
        # Para miniconda
        mkdir -p ~/miniconda3
        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
        bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
        rm -rf ~/miniconda3/miniconda.sh
        # Despues inicialice el shell
        ~/miniconda3/bin/conda init bash
        ~/miniconda3/bin/conda init zsh
        # https://docs.conda.io/projects/miniconda/en/latest/
    ```

2. **Crear Entorno:** Crear un entorno virtual con Anaconda.

    ```bash
    # Forma 1, Aca no se instala nada, tampoco python
    conda create --name mi_entorno
    # Forma 2
    conda create --name mi_entorno python=3.5 pandas
    ```

3. **Activar Entorno:** Activar un entorno virtual con Anaconda.
    - En Windows: `activate mi_entorno`
    - En macOS/Linux: `source activate mi_entorno`
    - Tambien `conda activate mi_entorno`

4. **Desactivar Entorno:** Desactivar un entorno virtual con Anaconda.
    - En Windows: `deactivate`
    - En macOS/Linux: `source deactivate`
    - Tambien `conda deactivate`conda inf

### ⚙ Gestión de Paquetes

1. **Instalar Paquetes:** Instalar paquetes con conda.

    ```bash
    conda install nombre_paquete
    # Para especificar versión
    conda install pandas=1.2
    conda install python=3.11 panda=1.2
    ```

2. **Actualizar Paquetes:** Actualizar paquetes con conda.

    ```bash
    conda update nombre_paquete
    ```

3. **Listar Paquetes:** Listar paquetes instalados en el entorno.

    ```bash
    conda list
    # Para buscar una liberia
    conda list pandas
    ```

4. **Listar Entornos:** Listar entornos creados

    ```bash
    conda env list
    ```

5. **Eliminar Paquetes:** Eliminar paquetes con conda.

    ```bash
    conda remove nombre_paquete
    ```

6. **Eliminar entornos:**

    ```bash
    conda env remove --name nombre_entorno
    ```

7. **Clonar un entorno a otro:**

    ```bash
    create --name entorno2 --copy --clone entorno1
    ```

8. **Revisiones:** Las revisiones sirven para regresar en el tiempo

    ```bash
    # Para listar revisiones
    conda list --revision
    # Voy a encontrra historia de instalaciones de librerias anteriores o cambios de las versiones
    # Si quiero regresar a una revisión
    conda install --revision numero_de_revision
    ```

9. **Exportar requisitos de conda:**

    ```bash
    conda env export --from-history --file enviroment.yml
    ```

10. **Instalar requisitos desde un archivo:**

    ```bash
    conda env create --file enviroment.yml
    # o para requirements.txt que se instala las dependencias en un entorno ya existente
    conda install --file requirements.txt
    ```

### Mamba

> Es un acelerador de creación de ambiente de conda, que usa la misma sintaxis

1. **Instalar mamba**

    ```bash
    conda install --channel conda-forge mamba
    # Para probar
    mamba --help
    ```

2. **Usar mamba**

    ```bash
    # Traer ambiente de un archivo yml
    # Primero eliminas el ambiente de conda
    conda env remove --name nombbre_entorno
    mamba env create --file enviroment.yml
    # Y lo activas con conda
    conda activate nombre_entorno
    # Lo demas se usa con mamba al inicio
    ```
