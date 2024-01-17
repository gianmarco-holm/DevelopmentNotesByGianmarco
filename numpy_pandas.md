# 📊 Apuntes de NumPy y Pandas
*Las 2 librerías muy importantes para la manipulación en la ciencia de datos (Numpy y Pandas)*

---

## NumPy

Es una librería enfocada al cálculo numérico y manejo de Arrays.
* Es muy veloz, hasta 50 veces más rápido que usar una lista de Python o C.
* Optimiza el almacenamiento en memoria.
* Maneja distintos tipos de datos.
* Es una librería muy poderosa, se pueden crear redes neuronales desde cero.

### 🚀 Introducción a NumPy

1. **Importar NumPy:** Cómo importar la biblioteca NumPy.
    ```python
    import numpy as np
    ```

2. **Arrays en NumPy:** el objeto principal de numpy es el array, por lo cual siempre debemos convertir los datos en array
    ```python
    lista = [1, 2 , 3, 4, 5, 6, 7, 8, 9] 
    lista
    ---> [1, 2, 3, 4, 5, 6, 7, 8, 9]
    lista_convertida = np.array(lista)
    lista_convertida
    ---> [1, 2, 3, 4, 5, 6, 7, 8, 9]
    #--------------------------------------
    matriz = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    matriz_convertida = np.array(matriz)
    matriz_convertida
    ---> array([[1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]])
    ```

3. **Acceso a los elementos:** El *indexado* nos permite acceder a los elementos de los array y matrices.

    >lista

    | Index | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    |-------|---|---|---|---|---|---|---|---|---|
    | 0     | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
    ```python
    lista_convertida[1:6]
    ---> array([2, 3, 4, 5, 6])

    lista_convertida[:6]
    ---> array([1, 2, 3, 4, 5, 6])

    lista_convertida[2:]
    ---> array([3, 4, 5, 6, 7, 8, 9])

    lista_convertida[::3]
    ---> array([1, 4, 7])
    ```
    >Matriz

    | Index | 0 | 1 | 2 |
    |-------|---|---|---|
    | 0     | 1 | 2 | 3 |
    | 1     | 4 | 5 | 6 |
    | 2     | 7 | 8 | 9 |
    ```python
    matriz_convertida[0]
    ---> array([1, 2, 3])

    matriz_convertida[0, 2]
    ---> 3

    matriz_convertida[1:]
    ---> array([[4, 5, 6],
                [7, 8, 9]])

    matriz_convertida[1:, 0:2]
    ---> array([[4, 5],
                [7, 8]])
    ```
4. **tipos de datos:** Los arrays de NumPy solo pueden contener un tipo de dato, ya que esto es lo que le confiere las ventajas de la *optimización de memoria.*
    ```python
    arr = np.array([1, 2, 3, 4])
    arr.dtype
    ---> dtype('int64')

    #Si queremos usar otro tipo de dato, lo podemos definir en la declaración del array.
    arr = np.array([1, 2, 3, 4], dtype = 'float64')
    arr.dtype
    ---> dtype('float64')
    arr
    ---> array([1., 2., 3., 4.])

    #También se puede cambiar a tipo booleano recordando que los números diferentes de 0 se convierten en True.
    arr = np.array([0, 1, 2, 3, 4])
    arr = arr.astype(np.bool_)
    arr
    ---> array([False,  True,  True,  True,  True])

    arr = np.array([0, 1, 2, 3, 4])
    arr = arr.astype(np.string_)
    arr
    ---> array([b'0', b'1', b'2', b'3', b'4'], dtype='|S21')

    arr = np.array(['0', '1', '2', '3', '4'])
    arr = arr.astype(np.int8)
    arr
    ---> array([0, 1, 2, 3, 4], dtype=int8)
    ```

