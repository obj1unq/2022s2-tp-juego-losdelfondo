class Texto {
	var property position = null
	method textColor() = "ffffff"
	
	method sePuedeAtravesar() = true
	method danio()=0
}

object tutorialMovimiento  inherits Texto{
	method text() = "¡ USA LAS TECLAS (W, A, S, D) PARA MOVER AL PERSONAJE !"	
}

object tutorialAtaque  inherits Texto{
	method text() = "¡ CON LA TECLA ' J ' PODRAS DISPARAR Y ATACAR A LOS ENEMIGOS !"	
}

object escapandoUNQ  inherits Texto{
	method text() = "¡ INTENTA ESCAPAR DE LA UNQ !"	
}