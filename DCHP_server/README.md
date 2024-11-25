
# Servidor DCHP

Aquí se encuentran en términos generales la configuraciones que tiene que tener el servidor DCHP de la empresa.

Actualmente se usa el router de la empresa para ese fin.


## Indice

- Configuración de DNS
- Configuración de IP estática
- Puertos expuestos
- Reservación de direcciones


## Configuración

#### DNS

Por motivos a bloqueos nacionales o internacionales se usaran dos DNS poniendo como primario siempre el DNS internacional.

Esto permite acceder a paginas externas e internas en Venezuela, incluyendo aquellas con certificados vencidos o inseguros.

| Primario | Secundario   |
| :------- | :----------- |
| 1.1.1.1  | 200.35.79.41 |

#### IP estática

Oficina 1 tiene contratado por Netuno un internet con ip estático esto significa que puede servir para propósitos generales, las configuraciones son las siguientes

| Tipo de conexión | Dirección ip | Sub mascara  | Puerta de enlace |
| :--------------- | :----------  | :----------- | :--------------- |
| Estático         | 190.6.52.13  | 255.255.255.0| 190.6.52.1       |

#### Puertos expuesto
La dirección ip del servidor local esta actualmente en 192.168.3.126 agradecemos cambiar si es necesario, es necesario de que esta ip sea estática.

La dirección ip 192.168.3.101 está reservada para el cata huellas.

| Dirección IP   | Puerto | Puerto | Protocolo | Descripción           | Servicio          |
| -------------- | ------ | ------ | --------- | --------------------- | ----------------- |
| 192.168.3.126  | 80     | 80     | TCP       | HTTP                  | HTTP              |
| 192.168.3.126  | 443    | 443    | TCP       | HTTP                  | HTTP              |
| 192.168.3.126  | 22     | 22     | All       | SSH                   | SSH               |
| 192.168.3.126  | 9000   | 9000   | TCP       | Portainer             | Portainer         |
| 192.168.3.101  | 8000   | 8000   | TCP       | IVMS Catahuellas      | IVMS Catahuellas  |
| 192.168.3.126  | 21114  | 21114  | TCP       | Rust server port      | Rust 21114        |
| 192.168.3.126  | 21115  | 21115  | TCP       | Rust server port      | Rust 21115        |
| 192.168.3.126  | 21116  | 21116  | All       | Rust server port      | Rust 21116        |
| 192.168.3.126  | 21117  | 21117  | TCP       | Rust server port      | Rust 21117        |
| 192.168.3.126  | 21118  | 21118  | TCP       | Rust server port      | Rust 21118        |
| 192.168.3.126  | 21119  | 21119  | TCP       | Rust server port      | Rust 21119        |
| 192.168.3.126  | 5432   | 5432   | TCP       | PostgreSQL database   | PostgreSQL        |
| 192.168.3.126  | 4222   | 4222   | TCP       | NATS messaging system | NATS              |
| 192.168.3.126  | 31000  | 31000  | TCP       | HMDM Messaging        | HeadWind          |
| 192.168.3.126  | 1688   | 1688   | TCP       | KMS activation        | Py-kms            |


### Reservación de direcciones ip

Para correr los servicios adecuadamente reservamos direcciones ip a estos dispositivos.

| Nombre del Servidor | Dirección MAC       | Dirección IP   |
| ------------------- | ------------------- | -------------- |
| ubuntu-server       | 18-66-DA-15-8A-1F   | 192.168.3.126  |
| Cata huellas        | 98-DF-82-84-DA-AD   | 192.168.3.101  |


