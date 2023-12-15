# 🌐 Apuntes de Bootstrap 5

## Nivel Básico

### 🚀 Introducción a Bootstrap

1. **CDN de Bootstrap:** Incluyendo Bootstrap en tu proyecto a través de CDN.
    ```html
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" integrity="...">

    <!-- JS (opcional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="..."></script>

    <!-- Tambien puedes incluir Popper y JS para menus desplegables, ventanas emergentes o para información sobre herramientas -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    ```

### 🚀 Layout en Bootstrap

1. **Breakpoints:** Definen los puntos de ruptura para el diseño responsivo.

| Punto de Interrupción    | Infijo de Clase | Dimensiones    |
|--------------------------|-----------------|-----------------|
| Extra Pequeño            | Ninguno         | <576px          |
| Pequeño                  | sm              | ≥576px          |
| Medio                    | md              | ≥768px          |
| Grande                   | lg              | ≥992px          |
| Extra Grande             | xl              | ≥1200px         |
| Extra Extra Grande       | xxl             | ≥1400px         |

```html
    <div class="container">
        <!-- Contenido de la página -->
    </div>

    <div class="container-sm">
        <!-- Contenido específico para el breakpoint small (≥576px) -->
    </div>

    <div class="container-md">
        <!-- Contenido específico para el breakpoint medium (≥768px) -->
    </div>
```

2. **Containers:** Proporcionan un contenedor para organizar y centrar el contenido.
    ```html
    <div class="container">
        <!-- Contenido de la página -->
    </div>

    <div class="container-fluid">
        <!-- Contenido de la página con ancho completo -->
    </div>
    ```

3. **Grid System:** Sistema de rejilla para el diseño responsivo.
    ```html
    <div class="container text-center">
        <div class="row">
            <div class="col" style="background-color: beige; border: 1px solid;">Columna 1</div>
            <div class="col" style="background-color: beige; border: 1px solid;">Columna 2</div>
            <div class="col" style="background-color: beige; border: 1px solid;">Columna 3</div>
        </div>
    </div>
    <div class="container text-center">
        <div class="row">
            <div class="col-3" style="background-color: beige; border: 1px solid;">Columna 1</div>
            <div class="col-5" style="background-color: beige; border: 1px solid;">Columna 2</div>
            <div class="col-2" style="background-color: beige; border: 1px solid;">Columna 3</div>
        </div>
    </div>
    <div class="container text-center">
        <div class="row">
            <div class="col col-lg-2" style="background-color: beige; border: 1px solid;">Columna 1</div>
            <div class="col-md-auto" style="background-color: beige; border: 1px solid;">Columna 2</div>
            <div class="col col-lg-2" style="background-color: beige; border: 1px solid;">Columna 3</div>
        </div>
    </div>
    <div class="container text-center">
        <div class="row">
            <div class="col col-md-6" style="background-color: beige; border: 1px solid;">Columna 1</div>
            <div class="col-6 col-md-2" style="background-color: beige; border: 1px solid;">Columna 2</div>
            <div class="col-2 col-md-4" style="background-color: beige; border: 1px solid;">Columna 3</div>
        </div>
    </div>
    <div class="container text-center">
        <div class="row row-cols-2">
            <div class="col" style="background-color: beige; border: 1px solid;">Columna 1</div>
            <div class="col" style="background-color: beige; border: 1px solid;">Columna 2</div>
            <div class="col" style="background-color: beige; border: 1px solid;">Columna 3</div>
            <div class="col" style="background-color: beige; border: 1px solid;">Columna 4</div>
        </div>
    </div>
    ```

4. **Columns:** Uso de clases para especificar el ancho de las columnas en diferentes breakpoints.
    ```html
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-4">
                <!-- Contenido de la columna -->
            </div>
            <!-- Agregar más columnas según sea necesario... -->
        </div>
    </div>
    ```

5. **Align y Justify:** Clases para alinear y justificar contenido.
    ```html
    <div class="d-flex align-items-center justify-content-between">
        <!-- Contenido centrado verticalmente y justificado entre los extremos -->
    </div>
    ```

6. **Salto de Columna Forzada:** Crear un salto de columna forzada en dispositivos específicos.
    ```html
    <div class="w-100 d-none d-md-block">
        <!-- Salto de columna forzada en dispositivos medium y superiores -->
    </div>
    ```

7. **Order:** Controla el orden de las columnas.
    ```html
    <div class="container">
        <div class="row">
            <div class="order-2 col-md-6">Segundo en el orden, primero visualizado</div>
            <div class="order-1 col-md-6">Primero en el orden, segundo visualizado</div>
        </div>
    </div>
    ```

8. **Offset:** Desplaza columnas hacia la derecha.
    ```html
    <div class="container">
        <div class="row">
            <div class="offset-md-2 col-md-8">Centrado en dispositivos medium</div>
        </div>
    </div>
    ```

9. **Margenes y Rellenos:** Clases para márgenes y rellenos.
    ```html
    <div class="ms-3">Margen a la izquierda de tamaño 3</div>
    <div class="me-3">Margen a la derecha de tamaño 3</div>
    <div class="mb-3">Margen inferior de tamaño 3</div>
    <div class="p-3">Relleno de tamaño 3 en todas las direcciones</div>
    ```

10. **Gutters:** Espacios entre las columnas (gutters) en el sistema de rejilla.
    ```html
    <div class="container">
        <div class="row g-3">
            <!-- Contenido con espacio entre columnas -->
        </div>
    </div>
    ```

