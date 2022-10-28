import wollok.game.*

class Obstaculo {
	/*
	
	La clase obstaculo define las propiedades de todos los obstaculos del juego
	Desde la imagen, posicion hasta las distintas interacciones que tienen con el resto
	de los objetos.
	
	*/
	var property position = null
	var property image = null
	var esAtravesable = false
	
	method sePuedeAtravesar() {
		return esAtravesable
	}
	
	method cambiarEstado() {
		esAtravesable = !self.sePuedeAtravesar()
	}
}

class Puerta inherits Obstaculo {
	
	override method cambiarEstado(){
		// Cambia el estado cuando el personaje consigue una llave
	}
	
}

object puerta {
	/*
	
	El objeto peuta define una nueva puerta en el mapa, a partir de una posicion e 
	imagen dada.
	
	*/
	method nuevo(posicion, imagen) {
		return (new Puerta(position = posicion, image = imagen))
	}
}

object obstaculo {
	/*El objeto obstaculo define un nuevo obstaculo en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Obstaculo(position = posicion, image="assets/objetos/Sprite-test-Moneda.png"))
	}
}