5. **Dimensiones:** Con las matrices podemos crear varias dimensiones, vamos a nombrarlas
    *  Scalar, Un solo dato o valor

    0

    * Vector, Una serie de datos

    | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
    |---|---|---|---|---|---|---|---|---|

    * Matriz, Hoja de cálculo

    | Color   | País      | Edad | Fruta   |
    |---------|-----------|------|---------|
    | Rojo    | España    | 24   | Pera    |
    | Amarillo| Colombia  | 30   | Manzana |

    * Tensor. Series de tiempo o Imágenes

    |       | Dimensión 0 | Dimensión 1 | Dimensión 2 |
    |-------|-------------|-------------|-------------|
    | Índice 0 | [0, 1, 2]   | [3, 4, 5]   | [6, 7, 8]   |
    | Índice 1 | [9, 10, 11] | [12, 13, 14]| [15, 16, 17]|
    | Índice 2 | [18, 19, 20]| [21, 22, 23]| [24, 25, 26]|

    ```python
    # Declarando un escalar.
    scalar = np.array(42)
    print(scalar)
    scalar.ndim
    ---> 42
    ---> 0

    # Declarando un vector.
    vector = np.array([1, 2, 3])
    print(vector)
    vector.ndim

    ---> [1 2 3]
    ---> 1

    # Declarando una matriz.
    matriz = np.array([[1, 2, 3], [4, 5, 6]])
    print(matriz)
    matriz.ndim
    ----[[1 2 3]
        [4 5 6]]
    ---> 2

    # Declarando un tensor.
    tensor = np.array([[[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]],[[13, 13, 15], [16, 17, 18], [19, 20, 21], [22, 23, 24]]])
    print(tensor)
    tensor.ndim
    ---> [[[ 1  2  3]
            [ 4  5  6]
            [ 7  8  9]
            [10 11 12]]

            [[13 13 15]
            [16 17 18]
            [19 20 21]
            [22 23 24]]]
    ---> 3
    ```

6. **Agregar o eliminar dimenciones:**
    ```python
    # Se puede definir el número de dimensiones desde la declaración del array
    vector = np.array([1, 2, 3], ndmin = 10)
    print(vector) 
    vector.ndim 

    ---> [[[[[[[[[[1 2 3]]]]]]]]]]
    ---> 10

    # Se pueden expandir dimensiones a los array ya existentes con expand_dims(). Axis = 0 hace referencia a las filas, mientras que axis = 1 a las columnas.
    expand = np.expand_dims(np.array([1, 2, 3]), axis = 0)
    print(expand)
    expand.ndim 

    ---> [[1 2 3]]
    ---> 2

    # Remover/comprimir las dimensiones que no están siendo usadas.
    print(vector, vector.ndim) 
    vector_2 = np.squeeze(vector)
    print(vector_2, vector_2.ndim)

    ---> [[[[[[[[[[1 2 3]]]]]]]]]] 10
    ---> [1 2 3] 1
    ```

7. **Creando arrays:** Numpy nos da varios métodos muy eficientes para poder crear arrays desde 0.

    ```python
    # Este método de NumPy nos permite generar arrays sin definir previamente una lista.
    np.arange(0,10)
    ---> array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

    # Un tercer argumento permite definir un tamaño de paso.
    np.arange(0,20,2)
    ---> array([ 0,  2,  4,  6,  8, 10, 12, 14, 16, 18])

    # np.zeros() Nos permite definir estructuras o esquemas.
    np.zeros(3)
    ---> array([0., 0., 0.])
    np.zeros((10,5))
    ---> array([[0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.],
        [0., 0., 0., 0., 0.]])

    # De igual manera, tenemos np.ones()
    np.ones(3)
    ---> array([1., 1., 1.])

    # np.linspace() Permite generar una array definiendo un inicio, un final y cuantas divisiones tendrá.
    np.linspace(0, 10 , 10)
    --->  array([ 0.,1.11111111,2.22222222,  3.33333333,  4.44444444,
            5.55555556,  6.66666667,  7.77777778,  8.88888889, 10.])

    # También podemos crear una matriz con una diagonal de 1 y el resto de 0.
    np.eye(4)
    ----> array([[1., 0., 0., 0.],
            [0., 1., 0., 0.],
            [0., 0., 1., 0.],
            [0., 0., 0., 1.]])

    # Otro método importante es generar números aleatorios.
    np.random.rand()
    ---> 0.37185218178880153

    np.random.rand(4)
    ---> array([0.77923054, 0.90495575, 0.12949965, 0.55974303])

    np.random.rand(4,4)
    ---> array([[0.26920153, 0.24873544, 0.02278515, 0.08250538],
                [0.16755087, 0.59570639, 0.83604996, 0.57717126],
                [0.00161574, 0.27857138, 0.33982786, 0.19693596],
                [0.69474123, 0.01208492, 0.38613157, 0.609117  ]])

    np.random.randint(1,15)
    ---> 7

    np.random.randint(1,15, (3,3))
    ---> array([[ 4,  2,  9],
                [ 5,  7,  8],
                [14, 14,  4]])
    ```

