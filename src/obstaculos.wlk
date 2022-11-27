import wollok.game.*

class Obstaculo {
	/*
	
	La clase obstaculo define las propiedades de todos los obstaculos del juego
	Desde la imagen, posicion hasta las distintas interacciones que tienen con el resto
	de los objetos.
	
	*/
	var property position = null
	var property image = null
	
	
	method sePuedeAtravesar() 
	
}

class Puerta inherits Obstaculo {
	
	override method sePuedeAtravesar(){return false}
	
	method cambiarEstado(){
		// Cambia el estado cuando el personaje consigue una llave
	}
	
}

class Muro inherits Obstaculo {
	override method sePuedeAtravesar(){return false}
}

class Piso inherits Obstaculo {
	override method sePuedeAtravesar(){return true}
	method danio(){return 0}
	method recibirDanio(cantidad){}
}