### 🚀 Contenido en Bootstrap

1. **Typography:** Estilos para encabezados, párrafos y texto.
    ```html
    <h1 class="display-4">Encabezado grande</h1>
    <p class="lead">Este es un párrafo destacado.</p>
    <figure class="text-end">
        <blockquote class="blockquote">
            <p>A well-known quote, contained in a blockquote element.</p>
        </blockquote>
        <figcaption class="blockquote-footer">
            Someone famous in <cite title="Source Title">Source Title</cite>
        </figcaption>
    </figure>
    ```

2. **Imágenes:** Clases para estilizar imágenes.
    ```html
    <img src="imagen.jpg" class="img-fluid" alt="Imagen fluida">
    <img src="..." class="rounded float-start" alt="...">
    <img src="..." class="rounded float-end" alt="...">
    ```

3. **Tables:** Estilos para tablas.
    ```html
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Encabezado 1</th>
                <th scope="col">Encabezado 2</th>
                <!-- Agregar más encabezados según sea necesario... -->
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Dato 1</td>
                <td>Dato 2</td>
                <!-- Agregar más datos según sea necesario... -->
            </tr>
        </tbody>
    </table>
    ```

4. **Figures:** Estilos para figuras y sus pies de foto.
    ```html
    <figure class="figure">
        <img src="imagen.jpg" class="figure-img img-fluid rounded" alt="Una imagen">
        <figcaption class="figure-caption">Pie de foto de la imagen</figcaption>
    </figure>
    <figure class="figure">
        <img src="..." class="figure-img img-fluid rounded" alt="...">
        <figcaption class="figure-caption text-end">A caption for the above image.</figcaption>
    </figure>
    ```

<!-- Continuar con la sección intermedia... -->


### 🎨 Componentes Básicos

4. **Botones:** Estilos para botones.
    ```html
    <button type="button" class="btn btn-primary">Botón Primario</button>
    ```

5. **Formularios:** Estilos para formularios.
    ```html
    <form>
        <div class="mb-3">
            <label for="exampleInputUsername" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="exampleInputUsername">
        </div>
        <!-- Otros campos del formulario... -->
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
    ```

6. **Navbar:** Barra de navegación responsiva.
    ```html
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Mi Sitio</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Acerca de</a>
                    </li>
                    <!-- Otros elementos de navegación... -->
                </ul>
            </div>
        </div>
    </nav>
    ```

7. **Alertas:** Mensajes de alerta.
    ```html
    <div class="alert alert-success" role="alert">
        ¡Operación exitosa!
    </div>
    ```

## Nivel Intermedio

### 📦 Componentes Avanzados

8. **Carousel:** Presentación de diapositivas para imágenes y contenido.
    ```html
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <!-- Contenido de la primera diapositiva -->
            </div>
            <div class="carousel-item">
                <!-- Contenido de la segunda diapositiva -->
            </div>
            <!-- Agregar más diapositivas según sea necesario... -->
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Anterior</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Siguiente</span>
        </button>
    </div>
    ```

9. **Modales:** Ventanas emergentes modales.
    ```html
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Abrir Modal
    </button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Contenido del modal... -->
            </div>
        </div>
    </div>
    ```

10. **Tabs:** Pestillas para organizar contenido.
    ```html
    <ul class="nav nav-tabs" id="myTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Inicio</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Perfil</a>
        </li>
        <!-- Agregar más pestañas según sea necesario... -->
    </ul>

    <div class="tab-content" id="myTabsContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <!-- Contenido de la pestaña "Inicio" -->
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <!-- Contenido de la pestaña "Perfil" -->
        </div>
        <!-- Agregar más contenido de pestañas según sea necesario... -->
    </div>
    ```

11. **Formularios Avanzados:** Componentes como selectores múltiples, interruptores y más.
    ```html
    <select class="form-select" aria-label="Default select example">
        <option selected>Selecciona una opción</option>
        <option value="1">Opción 1</option>
        <option value="2">Opción 2</option>
        <option value="3">Opción 3</option>
    </select>

    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">
            Recordarme
        </label>
    </div>
    ```

## Nivel Avanzado

### 🔧 Personalización y Extensión

12. **Personalización de Estilos:** Modificación de estilos y colores.
    ```html
    <style>
        .mi-clase-personalizada {
            color: #ff5733;
            font-size: 20px;
        }
    </style>
    ```

13. **Uso de Sass:** Integración de Sass para una personalización más avanzada.
    ```html
    <link rel="stylesheet" href="mi_estilo.scss">
    ```

14. **Creación de Componentes Personalizados:** Desarrollo de componentes personalizados.
    ```html
    <div class="mi-componente">
        <!-- Contenido del componente personalizado -->
    </div>
    ```

15. **Extensión con JavaScript:** Mejora de funcionalidades con JavaScript.
    ```html
    <script>
        // Tu código JavaScript personalizado aquí
    </script>
    ```

16. **Bootstrap Icons:** Uso de iconos incorporados de Bootstrap.
    ```html
    <i class="bi bi-heart-fill"></i>
    ```

17. **Temas de Bootstrap:** Implementación de temas predefinidos o personalizados.
    ```html
    <link rel="stylesheet" href="tema_personalizado.css">
    ```

18. **Uso de Font Awesome con Bootstrap:** Integración de iconos adicionales.
    ```html
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="..." crossorigin="anonymous">
    ```

<!-- Puedes agregar más secciones según tus necesidades... -->


