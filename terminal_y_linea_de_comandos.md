# 🖥️ Apuntes de Terminal y Línea de Comandos

## Nivel Básico

### 🚀 Comandos Básicos

1. **pwd: **Muestra el directorio actual.
    ```bash
    pwd
    ```

2. **ls: **Lista los archivos y carpetas en el directorio actual.
    ```bash
    ls
    ```

3. **cd: **Cambia de directorio.
    ```bash
    cd nombre_directorio
    ```

4. **mkdir: **Crea un nuevo directorio.
    ```bash
    mkdir nombre_directorio
    ```

5. **touch: **Crea un nuevo archivo.
    ```bash
    touch nombre_archivo.txt
    ```

### 🔍 Gestión de Archivos y Directorios

6. **cp: **Copia archivos o directorios.
    ```bash
    cp origen destino
    ```

7. **mv: **Mueve o renombra archivos o directorios.
    ```bash
    mv origen destino
    ```

8. **rm: **Elimina archivos o directorios.
    ```bash
    rm nombre_archivo.txt
    ```

9. **cat: **Muestra el contenido de un archivo.
    ```bash
    cat nombre_archivo.txt
    ```

### 🔄 Redirección y Tuberías

10. **> y >>: **Redirección de salida estándar a un archivo (sobrescribir o añadir).
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

11. **<: **Redirección de entrada estándar desde un archivo.
    ```bash
    comando < archivo.txt
    ```

12. **|: **Tubería o pipe operator, envía la salida de un comando como entrada a otro.
    ```bash
    comando1 | comando2
    # tee funciona igual que la dirección >
    ls -lh | sort | tee output.txt | less
    ```

### ⚙️ Otros Comandos Útiles

13. **man: **Muestra el manual de un comando.
    ```bash
    man nombre_comando
    ```

14. **grep: **Busca patrones en archivos.
    ```bash
    grep patron archivo.txt
    ```

15. **ps: **Muestra procesos en ejecución.
    ```bash
    ps
    ```

16. **kill: **Envía una señal a un proceso.
    ```bash
    kill -SIGTERM PID
    ```

## Nivel Intermedio

### 🌐 Redes y Conectividad

17. **ping: **Prueba la conectividad a un host.
    ```bash
    ping ejemplo.com
    ```

18. **traceroute: **Muestra la ruta que toma un paquete hasta un destino.
    ```bash
    traceroute ejemplo.com
    ```

19. **ssh: **Inicia una sesión segura de shell en un host remoto.
    ```bash
    ssh usuario@hostname
    ```

20. **scp: **Copia archivos entre hosts a través de SSH.
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

21. **chmod: **Cambia los permisos de un archivo.
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

22. **cron: **Programador de tareas en segundo plano.
    ```bash
    crontab -e
    ```

23. **curl: **Herramienta para transferir datos con URL.
    ```bash
    curl -O https://ejemplo.com/archivo.zip
    ```

24. **wget: **Descargador de archivos desde la web.
    ```bash
    wget https://ejemplo.com/archivo.zip
    ```

## Nivel Avanzado

### 🚀 Comandos Avanzados

25. **find: **Busca archivos en un directorio.
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

26. **awk: **Procesador de patrones y texto.
    ```bash
    awk '/patron/ {print $1}' archivo.txt
    ```

27. **sed: **Editor de flujo para la transformación de texto.
    ```bash
    sed 's/antiguo/nuevo/g' archivo.txt
    ```

28. **tar: **Crea y manipula archivos tar.
    ```bash
    tar -cvzf archivo.tar.gz directorio/
    ```

29. **grep : **Busca palabras en un archivp.
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

30. **du: **Muestra el uso del disco de un archivo o directorio.
    ```bash
    du -h archivo_o_directorio
    ```

<!-- Puedes seguir expandiendo la sección avanzada... -->