8. **Shape y Reshape:** Hay 2 funciones muy importantes de los arreglos (Shape y Reshape). La forma de un arreglo nos va a decir con que estructura se está trabajando (tamaño, manipular, ingresar).

    ```python
    # SHAPE
    # Indica la forma del arreglo.
    arr = np.random.randint(1,10,(3,2))
    arr.shape
    ---> (3, 2)

    arr
    ---> array([[4, 2],
            [4, 8],
            [4, 3]])

    # RESHAPE
    # Transforma el arreglo mientras se mantengan los elementos.
    arr.reshape(1,6)
    ----> array([[4, 2, 4, 8, 4, 3]])

    arr.reshape(2,3)
    ---> array([[4, 2, 4],
            [8, 4, 3]])

    np.reshape(arr,(1,6))
    ---> array([[4, 2, 4, 8, 4, 3]])

    #Se puede hacer un reshape como lo haría C o Fortran

    np.reshape(arr,(2,3), 'C')
    ---> array([[4, 2, 4],
                [8, 4, 3]])

    np.reshape(arr,(2,3), 'F')
    ---> array([[4, 4, 8],
                [4, 2, 3]])

    # Además, existe la opción de hacer reshape según como esté optimizado nuestro computador. En este caso es como en C.

    np.reshape(arr,(2,3), 'A')
    ---> array([[4, 2, 4],
        [8, 4, 3]])
    ```
9. **funciones principales:**

    ```python
    arr = np.random.randint(1, 20, 10)
    arr
    ---> array([ 6, 11, 15, 12,  9, 17,  7,  7, 12,  3])

    matriz = arr.reshape(2,5)
    matriz
    ---> array([[ 6, 11, 15, 12,  9],
                [17,  7,  7, 12,  3]])

    # .max Para el máximo
    arr.max() ----> 17
    matriz.max() ----> 17
    matriz.max(1) ---> array([15, 17])
    matriz.max(0) --->rray([17, 11, 15, 12,  9])

    # También tenemos .argmax() que nos devuelve la posición del elemento
    arr.argmax() ---> 9
    matriz.argmax(0) ---> array([0, 1, 1, 0, 1])

    # De forma análoga tenemos .min()
    arr.min() ---> 3
    arr.argmin() ---> 3
    matriz.min(0) ---> array([ 6,  7,  7, 12,  3])
    matriz.argmin(1) ---> array([6, 3])

    # Podemos saber la distancia entre el valor más bajo con el más alto.
    arr.ptp() # 17 - 3 ---> 14
    matriz.ptp(0)  ---> array([11,  4,  8,  0,  6])

    #ANÁLISIS ESTADÍSTICOS
    #Ordenar los elementos:
    arr.sort() ---> array([ 3,  6,  7,  7,  9, 11, 12, 12, 15, 17])

    # Obtener un percentil (Busca la posición que esta a la mitad):
    np.percentile(arr, 50) ---> 10.0

    # Mediana:
    np.median(arr) ---> 10.0

    # Desviación estándar:
    np.std(arr) ---> 4.0853396431631

    # Varianza:
    np.var(arr) ---> 16.69

    # Promedio:
    np.mean(arr) ---> 9.9

    # Lo mismo aplica para las matrices.
    np.median(matriz, 1) ---> array([ 7., 12.])

    # CONCATENACIÓN
    # Se pueden unir dos arrays

    a = np.array([[1,2], [3,4]])
    b= np.array([5, 6])
    np.concatenate((a,b), axis = 0)

    ---> ValueError: all the input arrays must have same number of dimensions, but the array at index 0 has 2 dimension(s) and the array at index 1 has 1 dimension(s)

    # El error anterior es debido a que ‘a’ tiene 2 dimensiones, mientras que ‘b’ tiene 1.
    a.ndim ---> 2
    b.ndim ---> 1

    # Debemos poner ‘b’ en 2 dimensiones también.

    b = np.expand_dims(b, axis = 0)
    np.concatenate((a,b), axis = 0)
    ---> array([[1, 2],
                [3, 4],
                [5, 6]])

    # De igual manera, podemos agregarlo en el otro eje

    np.concatenate((a,b), axis = 1)

    ValueError: all the input array dimensions for the concatenation axis must match exactly, but along dimension 0, the array at index 0 has size 2 and the array at index 1 has size 1

    # Como ‘b’ es una fila y no una columna, no se puede concatenar a menos que se aplique la transpuesta.

    # La transpuesta pone nuestro array en sentido opuesto, si el array original es (1,2), con la transpuesta quedará (2,1)

    b.T
    ---> array([[5],
            [6]])

    np.concatenate((a,b.T), axis = 1)
    ---> array([[1, 2, 5],
                [3, 4, 6]])
    ```

