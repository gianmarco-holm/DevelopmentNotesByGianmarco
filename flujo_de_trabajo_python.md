# 🐍 Tutorial de Flujo de Trabajo en Python

## Paso 1: Crear un Repositorio en GitHub

1. **Inicia Sesión en GitHub: **Inicia sesión en tu cuenta de GitHub.

2. **Crea un Nuevo Repositorio: **En tu perfil, haz clic en "Repositories" y luego en "New". Completa la información del repositorio y haz clic en "Create Repository".

## Paso 2: Clonar el Repositorio

3. **Clonar el Repositorio: **Abre tu terminal y ejecuta el siguiente comando para clonar el repositorio a tu máquina local.
    ```bash
    git clone https://github.com/tu_usuario/nuevo-repositorio.git
    ```

4. **Entrar al Repositorio: **Ingresa al directorio del repositorio clonado.
    ```bash
    cd nuevo-repositorio
    ```

## Paso 3: Configurar el Entorno Virtual

5. **Crear un Entorno Virtual: **Usa venv o conda para crear un entorno virtual.
    ```bash
    # Usando venv (en un entorno UNIX)
    python3 -m venv env

    # Usando conda
    conda create --name env python=3.8
    ```

6. **Activar el Entorno Virtual: **Activa el entorno virtual.
    - En Windows:
        ```bash
        .\env\Scripts\activate
        ```
    - En macOS/Linux:
        ```bash
        source env/bin/activate
        ```

## Paso 4: Instalar Dependencias

7. **Instalar Dependencias: **Usa pip o conda para instalar las dependencias.
    ```bash
    # Usando pip
    pip install -r requirements.txt

    # Usando conda
    conda install --file requirements.txt
    ```

## Paso 5: Desarrollar y Contribuir

8. **Desarrollar tu Código: **Usa tu editor de código favorito para escribir tu código Python.

9. **Agregar Cambios: **Usa git para agregar y hacer commit de tus cambios.
    ```bash
    git add .
    git commit -m "Agrega nueva funcionalidad"
    ```

10. **Subir Cambios: **Sube tus cambios al repositorio en GitHub.
    ```bash
    git push origin main
    ```

## Paso 6: Colaborar con Otros

11. **Crear Pull Request: **Cuando estés listo para incorporar tus cambios, crea un Pull Request en GitHub.

12. **Revisar y Fusionar: **Revisa y discute los cambios con otros colaboradores antes de fusionarlos con la rama principal.

## Paso 7: Mantener el Proyecto

13. **Actualizar Dependencias: **Actualiza las dependencias según sea necesario.
    ```bash
    # Usando pip
    pip freeze > requirements.txt

    # Usando conda
    conda list --export > requirements.txt
    ```

14. **Documentar y Etiquetar Versiones: **Documenta tu código y etiqueta nuevas versiones para un seguimiento claro del progreso del proyecto.

¡Listo! Ahora has configurado un flujo de trabajo básico para tu proyecto de Python. A medida que tu proyecto crece, puedes explorar herramientas adicionales y prácticas recomendadas. ¡Éxito con tu proyecto!
