# 🖥️ Apuntes de Terminal y Línea de Comandos

**Tabla de Contenido**

[TOC]

## Nivel Básico

### ¿Qué es la Terminal?
La terminal es una interfaz de texto que permite a los usuarios interactuar con el sistema operativo utilizando comandos. Proporciona acceso directo al núcleo del sistema y es una herramienta poderosa para realizar diversas tareas.

### ¿Qué es WSL y Cómo Instalarlo?
WSL (Windows Subsystem for Linux) es una característica de Windows que permite ejecutar un sistema operativo Linux directamente en Windows. Para instalarlo, sigue estos pasos:
```bash
# Abre PowerShell como administrador.
# Ejecuta el siguiente comando para habilitar WSL:
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# Habilita la característica de máquina virtual:
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# Descarga e instala el paquete de actualización del kernel de Linux desde Microsoft, en este caso Ubuntu.
# Establece WSL 2 como versión predeterminada:
wsl --set-default-version 2
```
### Estructura del sistemas de carpetas

* /: Directorio raíz.
* /home: Directorio de usuarios.
* /etc: Configuraciones del sistema.
* /bin: Binarios esenciales del sistema.
* /usr: Programas y archivos de usuarios.
* /var: Datos variables, como logs y bases de datos.
* /tmp: Archivos temporales.

### 🚀 Comandos Básicos

1. **pwd:** Muestra el directorio actual.
    ```bash
    pwd
    ```

2. **ls:** Lista los archivos y carpetas en el directorio actual.
    ```bash
    ls
    # Lista con detalles y tamaños humanos.
    ls -lh
    # Lista archivos ocultos.
    ls -a
    ```

3. **cd:** Cambia de directorio.
    ```bash
    cd nombre_directorio
    ```

4. **mkdir:** Crea un nuevo directorio.
    ```bash
    mkdir nombre_directorio
    ```

5. **touch:** Crea un nuevo archivo.
    ```bash
    touch nombre_archivo.txt
    ```

6. **clear:** Limpia la pantalla de la terminal.
    ```bash
    clear
    ```
7. **head:** Muestra las primeras líneas de un archivo.
    ```bash
    head nombre_archivo.txt
    ```
8. **tail:** Muestra las últimas líneas de un archivo.
    ```bash
    tail nombre_archivo.txt
    ```

9. **less:** Visualizador de texto con desplazamiento.
    ```bash
    Copy code
    less nombre_archivo.txt
    ```
10. **echo:** Imprime texto en la pantalla.
    ```bash
    echo "Hola, Mundo!"
    ```

### 🔍 Gestión de Archivos y Directorios

11. **cp:** Copia archivos o directorios.
    ```bash
    cp origen destino
    ```

12. **mv:** Mueve o renombra archivos o directorios.
    ```bash
    mv origen destino
    ```

13. **rm:** Elimina archivos o directorios.
    ```bash
    rm nombre_archivo.txt
    # Para eliminar directorios
    rm -r nombre_directorio
    rm -rfi nombre_directorio
    # -r para que elimine todo lo de adentro del directorio
    # -f para eliminar forzosamente
    # -i de interactivo, para que me pregunte si realmente deseo eliminar o no
    rmdir nombre_directorio
    # rmdir elimina un directorio vacio
    ```

14. **cat:** Muestra el contenido de un archivo.
    ```bash
    cat nombre_archivo.txt
    ```

15. **tree y Cómo Instalarlo:** Muestra la estructura de directorios en formato de árbol.
    ```bash
    sudo apt install tree
    tree
    ```

16. **xdg-open o open:** Abre archivos o directorios con la aplicación predeterminada.
    ```bash
    xdg-open nombre_archivo.txt
    ```

17. **nautilus:** Explorador de archivos en entornos GNOME.
    ```bash
    nautilus
    ```

18. **type:** Muestra la ubicación del ejecutable de un comando.
    ```bash
    type ls
    ```

19. **help:** Proporciona ayuda integrada para comandos internos de la shell.
    ```bash
    help
    ```

20. **man:** Muestra el manual de un comando.
    ```bash
    man nombre_comando
    ```

21. **alias lista_larga="ls -lSh":** Crea un alias para un comando.de un comando.
    ```bash
    alias lista_larga="ls -lSh"
    ```

