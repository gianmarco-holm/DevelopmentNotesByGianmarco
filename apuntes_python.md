# 🐍 Apuntes de Python

## Nivel Básico

### 🚀 Fundamentos

1. **Hello World:** Imprime "Hello, World!" en la consola.
    ```python
    print("Hello, World!")
    ```
2. **input:** Captura de Python
    ```python
    last_name = input('¿Cuál es tu apellido? => ')
    ```
3. **Variables:** Declaración y asignación de variables.
    ```python
    nombre = "Gianmarco"
    edad = 25
    ```
4. **Tipos de Datos:** Enteros, flotantes, cadenas, booleanos.
    ```python
    entero = 42
    flotante = 3.14
    cadena = "Hola, Python"
    booleano = True
    ```
5. **Type:** Te permite saber el tipo de datos
    ```python
    my_name = "Nicolas"
    print(type(my_name))
    ```
6. **Operadores Matematicos:** 
    ```python
    + = suma
    - = resta
    * = multiplicación
    / = divición
    ^ = potencia
    // = solo muestra el resultado entero
    % = obtiene el residuo
    ```
7. **Operadores de Comparación:** `==`, `!=`, `<`, `>`, `<=`, `>=`.
    ```python
    resultado = (5 == 5)
    resultado = (10 != 5)
    resultado = (10 < 20)
    resultado = (20 > 10)
    resultado = (15 <= 15)
    resultado = (25 >= 20)
    ```
8. **Operadores Lógicos:** `and`, `or`, `not` para operaciones lógicas.
    ```python
    resultado = (True and False)
    resultado = (True or False)
    resultado = not True
    ```

### 🔄 Estructuras de Control

9. **Condicionales:** Uso de `if`, `elif` y `else`.
    ```python
    if condicion:
        # código
    elif otra_condicion:
        # código
    else:
        # código
    ```
10. **Bucles:** Uso de bucles `for` y `while`.
    ```python
    for elemento in iterable:
        # código

    while condicion:
        # código
    ```
11. **Listas:** Declaración y manipulación de listas.
    ```python
    lista = [1, 2, 3, 4, 5]
    lista.append(6)
    ```

12. **Diccionarios:** Declaración y manipulación de diccionarios.
    ```python
    diccionario = {"clave": "valor", "nombre": "Gianmarco"}
    print(diccionario["clave"])
    ```

### 📚 Funciones

13. **Definición de Funciones:** Creación y llamada de funciones.
    ```python
    def saludar(nombre):
        print("Hola, " + nombre)

    resultado = saludar("Gianmarco")
    ```
14. **Parámetros y Argumentos:** Uso de parámetros y argumentos en funciones.
    ```python
    def suma(a=1, b=1):
        print(a + b)

    resultado = suma(3, 5)
    ```
15. **Return:** Retorno de valores desde funciones.
    ```python
    def cuadrado(numero):
        return numero, numero ** 2

    numero, resultado = cuadrado(4)
    ```

## Nivel Intermedio

### 🧠 Programación Orientada a Objetos (POO)

1. **Clases y Objetos:** Definición y uso de clases y objetos.
    ```python
    class Persona:
        def __init__(self, nombre, edad):
            self.nombre = nombre
            self.edad = edad

    persona1 = Persona("Gianmarco", 25)
    ```

2. **Herencia:** Creación de clases derivadas.
    ```python
    class Estudiante(Persona):
        def __init__(self, nombre, edad, curso):
            super().__init__(nombre, edad)
            self.curso = curso

    estudiante1 = Estudiante("Estudiante", 20, "Python")
    ```

3. **Encapsulamiento:** Control de acceso a atributos y métodos.
    ```python
    class Ejemplo:
    def __init__(self):
        self.publico = "Soy público"

    instancia = Ejemplo()
    print(instancia.publico)

    class Ejemplo:
        def __init__(self):
            self.__privado = "Soy privado"

    instancia = Ejemplo()
    print(instancia._Ejemplo__privado)

    class Ejemplo:
    def __init__(self):
        self.__privado = "Soy privado"

    instancia = Ejemplo()
    print(instancia._Ejemplo__privado)
    ```

