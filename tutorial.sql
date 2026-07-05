UPDATE tutoriales SET
descripcion = 'Antes de crear una API con FastAPI es importante preparar una carpeta de trabajo organizada. En este nivel crearás la estructura inicial del proyecto y generarás un entorno virtual para instalar las dependencias de forma aislada.',
reto = 'Crea una carpeta llamada mi_api_fastapi y dentro genera un entorno virtual para el proyecto.',
pista = 'Desde la terminal usa mkdir mi_api_fastapi, entra a la carpeta con cd mi_api_fastapi y ejecuta python -m venv venv.',
prueba = 'Verifica que dentro de la carpeta del proyecto aparezca una carpeta llamada venv. Esa carpeta confirma que el entorno virtual fue creado correctamente.'
WHERE orden = 1;

UPDATE tutoriales SET
descripcion = 'El entorno virtual permite trabajar con las librerías necesarias del proyecto sin afectar otras instalaciones de Python. Antes de instalar FastAPI o cualquier dependencia, debes activarlo desde la terminal.',
reto = 'Activa el entorno virtual antes de instalar las librerías del proyecto.',
pista = 'En Windows usa venv\\Scripts\\activate. En Linux o Mac usa source venv/bin/activate.',
prueba = 'Si el entorno se activó correctamente, la terminal mostrará (venv) al inicio de la línea de comandos.'
WHERE orden = 2;

UPDATE tutoriales SET
descripcion = 'FastAPI será el framework encargado de crear la API y Uvicorn será el servidor que ejecutará la aplicación. Ambas herramientas son necesarias para iniciar el desarrollo del backend.',
reto = 'Instala FastAPI y Uvicorn dentro del entorno virtual activado.',
pista = 'Asegúrate de ver (venv) en la terminal antes de ejecutar pip install fastapi uvicorn.',
prueba = 'Ejecuta pip list y verifica que aparezcan fastapi y uvicorn entre las librerías instaladas.'
WHERE orden = 3;

UPDATE tutoriales SET
descripcion = 'El archivo main.py será el archivo principal de la aplicación. Para este ejemplo básico se crea en la raíz del proyecto; en proyectos más grandes normalmente se coloca dentro de una carpeta llamada app.',
reto = 'Crea el archivo main.py en la raíz del proyecto.',
pista = 'Puedes crearlo desde Visual Studio Code o con el comando type nul > main.py en Windows.',
prueba = 'Verifica que el archivo main.py esté dentro de la carpeta principal del proyecto, al mismo nivel que la carpeta venv.'
WHERE orden = 4;

UPDATE tutoriales SET
descripcion = 'En main.py se crea la instancia principal de FastAPI y se definen las rutas de la aplicación. En proyectos pequeños las rutas pueden estar directamente en este archivo; en proyectos grandes se suelen separar en routers dentro de la carpeta app.',
reto = 'Crea tu primera aplicación FastAPI y define una ruta principal.',
pista = 'Importa FastAPI, crea app = FastAPI() y utiliza @app.get("/") para definir la ruta inicial.',
prueba = 'Después de ejecutar el servidor, abre http://127.0.0.1:8000. Debes ver una respuesta JSON con el mensaje configurado.'
WHERE orden = 5;

UPDATE tutoriales SET
descripcion = 'Uvicorn permite levantar el servidor de desarrollo para ejecutar la aplicación FastAPI. Al usar --reload, el servidor se reinicia automáticamente cuando detecta cambios en el código.',
reto = 'Ejecuta el servidor con Uvicorn para probar tu primera API.',
pista = 'Usa uvicorn main:app --reload si main.py está en la raíz del proyecto.',
prueba = 'Si todo está correcto, la terminal mostrará Application startup complete y podrás abrir http://127.0.0.1:8000 en el navegador.'
WHERE orden = 6;

UPDATE tutoriales SET
descripcion = 'FastAPI genera automáticamente documentación interactiva basada en OpenAPI. Desde /docs puedes visualizar todas las rutas, conocer qué datos reciben y probar los endpoints directamente desde el navegador sin usar Postman.',
reto = 'Abre la documentación automática de FastAPI y revisa la ruta creada.',
pista = 'Agrega /docs al final de la URL del servidor.',
prueba = 'Abre http://127.0.0.1:8000/docs. Debe aparecer Swagger UI mostrando los endpoints disponibles de tu API.'
WHERE orden = 7;

