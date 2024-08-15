# Regresión Lineal con Python y scikit-learn

## 1. Introducción

### 1.1. Tu primera regresión lineal con scikit-learn

#### Requisitos

* Matemáticas para inteligencia artificial.
* Análisis exploratorio de datos con Python y Pandas.
* Visualización de datos con Matplotlib y Seaborn.
* Fundamentos de inteligencia artificial.

#### Codigo para entender mejor la relación entre variables

```python
  import seaborn as sns
  sns.set( style= 'whitegrid', context='notebook ')
  sns.pairplot(df[cols]height=2.5)
  sns.heatmap(
    cm,
    cbar=True,
    annot=True,
    square=True,
    fmt='.2f'
    annot_kws={'size':15}
    yticklabels=cols,
    xticklabels=cols
  )
```

#### Carga de datos

[Enlace](https://drive.google.com/file/d/1XtiOd1sP-y0gQ6li0FkV2C_ZBrruysQu/view?usp=sharing)

### 1.2. Análisis de datos para tu primera regresión lineal

[Enlace](https://drive.google.com/file/d/1XtiOd1sP-y0gQ6li0FkV2C_ZBrruysQu/view?usp=sharing)

### 1.3. Entrenando un modelo de regresión lineal con scikit-learn

Un modelo de regresión lineal es una técnica estadítica que modela la relación entre una o varias **variables independientes** y una **variable dependiente**, es decir busca la recta o la ecuación que mejor se ajuste a los datos observados, permitiéndonos predecir o entender como cambia la variable dependiente en función de la variable independiente.

[Enlace](https://drive.google.com/file/d/1XtiOd1sP-y0gQ6li0FkV2C_ZBrruysQu/view?usp=sharing)

## 2. Como funciona la regresion lineal

### 2.1. Que es la regresion lineal?

![Regresion lineal simple](../../images/regresion_lineal_simple.png)

* Puntos amarillos: Son los datos observados en el plano cartesiano, es decir la pareja de valores (x,y)
* Recta verde: Representa la recta de la ecuación de la regresion lineal ajustada a los datos observados.
* W0 (intercepto): Indica el valor de y cuando x=0, es decir es la distancia del origen hasta la linea de regresion cuando cruza el eje y o ordenada.
* W1 (pendiente): Muestra cuando cambia y por cada unidad que cambia x, tal como indica el triangulo rojo.

> Como conclusion el grafico muestra como se relaciona una variable dependiente, predictor, regresor o y con una variable independiente, variable explicada, variable respuesta o x mediante una linea de regresion.

### 2.2. Cuándo utilizar un modelo de regresión lineal

* Para predecir variables numericas es un buen modelo de entrada, y si este no ajusta bien, cambiar a modelos mas complejos.
* Si las variables independientes son primordialmente númericas, sería un visto bueno hacia la regresión lineal.
* Si hay muchas variables categoricas es recomendable no usar una regresion lineal
* Reduce las variables lo mas que puedas, es decir si tienes 40 variables, trata de usar 20 o 15 de estas.
* Evita la Multicolinealidad. variables diferentes que explican lo mismop, por ejem: peso en kg y en libras.
* No predigas fuera del dominio de la variable independiente.

### 2.3. Función de pérdida y optimización: mínimos cuadrados

Un algoritmo siempre pasa por un loop:

1. Se ajusta el modelo.
2. Se comparan resultados con los reales.
3. Se ajustan pesos en el modelo.
4. Regreso a paso inicial si no se converge.

![Funcion de perdida y optimización](../../images/funcion_perdida_optimizacion.png)

Estos pasos se lleva a este grafico donde se ajusta el modelo y se van comparando los resultados ajustando los pesos del modelo de la regresión lineal hasta que la linea roja llegue al azul que sería el mejor modelo de regresion.

Para ejecutar esto tenemos:

#### Función de pérdida

La función de pérdida (también conocida como función de costo o función de error) mide la discrepancia entre los valores predichos por el modelo y los valores reales de los datos de entrenamiento. El objetivo del entrenamiento es minimizar esta discrepancia para que las predicciones del modelo sean lo más precisas posibles.

#### La función de optimización

Se refiere al proceso y los algoritmos utilizados para minimizar la función de pérdida ajustando los parámetros del modelo (por ejemplo, pesos y bias en una red neuronal). El objetivo es encontrar los valores de los parámetros que resulten en la menor pérdida posible.

### 2.4. Evaluando el modelo: R^2 y MSE

Estas son las metricas que nos ayudara a evaluar como se ajusta el modelo a los datos reales

* R - Ajustada.
* Error máximo.
* Error absoluto promedio (MAE).
* Mediana de los errores absoluto.
* Raíz del promedio de los errores cuadrados
* (RMSE).
* Varianza explicada.
* Tambien existe uno que es por grafico (grafico de los residuales) que consiste en mover la recta de la regresion 90 grados, y todos los puntos que quedes afuera como residuo es los errores de nuestro modelo.

#### Para la función de Perdida tenemos las siguientes métricas

Si es una regresion tenemos -->

##### Error Cuadrático Medio (MSE)

$$
\text{MSE} = \frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2
$$

##### Error Absoluto Medio (MAE)

$$
\text{MAE} = \frac{1}{n} \sum_{i=1}^{n} |y_i - \hat{y}_i|
$$

##### R Cuadrado (R²)

$$
R^2 = 1 - \frac{\sum_{i=1}^{n} (y_i - \hat{y}_i)^2}{\sum_{i=1}^{n} (y_i - \bar{y})^2}
$$

$$
\text{Donde:}
$$
$$
y_i \text{ : son los valores reales.} \\
\hat{y}_i \text{ : son los valores predichos por el modelo.} \\
\bar{y} \text{ : es el valor promedio de los valores reales.}
$$

Si es de Clasificación tenemos -->

##### Entropía Cruzada (Cross-Entropy Loss)

$$
\text{Cross-Entropy} = -\frac{1}{n} \sum_{i=1}^{n} \left( y_i \log(\hat{y}_i) + (1 - y_i) \log(1 - \hat{y}_i) \right)
$$

##### Error Logístico (Log Loss)

Similar a la entropía cruzada, utilizada en clasificación binaria.

#### Para la Función de Optimización tenemos las siguientes métricas

 Algunos de los algoritmos de optimización más comunes son:

##### Descenso de Gradiente (Gradient Descent)

1. **Batch Gradient Descent**
Actualiza los parámetros utilizando todo el conjunto de datos en cada iteración.

2. **Stochastic Gradient Descent (SGD)**
Actualiza los parámetros utilizando una sola muestra a la vez.

3. **Mini-batch Gradient Descent**
Actualiza los parámetros utilizando pequeños subconjuntos del conjunto de datos.

##### Descenso de Gradiente con Momentos

1. **Momentum**
Acelera SGD acumulando una fracción de la actualización anterior en la dirección de la mínima.

2. **Nesterov Accelerated Gradient (NAG)**
Similar a Momentum, pero hace una corrección antes de calcular el gradiente.

##### Métodos Adaptativos

1. **AdaGrad**
Adapta la tasa de aprendizaje para cada parámetro dividiéndola por la raíz cuadrada de la suma de las derivadas cuadradas anteriores.

2. **RMSprop**
Similar a AdaGrad, pero utiliza una media móvil de las derivadas cuadradas.

3. **Adam (Adaptive Moment Estimation)**
Combina las ideas de AdaGrad y RMSprop, ajustando la tasa de aprendizaje para cada parámetro usando momentos del primer y segundo orden.

## 3. Regresión Lineal Multivariable

### 3.1. Regresión Lineal Multivariable

$$
y =w_0 + w_1x_1 + ... + w_nx_n
$$

La regresión lineal multivariable es el calculo matematico que modela la relación de variables variables independientes y una variable dependiente.

### 3.2. Practica

[Enlace](https://drive.google.com/file/d/1O2g5aftPujh2CkK2-OQi72yFow1Hjgbf/view?usp=sharing)

### 4. Proyecto práctico

### 4.1. Regresión lineal para predecir los gastos médicos de pacientes

Utilizando como inicio datos del US Census Bureau se recabaron datos de gastos en seguros de datos médicos de varios pacientes.

| Variable                | Tipo               | Descripción                            |
|-------------------------|--------------------|----------------------------------------|
| Edad                    | numérica           | La edad del asegurado                  |
| Sexo                    | dicotómica         | Género binario del asegurado           |
| Índice de masa corporal | numérica           | Índice de masa corporal del paciente   |
| Hijos                   | numérica entera    | Cantidad de hijos del paciente         |
| Fumador                 | booleana           | Si el paciente es fumador o no fumador |
| Región                  | categórica         | Región en la que vive el paciente      |
| Cargos                  | numérica           | La cantidad que pago de seguro el paciente |

La data se encuentra en [Kaggle](https://www.kaggle.com/datasets/mirichoi0218/insurance)

### 4.2. Exploración y preparación de datos

### 4.3. Análisis de correlación de datos

### 4.4 Entrenamiento del modelo

### 4.5. Evaluando el modelo

### 4.6. Mejorando el modelo

## 5. Pasos Siguientes

### 5.1. ¿Qué hay más allá de la linealidad?

1. Va a ver modelos que no van a calzar en un modelo de regresión lineal y se tienen que colocar en un modelo polinomial.
2. Debemos de tratar con modelos con sesgo y mucha varianza
3. Debemos aplicar la regularización a nuestros modelos

### 5.2. Siguientes pasos en modelos de inteligencia artificial

1. Vectores de soporte de regresión
2. K-vecinos mas cercanos
3. Redes Neuronales
4. Si bien es cierto vimos el analisis supervisado para un análisis de regresion, pero, tambien existe analisis supervisado para problemas de regresión, análisis no supervisado de clustering y reducción de dimensionalidad.
