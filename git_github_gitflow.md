# 🚀 Comandos de Git, GitHub y GitFlow

**Tabla de Contenido**

[TOC]

## 🌠 Git

### 🌟 Flujo Básico

1. **git init:** Inicializa un nuevo repositorio de Git.

   ```bash
   git init
   ```

2. **git add:** Añade cambios al área de preparación.

   ```bash
   git add nombre_archivo.txt
   git add .  // Añade todos los archivos
   ```

3. **git commit -m:** Registra los cambios en el repositorio con un mensaje descriptivo.
   ```bash
   git commit -m "Mensaje descriptivo del commit"
   git commit -am "Mensaje descriptivo del commit" // Añade y registra los cambios en un solo comando.
   ```

### 🔍 Monitoreo

1. **git status:** Muestra el estado de los archivos en el directorio de trabajo.

   ```bash
   git status
   ```

2. **git show:** Muestra los cambios introducidos en el último commit.
   ```bash
   git show
   git show --pretty=email // Muestra los cambios en formato de correo electrónico.
   ```
3. **git log:** Muestra un historial de commits.

   ```bash
   git log
   git log --all --graph --decorate --oneline // Muestra un historial gráfico de commits.
   ```

4. **git diff:** Muestra las diferencias entre commits, áreas de preparación y el directorio de trabajo.
   ```bash
   git diff commit_A commit_B
   ```

### ⚙ Configuración

1. **git config:** Configura opciones de Git.

   ```bash
   git config opcion valor
   ```

2. **git config --global user.email:** Configura el correo electrónico del usuario a nivel global.

   ```bash
   git config --global user.email "youremail@example.com"
   ```

3. **git config --global user.name:** Configura el nombre del usuario a nivel global.

   ```bash
   git config --global user.name "Tu Nombre"
   ```

4. **git config --list:** Muestra la configuración actual de Git.
   ```bash
   git config --list
   ```

### 🌳 Versionamiento

1. **git branch:** Muestra y crea ramas.

   ```bash
   git branch
   ```

2. **git checkout:** Cambia de rama o restaura archivos.

   ```bash
   git checkout nombre_rama
   ```

3. **git merge:** Combina cambios de una rama en otra.
   ```bash
   git merge nombre_rama
   ```

### ⏪ Volver en el tiempo

1. **git reset --soft:** Desplaza la rama actual al commit especificado manteniendo los cambios en el área de preparación.

   ```bash
   git reset --soft commit_A
   ```

2. **git reset --mixed:** Desplaza la rama actual al commit especificado y deshace los cambios en el área de preparación.

   ```bash
   git reset --mixed commit_A
   ```

3. **git reset --hard:** Desplaza la rama actual al commit especificado y deshace los cambios en el área de preparación y el directorio de trabajo.

   ```bash
   git reset --hard commit_A
   ```

4. **git reset HEAD:** Deshace los cambios en el área de preparación.

   ```bash
   git reset HEAD nombre_archivo.txt
   ```

5. **git rm --cached:** Elimina archivos del área de preparación, pero los conserva en el directorio de trabajo.

   ```bash
   git rm --cached nombre_archivo.txt
   ```

6. **git rm --force:** Elimina archivos del área de preparación y del directorio de trabajo.
   ```bash
   git rm --force nombre_archivo.txt
   ```

## 🌌 GitHub

### 🌟 Flujo Básico de GitHub

#### Acceso mediante HTTPS:

1. **git clone:** Clona un repositorio de GitHub, si el repositorio es tuyo podras hacer todas las operaciones, como pull y push, pero si no es tu repositorio solo podras realizar pull, ya que para push necesitaras permisos del propietario.
   ```bash
   git clone url_repositorio
   # Luego te pedira correo y token
   # El token se obtiene de github>>Settings>>Developer settings>>Personal acces tokens>>Tokens classic>> Generate new token
   ```

#### Acceso mediante SSH:

1. **Generar una nueva llave SSH(Windows, WSL, Linux y Mac):**

   ```bash
   ssh-keygen -t rsa -b 4096 -C "youremail@example.com"
   ```

2. **Comprobar proceso y agregar clave al agente (Windows, WSL, Linux):**

   ```bash
   eval $(ssh-agent -s)
   ssh-add ~/.ssh/tu-clave-ssh-privada
   ```

