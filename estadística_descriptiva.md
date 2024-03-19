# 📈 Estadística Descriptiva para Ciencia de Datos

## Introducción

La estadística es importante aprenderlo, ya que, en todo el workflow de la ciencia de datos se usa, como veremos más abajo la estadística descriptiva se usa en las dos primeras fases: `Ingesta y Procesamiento de datos` y `Exploración y Analítica de datos`; en cambio la estadística inferencial se usa en la dos ultimas fases: `En la evaluación y producción del modelo` e `Interacción con el usuario final`

Debido a esto, este estudio se va a dividir en 2 grandes grupos:

* Estadísticos para ingesta y procesamiento

* Estadísticos para analítica y exploración

### Estadística descriptiva vs. inferencial

| Aspecto                 | Estadística Descriptiva                 | Estadística Inferencial                    |
|-------------------------|-----------------------------------------|--------------------------------------------|
| **Objetivo**            | Describir y resumir un conjunto de datos | Hacer inferencias sobre una población      |
| **Métodos**             | Medidas resumen (media, mediana, etc.)   | Estimación de parámetros y pruebas de hipótesis |
| **Enfoque**             | Organización y resumen de datos          | Inferir características de una población a partir de una muestra |
| **Ejemplos de Métodos** | Media, mediana, moda, rango, etc.        | Estimación de la media poblacional, pruebas de hipótesis |

**¿Puede mentir la estadística?**

La estadística descriptiva tiene un problema al momento de definir que métrica es la que nos va a brindar la mayor relevancia para nuestro estudio.

* El resultado podría estar sesgado a nuestro criterio personal, mostrando mayor interés a un cierto parámetro. dejando de lado a otro que también podría ser relevante. Mostramos solo una cara de la moneda.
* No existen definiciones objetivas en estadística, sin embargo sobre estas definiciones podemos realizar cálculos exactos lo cual es un problema
* Los diferentes estadísticos descriptivos dan nociones diferentes sobre los mismos datos.

**¿Por que aprender estadística?**

A pesar de los problemas que pueda presentar es muy importante entender que la estadística nos puede ayudar a:

* Resumir grandes cantidades de información
* Tomar mejores decisiones
* Responder preguntas con relevancia social
* Reconocer patrones en los datos
* Descubrir a quien usan estas herramientas con fines nefastos

### Flujo de trabajo en data science

El flujo de trabajo del data science esta compuesto de
![Flujo de Trabajo de la Ciencia de Datos](./images/flujo_de_trabajo.jpeg)

>Puede existir profesiones que se enfoquen mas a cada una de fases, no existe un perfil de data science que se encargue a todo el flujo de trabajo. .

#### ¿En que partes del flujo de trabajo se necesita de estadística?

Todos las partes del flujo requiere del conocimiento en ciertas ramas de la estadística. La estadística descriptiva se va a emplear más en los dos primeros bloques de trabajo.

***Ingesta de datos y Validación :** Se encarga de todo el procesamiento de ETL (Extract Transform Load) obtener los datos, limpiarlos y estructurarlos, crear pipelines de análisis automatizado, es decir que transformaciones vamos a realizar a los datos para que estén listos para el caso especifico de estudio que vamos a realizar.*

***Preparación y entrenamiento del modelo:** En este bloque se va a realizar un análisis exploratorio de los datos con estadística descriptiva, entender correlaciones y realizar posibles reducciones de datos.*

***Evaluar el modelo, Producción e Interacción:** esta parte del flujo se basa mas en la estadística inferencial.*

## Estadísticos para análisis exploratorio de los datos

* [Introducción 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/01-introducci%C3%B3n-3975f2cb16184de8acd0d77a3a47ffe0)
* [Tipos de Datos 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/02-tipos-de-datos-c16d8d19e24148c997ba2b85f44c6b1f)
* [Medidas Central 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/03-medidas-central-eba9c1974e1c40b78e90d38ddba1d34b)
* [Medidas de Disperción 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/04-medidas-dispersion-d5cf7b3a3cce4d0d944633b7e3212a7d)
* [Visualizaciones 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/05-Visualizaciones-89b55ed94ddf4ad585f57ae1e8221bb6)

## Estadísticos para ingesta y procesamiento de datos para entrenamiento de modelos de machine learning

* [Procesamiento de Datos Numéricos 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/06-Procesamiento-datos-numericos-c1495dd95fba49c09729a99f195d793d)
* [Procesamiento de Datos Categóricos 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/07-Procesamiento-datos-categoricos-6af947ac81794b2e9e0be90e434255c9)
* [Matriz de Covarianza 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/08-matriz-covarianza-a6e826757ef3423b873a7695f6198477)
* [Análisis de Componentes 🫵🏻](https://deepnote.com/workspace/gianmarco-holm-421cbaf8-26f8-4328-a3b6-8e02322986c3/project/Estadistica-descriptiva-en-la-Ciencia-de-Datos-4ae198ff-84f2-47b6-a278-e41621250eb4/notebook/09-An%C3%A1lisis-de-Componentes-Principales-1c290f41587a4aa7a4db68f9176cd42b)
