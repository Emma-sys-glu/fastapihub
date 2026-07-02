from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.database import get_db
from app.schemas import PersonaCreate, PersonaUpdate, PersonaResponse
from app.crud import (
    obtener_personas,
    crear_persona,
    obtener_persona,
    actualizar_persona,
    eliminar_persona
)

router = APIRouter(
    prefix="/api/personas",
    tags=["Personas"]
)


@router.get("/", response_model=list[PersonaResponse])
def api_obtener_personas(db: Session = Depends(get_db)):
    return obtener_personas(db)


@router.post("/", response_model=PersonaResponse)
def api_crear_persona(persona: PersonaCreate, db: Session = Depends(get_db)):
    return crear_persona(db, persona)


@router.get("/{persona_id}", response_model=PersonaResponse)
def api_obtener_persona(persona_id: int, db: Session = Depends(get_db)):
    persona = obtener_persona(db, persona_id)

    if not persona:
        raise HTTPException(status_code=404, detail="Persona no encontrada")

    return persona


@router.put("/{persona_id}", response_model=PersonaResponse)
def api_actualizar_persona(
    persona_id: int,
    persona: PersonaUpdate,
    db: Session = Depends(get_db)
):
    persona_actualizada = actualizar_persona(db, persona_id, persona)

    if not persona_actualizada:
        raise HTTPException(status_code=404, detail="Persona no encontrada")

    return persona_actualizada


@router.delete("/{persona_id}")
def api_eliminar_persona(persona_id: int, db: Session = Depends(get_db)):
    persona = eliminar_persona(db, persona_id)

    if not persona:
        raise HTTPException(status_code=404, detail="Persona no encontrada")

    return {"mensaje": "Persona eliminada correctamente"}