10. **Copy:** .copy() nos permite copiar un array de NumPy en otra variable de tal forma que al modificar el nuevo array los cambios no se vean reflejados en array original.

    ```python
    arr = np.arange(0, 11)
    arr ----> array([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10])

    # Tomamos un trozo del array original
    arr[0:6] ----> array([0, 1, 2, 3, 4, 5])
    trozo_de_arr = arr[0:6]

    # Queremos pasar todas nuestras variables a 0
    trozo_de_arr[:] = 0
    trozo_de_arr ----> array([0, 0, 0, 0, 0, 0])

    # Se han modificado los datos del array original porque seguía haciendo referencia a esa variable.
    arr ----> array([ 0,  0,  0,  0,  0,  0,  6,  7,  8,  9, 10])

    # Con .copy() creamos una copia para no dañar nuestro array original
    arr_copy = arr.copy()
    arr_copy[:] = 100
    arr_copy ----> array([100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100])
    arr ----> array([ 0,  0,  0,  0,  0,  0,  6,  7,  8,  9, 10])
    ```

10. **Copy:** .copy() nos permite copiar un array de NumPy en otra variable de tal forma que al modificar el nuevo array los cambios no se vean reflejados en array original.

    ```python
    arr = np.arange(0, 11)
    arr ----> array([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10])

    # Tomamos un trozo del array original
    arr[0:6] ----> array([0, 1, 2, 3, 4, 5])
    trozo_de_arr = arr[0:6]

    # Queremos pasar todas nuestras variables a 0
    trozo_de_arr[:] = 0
    trozo_de_arr ----> array([0, 0, 0, 0, 0, 0])

    # Se han modificado los datos del array original porque seguía haciendo referencia a esa variable.
    arr ----> array([ 0,  0,  0,  0,  0,  0,  6,  7,  8,  9, 10])

    # Con .copy() creamos una copia para no dañar nuestro array original
    arr_copy = arr.copy()
    arr_copy[:] = 100
    arr_copy ----> array([100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100])
    arr ----> array([ 0,  0,  0,  0,  0,  0,  6,  7,  8,  9, 10])
    ```

11. **Condiciones:** Las condiciones nos permiten hacer consultas más específicas.

    ```python
    arr = np.linspace(1,10,10, dtype = 'int8')
    arr 
    ---> array([ 1,  2,  3,  4,  5,  6,  7,  8,  9, 10], dtype=int8)

    # Regresa un array de booleanos dónde la condición se cumple.
    indices_cond = arr > 5
    indices_cond
    ---> array([False, False, False, False, False,  True,  True,  True,  True, True])

    # Regresa los valores para dónde la condiciones True.
    arr[indices_cond] 
    ---> array([ 6,  7,  8,  9, 10], dtype=int8)

    # Múltiples condiciones.
    arr[(arr > 5) & (arr < 9)] 
    ---> array([6, 7, 8], dtype=int8)

    # Modificar los valores que cumplan la condición.
    arr[arr > 5] = 99
    arr
    ---> array([ 1,  2,  3,  4,  5, 99, 99, 99, 99, 99], dtype=int8)
    ```

