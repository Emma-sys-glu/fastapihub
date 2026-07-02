from pydantic import BaseModel


class PersonaBase(BaseModel):
    nombre: str
    apellido: str
    edad: int
    correo: str
    ciudad: str


class PersonaCreate(PersonaBase):
    pass


class PersonaUpdate(PersonaBase):
    pass


class PersonaResponse(PersonaBase):
    id: int

    class Config:
        from_attributes = True