UPDATE tutoriales SET
descripcion = 'El método HTTP GET permite consultar información de una API sin modificar los datos almacenados. Es el método más utilizado para obtener listas o registros específicos. En este nivel crearás un endpoint GET que devolverá una lista de usuarios en formato JSON.',
reto = 'Crea una ruta GET llamada /usuarios que devuelva una lista de usuarios.',
pista = 'Utiliza @app.get("/usuarios") y retorna una lista de diccionarios.',
prueba = 'Ejecuta el servidor y abre http://127.0.0.1:8000/usuarios. Debes ver una respuesta JSON con los usuarios Ana y Luis.'
WHERE orden = 8;

UPDATE tutoriales SET
descripcion = 'Los modelos de Pydantic permiten definir la estructura de los datos que recibirá la API. Para este ejemplo puedes crear el modelo en main.py, aunque en proyectos más grandes se recomienda crear un archivo separado llamado schemas.py dentro de la carpeta app.',
reto = 'Crea un modelo Usuario con nombre, correo y edad usando Pydantic.',
pista = 'Importa BaseModel desde pydantic y define los tipos de datos de cada campo.',
prueba = 'Desde la documentación en /docs, si envías datos incompletos o incorrectos, FastAPI mostrará automáticamente un error de validación.'
WHERE orden = 9;

UPDATE tutoriales SET
descripcion = 'El método POST se utiliza para enviar información al servidor y crear nuevos registros. En este nivel recibirás datos usando el modelo de Pydantic y los guardarás temporalmente en una lista.',
reto = 'Crea un endpoint POST que reciba un usuario y lo agregue a una lista.',
pista = 'Usa @app.post("/usuarios") y recibe un parámetro de tipo Usuario.',
prueba = 'Desde la documentación automática en /docs, busca POST /usuarios, presiona Try it out, escribe un usuario en JSON y ejecuta la petición.'
WHERE orden = 10;

UPDATE tutoriales SET
descripcion = 'Los parámetros de ruta permiten recibir valores directamente desde la URL. Son útiles para buscar registros específicos, como un usuario por su identificador.',
reto = 'Crea una ruta que reciba un id desde la URL.',
pista = 'Usa una ruta como /usuarios/{id} y declara el parámetro id como entero.',
prueba = 'Abre http://127.0.0.1:8000/usuarios/1. La API debe responder con el id enviado en la URL.'
WHERE orden = 11;

UPDATE tutoriales SET
descripcion = 'El método PUT se utiliza para actualizar información existente. Normalmente combina un identificador en la URL con nuevos datos enviados en el cuerpo de la petición. Puedes probarlo desde la documentación automática de FastAPI.',
reto = 'Crea una ruta PUT para actualizar un usuario existente.',
pista = 'Usa @app.put("/usuarios/{id}") y recibe tanto el id como un objeto Usuario.',
prueba = 'Desde /docs prueba PUT /usuarios/{id}. Coloca un id, escribe datos nuevos en JSON y ejecuta la petición desde la documentación.'
WHERE orden = 12;

UPDATE tutoriales SET
descripcion = 'El método DELETE permite eliminar información del servidor. En una API real, este endpoint eliminaría un registro de la base de datos usando su identificador.',
reto = 'Crea una ruta DELETE que reciba el id del usuario a eliminar.',
pista = 'Usa @app.delete("/usuarios/{id}") y retorna un mensaje de confirmación.',
prueba = 'Desde /docs prueba DELETE /usuarios/{id}. Coloca un id y verifica que la API responda con un mensaje de eliminación.'
WHERE orden = 13;

UPDATE tutoriales SET
descripcion = 'Para conectar FastAPI con PostgreSQL necesitas instalar SQLAlchemy y el driver de PostgreSQL. Antes de ejecutar el comando, asegúrate de tener activado el entorno virtual para que las dependencias se instalen solo en este proyecto.',
reto = 'Instala las dependencias necesarias para trabajar con PostgreSQL desde FastAPI.',
pista = 'Activa el entorno virtual y después ejecuta pip install sqlalchemy psycopg2-binary python-dotenv.',
prueba = 'Ejecuta pip list y confirma que aparezcan sqlalchemy, psycopg2-binary y python-dotenv.'
WHERE orden = 14;