22. **Wilcards:** 
    ```bash
    # Lista archivos con extensión .png.
    ls -l *.png
    # Lista archivos que comienzan con "fotoDe".
    ls -l fotoDe*
    # Lista archivos que tienen un solo caracter entre "foto" y ".png".
    ls -l foto?.png
    # Lista archivos que tienen dos caracteres entre "foto" y ".jpg"
    ls -l foto??.jpg
    # Lista archivos que comienzan con "c" o "i".
    ls -l [cCiI]*
    # Lista archivos que comienzan con "foto" seguido de un número del 2 al 6.
    ls -l foto[2-6]*
    ```

### 🔄 Redirección y Tuberías

23. **> y >>:** Redirección de salida estándar a un archivo (sobrescribir o añadir).
    ```bash
    # Redirecciona a un archivo
    comando > archivo.txt
    # Si el archivo ya existe lo concatenas
    comando >> archivo.txt
    # Si queremos redireccionar el error
    comando 2> error.txt
    # Si queremos redireccionar el error o la salida, cualquier de los dos
    comando > archivo.txt 2>&1
    ```

24. **<:** Redirección de entrada estándar desde un archivo.
    ```bash
    comando < archivo.txt
    ```

25. **|:** Tubería o pipe operator, envía la salida de un comando como entrada a otro.
    ```bash
    comando1 | comando2
    # tee funciona igual que la dirección >
    ls -lh | sort | tee output.txt | less
    figlet "hola" | lolcat
    cowsay "Hola" | lolcat
    ```

### ⚙️ Otros Comandos Útiles

26. **man:** Muestra el manual de un comando.
    ```bash
    man nombre_comando
    ```

27. **grep:** Busca patrones en archivos.
    ```bash
    grep patron archivo.txt
    ```

### Manejo de Procesos

28. **ps:** Muestra información sobre procesos.
    ```bash
    ps
    ```

29. **top:** Muestra una lista dinámica de procesos en ejecución.
    ```bash
    top
    ```

30. **htop:** Visualizador interactivo de procesos.
    ```bash
    sudo apt install htop
    htop
    ```
31. **glances:** Monitor de sistema con interfaz web.
    ```bash
    sudo apt install glances
    glances
    ```

32. **kill:** Envía una señal a un proceso.
    ```bash
    kill PID
    ```

## Nivel Intermedio

### 🌐 Redes y Conectividad

1. **ping:** Prueba la conectividad a un host.
    ```bash
    ping ejemplo.com
    ```

2. **traceroute:** Muestra la ruta que toma un paquete hasta un destino.
    ```bash
    traceroute ejemplo.com
    ```

3. **ssh:** Inicia una sesión segura de shell en un host remoto.
    ```bash
    ssh usuario@hostname
    ```

4. **scp:** Copia archivos entre hosts a través de SSH.
    ```bash
    scp archivo.txt usuario@hostname:/ruta/destino
    ```

### 📅 Programación y Automatización

#### Tipos de archivos
| Atributo | Tipo de archivo |
| --- | --- |
| - | Es un archivo normal, como un documento de texto, una foto, un video, etc. |
| d | Por directory es un directorio |
| l | Es un enlace simbólico. Es algo que veremos en próximas clases |
| b | Bloque especial, son archivos que manejan información para el sistema, como la información de un disco duro |
| **.** | Es un archivo oculto |

#### Permisos de usuario
Los siguientes caracteres se leen de 3 en 3, por cada uno de los tipos de usuario.

##### Owner
El dueño del archivo, si no se ha cambiado, es quien lo creo y tiene mayor jerarquía sobre los otros 3. Le corresponden los primeros 3 caracteres de los permisos.

##### Group
Se puede crear grupos de usuarios para darle a todos o varios los mismos permisos. A estos usuarios le corresponden el cuarto, quinto y sexto caracter de los permisos de usuarios y tienen mayor jerarquía que el último.

##### World
También llamado "otros", es cualquier otro usuario que no pertenezca a un grupo de usuario y tampoco sea el dueño, este tiene la menor jerarquía.

#### Tipos de permisos
| Símbolo | Significado | Permiso |
| --- | --- | --- |
| r | readable | Significa que puede leer su contenido |
| w | writable | El usuario puede editar el contenido del archivo, también el nombre y los permisos |
| x | executable | El usuario puede ejecutarlo en caso de que sea un programa |

Los permisos se escriben en ese orden rwx. Para indicar que el permiso no está disponible, se escribe un guion.

