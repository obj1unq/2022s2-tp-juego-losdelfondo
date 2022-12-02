class Texto {
	var property position = null
	method textColor() = "ffffff"
	
	method sePuedeAtravesar() = true
	method danio()=0
	method esAtravesado(personaje){}
}

object tutorialMovimiento  inherits Texto{
	method text() = "¡ USA LAS TECLAS (W, A, S, D) PARA MOVER AL PERSONAJE !"	
}

object tutorialAtaque  inherits Texto{
	method text() = "¡ CON LA TECLA ' J ' PODRAS ATACAR A LOS ENEMIGOS A MELEE!"	
}

object escapandoUNQ  inherits Texto{
	method text() = "¡ INTENTA ESCAPAR DE LA UNQ !"	
}

object activacionPortal   inherits Texto{
	method text() = "¡ UTILIZA NUEVAMENTE LA TECLA ' J ' PARA ACTIVAR EL PORTAL !"	
}