UPDATE tutoriales SET
descripcion = 'Antes de configurar la conexión debes tener una base de datos creada en PostgreSQL. Luego crea un archivo llamado database.py dentro de la carpeta app o en la raíz del proyecto, según tu estructura. Los datos de conexión deben coincidir con el nombre de la base de datos, usuario, contraseña y puerto configurados en PostgreSQL.',
reto = 'Crea el archivo database.py y configura la conexión a PostgreSQL con SQLAlchemy.',
pista = 'Verifica que DATABASE_URL tenga el usuario, contraseña, host, puerto y nombre de base correctos.',
prueba = 'Si la base de datos existe y los datos de conexión son correctos, FastAPI iniciará sin errores de conexión.'
WHERE orden = 15;

UPDATE tutoriales SET
descripcion = 'Los modelos de SQLAlchemy representan tablas de la base de datos. Crea un archivo llamado models.py dentro de la carpeta app o junto a database.py. En este archivo definirás las clases que se convertirán en tablas.',
reto = 'Crea el archivo models.py y define el modelo UsuarioDB.',
pista = 'Importa Column, Integer y String desde sqlalchemy, y Base desde database.py.',
prueba = 'Revisa que el nombre de la tabla en __tablename__ coincida con la tabla que quieres crear o utilizar en PostgreSQL.'
WHERE orden = 16;

UPDATE tutoriales SET
descripcion = 'SQLAlchemy puede crear las tablas definidas en models.py utilizando Base.metadata.create_all. Esta instrucción normalmente se coloca al inicio de la aplicación para asegurar que las tablas existan.',
reto = 'Configura la creación automática de tablas desde SQLAlchemy.',
pista = 'Importa engine desde database.py y Base desde models.py o database.py según tu estructura.',
prueba = 'Ejecuta el proyecto y revisa PostgreSQL con \\dt dentro de psql. Debe aparecer la tabla usuarios si todo fue configurado correctamente.'
WHERE orden = 17;

UPDATE tutoriales SET
descripcion = 'La función get_db administra las sesiones con la base de datos. Su objetivo es abrir una conexión cuando inicia una petición y cerrarla al terminar, evitando conexiones abiertas innecesariamente.',
reto = 'Crea la función get_db para manejar sesiones de SQLAlchemy.',
pista = 'La función debe crear una sesión con SessionLocal(), usar yield db y cerrar la conexión en finally.',
prueba = 'Para probarlo, utiliza Depends(get_db) en un endpoint. Si el servidor inicia sin errores y el endpoint puede usar db, significa que la sesión se está inyectando correctamente.'
WHERE orden = 18;

UPDATE tutoriales SET
descripcion = 'Ahora el endpoint POST dejará de guardar datos en una lista temporal y comenzará a almacenarlos en PostgreSQL. Para lograrlo debes importar get_db desde database.py y UsuarioDB desde models.py.',
reto = 'Modifica el endpoint POST para guardar usuarios en PostgreSQL.',
pista = 'Importa Depends, Session, get_db y UsuarioDB. Luego usa db.add(), db.commit() y db.refresh().',
prueba = 'Desde /docs ejecuta POST /usuarios con un JSON válido. Después revisa PostgreSQL o ejecuta GET /usuarios para confirmar que el registro fue guardado.'
WHERE orden = 19;

UPDATE tutoriales SET
descripcion = 'En este nivel reemplazarás el endpoint GET que devolvía una lista en memoria por una consulta real a PostgreSQL. De esta forma, los usuarios mostrados vendrán directamente desde la base de datos.',
reto = 'Reemplaza el endpoint GET /usuarios para consultar los registros desde PostgreSQL.',
pista = 'Usa db.query(UsuarioDB).all() dentro del endpoint y recibe db con Depends(get_db).',
prueba = 'Reemplaza el código anterior de GET /usuarios por este nuevo endpoint. Luego abre http://127.0.0.1:8000/usuarios y verifica que aparezcan los registros almacenados en PostgreSQL.'
WHERE orden = 20;

UPDATE tutoriales SET
descripcion = 'Al finalizar tendrás una API REST funcional con FastAPI capaz de crear, consultar, actualizar y eliminar información conectada a PostgreSQL. También podrás probar todos los endpoints desde la documentación automática.',
reto = 'Ejecuta el proyecto final y prueba el flujo completo de la API.',
pista = 'Abre /docs y prueba los métodos GET, POST, PUT y DELETE en orden.',
prueba = 'Desde la documentación automática crea un usuario con POST, consulta con GET, actualiza con PUT y elimina con DELETE. Si todo funciona, tu API REST está completa.'
WHERE orden = 21;