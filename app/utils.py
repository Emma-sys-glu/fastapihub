from app.crud import obtener_menu, obtener_footer

def obtener_contexto_base(db):
    return {
        "menu": obtener_menu(db),
        "footer": obtener_footer(db)
    }