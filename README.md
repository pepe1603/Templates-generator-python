### Proyecto de Plantilla Python ###

Este proyecto permite crear proyectos Python estructurados con un entorno virtual y una estructura básica. Usa make para gestionar las tareas del proyecto.

Estructura del Proyecto

# Cada proyecto creado tendrá esta estructura:

<nombre_del_proyecto>/
├── downloads/
├── README.md
├── requirements.txt
└── src/
    ├── main.py
    └── modulos/
        └── modulos_importados_en_main.txt

# Comandos Disponibles

1. Crear un proyecto

Crea una nueva estructura de proyecto con un nombre personalizado.

make create_project PROJECT=<nombre_del_proyecto>

Si no se proporciona un nombre, se usará new_project_default.

2. Crear entorno virtual

Crea un entorno virtual para el proyecto.

make create_venv

3. Instalar dependencias

Instala las dependencias desde el archivo requirements.txt.

make install_deps

4. Ejecutar el proyecto

Ejecuta el archivo main.py dentro del entorno virtual.

make run

5. Limpiar proyecto

Elimina el proyecto y su entorno virtual.

make clean

6. Acción por defecto

Si no se proporciona un nombre, se crea un proyecto con new_project_default y lo configura.

make all

# Flujo Completo

make create_project PROJECT=mi_nuevo_proyecto
make create_venv
make install_deps
make run
make clean

# Notas

Asegúrate de tener Python 3, pip y make instalados.

make es necesario para ejecutar los comandos.