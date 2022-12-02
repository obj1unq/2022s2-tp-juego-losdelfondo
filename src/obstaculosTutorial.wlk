import wollok.game.*
import obstaculos.*
import pantallas.*

object piso {

	method nuevo(posicion) {
		return game.addVisual(new Piso(position = posicion, image = "assets/pisos/pebble_brown_0_new.png"))
	}
}

object spawn {

	method nuevo(posicion) {
		return game.addVisual(new Piso(position = posicion, image = "assets/pisos/spawn.png"))
	}
}

object portal inherits Puerta (image = "assets/extras/portal.gif") {

	method nuevo(posicion) {
		return game.addVisualIn(self, posicion)
	}
	
	override method esAtravesado(personaje) {
		victoria.iniciar()
	}
}

object puerta {

	/*	
	 * El objeto puerta define una nueva puerta en el mapa, a partir de una posicion e 
	 * imagen dada.	
	 */
	method nuevo(posicion, imagen) {
		return(new Puerta(position = posicion, image = imagen))
	}

}

object muroHorizontal {

	/*El objeto muroNorte define un nuevo muroNorte en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-horizontal.png"))
	}

}

object muroVertical {

	/*El objeto muroEste define un nuevo muroEste en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-vertical.png"))
	}

}

object muroNoroOeste {

	/*El objeto muroNoroOeste define un nuevo muroNoroOeste en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-esquina-noroOeste.png"))
	}

}

object muroSuroOeste {

	/*El objeto muroSuroOeste define un nuevo muroSuroOeste en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-esquina-surOeste.png"))
	}

}

object muroNoroEste {

	/*El objeto muroNoroEste define un nuevo muroNoroEste en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-esquina-noroEste.png"))
	}

}

object muroSuroEste {

	/*El objeto muroSuroEste define un nuevo muroSuroEste en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-esquina-surEste.png"))
	}

}

object muroTNorte {
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-T-norte.png"))
	}
}

object muroTSur {
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-T-sur.png"))
	}
}

object muroTOeste {
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-T-oeste.png"))
	}
}

object muroTEste {
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-T-este.png"))
	}
}

object muroCruz {
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image = "assets/muros/muro-cruz.png"))
	}
}