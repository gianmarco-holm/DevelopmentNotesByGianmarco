# 📊 Apuntes de Jupyter Notebooks y Anaconda

## Jupyter Notebooks

### 🚀 Introducción a Jupyter

1. **Instalación de Jupyter: **Instala Jupyter Notebook usando pip.
    ```bash
    pip install jupyter
    ```

2. **Iniciar Jupyter Notebook: **Inicia el servidor Jupyter localmente.
    ```bash
    jupyter notebook
    ```

3. **Celdas: **Tipos de celdas (código, markdown) y su uso.
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

1. **Ingreso: **
    ```bash
    # Se puede ingresar desde la web como google colaboratory
    # Tambien puedes ingresar desde Google Drive -> Nuevo -> Conectar
    # Ejemplo de uso
    https://drive.google.com/file/d/1j2W4ZZu1k20TXRqDdaHZ_FnOtumAWDxk/view?usp=sharing
    ```

### 🚀 Introducción a Notebook con VsCode

1. **Manejadores de codigo: **
    ![Editores vs IDE](./images/editores%20vs%20ide.png)

1. **Introducción: **
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
    ```

### 📈 Uso Básico

4. **Guardar y Exportar: **Guardar y exportar el notebook.
    - Guardar: `Ctrl + S` o `File -> Save and Checkpoint`
    - Exportar: `File -> Download as -> [Formato]`

5. **Widgets Interactivos: **Crear widgets para interactividad.
    ```python
    from ipywidgets import interact

    def cuadrado(numero):
        return numero ** 2

    interact(cuadrado, numero=5)
    ```

6. **Extensiones: **Instalar y usar extensiones para mejorar la funcionalidad.
    ```bash
    pip install jupyter_contrib_nbextensions
    jupyter contrib nbextension install --user
    ```

## Anaconda

### 🚀 Gestión de Entornos

7. **Instalación de Anaconda: **Descargar e instalar Anaconda desde el sitio oficial.

8. **Crear Entorno: **Crear un entorno virtual con Anaconda.
    ```bash
    conda create --name mi_entorno python=3.8
    ```

9. **Activar Entorno: **Activar un entorno virtual con Anaconda.
    - En Windows: `activate mi_entorno`
    - En macOS/Linux: `source activate mi_entorno`

10. **Desactivar Entorno: **Desactivar un entorno virtual con Anaconda.
    - En Windows: `deactivate`
    - En macOS/Linux: `source deactivate`

### ⚙ Gestión de Paquetes

11. **Instalar Paquetes: **Instalar paquetes con conda.
    ```bash
    conda install nombre_paquete
    ```

12. **Actualizar Paquetes: **Actualizar paquetes con conda.
    ```bash
    conda update nombre_paquete
    ```

13. **Listar Paquetes: **Listar paquetes instalados en el entorno.
    ```bash
    conda list
    ```

14. **Eliminar Paquetes: **Eliminar paquetes con conda.
    ```bash
    conda remove nombre_paquete
    ```

### 🛠️ Otras Funcionalidades

15. **Jupyter con Anaconda: **Usar Jupyter Notebooks con Anaconda.
    ```bash
    conda install -c conda-forge notebook
    ```

16. **Ambientes Virtuales en Jupyter: **Agregar entornos virtuales de Anaconda a Jupyter.
    ```bash
    conda install nb_conda
    ```

17. **Gestión de Ambientes: **Gestionar entornos virtuales con Anaconda Navigator.

<!-- Continuar con la sección avanzada... -->
