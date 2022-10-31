import wollok.game.*
import direcciones.*

class Individuo {
	
	var property position = game.center()
	
	var vida = 100
	
	method vida() {
		return vida
	}
	
	method image()
	
	method sePuedeAtravesar()
	
	method moverse(direccion) {
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		}
	}

	method avanzar(direccion) {
		self.position(direccion.posicion(self.position()))
	}
	
	method colisionarCon(individuo) = game.colliders(individuo).forEach({cosa => cosa.colisionar()})
	
	
}

class Enemigo inherits Individuo {
	
		
	method direccionMasConveniente(direcciones){ 
		return direcciones.min{ direccion => direccion.posicion(self.position()).distance(principal.position()) }
	}
	
	method moverHaciaJugador() {
		var direccionMasConveniente = self.direccionMasConveniente(self.direccionesAtravesables())
		self.moverse(direccionMasConveniente)
	}

	method direccionesAtravesables() {
		return [izquierda, arriba, abajo, derecha].filter({ direccion => direccion.puedeMoverseA(self) })
	}
	
}

// TAL VEZ CREAR UN FACTORY PARA ESTOS INDIVIDUOS

object milei inherits Enemigo{

	override method image() = "milei/quieto_mirando_derecha.png"
	
	override method sePuedeAtravesar() = true

}
object fidel inherits Enemigo{
	
	var property position = game.at(5, 10)

	override method image() = "old_man/quieto_mirando_derecha.png"
	
	override method sePuedeAtravesar() = true
}

object principal inherits Individuo{

	var property position = game.center()

	method image() = "principal/quieto_mirando_derecha.png"

	override method sePuedeAtravesar() = true
	

}