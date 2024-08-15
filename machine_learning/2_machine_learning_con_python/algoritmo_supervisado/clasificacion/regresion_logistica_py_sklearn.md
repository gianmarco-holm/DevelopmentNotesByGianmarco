# Regresión Logística con Python y scikit-learn

## 1. Introducción

### 1.1. ¿Qué es la regresión logística?

Es un método de machine learning utilizada para predecir una variable categorica, mediante la clasificación binaria o multiclase, usando una función sigmoidal que forma una "S" en el plano cartesiano y que mapea el valor entre 0 y 1, aquí se establece un umbral de 0.5 para decidir la clasificación.

**Función Sigmoide:**

$$
\sigma(z) = \frac{1}{1 + e^{-z}}
$$

Donde z es : $\beta_0 + \beta_1 x_1 + \beta_2 x_2 + \ldots + \beta_n x_n$

### 1.2. Tu primera clasificación con regresión logística

[Notebook del primer proyecto de regresión logistica](https://drive.google.com/file/d/1CdBdx448IasN9_uUqVWgt-r5EZCNdl9_/view?usp=sharing)

### 1.3. Cuando usar regresión logística?

Vetajas:

* Fácil de implementar
* Coeficientes interpretables.
* Inferencia de la importancia de cada característica.
* Clasificación en porcentajes.
* Excelentes resultados con datasets linealmente separables.

Desventajas:

* Asume linealidad entre las variables dependientes.
* Overfitting sobre datasets de alta dimensionalidad.
* Le afecta la multicolinealidad de variables.
* Mejores resultados con datasets grandes.

Cuando usarla:

* Sencillo y rápido.
* Probabilidades de ocurrencia sobre un evento categórico.
* Dataset linealmente separable.
* Datasets grandes.
* Datasets balanceados.

### 1.4. Fórmula de regresión logística

Como sabemos la probabilidad viene de esta formula

**Función Sigmoide:**

$$
\sigma(z) = \frac{1}{1 + e^{-z}}
$$

Ahora este z tambien lo podemos expresar con **ods**.

**ODS:**
Es la probabilidad de que un evento sea exitoso, es decir que si un evento tiene la probabilidad p=80% de que ocurra y y un 20% de que no ocurra, se divide 80/20=4, lo que significa que hay 4 veces mas probable de que un evento sea exitoso.

$$
ods = \frac{p}{1-p}
$$

**Log Ods:**
Se utiliza el logaritmo para estandarizar la respuesta entre 0 a 1 y obtener la clasificación.

$$
\text{log-odds} = \log\left(\frac{p}{1 - p}\right)
$$

decimos que z es igual a un ods porque z tiene esta función $\beta_0 + \beta_1 x_1$ y esta función es la regresión lineal, esto significa que la regresión lineal esta ligada con la regresión logística

$$
\log\left(\frac{p}{1 - p}\right) = \beta_0 + \beta_1 x_1
$$

Le colocamos el logaritmo para llevar la probabilidad a un número que este entre 0 y 1, desbejando esta función, obtenemos la función sigmoide.

$$
\sigma(z) = \frac{1}{1 + e^{-(\beta_0 + \beta_1 x_1)}}
$$

## 2. Regresión logística binomial

### 2.1. Preparando los datos

**Data pre-procing:**

* Eliminar duplicados.
* Evaluar valores nulos.
* Remover columnas innecesarias.
* Procesar datos categóricos.
* Remover outliers.
* Escalar data.

### 2.2. Análisis de correlación y escalabilidad de los datos

[Enlace del proyecto](https://drive.google.com/file/d/11hTofqvbiyyADaZBkWjm-JNMNhSO4juC/view?usp=sharing)

### 2.3. Análisis exploratorio de datos

### 2.4. Evaluando el modelo (MLE)

En la regresión logística, tanto el descenso de gradiente (Gradient Descent) como el máximo verosímil (Maximum Likelihood Estimation, MLE) son métodos utilizados para estimar los parámetros del modelo, pero funcionan de maneras diferentes. A continuación se detallan sus diferencias:

#### MLE

Es un método estadístico para estimar los parámetros de un modelo de probabilidad, maximizando la función de verosimilitud.

#### Descenso de Gradiente

Es un algoritmo iterativo utilizado para encontrar los valores óptimos de los parámetros que minimizan una función de costo (en este caso, la función de pérdida logística).

En resumen, mientras que ambos métodos buscan ajustar los parámetros del modelo para que se ajusten mejor a los datos, el descenso de gradiente es un método iterativo de optimización que minimiza una función de costo, y el MLE es un método estadístico que maximiza la probabilidad de los datos observados.

### 2.5. Análisis de resultados de regresión logística

### 2.6. Regularizers

Los regularizadores son técnicas utilizadas en los modelos de aprendizaje automático para prevenir el sobreajuste (overfitting) al penalizar los coeficientes del modelo. Los dos tipos más comunes de regularización son:

* L1 Regularization (Lasso): Penaliza la suma de los valores absolutos de los coeficientes. Puede resultar en algunos coeficientes exactamente iguales a cero, lo que lleva a la eliminación de algunas características.
* L2 Regularization (Ridge): Penaliza la suma de los cuadrados de los coeficientes. Tiende a reducir los coeficientes sin hacerlos exactamente cero.

```python
# Inicializamos el modelo de Regresión Logística con regularización L1
logreg = LogisticRegression(penalty='l1', solver='liblinear', C=1.0)

# Inicializamos el modelo de Regresión Logística con regularización L2
logreg = LogisticRegression(penalty='l2', C=1.0)  # C es el inverso de la fuerza de regularización, cuanto más pequeño, mayor es la regularización
```

**Explicación de los parámetros:**

* penalty: Especifica el tipo de regularización a utilizar. 'l2' para L2 regularization y 'l1' para L1 regularization.
* C: Es el inverso de la fuerza de regularización. Un valor más pequeño de C implica una regularización más fuerte. Por ejemplo, C=1.0 es una regularización moderada, C=0.1 es una regularización más fuerte, y C=10.0 es una regularización más débil.
* solver: El algoritmo a utilizar en el optimizador. 'liblinear' es una buena opción para L1 regularization.

## 3. Regresión logística multinomial

### 3.1. Cómo funciona la regresión logística multiclase

#### One vs rest

El método "One vs Rest" (OvR) descompone el problema de clasificación multiclase en múltiples problemas de clasificación binaria. Para cada clase, se entrena un modelo de regresión logística que diferencia entre esa clase específica y todas las demás. Durante la predicción, el modelo con la mayor probabilidad para una clase específica es el que se elige.

#### Multinomial Logistic Classifier

El clasificador de regresión logística multinomial maneja el problema de clasificación multiclase directamente, en lugar de descomponerlo en múltiples problemas binarios. Este enfoque extiende la regresión logística para predecir múltiples clases simultáneamente utilizando una función softmax para calcular las probabilidades de cada clase. Este método es más adecuado para problemas de clasificación multiclase con dependencias entre clases.

#### Scikit Learn Solvers

Scikit-learn proporciona varios solvers (algoritmos de optimización) para la regresión logística, cada uno con sus propias características y capacidades para manejar penalizaciones y soportar clasificación multiclase:

| Solvers          | Penalties             | L2 penalty | L1 penalty | Elastic-Net (L1 + L2) | No penalty (‘none’) | Multiclass support             | Penalize the intercept (bad) | Faster for large datasets | Robust to unscaled datasets |
|------------------|-----------------------|------------|------------|-----------------------|---------------------|-------------------------------|------------------------------|----------------------------|-----------------------------|
| ‘lbfgs’          |                       | yes        | no         | no                    | yes                 | multinomial multiclass        | no                           | no                         | yes                         |
| ‘liblinear’      |                       | no         | yes        | no                    | no                  | yes                           | yes                          | no                         | yes                         |
| ‘newton-cg’      |                       | yes        | no         | no                    | yes                 | yes                           | no                           | no                         | yes                         |
| ‘newton-cholesky’|                       | no         | no         | no                    | yes                 | no                            | no                           | no                         | yes                         |
| ‘sag’            |                       | yes        | no         | no                    | yes                 | yes                           | no                           | yes                        | no                          |
| ‘saga’           |                       | yes        | yes        | yes                   | yes                 | yes                           | no                           | yes                        | no                          |

### 3.2. Carga y preprocesamiento de datos multiclase

[Enlace](https://drive.google.com/file/d/1Cl40kIcXg4zpkkRLoITUXZdMDduq4v3l/view?usp=sharing)

### 3.3. Análisis exploratorio y escalamiento de datos multiclase

### 3.4. Entrenamiento y evaluación de regresión logística multiclase

[Futuro proyecto](https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-data)
