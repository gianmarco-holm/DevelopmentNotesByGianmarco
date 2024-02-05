# Configuración Profesional de Entorno de Trabajo para Ciencia de Datos

## 1. Plantillas de Proyectos

Las plantillas de proyectos son un medio que posibilita portar o construir un diseño predefinido. Estas te permiten definir carpetas, notebooks, scripts, archivos de configuración, etc.

Algunas razones para usar plantillas en proyectos se debe a que:

* Agiliza tu trabajo y reduce la fatiga por decisión.
* Es más fácil de personalizar un proyecto hecho con plantillas que hecho desde cero.
* La reproducibilidad de un proyecto es más viable.
* Es más fácil encontrar algo entre los componentes del proyecto.

### 1.1 Instalar Cookiecutter

Es un manejador de plantillas multiplataforma (Windows, Mac OS, Linux) que te permite hacer plantillas en lenguaje de programación o formato de marcado. Puede ser usado como herramienta de línea de comandos o como librería de Python.

Cookiecutter funciona con Jinja, un motor de plantillas extensible con el cual puedes crear plantillas como si estuvieras escribiendo código en Python.

**¿Cómo funciona?**

Hay 3 pasos para entender la manera en que funciona:

* Detectará una sintaxis especial en los documentos y carpetas de tu proyecto.
* Buscará variables y valores a reemplazar.
* Finalmente, entregará un proyecto con la estructura definida en la plantilla.

#### 1.1.1 Sintaxis de Jinja

Existen 3 tipos diferentes de bloques:

* **Bloques de expresión:** se usan para incluir variables en la plantilla:

```bash
    {{ cookiecutter.saluda }}
```

* **Bloques de declaración:** se usan para el uso de condicionales, ciclos, etc.:

```bash
    {% if coockiecutter.eres_asombroso %}
    . . .
    {% endif %}
```

* **Bloques de comentario:** se usan para dejar comentarios o recomendaciones a los propios desarrolladores:

```bash
    {# Esto es un comentario #}
```

#### 1.1.2 Instalación de Cookiecutter

**Importante:** Todos los pasos son vía consola y con Anaconda instalado.

1. Crea una carpeta un entrar en ella:

    ```bash
    mkdir <nombre_carpeta>
    cd <nombre_carpeta>
    ```

2. Agrega el canal Conda-Forge a tu configuración global:

    ```bash
    conda config --add channels conda-forge
    ```

3. Crea un ambiente virtual que contenga a Coockiecutter:

    ```bash
    conda create --name <nombre_ambiente> coockiecutter=1.7.3
    ```

4. Activa el ambiente virtual:

    ```bash
    conda activate <nombre_ambiente>
    ```

5. Definir en dónde estará tu ambiente:

    ```bash
    conda env export --from-history --file environment.yml
    ```

6. Para desactivar el ambiente virtual:

    ```bash
    conda deactivate
    ```
