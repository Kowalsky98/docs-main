# Backend Indexa

Este proyecto fue construido a fin de responder a la necesidad del manejo de activos fijos para Gana loterías.

## Tecnologías usadas

La base de todo el backend son estas dos tecnologías

- [Express.js 4](https://expressjs.com/es/4x/api.html)
- [Sequelize 6](https://sequelize.org/docs/v6/)

## Ejecuta el proyecto

```bash
  npm install
```

```bash
  npm run start
```

## Estructura de carpeta

```
└── 📁api
    └── 📁src
        └── 📁controllers
        └── 📁db
            └── 📁migrations
            └── 📁models
            └── 📁seeders
            └── config.js
        └── 📁helpers
        └── 📁libs
        └── 📁middlewares
        └── 📁models-factories
        └── 📁routes
        └── 📁schemas
        └── 📁services
        └── 📁utils
            └── 📁auth
                └── 📁strategies
            └── 📁roles
        └── config.js
        └── index.js
    └── 📁test
    └── .env-example
    └── .gitignore
    └── .sequelizerc
    └── jsconfig.json
    └── package-lock.json
    └── package.json
    └── yarn.lock
```

# Descripción de la Estructura del Proyecto

- **📁api**: Carpeta raíz del proyecto que contiene todo el código fuente y la configuración del backend.

  - **📁src**: Directorio principal que alberga el código fuente de la aplicación.

    - **📁controllers**: Contiene los controladores que gestionan la lógica de negocio para las diferentes rutas y peticiones de la API.

    - **📁db**: Directorio relacionado con la base de datos.

      - **📁migrations**: Archivos de migraciones que definen cambios incrementales en la estructura de la base de datos.

      - **📁models**: Modelos que representan las entidades de la base de datos y definen su estructura y relaciones.

      - **📁seeders**: Scripts utilizados para pre-poblar la base de datos con datos iniciales.

      - **config.js**: Archivo de configuración para la base de datos, Utilizado para definir incializar los modelos, relaciones de bases de datos y las configuraciones de Sequelize.

    - **📁helpers**: Funciones de ayuda o utilidades que son utilizadas en diferentes partes de la aplicación para tareas comunes o repetitivas.

    - **📁libs**: Conexión de bases de datos de sequelize centralizadas aquí.

    - **📁middlewares**: Middleware que se ejecuta durante el ciclo de vida de las peticiones HTTP. Estos se utilizan para validar, transformar o autenticar peticiones antes de que lleguen a los controladores.

    - **📁models-factories**: Fábricas para crear instancias de modelos, usadas para romper reactivada y reducir duplicidad en el código.

    - **📁routes**: Define las rutas de la API y asigna controladores específicos a cada ruta.

    - **📁schemas**: Esquemas de validación, usando Joi, para asegurar que los datos de las peticiones sean válidos antes de procesarlos.

    - **📁services**: Contiene la lógica de negocio que se puede reutilizar a lo largo de diferentes controladores, como la gestión de usuarios o la comunicación con servicios externos.

    - **📁utils**: Utilidades generales para la aplicación que no encajan específicamente en otros directorios.

      - **📁auth**: Relacionado con la autenticación de usuarios.

        - **📁strategies**: Estrategias de autenticación (por ejemplo, JWT, OAuth).

      - **📁roles**: Gestión de roles y permisos dentro de la aplicación.

    - **config.js**: Archivo de configuración general para la aplicación.

    - **index.js**: Punto de entrada principal de la aplicación donde se inicia el servidor y se configuran las rutas y middlewares.

  - **📁test**: Directorio destinado a las pruebas unitarias, de integración o funcionales para garantizar la calidad y fiabilidad del código.

  - **.env-example**: Ejemplo de archivo de configuración de entorno que muestra las variables de entorno necesarias para ejecutar la aplicación.

  - **.gitignore**: Archivo que especifica qué archivos o directorios deben ser ignorados por Git para evitar su inclusión en el control de versiones.

  - **.sequelizerc**: Archivo de configuración para Sequelize, el cual puede especificar rutas personalizadas para modelos, migraciones y seeders.

  - **jsconfig.json**: Archivo de configuración para JavaScript que permite definir opciones de compilación, rutas, y otras configuraciones específicas del editor.

  - **package-lock.json**: Archivo que contiene una lista detallada de las versiones exactas de las dependencias instaladas, asegurando consistencia en las instalaciones futuras.

  - **package.json**: Archivo principal de configuración del proyecto Node.js que lista las dependencias, scripts, y metadatos de la aplicación.

  - **yarn.lock**: Similar a `package-lock.json`, pero específico para el gestor de paquetes Yarn, asegurando versiones consistentes de las dependencias.

## Referencia de la API

Todos los endpoints son precedidos por la versión a fecha la ultima versión es la 4.

ejemplo:

```http
  https://miapi.com/v4/auth/login
```

### Resources and endpoints

| Resource             | Methods            | Endpoints                                |
| :------------------- | :----------------- | :--------------------------------------- |
| `Auth`               | POST               | [/auth/login]()                          |
|                      | POST               | [/auth/check]()                          |
|                      | POST               | [/auth/recovery]()                       |
|                      | POST               | [/auth/change-password]()                |
|                      | POST               | [/auth/sign-up]()                        |
| `Assets`             | GET, POST          | [/assets]()                              |
|                      | POST               | [/assets/import]()                       |
|                      | GET                | [/assets/tag]()                          |
|                      | GET                | [/assets/excel]()                        |
|                      | GET, PATCH, DELETE | [/assets/:id]()                          |
|                      | GET                | [/assets/:id/logs]()                     |
|                      | GET                | [/assets/:id/geo]()                      |
|                      | GET                | [/assets/:id/movements]()                |
|                      | GET                | [/assets/:id/maintenances]()             |
|                      | GET, PATCH, DELETE | [/assets/:id/specifications]()           |
|                      | GET, PATCH         | [/assets/:id/specifications]()           |
|                      | PATCH              | [/assets/:id/restore]()                  |
| `Models`             | GET, POST          | [/models]()                              |
|                      | POST               | [/models/import]()                       |
|                      | GET, PATCH, DELETE | [/models/:id]()                          |
|                      | PATCH              | [/models/:id/restore]()                  |
| `Brands`             | GET, POST          | [/brands]()                              |
|                      | POST               | [/brands/import]()                       |
|                      | GET, PATCH, DELETE | [/brands/:id]()                          |
|                      | PATCH              | [/brands/:id/restore]()                  |
| `Categories`         | GET, POST          | [/categories]()                          |
|                      | POST               | [/categories/import]()                   |
|                      | GET, PATCH, DELETE | [/categories/:id]()                      |
|                      | PATCH              | [/categories/:id/restore]()              |
| `Specifications`     | GET, POST          | [/categories/specifications]()           |
|                      | GET, PATCH, DELETE | [/categories/specifications/:id]()       |
| `Maintenances`       | GET, POST          | [/maintenances]()                        |
|                      | PATCH              | [/maintenances/:id]()                    |
| `Maintenances types` | GET, POST          | [/maintenances/types]()                  |
|                      | GET, PATCH, DELETE | [/maintenances/types/:id]()              |
| `Geo location`       | GET, POST          | [/geolocation]()                         |
| `Products`           | GET, POST          | [/products]()                            |
|                      | GET, PATCH, DELETE | [/products/:id]()                        |
| `Consumables`        | GET, POST          | [/consumables]()                         |
|                      | GET, PATCH, DELETE | [/consumables/:id]()                     |
|                      | GET                | [/consumables/:id/products]()            |
|                      | GET                | [/consumables/:id/movements]()           |
|                      | PATH               | [/consumables/:id/products/:productId]() |
|                      | POST               | [/consumables/:id/checking]()            |
|                      | POST               | [/consumables/:id/checkout]()            |
| `Paths`              | GET, POST          | [/paths]()                               |
|                      | GET, PATCH, DELETE | [/paths/:id]()                           |
| `Roles`              | GET, POST          | [/roles]()                               |
|                      | GET, PATCH, DELETE | [/roles/:id]()                           |
| `Orders`             | GET                | [/orders]()                              |
|                      | GET                | [/orders/:id]()                          |
|                      | POST               | [/orders/checkout]()                     |
|                      | POST               | [/orders/checking]()                     |
| `Locations`          | GET, POST          | [/locations]()                           |
|                      | POST               | [/locations/import]()                    |
|                      | GET, PATCH, DELETE | [/locations/:id]()                       |
|                      | GET                | [/locations/:id/assets]()                |
|                      | PATCH              | [/locations/:id/restore]()               |
| `Location types`     | GET, POST          | [/locations/types]()                     |
|                      | GET, PATCH, DELETE | [/locations/types/:id]()                 |
| `Location zones`     | GET, POST          | [/locations/zones]()                     |
|                      | GET, PATCH, DELETE | [/locations/zones/:id]()                 |
| `Groups`             | GET, POST          | [/groups]()                              |
|                      | GET                | [/groups/locations]()                    |
|                      | POST               | [/groups/import]()                       |
|                      | GET, PATCH, DELETE | [/groups/:id]()                          |
|                      | PATCH              | [/groups/:id/restore]()                  |
| `Users`              | GET, POST          | [/users]()                               |
|                      | GET, PATCH, DELETE | [/users/:id]()                           |
| `Customers`          | GET, POST          | [/customers]()                           |
|                      | GET, PATCH, DELETE | [/customers/:id]()                       |
| `Roles`              | GET, POST          | [/roles]()                               |
|                      | GET, PATCH, DELETE | [/roles/:id]()                           |