### 📦 Módulos y Paquetes

4. **Importación de Módulos:** Uso de módulos predefinidos y creados.
    ```python
    import math
    from mi_modulo import mi_funcion
    ```

5. **Creación de Módulos:** Estructuración de código en módulos.
    ```python
    # mi_modulo.py
    '''
    Aveces es necesario crear un archivo lamado__init__.py para indicar que el directorio debe ser tratado como paquete y declarar que variables y modulos quieres exportar
    '''
    def mi_funcion():
        return "Hola desde mi módulo"
    ```

### 🧐 Excepciones

6. **Manejo de Excepciones:** Captura y gestión de errores.
    ```python
    try:
        # código que puede lanzar una excepción
    except TipoDeError as e:
        # manejo de la excepción
    ```

7. **Lanzamiento de Excepciones:** Creación y lanzamiento de excepciones personalizadas.
    ```python
    raise ValueError("Mensaje de error")
    ```
### 🔤 Comandos para Strings

8. **Concatenación:** Unir dos strings.
    ```python
    saludo = "Hola"
    nombre = "Gianmarco"
    resultado = saludo + " " + nombre
    template = f"{saludo} tu nombre es {nombre}"
    ```

9. **Indexing y Slicing:** Acceso a caracteres y segmentos de un string.
    ```python
    # Indexing
    mensaje = "Python"
    tamaño = len(mensaje)
    primer_caracter = mensaje[0]
    ultimo_caracte = mensaje[tamaño-1]
    # Slincing
    text = "Ella sabe Python"
    print(text[0:6]) # Ella s
    print(text[10:16]) # Python
    print(text[:10]) # Ella sabe
    print(text[5:-1]) # sabe Pytho
    print(text[5:]) # sabe Python
    print(text[:]) # Ella sabe Python
    print(text[10:16:1]) # Python
    print(text[10:16:2]) # Pto
    print(text[::2]) # El aePto
    print(text[::-1]) # nohtyP ebas allE
    ```

10. **Métodos de Strings:** Operaciones comunes con strings.
    ```python
    mensaje = "Python es genial"
    longitud = len(mensaje)
    mayusculas = mensaje.upper()
    minusculas = mensaje.lower()
    divide_cadena_en_lista = mensaje.split()
    capitalize = mensaje.capitalize()
    boolean_comienza_con = mensaje.startswith('Python')
    boolean_termina_en = mensaje.endswith('genial')
    remplace = mensaje.replace('genial','increible')
    conteo_de_e = mensaje.count('e')
    mayuscula_a_minuscula_o_alrevez = mensaje.swapcase()
    boolean_es_digito = mensaje.isdigit()
    ```

### 📋 Comandos para Listas

11. **CRUD con Listas:** Operaciones básicas con listas (Crear, Leer, Actualizar, Eliminar).
    ```python
    # Crear
    mi_lista = [1, 2, 3, 4]

    # Leer
    primer_elemento = mi_lista[0]

    # Actualizar
    mi_lista[1] = 10
    mi_lista.append(5) #Agregar un elemento
    mi_lista.insert(1,'hola') #Insertar en el index 1
    mi_lista.index('hola') #Devuelve el index

    # Eliminar
    del mi_lista[2]
    mi_lista.remove('hola')
    mi_lista.pop() #Elimina el ultimo elemento
    mi_lista.pop(2) #Elimina según el index
    mi_lista.reverse() #Todos los elementos al revez
    mi_lista.sort() #Ordena todos los elementos
    ```

12. **List Comprehension:** Crear listas de manera concisa.
    ```python
    cuadrados = [x**2 for x in range(5)]
    num_par_random = [num for num in [random.randint(1, 100) for _ in range(1, 20)] if num % 2 == 0]
    ```

### 🔄 Comandos para Tuplas

