from sqlalchemy.orm import Session
from app.models import Tecnologia, Persona, Menu, Inicio, Estadistica, Footer, SeccionInicio, ArquitecturaInicio,SeccionFastAPI,SeccionTutorialInfo,CategoriaTutorial,Tutorial

def obtener_menu(db: Session):
    return db.query(Menu).order_by(Menu.orden).all()

def obtener_tecnologias(db: Session):
    return db.query(Tecnologia).all()

def obtener_inicio(db: Session):
    return db.query(Inicio).first()

def obtener_estadisticas(db: Session):
    return db.query(Estadistica).all()

def obtener_footer(db: Session):
    return db.query(Footer).first()

def obtener_secciones_inicio(db: Session):
    secciones = db.query(SeccionInicio).all()
    return {seccion.clave: seccion for seccion in secciones}

def obtener_arquitectura_inicio(db: Session):
    return db.query(ArquitecturaInicio).order_by(ArquitecturaInicio.orden).all()

def obtener_secciones_fastapi(db: Session):
    return db.query(SeccionFastAPI).order_by(SeccionFastAPI.orden).all()

def obtener_info_tutorial(db: Session):
    return db.query(SeccionTutorialInfo).first()

def obtener_categorias_tutorial(db: Session):
    return db.query(CategoriaTutorial).all()


def obtener_tutoriales(db: Session):
    return db.query(Tutorial).order_by(Tutorial.orden).all()

def obtener_personas(db: Session):
    return db.query(Persona).order_by(Persona.id).all()


def crear_persona(db: Session, persona):
    nueva = Persona(**persona.dict())
    db.add(nueva)
    db.commit()
    db.refresh(nueva)
    return nueva


def obtener_persona(db: Session, persona_id: int):
    return db.query(Persona).filter(Persona.id == persona_id).first()


def actualizar_persona(db: Session, persona_id: int, datos):
    persona = obtener_persona(db, persona_id)

    if persona:
        for key, value in datos.dict().items():
            setattr(persona, key, value)

        db.commit()
        db.refresh(persona)

    return persona


def eliminar_persona(db: Session, persona_id: int):
    persona = obtener_persona(db, persona_id)

    if persona:
        db.delete(persona)
        db.commit()

    return persona