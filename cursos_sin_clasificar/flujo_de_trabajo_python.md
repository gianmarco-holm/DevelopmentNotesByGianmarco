# 🐍 Tutorial de Flujo de Trabajo en Python

## Instalaciones

### Para WSL o  Linux

    ```bash
    #Actualizas el so
    sudo apt update
    sudo apt upgrade
    # Revisas si ya esta instalado python y pip
    python3 --version
    pip3 --version
    # Instalas Python y pip
    sudo apt install python3
    sudo apt install python3-pip
    # El entorno VENV ya viene instalado por defecto
    # Para ciencia de datos se instala el entorno conda, en este caso usare miniconda
    # El link lo sacas de la pagina web de conda
    wget -O anaconda.sh linkDeDescarga
    bash anaconda.sh
    bash
    # Para saber si esta instalado, puedes reiniciar tu terminal y ejecutando
        conda info
        # SI no funciona puede ser que no se agrego correctamente la variable de entorno y puedes hacer lo siguiente, en zsh o bash
        vim .bashrc
        #Luego tecleas i para insertar, y colocas esta varias y luego le das esc y luego tecleas :wq para guardar y salir
        export PATH="$HOME/miniconda3/bin:$PATH"
    ```

### Para Windows

## Paso 1: Crear un Repositorio en GitHub o el otro camino es crear una carpeta local

### Repositorio en github

1. **Inicia Sesión en GitHub:** Inicia sesión en tu cuenta de GitHub.

2. **Crea un Nuevo Repositorio:** En tu perfil, haz clic en "Repositories" y luego en "New". Completa la información del repositorio y haz clic en "Create Repository".

3. **Clonar el Repositorio:** Abre tu terminal y ejecuta el siguiente comando para clonar el repositorio a tu máquina local.

        ```bash
        git clone url_repositorio
        # Luego te pedira correo y token
        # El token se obtiene de github>>Settings>>Developer settings>>Personal acces tokens>>Tokens classic>> Generate new token
        ```

4. **Entrar al Repositorio:** Ingresa al directorio del repositorio clonado.

        ```bash
        cd nuevo-repositorio
        ```

### Si creas una carpeta local

1. Tienes que juntar las dos historias.

        ```bash
        git remote add origin url_repositorio
        git remote -v
        git branch -m main
        git push origin main
        git pull origin main --allow-unrelated-histories
        ```

## Paso 2: Configurar el Entorno Virtual

1. **Crear un Entorno Virtual:** Usa venv o conda para crear un entorno virtual.

        ```bash
        # Usando venv
        python3 -m venv env

        # Usando conda
        conda create --name mi_entorno
        ```

2. **Activar el Entorno Virtual:** Activa el entorno virtual.

    - En Windows:

            ```bash
            .\env\Scripts\activate
            ```

    - En macOS/Linux:

            ```bash
            source env/bin/activate
            ```

    - Para conda:

            ```bash
        conda activate mi_entorno
            ```

## Paso 4: Instalar Dependencias

1. **Instalar Dependencias:** Usa pip o conda para instalar las dependencias.

        ```bash
        # Usando pip
        pip install -r requirements.txt

        # Usando conda
        conda install --file requirements.txt
        ```

## Paso 5: Desarrollar y Contribuir

1. **Desarrollar tu Código:** Usa tu editor de código favorito para escribir tu código Python.

2. **Agregar Cambios:** Usa git para agregar y hacer commit de tus cambios.

        ```bash
        git add .
        git commit -m "Agrega nueva funcionalidad"
        ```

3. **Subir Cambios:** Sube tus cambios al repositorio en GitHub.

        ```bash
        git push origin main
        ```

## Paso 6: Colaborar con Otros

1. **Crear Pull Request:** Cuando estés listo para incorporar tus cambios, crea un Pull Request en GitHub.

2. **Revisar y Fusionar:** Revisa y discute los cambios con otros colaboradores antes de fusionarlos con la rama principal.

## Paso 7: Mantener el Proyecto

1. **Actualizar Dependencias:** Actualiza las dependencias según sea necesario.

        ```bash
        # Usando pip
        pip freeze > requirements.txt

        # Usando conda
        conda list --export > requirements.txt
        ```

2. **Documentar y Etiquetar Versiones:** Documenta tu código y etiqueta nuevas versiones para un seguimiento claro del progreso del proyecto.

¡Listo! Ahora has configurado un flujo de trabajo básico para tu proyecto de Python. A medida que tu proyecto crece, puedes explorar herramientas adicionales y prácticas recomendadas. ¡Éxito con tu proyecto!
