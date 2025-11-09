#!/bin/bash

# Actualizar paquetes
sudo apt update && sudo apt upgrade -y

# Instalar python3, pip y venv si no están
sudo apt install python3 python3-venv python3-pip unzip curl -y

# Crear entorno virtual
python3 -m venv ~/fastapi_app/venv

# Activar entorno
source ~/fastapi_app/venv/bin/activate

# Clonar repo de GitHub
git clone https://github.com/CardozoEIA/PracticaSO.git ~/fastapi_app

# Ir a la carpeta del proyecto
cd ~/fastapi_app

# Instalar dependencias
pip install --upgrade pip
pip install -r requirements.txt

# Crear servicio systemd
sudo cp fastapi.srv /etc/systemd/system/fastapi.service
sudo systemctl daemon-reload
sudo systemctl enable fastapi
sudo systemctl start fastapi

# Verificar estado
sudo systemctl status fastapi
