#!/bin/bash

#Limpiar consola
clear

# Solicitar subdominio
echo -e "\e[32mSubdominio: \e[0m"
read SUBDOMINIO

# Confirmar subdominio ingresado
echo -e "\nPor favor confirma que el subdominio que ingresaste es correcto"
echo -e "Subdominio: \e[32m$SUBDOMINIO\e[0m"

read -p "¿El subdominio ingresado es correcto? (S/N): " CONFIRMAR

while [[ "$CONFIRMAR" != "S" && "$CONFIRMAR" != "s" ]]; do
  clear
  echo -e "\e[32mSubdominio: \e[0m"
  read SUBDOMINIO

  # Confirmar subdominio ingresado
  echo -e "\nPor favor confirma que el subdominio que ingresaste es correcto"
  echo -e "Subdominio: \e[32m$SUBDOMINIO\e[0m"
  
  read -p "¿El subdominio ingresado es correcto? (S/N): " CONFIRMAR
done

# Limpiar consola
clear

# Preparar ambiente del VPS 
echo -e "\033[1;32m 1/5 Preparando VPS... \033[0m"
sudo apt-get -yqqq update >/dev/null 2>&1
sudo apt-get -yqqqq install sudo curl nano zip htop unzip wget >/dev/null 2>&1
sudo apt-get -yqqq clean >/dev/null 2>&1
sudo apt-get -yqqq autoclean >/dev/null 2>&1
sudo rm -rf /var/cache/apk/*
sudo apt -yqqq autoremove --purge snapd >/dev/null 2>&1
sudo ufw allow 80/tcp comment 'accept HTTP caddy port' >/dev/null 2>&1
sudo ufw allow 443/tcp comment 'accept HTTPS caddy port' >/dev/null 2>&1
clear

#Instalar Docker 
echo -e "\033[1;32m 2/5 Instalando Docker... \033[0m"
sudo curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh 2>dev>null;
sudo docker network create --driver bridge caddy;
sudo service docker start 2>dev>null;
sudo systemctl start docker 2>dev>null;
clear

#Instalar Caddy
echo -e "\033[1;32m 3/5 Instalando Caddy... \033[0m"
sudo docker run -d \
  --name caddy \
  --network caddy \
  -p 80:80 \
  -p 443:443 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v caddy_data:/data \
  --restart unless-stopped \
  -e CADDY_INGRESS_NETWORKS=caddy \
  lucaslorentz/caddy-docker-proxy
clear

# Instalar Portainer
echo -e "\033[1;32m 4/5 Instalando Portainer... \033[0m"
sudo docker run -d \
  --name portainer \
  --restart always \
  -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  --network=caddy \
  --label caddy=$SUBDOMINIO \
  --label caddy.reverse_proxy="{{upstreams 9000}}" \
  portainer/portainer-ce:latest
clear

  
#Esperar que se active portainer
echo -e "\033[1;32m 5/5 Finalizando instalación... \033[0m"
sleep 15
clear

#Mostrar mensaje final

echo -e "\n\033[1;31m==============================================\033[0m"
echo -e "\033[1;32m|           La preparación está OK!          |\033[0m"
echo -e "\033[1;31m==============================================\033[0m\n"
echo -e "\033[1;33m Accede a Portainer desde: \033[0m\e[32m$SUBDOMINIO\e[0m\n"