| d | rwx | r-x | r-x |
| --- | --- | --- | --- |
| Esto es un directorio | owner | group | world |
|| El dueño puede leer, escribir y ejecutar | El grupo puede leer y ejecutar | Los demás pueden leer y ejecutar |

Vamos con otro

-rw-r--r--

| - | rw- | r-- | r-- |
| --- | --- | --- | --- |
| Esto es un archivo normal, como una imágen o un video | owner | group | world |
|| El dueño puede leer y escribir | El grupo sólo puede leer | El resto sólo puede leer |

Representando permisos de forma octal
Si organizamos los permisos de esta forma

| r | w | x |
| --- | --- | --- |

E indicamos con un cero si el usuario no tiene el permiso y con un uno si el usuario si lo tiene, pongamos de ejemplo el permiso r-x:

| r | w | x |
| --- | --- | --- |
| 1 | 0 | 1 |

Y ahora esos números los leemos en binario, nos quedaría así.

| r | w | x |
| --- | --- | --- |
| 1 | 1 | 1 |
|| 7 |

Si repetimos esto con el resto de las combinaciones tenemos un número por cada combinación de permiso, por ejemplo el permiso r-x queda así:

| r | - | x |
| --- | --- | --- |
| 1 | 0 | 1 |
|| 5 |

Usando todo esto podemos leer el conjunto de permisos rwxr-xr--, así:

| r | w | x | | r | - | x | | r | - | - |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 1 | 1| | 1 | 0 | 1 | | 1 | 0 | 0 | 0 | || 7 |||| 5 |||| 1 |||

5. **chmod:** Cambia los permisos de un archivo.
    ```bash
    chmod permisos archivo
    # Añade escritura al grupo puede ser de dos formas
    chmod g+w [archivo]
    chmod 764 [archivo]
    # Ejecución y escritura a grupo y otros
    chmod go+wx [archivo]
    chmod 777 [archivo]
    # Añade lectura a usuario, y solo escritura al grupo
    chmod u+r,g=w [archivo]
    chmod 724 [archivo]
    ```

6. **cron:** Programador de tareas en segundo plano.
    ```bash
    crontab -e
    ```

7. **curl:** Herramienta para transferir datos con URL.
    ```bash
    curl -O https://ejemplo.com/archivo.zip
    ```

8. **wget:** Descargador de archivos desde la web.
    ```bash
    wget https://ejemplo.com/archivo.zip
    ```

## Nivel Avanzado

### 🚀 Comandos Avanzados

1. **find:** Busca archivos en un directorio.
    ```bash
    find directorio -name "patron"
    find ./ -name *.txt | less
    # Podemos buscar por tipos por file f o d de directorio
    find ./ -type d -name Documents
    # Busqueda por tamaños, mayores a 20 mb
    find ./ -size 20M
    # Podemos limitar la produndidad de busqueda de carpetas
    find ./ -type d -maxdepth 2
    find ./ -type d -mindepth 2
    ```

2. **awk:** Procesador de patrones y texto.
    ```bash
    awk '/patron/ {print $1}' archivo.txt
    ```

3. **sed:** Editor de flujo para la transformación de texto.
    ```bash
    sed 's/antiguo/nuevo/g' archivo.txt
    ```

4. **tar:** Crea y manipula archivos tar.
    ```bash
    sudo apt install rar
    sudo apt install unrar
    comprimir:
    # para formato .tar
    tar -cvf compressed.tar Documents/toCompress/
    # para formato .tar.gz
    tar -czvf compressed.tar.gz Documents/toCompress/
    # para formato rar
    rar a nombreArchivo.rar carpetaAComprimir
    # para zip
    zip -r copressed.zip Documents/toCompress/

    descomprimir:
    #Para tar
    tar -xvf compressed.tar.gz
    #Para tar.gz o .tgz
    tar -xzvf compressed.tar.gz
    #Para unrar
    unrar x carpetaComprimida.rar
    # Para zip
    unzip compressed.zip
    ```

5. **grep :** Busca palabras en un archivp.
    ```bash
    # -v para palabras que no coincida
    grep -v "patron" archivo.txt
    # Busca la palabra the
    grep the movies.csv
    # -i para que no importa la mayus o minusc
    grep -i Action movies.csv
    # Para contar palabras
    grep -c Drama movies.csv
    # Para limitar las primeras 10 coincidencias
    grep -m 10 Fan movies.csv
    ```

6. **which:** Muestra la ubicación de un ejecutable.
    ```bash
    which nombre_comando
    ```

