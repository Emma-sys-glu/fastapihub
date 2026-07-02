from fastapi import APIRouter, Request, Depends
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from sqlalchemy.orm import Session
from app.utils import obtener_contexto_base
from app.database import get_db
from app.crud import  obtener_menu, obtener_inicio,obtener_estadisticas,obtener_tecnologias,obtener_secciones_inicio, obtener_arquitectura_inicio,obtener_secciones_fastapi,obtener_info_tutorial,obtener_categorias_tutorial,obtener_tutoriales,obtener_footer


router = APIRouter()
templates = Jinja2Templates(directory="app/templates")

@router.get("/", response_class=HTMLResponse)
async def inicio(request: Request, db: Session = Depends(get_db)):
    contexto = obtener_contexto_base(db)

    contexto.update({
        "inicio": obtener_inicio(db),
        "estadisticas": obtener_estadisticas(db),
        "tecnologias": obtener_tecnologias(db),
        "secciones_inicio": obtener_secciones_inicio(db),
        "arquitectura_inicio": obtener_arquitectura_inicio(db)
    })

    return templates.TemplateResponse(
        request=request,
        name="index.html",
        context=contexto
    )


@router.get("/fastapi", response_class=HTMLResponse)
async def fastapi_page(request: Request, db: Session = Depends(get_db)):
    contexto = obtener_contexto_base(db)

    contexto.update({
        "secciones": obtener_secciones_fastapi(db)
    })

    return templates.TemplateResponse(
        request=request,
        name="fastapi.html",
        context=contexto
    )


@router.get("/tutorial", response_class=HTMLResponse)
async def tutorial(request: Request, db: Session = Depends(get_db)):
    contexto = obtener_contexto_base(db)

    contexto.update({
        "info_tutorial": obtener_info_tutorial(db),
        "categorias": obtener_categorias_tutorial(db),
        "tutoriales": obtener_tutoriales(db)
    })

    return templates.TemplateResponse(
        request=request,
        name="tutorial.html",
        context=contexto
    )


@router.get("/laboratorio", response_class=HTMLResponse)
async def laboratorio(request: Request, db: Session = Depends(get_db)):
    contexto = obtener_contexto_base(db)

    return templates.TemplateResponse(
        request=request,
        name="laboratorio.html",
        context=contexto
    )