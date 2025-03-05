# Makefile para crear proyectos Python con la estructura especificada

# Parámetro: Si no se pasa nombre de proyecto, se usará 'new_project_default'
PROJECT_NAME := $(if $(PROJECT),$(PROJECT),)

# Verificar si no se ha proporcionado un nombre para el proyecto
create_project:
	@if [ -z "$(PROJECT_NAME)" ]; then \
		echo "ERROR: Debes proporcionar un nombre para el proyecto."; \
		echo "Si deseas crear un proyecto con un nombre por defecto, usa la orden 'make all'"; \
		exit 1; \
	fi

	@echo ""
	@echo "****************************************************"
	@echo "---> Creando proyecto: $(PROJECT_NAME)  <---"
	@echo "****************************************************"
	mkdir -p $(PROJECT_NAME)/downloads
	mkdir -p $(PROJECT_NAME)/src/modulos
	touch $(PROJECT_NAME)/README.md
	touch $(PROJECT_NAME)/requirements.txt
	touch $(PROJECT_NAME)/src/main.py
	touch $(PROJECT_NAME)/src/modulos/modulos_importados_en_main.txt
	@echo "Estructura de proyecto creada en $(PROJECT_NAME)/"
	@echo "------------------------------------------------------------------------"
	@echo "Pasos a seguir para completar la configuración del proyecto:"
	@echo "------------------------------------------------------------------------"
	@echo "| 1. Cambia al directorio del proyecto: cd $(PROJECT_NAME)"
	@echo "| 2. Ejecuta: make create_venv"
	@echo "|        Esto creará el entorno virtual."
	@echo "| 3. Ejecuta: make install_deps"
	@echo "|         Esto instalará las dependencias de tu proyecto."
	@echo "| 4. Finalmente, ejecuta tu proyecto con: make run"
	@echo "|"
	@echo "| ¡Listo! Ahora puedes comenzar a desarrollar y ejecutar el proyecto."
	@echo "------------------------------------------------------------------------"

# Crear entorno virtual
create_venv:
	python3 -m venv $(PROJECT_NAME)/venv
	@echo "Entorno virtual creado en $(PROJECT_NAME)/venv"
	@echo "¡Éxito! Ahora puedes instalar las dependencias."
	@echo ""

# Instalar dependencias (se asume que tienes un archivo requirements.txt)
install_deps:
	@echo "Instalando dependencias..."
	$(PROJECT_NAME)/venv/bin/pip install -r $(PROJECT_NAME)/requirements.txt
	@echo "Dependencias instaladas con éxito."

# Ejecutar el proyecto
run:
	@echo "Ejecutando el proyecto..."
	$(PROJECT_NAME)/venv/bin/python $(PROJECT_NAME)/src/main.py

# Eliminar el proyecto y entorno virtual (para limpieza)
clean:
	rm -rf $(PROJECT_NAME)
	@echo "Proyecto y entorno virtual eliminados"

# Acción por defecto: Crear la estructura y entorno virtual con nombre por defecto
all: 
	@echo "No se proporcionó un nombre para el proyecto.... Se asignó uno por defecto!"
	@echo "Creando un nuevo proyecto con nombre 'new_project_default'."
	$(MAKE) create_project PROJECT=new_project_default
	$(MAKE) create_venv
	@echo "Proyecto creado con éxito. ¡Listo para empezar!"
