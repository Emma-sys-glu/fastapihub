from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

from app.database import engine
from app.models import Base
from app.routers import web, personas

app = FastAPI(
    title="FastAPI Learning Hub",
    description="Proyecto escolar desarrollado con FastAPI y PostgreSQL",
    version="1.0"
)

Base.metadata.create_all(bind=engine)

app.mount("/static", StaticFiles(directory="app/static"), name="static")

app.include_router(web.router)
app.include_router(personas.router)