7. **du:** Muestra el uso del disco de un archivo o directorio.
    ```bash
    du -h archivo_o_directorio
    ```

8. **Concatenando comandos:** Muestra el uso del disco de un archivo o directorio.
    ```bash
    # Ejecuta varios comandos en secuencia con ;
    ls; mkdir nuevo; cal
    # Ejecuta varios comandos al mismo tiempo.
    ls & date & cal
    # Ejecuta un comando si el anterior se ejecuta correctamente.
    cd lp && mkdir comida
    # Ejecuta un comando si el anterior falla.
    cd proyectos || ls -l
    ```

17. **su root:** Cambia al usuario root.
    ```bash
    su root
    ```

9. **whoami:** Muestra el nombre de usuario actual.
    ```bash
    whoami
    ```

10. **chown [usuarioAlQuePertenecerá] [archivo]:** Cambia el dueño de un archivo.
    ```bash
    chown usuario archivo
    ```

11. **ln -s ruta_de_archivo:** Crea un enlace simbólico a un archivo.
    ```bash
    ln -s ruta_de_archivo
    ```

12. **variables de entorno:** Muestra todas las variables de entorno.
    ```bash
    printenv
    ```
## Procesos en Primer Plano y Fondo (foreground o background)

### 🔄 Procesos en Primer Plano

13. **Ctrl-Z:** Pausa un proceso en primer plano y lo manda a background, sirve para seguir haciendo otras cosas en la terminar.
    ```bash
    cat > mi_nota.txt
    # Presiona Ctrl-Z para pausar el proceso
    ```

14. **fg:** Trae un proceso pausado al primer plano.
    ```bash
    fg %1
    ```

### 🔀 Procesos en Fondo

15. **&:** Ejecuta un proceso en segundo plano.
    ```bash
    cat > mi_nota.txt &
    ```

16. **jobs:** Muestra los procesos en segundo plano.
    ```bash
    jobs
    ```

17. **bg:** Reanuda un proceso en segundo plano.
    ```bash
    bg %1
    ```

18. **Ctrl-C:** Termina un proceso en primer plano.
    ```bash
    # Presiona Ctrl-C para interrumpir el proceso en primer plano
    ```

19. **nohup:** Ejecuta un comando inmune a la desconexión del terminal.
    ```bash
    nohup comando &
    ```

20. **disown:** Desvincula un proceso de la terminal actual.
    ```bash
    disown %1
    ```

## 🏡Personalizar el terminal

1. **Instala Tilix**
Tilix es un emulador de terminal. Para instalarlo:
```bash
$ sudo apt install tilix
```

2. **Instala ZSH**
Vamos a usar la Shell ZSH. Para cambiarla:
```bash
$ sudo aptinstall zsh
```
Comando para dejar por DEFECTO la shell de bash o zsh:

```bash
$ chsh -s $(which bash)

$ chsh -s $(which zsh)
```
(después de cambiar a zsh apretar la opción 0, para crear un archivo .zshrc en blanco)

Para cambiar entre bash y zsh en el momento:
```bash
$ exec bash

$ exec zsh
# Y luego la opción de 0
```
3. **Personaliza funcionalidades y colores**
Ahora, puedes ponerle funcionalidades y colores con OH-MY-ZSH
```bash
# https://ohmyz.sh/#install
# Sirve para Optimizar y liberar todo el poder de zsh ya que viene con muchas funciones utiles, ayudas, complementos, temas y otros.
$ sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
4. **Usa Power Level**
Vamos a instalarle un tema (powerLevel10K):
```bash
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
después vamos a entrar al archivo .zshrc:
```bash
$ vim ~/.zshrc
```

buscamos y cambiamos la parte que dice ZSH_THEME por esto:
```bash
$ ZSH_THEME="powerlevel10k/powerlevel10k"
```
Guardamos y salimos.

Después instalamos estas 4 fuentes de texto que aparece en la parte de fonts en el siguiente link https://github.com/romkatv/powerlevel10k: 
MesloLGS NF Regular.ttf
MesloLGS NF Bold.ttf
MesloLGS NF Italic.ttf
MesloLGS NF Bold Italic.ttf

Cuando salgamos y volvamos a entrar a la terminal nos va a salir el wizard de powerlevel10k para configurar la terminal como quieras, simplemente sigue los pasos.

Para volver a configurar el tema Powerlevel10k desde el principio en caso de que quieras cambiar algo:
```bash
$ p10k configure
```