13. **Comandos de Tuplas:** Operaciones básicas con tuplas.
    ```python
    mi_tupla = (1, 2, 3, 2, 'hola')
    conteo_ocurrencias = mi_tupla.count(2)
    indice = mi_tupla.index('hola')
    tupla_transformada = list(mi_tupla)
    ```

14. **Tuplas como Claves de Diccionarios:** Uso de tuplas como claves en diccionarios.
    ```python
    diccionario = {(1, 2): "Valor"}
    ```

## Nivel Avanzado

### 🚀 Características Avanzadas

1. **Decoradores:** Los decoradores en Python son una forma elegante de modificar o extender el comportamiento de funciones o métodos sin cambiar su código interno.
    ```python
    def mi_decorador(funcion):
        def wrapper():
            print("Antes de la función")
            funcion()
            print("Después de la función")
        return wrapper

    @mi_decorador
    def mi_funcion():
        print("¡Hola!")

    # Es como si estuvieras diciendo
    # mi_funcion = mi_decorador(mi_funcion)

    mi_funcion()
    ```

2. **Generadores:** Un generador es una forma especial de iterable, una función que produce una secuencia de valores sobre la marcha. A diferencia de las funciones regulares que utilizan return para devolver un valor y terminar la función, los generadores utilizan la palabra clave yield para pausar la ejecución y devolver un valor temporalmente. Cuando se llama al generador nuevamente, la ejecución se reanuda desde donde se detuvo.
    ```python
    def generador():
        yield 1
        yield 2
        yield 3

    for numero in generador():
        print(numero)
    ```

20. **Context Managers:** Implementación de gestores de contexto.
    ```python
    class MiContexto:
        def __enter__(self):
            print("Entrando al contexto")
            return self

        def __exit__(self, exc_type, exc_value, traceback):
            print("Saliendo del contexto")

    with MiContexto() as contexto:
        # código dentro del contexto
    ```

21. **Programación Funcional:** Conceptos de programación funcional en Python.
    ```python
    # Map
    lista = [1, 2, 3, 4, 5]
    cuadrados = list(map(lambda x: x**2, lista))

    # Filter
    pares = list(filter(lambda x: x % 2 == 0, lista))

    # Reduce
    from functools import reduce
    suma = reduce(lambda x, y: x + y, lista)
    ```

22. **Expresiones Regulares:** Uso de expresiones regulares en Python.
    ```python
    import re

    patron = re.compile(r'\b\w+\b')
    resultado = patron.findall("Hola, ¿cómo estás?")
    ```

23. **Manejo de Archivos:** Lectura y escritura de archivos.
    ```python
    # Lectura
    with open('archivo.txt', 'r') as archivo:
        contenido = archivo.read()

    # Escritura
    with open('nuevo_archivo.txt', 'w') as archivo:
        archivo.write('Hola, mundo!')
    ```

### 📚 Bibliotecas Específicas

24. **NumPy:** Manipulación de arreglos y matrices.
    ```python
    import numpy as np

    array = np.array([1, 2, 3, 4, 5])
    ```

25. **Pandas:** Manipulación y análisis de datos.
    ```python
    import pandas as pd

    datos = {'Nombre': ['Alice', 'Bob', 'Charlie'],
             'Edad': [25, 30, 35]}
    df = pd.DataFrame(datos)
    ```

26. **Matplotlib:** Creación de gráficos y visualización de datos.
    ```python
    import matplotlib.pyplot as plt

    x = [1, 2, 3, 4, 5]
    y = [2, 4, 6, 8, 10]
    plt.plot(x, y)
    plt.show()
    ```

27. **Django:** Desarrollo de aplicaciones web con el framework Django.
    ```bash
    pip install django
    django-admin startproject mi_proyecto
    ```

28. **Flask:** Desarrollo de aplicaciones web con el framework Flask.
    ```python
    from flask import Flask

    app = Flask(__name__)

    @app.route('/')
    def hola_mundo():
        return 'Hola, mundo!'
    ```

