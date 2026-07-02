DROP TABLE IF EXISTS tutoriales CASCADE;
DROP TABLE IF EXISTS categorias_tutorial CASCADE;
DROP TABLE IF EXISTS tecnologias CASCADE;
DROP TABLE IF EXISTS personas CASCADE;
DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS inicio CASCADE;
DROP TABLE IF EXISTS estadisticas CASCADE;
DROP TABLE IF EXISTS secciones_fastapi CASCADE;
DROP TABLE IF EXISTS secciones_inicio CASCADE;
DROP TABLE IF EXISTS arquitectura_inicio CASCADE;
DROP TABLE IF EXISTS secciones_tutorial_info CASCADE;
DROP TABLE IF EXISTS footer CASCADE;

CREATE TABLE menu(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ruta VARCHAR(100) NOT NULL,
    orden INTEGER NOT NULL
);

CREATE TABLE inicio(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    subtitulo VARCHAR(255),
    descripcion TEXT,
    boton_principal VARCHAR(100),
    boton_secundario VARCHAR(100)
);

CREATE TABLE estadisticas(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    valor VARCHAR(50)
);

CREATE TABLE tecnologias(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    icono VARCHAR(100)
);

CREATE TABLE secciones_inicio(
    id SERIAL PRIMARY KEY,
    clave VARCHAR(100) UNIQUE NOT NULL,
    titulo VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE arquitectura_inicio(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    icono VARCHAR(100),
    orden INTEGER
);

CREATE TABLE secciones_fastapi(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    contenido TEXT,
    icono VARCHAR(100),
    orden INTEGER
);

CREATE TABLE categorias_tutorial(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE tutoriales(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    descripcion TEXT,
    codigo TEXT,
    orden INTEGER,
    categoria_id INTEGER NOT NULL REFERENCES categorias_tutorial(id),
    reto TEXT,
    pista TEXT,
    recompensa VARCHAR(150),
    prueba TEXT
);

CREATE TABLE secciones_tutorial_info(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE personas(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    edad INTEGER,
    correo VARCHAR(150),
    ciudad VARCHAR(100)
);

CREATE TABLE footer(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255),
    descripcion TEXT
);

INSERT INTO menu(nombre,ruta,orden) VALUES
('Inicio','/',1),
('FastAPI','/fastapi',2),
('Tutorial','/tutorial',3),
('Laboratorio','/laboratorio',4);

INSERT INTO inicio(titulo,subtitulo,descripcion,boton_principal,boton_secundario) VALUES
(
'Aprende FastAPI desde cero',
'Framework moderno para crear APIs con Python',
'Esta plataforma enseña FastAPI mediante teoría, ejemplos prácticos y un laboratorio conectado a PostgreSQL.',
'Comenzar Tutorial',
'Probar la API'
);

INSERT INTO estadisticas(titulo,valor) VALUES
('Módulos','21'),
('Tecnologías','6'),
('CRUD','1'),
('Proyecto','100%');

INSERT INTO tecnologias(nombre,descripcion,icono) VALUES
('Python','Lenguaje principal utilizado para desarrollar aplicaciones con FastAPI.','bi bi-filetype-py'),
('FastAPI','Framework moderno para construir APIs rápidas con Python.','bi bi-lightning-charge-fill'),
('PostgreSQL','Base de datos relacional utilizada para almacenar la información del proyecto.','bi bi-database-fill'),
('SQLAlchemy','ORM utilizado para conectar FastAPI con PostgreSQL.','bi bi-diagram-3-fill'),
('Bootstrap 5','Framework CSS utilizado para crear una interfaz responsiva.','bi bi-bootstrap-fill'),
('Jinja2','Motor de plantillas usado para mostrar datos dinámicos en HTML.','bi bi-file-code-fill');

INSERT INTO secciones_inicio(clave,titulo,descripcion) VALUES
('tecnologias','Tecnologías utilizadas','Herramientas utilizadas para desarrollar este proyecto.'),
('arquitectura','Flujo de una API','Visualiza el recorrido de una solicitud desde el cliente hasta PostgreSQL utilizando FastAPI.');

INSERT INTO arquitectura_inicio(nombre,icono,orden) VALUES
('Usuario','bi bi-person-circle',1),
('Página Web','bi bi-window',2),
('FastAPI','bi bi-lightning-charge-fill',3),
('PostgreSQL','bi bi-database-fill',4),
('Respuesta JSON','bi bi-filetype-json',5);

INSERT INTO secciones_fastapi(titulo,contenido,icono,orden) VALUES
('¿Qué es FastAPI?','FastAPI es un framework moderno de Python para crear APIs REST de forma rápida, segura y eficiente. Permite construir servicios web que reciben peticiones, procesan información, consultan bases de datos y devuelven respuestas en formato JSON.','bi bi-lightning-charge-fill',1),
('¿Para qué sirve?','Sirve para desarrollar aplicaciones backend, APIs REST, microservicios, sistemas conectados a bases de datos, paneles administrativos, servicios para aplicaciones móviles y plataformas web modernas.','bi bi-question-circle-fill',2),
('¿Por qué es tan popular?','FastAPI combina velocidad, facilidad de uso y documentación automática. Gracias a Python, Pydantic y Starlette, permite escribir menos código, validar datos automáticamente y construir APIs profesionales en poco tiempo.','bi bi-stars',3),
('Características principales','Entre sus características destacan la validación automática de datos, soporte para programación asíncrona, documentación automática con Swagger y ReDoc, tipado moderno de Python, manejo de rutas HTTP y compatibilidad con bases de datos.','bi bi-list-check',4),
('Documentación automática','Una de sus ventajas más importantes es que genera documentación interactiva automáticamente. Al crear endpoints, FastAPI produce una interfaz en /docs donde se pueden probar las rutas GET, POST, PUT y DELETE.','bi bi-file-earmark-code-fill',5),
('Validación con Pydantic','FastAPI utiliza modelos de Pydantic para validar la información que recibe la API. Esto ayuda a evitar errores, controlar tipos de datos y asegurar que la información enviada por el usuario sea correcta.','bi bi-shield-check',6),
('Conexión con bases de datos','FastAPI puede conectarse con bases de datos como PostgreSQL, MySQL, SQLite o MongoDB. En este proyecto se utiliza PostgreSQL junto con SQLAlchemy para consultar, guardar, actualizar y eliminar información.','bi bi-database-fill',7),
('Métodos HTTP','FastAPI permite crear rutas usando métodos HTTP como GET para consultar información, POST para crear datos, PUT para actualizar registros y DELETE para eliminarlos.','bi bi-arrow-left-right',8),
('Comparación con Flask y Django','Flask es simple y flexible, Django es muy completo para aplicaciones grandes, mientras que FastAPI destaca especialmente en la creación de APIs rápidas, modernas y documentadas automáticamente.','bi bi-bar-chart-fill',9),
('Casos de uso reales','FastAPI se puede utilizar en aplicaciones empresariales, sistemas escolares, tiendas en línea, servicios de autenticación, APIs para aplicaciones móviles, dashboards, microservicios y proyectos con inteligencia artificial.','bi bi-briefcase-fill',10),
('Ventajas para este proyecto','En este proyecto FastAPI funciona como intermediario entre la página web y PostgreSQL. La interfaz no contiene información fija: FastAPI consulta la base de datos y envía los datos al HTML mediante Jinja2.','bi bi-diagram-3-fill',11),
('Resumen','FastAPI es una herramienta moderna para construir APIs con Python. Su rapidez, documentación automática, validación de datos y facilidad para conectarse a bases de datos lo convierten en una excelente opción para proyectos web actuales.','bi bi-check-circle-fill',12);

INSERT INTO categorias_tutorial(nombre) VALUES
('Introducción'),
('Primeros pasos'),
('Rutas HTTP'),
('Base de Datos'),
('Proyecto Final');

INSERT INTO secciones_tutorial_info(titulo,descripcion) VALUES
(
'Tutorial interactivo: crea tu primera API con FastAPI',
'Sigue los niveles en orden para construir una API REST completa con Python, FastAPI, Swagger, Pydantic, SQLAlchemy y PostgreSQL. Cada nivel desbloquea el siguiente.'
);

INSERT INTO tutoriales
(titulo, descripcion, codigo, orden, categoria_id, reto, pista, recompensa, prueba)
VALUES
('1. Preparar el entorno','Antes de crear una API con FastAPI necesitas tener Python instalado y crear una carpeta para tu proyecto. Este paso prepara la estructura inicial.','mkdir mi_api_fastapi
cd mi_api_fastapi
python -m venv venv',1,1,'Crea una carpeta llamada mi_api_fastapi y dentro genera un entorno virtual.','Usa python -m venv venv.','Insignia: Entorno preparado','Verifica que la carpeta exista y que dentro aparezca la carpeta venv.'),

('2. Activar el entorno virtual','El entorno virtual permite instalar librerías solo para este proyecto, evitando conflictos con otros proyectos de Python.','venv\Scripts\activate',2,2,'Activa el entorno virtual desde la terminal.','En Windows usa venv\Scripts\activate.','Insignia: Entorno activado','Cuando se active, la terminal debe mostrar (venv) al inicio.'),

('3. Instalar FastAPI y Uvicorn','FastAPI será el framework para crear la API y Uvicorn será el servidor que ejecutará la aplicación.','pip install fastapi uvicorn',3,2,'Instala FastAPI y Uvicorn usando pip.','El comando es pip install fastapi uvicorn.','Insignia: FastAPI instalado','Ejecuta pip list y verifica que aparezcan fastapi y uvicorn.'),

('4. Crear el archivo principal','Crea un archivo llamado main.py. Este archivo será el punto de entrada de tu API.','type nul > main.py',4,2,'Crea un archivo main.py en la carpeta del proyecto.','También puedes crearlo desde Visual Studio Code.','Insignia: Archivo principal','Verifica que main.py exista en la carpeta principal.'),

('5. Crear la primera aplicación FastAPI','En main.py importa FastAPI, crea una instancia de la aplicación y define una ruta inicial.','from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def inicio():
    return {"mensaje": "Hola Mundo con FastAPI"}',5,2,'Crea una aplicación FastAPI que devuelva un mensaje en la ruta principal.','Usa app = FastAPI() y @app.get("/").','Insignia: Hola Mundo','Ejecuta el servidor y abre http://127.0.0.1:8000. Debe mostrar el mensaje en JSON.'),

('6. Ejecutar el servidor','Para ver funcionando tu API debes ejecutar Uvicorn indicando el archivo y el nombre de la aplicación.','uvicorn main:app --reload',6,2,'Ejecuta el servidor y abre la API en el navegador.','La ruta será http://127.0.0.1:8000.','Insignia: Servidor activo','Si no hay errores, Uvicorn mostrará Application startup complete.'),

('7. Revisar la documentación automática','FastAPI genera documentación automática. En /docs puedes probar tus endpoints sin usar Postman.','http://127.0.0.1:8000/docs',7,1,'Abre la documentación automática de FastAPI.','Agrega /docs al final de la URL.','Insignia: Swagger Explorer','Abre http://127.0.0.1:8000/docs y revisa que aparezca Swagger UI.'),

('8. Crear un endpoint GET','GET se utiliza para consultar información. En este ejemplo se devuelve una lista de usuarios.','@app.get("/usuarios")
def obtener_usuarios():
    return [
        {"id": 1, "nombre": "Ana"},
        {"id": 2, "nombre": "Luis"}
    ]',8,3,'Crea una ruta GET llamada /usuarios.','Devuelve una lista de diccionarios.','Insignia: Método GET','Abre http://127.0.0.1:8000/usuarios. Debes ver los usuarios Ana y Luis.'),

('9. Crear modelos con Pydantic','Pydantic permite definir la estructura de los datos que recibirá la API. Esto ayuda a validar información automáticamente.','from pydantic import BaseModel

class Usuario(BaseModel):
    nombre: str
    correo: str
    edad: int',9,3,'Crea un modelo Usuario con nombre, correo y edad.','Importa BaseModel desde pydantic.','Insignia: Validador de datos','Si envías datos incorrectos desde Swagger, FastAPI mostrará un error de validación.'),

('10. Crear un endpoint POST','POST se usa para crear información. En este ejemplo se recibe un usuario usando el modelo de Pydantic.','usuarios = []

@app.post("/usuarios")
def crear_usuario(usuario: Usuario):
    usuarios.append(usuario)
    return {
        "mensaje": "Usuario creado",
        "usuario": usuario
    }',10,3,'Crea una ruta POST que reciba un usuario y lo agregue a una lista.','Usa @app.post("/usuarios").','Insignia: Método POST','Desde /docs prueba POST /usuarios con un JSON y revisa la respuesta.'),

('11. Crear un endpoint con parámetro','FastAPI permite recibir parámetros en la URL. Esto es útil para buscar un registro por su identificador.','@app.get("/usuarios/{id}")
def obtener_usuario(id: int):
    return {"id": id, "mensaje": "Usuario encontrado"}',11,3,'Crea una ruta que reciba un id desde la URL.','Usa /usuarios/{id}.','Insignia: Parámetros de ruta','Abre http://127.0.0.1:8000/usuarios/1 y revisa el JSON.'),

('12. Crear un endpoint PUT','PUT se utiliza para actualizar información existente. Normalmente recibe un id y nuevos datos.','@app.put("/usuarios/{id}")
def actualizar_usuario(id: int, usuario: Usuario):
    return {
        "mensaje": "Usuario actualizado",
        "id": id,
        "usuario": usuario
    }',12,3,'Crea una ruta PUT para actualizar un usuario.','Combina un parámetro id con un modelo Pydantic.','Insignia: Método PUT','Desde Swagger prueba PUT /usuarios/{id} con datos nuevos.'),

('13. Crear un endpoint DELETE','DELETE se utiliza para eliminar información. En una API real eliminaría un registro de la base de datos.','@app.delete("/usuarios/{id}")
def eliminar_usuario(id: int):
    return {
        "mensaje": "Usuario eliminado",
        "id": id
    }',13,3,'Crea una ruta DELETE que reciba el id del usuario.','Usa @app.delete("/usuarios/{id}").','Insignia: Método DELETE','Desde Swagger prueba DELETE /usuarios/{id} y revisa la respuesta.'),

('14. Instalar SQLAlchemy y PostgreSQL','Para conectar FastAPI con PostgreSQL usaremos SQLAlchemy y el driver psycopg2.','pip install sqlalchemy psycopg2-binary python-dotenv',14,4,'Instala las dependencias necesarias para conectar PostgreSQL.','Necesitas sqlalchemy, psycopg2-binary y python-dotenv.','Insignia: Base de datos lista','Ejecuta pip list y verifica que las dependencias estén instaladas.'),

('15. Crear la conexión a PostgreSQL','Crea un archivo database.py para configurar la conexión entre FastAPI y PostgreSQL.','from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

DATABASE_URL = "postgresql://postgres:password@localhost:5432/mi_base"

engine = create_engine(DATABASE_URL)

SessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=engine
)

Base = declarative_base()',15,4,'Crea el archivo database.py con la configuración de SQLAlchemy.','Cambia password y mi_base por tus datos reales.','Insignia: Conexión SQL','Si la conexión es correcta, FastAPI iniciará sin errores.'),

('16. Crear un modelo de base de datos','Los modelos de SQLAlchemy representan tablas de la base de datos. En este caso se crea una tabla usuarios.','from sqlalchemy import Column, Integer, String
from database import Base

class UsuarioDB(Base):
    __tablename__ = "usuarios"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String)
    correo = Column(String)
    edad = Column(Integer)',16,4,'Crea un modelo SQLAlchemy para la tabla usuarios.','Define columnas como id, nombre, correo y edad.','Insignia: Modelo SQLAlchemy','Revisa que el modelo tenga el mismo nombre de tabla que usarás en PostgreSQL.'),

('17. Crear las tablas','FastAPI puede crear las tablas usando Base.metadata.create_all. Esto se coloca normalmente en main.py.','from database import engine
from models import Base

Base.metadata.create_all(bind=engine)',17,4,'Crea las tablas desde SQLAlchemy.','Importa engine y Base correctamente.','Insignia: Tablas creadas','Ejecuta el proyecto y revisa en PostgreSQL que la tabla usuarios exista.'),

('18. Crear dependencia de sesión','Una sesión permite consultar, guardar, actualizar y eliminar datos en la base de datos.','def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()',18,4,'Crea la función get_db para manejar sesiones.','Debe ir en database.py.','Insignia: Sesión segura','Utiliza Depends(get_db) en tus endpoints para probar que se abre la sesión.'),

('19. Guardar datos en PostgreSQL','Ahora el endpoint POST puede guardar usuarios directamente en PostgreSQL usando SQLAlchemy.','from fastapi import Depends
from sqlalchemy.orm import Session

@app.post("/usuarios")
def crear_usuario(usuario: Usuario, db: Session = Depends(get_db)):
    nuevo = UsuarioDB(
        nombre=usuario.nombre,
        correo=usuario.correo,
        edad=usuario.edad
    )

    db.add(nuevo)
    db.commit()
    db.refresh(nuevo)

    return nuevo',19,4,'Crea un POST que guarde un usuario en PostgreSQL.','Usa db.add(), db.commit() y db.refresh().','Insignia: Registro guardado','Desde Swagger prueba POST /usuarios y luego revisa PostgreSQL.'),

('20. Consultar datos desde PostgreSQL','El endpoint GET puede consultar todos los registros guardados en la base de datos.','@app.get("/usuarios")
def listar_usuarios(db: Session = Depends(get_db)):
    return db.query(UsuarioDB).all()',20,4,'Crea un GET que consulte todos los usuarios desde PostgreSQL.','Usa db.query(UsuarioDB).all().','Insignia: Consulta SQL','Abre http://127.0.0.1:8000/usuarios y deben aparecer los registros guardados.'),

('21. Proyecto final','Al finalizar tendrás una API REST con FastAPI capaz de crear, consultar, actualizar y eliminar información conectada a PostgreSQL.','uvicorn main:app --reload

# Documentación:
# http://127.0.0.1:8000/docs',21,5,'Ejecuta el proyecto final y prueba todos los endpoints desde Swagger.','Abre /docs y prueba GET, POST, PUT y DELETE.','Insignia: Desarrollador FastAPI','Prueba el flujo completo: crear usuario, consultar, actualizar y eliminar.');

INSERT INTO personas(nombre,apellido,edad,correo,ciudad) VALUES
('José Emanuel','Malbaes',20,'emanuel@example.com','Estado de México'),
('María','López',22,'maria@example.com','Toluca'),
('Carlos','Hernández',25,'carlos@example.com','Puebla'),
('Ana','Martínez',19,'ana@example.com','Ciudad de México'),
('Luis','Ramírez',27,'luis@example.com','Guadalajara');

INSERT INTO footer(titulo,descripcion) VALUES
(
'FastAPIHub',
'Plataforma educativa para aprender FastAPI mediante ejemplos prácticos, tutoriales y un laboratorio interactivo.'
);