import wollok.game.*

class Obstaculo {
	/*
	
	La clase obstaculo define las propiedades de todos los obstaculos del juego
	Desde la imagen, posicion hasta las distintas interacciones que tienen con el resto
	de los objetos.
	
	*/
	var property position = null
	var property image = null
	var esTraspasable = false
	
	method cambiarEstado() {
		esTraspasable = !esTraspasable
	}
	
	method esTraspasable() {
		return esTraspasable
	}
	
	method colisionarCon(objeto) {
		if(!self.esTraspasable()) {
			//TODO: No deberia dejar pasar al objeto
		}
	}
}

object obstaculo {
	/*
	
	El objto obstaculo define un nuevo obstaculo en el mapa, a partir de una posicion e 
	imagen dada.
	
	*/
	method nuevo(posicion, imagen) {
		return (new Obstaculo(position = posicion, image = imagen))
	}
}