12. **Operaciones:** 

    ```python
    # Existen diferentes operaciones que se pueden usar para los arrays de NumPy.
    lista = [1,2]
    lista ----> [1, 2]

    # Una lista de Python entiende que quieres duplicar los datos. No es lo que buscamos.
    lista * 2
    ---> [1, 2, 1, 2]

    # Pero Numpy lo entiende mucho mejor
    arr = np.arange(0,10)
    arr2 = arr.copy()
    arr ----> array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

    # Ahora multiplicamos por un vector:
    arr * 2
    ---> array([ 0,  2,  4,  6,  8, 10, 12, 14, 16, 18])

    # Operación suma de vectores:
    arr + 2 
    ---> array([ 2,  3,  4,  5,  6,  7,  8,  9, 10, 11])

    # División con un vector
    # Como en este caso la primera posición del array es 0, muestra un error pero, no detiene el proceso.
    1 / arr

    ---> RuntimeWarning: divide by zero encountered in true_divide
    Entry point for launching an IPython kernel.

    ---> array([    inf,   1.  , 0.5 , 0.33333333, 0.25 ,0.2, 0.16666667, 0.14285714, 0.125 , 0.11111111])

    #Elevar a un vector:
    arr**2
    ---> array([ 0,  1,  4,  9, 16, 25, 36, 49, 64, 81])

    # Sumar dos arrays de igual dimensiones las hace elemento por elemento:
    arr + arr2
    ---> array([ 0,  2,  4,  6,  8, 10, 12, 14, 16, 18])

    # Lo mismo aplica para matrices.
    matriz = arr.reshape(2,5)
    matriz2 = matriz.copy()
    matriz
    ---> array([[0, 1, 2, 3, 4],
            [5, 6, 7, 8, 9]])
    matriz - matriz2
    ---> array([[0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0]])

    # Una operación importante es la de punto por punto, aquí dos formas de hacerla:
    np.matmul(matriz, matriz2.T)
    ---> array([[ 30,  80],
            [ 80, 255]])
    matriz @ matriz2.T
    ---> array([[ 30,  80],
        [ 80, 255]])
    ```

## Pandas

Pandas está enfocada a la manipulación y análisis de datos.
* Al estar construido sobre NumPy es veloz.
* Requiere poco código para manipular los datos.
* Soporta múltiples formatos de archivos.
* Ordena los datos en una alienación inteligente.
* Se pueden manejar grandes cantidades de datos, hacer analítica y generar dashboards.

### 🚀 Introducción a Pandas

1. **Importar Pandas:** Cómo importar la biblioteca Pandas.
    ```python
    import pandas as pd
    ```

2. **Series en Pandas:** Es muy parecido a un array de una dimensión (o vector) de NumPy.

    • Arreglo unidimensional indexado
    • Búsqueda por índice
    • Slicing
    • Operaciones aritméticas
    • Distintos tipos de datos

    ```python
    import pandas as pd

    serie = pd.Series([1, 2, 3, 4, 5])

    psg_players = pd.Series(['Navas','Mbappe','Neymar','Messi'], index=[1,7,10,30])

    psg_players
    ---> 1      Navas
        7     Mbappe
        10    Neymar
        30     Messi
        dtype: object

    dict = {1: 'Navas', 7: 'Mbappe', 10: 'Neymar', 30:'Messi'}
    pd.Series(dict)
    ---> 1 Navas
    7 Mbappe
    10 Neymar
    30 Messi
    dtype: object

    psg_players[7]
    ----> 'Mbappe'

    psg_players[0:3]
    -----> 0     Navas
        1    Mbappe
        2    Neymar
        dtype: object
    ```

3. **DataFrames en Pandas:** Muy parecido a las estructuras matriciales trabajadas con NumPy.

    • Estructura principal
    • Arreglo de dos dimensiones
    • Búsqueda por índice (columnas o filas)
    • Slicing
    • Operaciones aritméticas
    • Distintos tipos de datos
    • Tamaño variable

    ```python
    import pandas as pd

    datos = {'Nombre': ['Alice', 'Bob', 'Charlie'],
             'Edad': [25, 30, 35]}
    df = pd.DataFrame(datos)

    dict = {'Jugador':['Navas','Mbappe','Neymar','Messi'],
    'Altura':[183.0, 170.0, 170.0, 163.0],
    'Goles':[2, 200, 150, 500]}
    df_players = pd.DataFrame(dict, index=[1,7,10,30])
    --->   Jugador Altura Goles
            1 Navas    183    2
            7 Mbappe   170    200
            10 Neymar   170    150
            30 Messi    163    500

    df_players.columns
    ---> Index(['Jugador', 'Altura', 'Goles'], dtype='object')

    df_players.index
    ------> RangeIndex(start=0, stop=4, step=1)
    ```

### 🔄 Operaciones Básicas en Pandas

4. **Seleccionar Datos:** Cómo seleccionar columnas y filas en un DataFrame.
    ```python
    columna = df['Nombre']
    fila = df.loc[0]
    ```

5. **Filtrar Datos:** Cómo aplicar condiciones para filtrar datos.
    ```python
    filtrado = df[df['Edad'] > 30]
    ```

6. **Operaciones con Columnas:** Realizar operaciones en columnas.
    ```python
    df['Doble Edad'] = df['Edad'] * 2
    ```


