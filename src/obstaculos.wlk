import wollok.game.*
import configuracion.*

class Obstaculo {

	/*
	 * 
	 * La clase obstaculo define las propiedades de todos los obstaculos del juego
	 * Desde la imagen, posicion hasta las distintas interacciones que tienen con el resto
	 * de los objetos.
	 * 
	 */
	var property position = null
	var property image = null

	method sePuedeAtravesar()
	
	method danio()=0

	method recibirDanio(cantidad) {}
	
	method esAtravesado(personaje){}
}

class Puerta inherits Obstaculo {
	
	var property puertaActiva = false
	
	override method sePuedeAtravesar()= self.puertaActiva()
	
	method puedeCambiarEstado(){
		return manager.entidades().isEmpty()
	}
	
	method cambiarEstado() {
		if (self.puedeCambiarEstado()){
			self.puertaActiva(true)		
		}	
	}

}

class Muro inherits Obstaculo {

	override method sePuedeAtravesar() {
		return false
	}

}

class Piso inherits Obstaculo {

	override method sePuedeAtravesar() {
		return true
	}

}