3. **Comprobar proceso (Mac):**

   ```bash
   eval "$(ssh-agent -s)"
   # Si se usa macOS Sierra 10.12.2 o superior se crea un archivo llamado config
   vim config # y se coloca el siguiente texto
   Host *
   AddKeysToAgent yes
   UseKeychain yes
   IdentityFile ~/.ssh/id_rsa
   ```
4. **Agregar tu llave al agente (Mac):**.
   ```bash
   ssh-add -K ~/.ssh/id_rsa
   ```

#### Opcional:
Cuando se clona un repositorio se crea automaticamente el remoto, solo se crea remoto cuando:
* Creas un nuevo repositorio local sin clonar desde un remoto existente.
*  Si trabajas en un proyecto que tiene múltiples repositorios remotos.


5. **git remote add origin:** Añade un repositorio remoto llamado "origin".

   ```bash
   git remote add origin url_repositorio
   ```

6. **git remote -v:** Muestra la URL de los repositorios remotos.

   ```bash
   git remote -v
   ```

#### Actualización de cambios:
7. **git branch -m main:** Renombra la rama principal a "main".

   ```bash
   git branch -m main
   ```

8. **git push origin main:** Empuja los cambios a la rama principal en GitHub.

   ```bash
   git push origin main
   ```

9. **git pull origin main:** Tira los cambios remotos en la rama principal.

    ```bash
    git pull origin main
    ```

10. **git pull origin main --allow-unrelated-histories:** Tira cambios remotos incluso si las historias son no relacionadas.

   ```bash
   git pull origin main --allow-unrelated-histories
   ```

11. **git push:** Empuja los cambios al repositorio remoto.

    ```bash
    git push
    ```

12. **git fetch:** Obtiene los cambios del repositorio remoto sin fusionarlos.

    ```bash
    git fetch
    ```

13. **git pull:** Obtiene y fusiona los cambios del repositorio remoto.
    ```bash
    git pull
    ```

## 🌊 Gitflow Workflow

El flujo de Gitflow es un modelo de ramificación para Git que ayuda en la gestión del desarrollo de software y las versiones. Aquí está una descripción de los pasos clave en el flujo de Gitflow:

### Ramas Principales

- **master:** Contiene solo versiones estables y liberadas del proyecto.
- **develop:** Rama en la que se trabaja activamente y donde se preparan nuevas versiones para la liberación.

### Pasos del Flujo

1. **Crear la Rama `develop`: ** Esta rama es donde se realiza el desarrollo activo.
   ```bash
   git checkout -b develop
   ```
2. **Crear una Rama de `release`:** Se crea una rama de release desde develop para preparar la versión para la producción.
   ```bash
   git checkout -b release/x.y.z develop // x.y.z es la version [1.0.0]
   ```
3. **Crear una Rama de `feature` para cada Tarea:** Por cada tarea, se crea una rama de feature desde develop.
   ```bash
   git checkout -b feature/nombre_feature develop
   ```
4. **Cerrar y Fusionar la Rama de Feature:** Cuando la tarea está completa, la rama de feature se cierra y se fusiona con develop.
   ```bash
   git checkout develop
   git merge --no-ff feature/nombre_feature
   git branch -d feature/nombre_feature
   ```
5. **Fusionar la Rama de Release con develop y master:** La rama de release se fusiona tanto con develop como con master, y se etiqueta la versión.
   ```bash
   git checkout develop
   git merge --no-ff release/x.y.z
   git checkout master
   git merge --no-ff release/x.y.z
   git tag -a x.y.z -m "Versión x.y.z"
   git branch -d release/x.y.z
   ```
6. **Manejar Problemas en Producción con Hotfix:** Si hay problemas en la versión liberada en master, se crea una rama de hotfix para solucionarlos.
   ```bash
   git checkout -b hotfix/x.y.z master
   ```
7. **Fusionar el Hotfix con develop y master:** Una vez que el hotfix está completo, se fusiona tanto con develop como con master, y se etiqueta la nueva versión.
   ```bash
   git checkout develop
   git merge --no-ff hotfix/x.y.z
   git checkout master
   git merge --no-ff hotfix/x.y.z
   git tag -a x.y.z -m "Versión x.y.z"
   git branch -d hotfix/x.y.z
   ```
