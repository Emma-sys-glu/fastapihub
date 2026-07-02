from sqlalchemy import Column, Integer, String, Text, ForeignKey
from app.database import Base

class Menu(Base):
    __tablename__ = "menu"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(100))
    ruta = Column(String(100))
    orden = Column(Integer)


class Categoria(Base):
    __tablename__ = "categorias"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(100))


class Tutorial(Base):
    __tablename__ = "tutoriales"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String(200))
    descripcion = Column(Text)
    codigo = Column(Text)
    orden = Column(Integer)
    categoria_id = Column(Integer, ForeignKey("categorias.id"))
    reto = Column(Text)
    pista = Column(Text)
    recompensa = Column(String)
    prueba = Column(Text)


class Tecnologia(Base):
    __tablename__ = "tecnologias"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(100))
    descripcion = Column(Text)
    icono = Column(String(100))


class Inicio(Base):
    __tablename__ = "inicio"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String)
    subtitulo = Column(String)
    descripcion = Column(Text)
    boton_principal = Column(String)
    boton_secundario = Column(String)


class Estadistica(Base):
    __tablename__ = "estadisticas"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String)
    valor = Column(String)


class SeccionInicio(Base):
    __tablename__ = "secciones_inicio"

    id = Column(Integer, primary_key=True, index=True)
    clave = Column(String)
    titulo = Column(String)
    descripcion = Column(Text)

class ArquitecturaInicio(Base):
    __tablename__ = "arquitectura_inicio"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String)
    icono = Column(String)
    orden = Column(Integer)

class SeccionFastAPI(Base):
    __tablename__ = "secciones_fastapi"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String)
    contenido = Column(Text)
    icono = Column(String)
    orden = Column(Integer)

class SeccionTutorialInfo(Base):
    __tablename__ = "secciones_tutorial_info"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String)
    descripcion = Column(Text)

class CategoriaTutorial(Base):
    __tablename__ = "categorias_tutorial"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String)

class Persona(Base):
    __tablename__ = "personas"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String)
    apellido = Column(String)
    edad = Column(Integer)
    correo = Column(String)
    ciudad = Column(String)

class Footer(Base):
    __tablename__ = "footer"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String)
    descripcion = Column(Text)