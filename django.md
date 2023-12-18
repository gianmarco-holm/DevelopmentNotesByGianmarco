# 🐍 Apuntes de Django

## Nivel Básico

### 🚀 Introducción a Django

1. **Instalación: **Instalación de Django usando pip.
    ```bash
    # Preparo el entorno virtual
    python3 -m pip install venv
    python3 -m venv nombre_del_entorno
    # Activo el entorno virtual
    # Para Linux
    source nombre_del_entorno/bin/activate
    # Para windows
    nombre_del_entorno\Scripts\activate
    # Instalo django
    pip install django -U
    ```

2. **Crear un Proyecto: **Crear un nuevo proyecto Django.
    ```bash
    django-admin startproject nombre_proyecto
    # Le podemos colocar un punto al final para que no cree una carpeta adentro con el nombre del proyecto
    django-admin startproject nombre_proyecto .
    ```

3. **Crear una Aplicación: **Crear una nueva aplicación dentro del proyecto.
    ```bash
    python manage.py startapp nombre_app
    ```

### 🏠 Estructura del Proyecto

4. **Estructura del Proyecto: **Descripción de la estructura de archivos y carpetas en un proyecto Django.

Nombre_del_Proyecto/
├──__init__.py ** Indica que el directorio es un paquete de python
├── asgi.py ** Punto de entrada para servidores Asgi
├── settings.py ** Configuraciones principales del proyecto. Contiene configuraciones como bases de datos, aplicaciones instaladas, configuración de idioma, zonas horarias, etc.
├── urls.py ** Define las URL de la aplicación. Mapea las URL a las vistas correspondientes. Especifica cómo se deben manejar las solicitudes HTTP.
└── wsgi.py ** Punto de entrada para servidores Wsgi
 manage.py ** Script de línea de comandos para gestionar varias tareas del proyecto Django. Puedes usarlo para crear aplicaciones, aplicar migraciones, iniciar el servidor de desarrollo, entre otras cosas.



### 🌐 Modelos y Bases de Datos

5. **Definir Modelos: **Creación de modelos para representar datos en la base de datos.
    ```python
    from django.db import models

    class MiModelo(models.Model):
        campo_texto = models.CharField(max_length=100)
        campo_fecha = models.DateField()
    ```

6. **Migraciones: **Crear y aplicar migraciones para actualizar la base de datos.
    ```bash
    python manage.py makemigrations
    python manage.py migrate
    ```

7. **Admin Interface: **Registrar modelos en el panel de administración.
    ```python
    from django.contrib import admin

    admin.site.register(MiModelo)
    ```

### 🌐 Vistas y Plantillas

8. **Vistas: **Definir vistas para manejar las solicitudes del usuario.
    ```python
    from django.shortcuts import render
    from django.http import HttpResponse

    def mi_vista(request):
        return HttpResponse("Hola, Django!")
    ```

9. **Plantillas: **Crear plantillas HTML y renderizarlas en las vistas.
    ```html
    <!-- mi_template.html -->
    <html>
    <head>
        <title>{{ titulo }}</title>
    </head>
    <body>
        <h1>{{ contenido }}</h1>
    </body>
    </html>
    ```

10. **URLs: **Configurar las URL para mapear a las vistas.
    ```python
    from django.urls import path
    from .views import mi_vista

    urlpatterns = [
        path('ruta/', mi_vista, name='nombre_vista'),
    ]
    ```

## Nivel Intermedio

### 🌐 Vistas y Plantillas (Continuación)

11. **Contexto en Vistas: **Enviar datos a las plantillas usando el contexto.
    ```python
    def mi_vista(request):
        contexto = {'titulo': 'Mi Página', 'contenido': 'Hola, Django!'}
        return render(request, 'mi_template.html', contexto)
    ```

12. **Formularios: **Crear y procesar formularios en Django.
    ```python
    from django import forms

    class MiFormulario(forms.Form):
        campo_texto = forms.CharField(max_length=100)
        campo_fecha = forms.DateField()
    ```

13. **Autenticación: **Manejar la autenticación de usuarios en Django.
    ```python
    from django.contrib.auth import login, authenticate
    from django.shortcuts import render, redirect

    def login_view(request):
        if request.method == 'POST':
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('dashboard')
    ```

### 🌐 Django ORM y QuerySets

14. **QuerySets: **Realizar consultas a la base de datos usando QuerySets.
    ```python
    # Obtener todos los objetos
    objetos = MiModelo.objects.all()

    # Filtrar objetos
    filtrados = MiModelo.objects.filter(campo_texto__icontains='ejemplo')

    # Ordenar objetos
    ordenados = MiModelo.objects.order_by('campo_fecha')
    ```

15. **Relaciones en Modelos: **Definir y trabajar con relaciones entre modelos.
    ```python
    class OtroModelo(models.Model):
        relacion = models.ForeignKey(MiModelo, on_delete=models.CASCADE)
    ```

16. **Manejo de Archivos: **Subir y manejar archivos en Django.
    ```python
    from django.core.files.storage import FileSystemStorage

    def manejar_archivo(request):
        if request.method == 'POST' and request.FILES['archivo']:
            archivo = request.FILES['archivo']
            fs = FileSystemStorage()
            fs.save(archivo.name, archivo)
    ```

## Nivel Avanzado

### 🌐 Middleware y Vistas Genéricas

17. **Middleware: **Extender la funcionalidad de Django usando middleware.
    - Crear un middleware: `middleware.py`
        ```python
        class MiMiddleware:
            def __init__(self, get_response):
                self.get_response = get_response

            def __call__(self, request):
                # Lógica antes de la vista
                response = self.get_response(request)
                # Lógica después de la vista
                return response
        ```

18. **Vistas Genéricas: **Usar vistas genéricas para simplificar la creación de vistas.
    - Ejemplo de una vista basada en clase:
        ```python
        from django.views.generic import ListView
        from .models import MiModelo

        class ListaObjetos(ListView):
            model = MiModelo
            template_name = 'lista_objetos.html'
            context_object_name = 'objetos'
        ```

### 🌐 Django REST Framework

19. **Django REST Framework: **Crear APIs utilizando Django REST Framework.
    - Instalación:
        ```bash
        pip install djangorestframework
        ```

    - Ejemplo de vista de API:
        ```python
        from rest_framework.views import APIView
        from rest_framework.response import Response
        from rest_framework import status

        class MiVistaAPI(APIView):
            def get(self, request):
                datos = {'mensaje': 'Hola desde la API'}
                return Response(datos, status=status.HTTP_200_OK)
        ```

20. **Serializadores: **Convertir objetos complejos en tipos de datos nativos para facilitar su representación.
    ```python
    from rest_framework import serializers

    class MiModeloSerializer(serializers.ModelSerializer):
        class Meta:
            model = MiModelo
            fields = '__all__'
    ```


