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

	method colisiones(individuo) = game.colliders(individuo).forEach({ cosa => cosa.colisionar(individuo) })

	method colisionar(colisionado) {
		self.colisionarCon(colisionado)
		colisionado.colisionarCon(self)
	}

	method recibirDanio(cantidad) {
		vida = vida - cantidad
	}

	method colisionarCon(colisionado)

}

class Enemigo inherits Individuo {

	method direccionMasConveniente(direcciones) {
		return direcciones.min{ direccion => direccion.posicion(self.position()).distance(principal.position()) }
	}

	method moverHaciaJugador() {
		var direccionMasConveniente = self.direccionMasConveniente(self.direccionesAtravesables())
		self.moverse(direccionMasConveniente)
	}

	method direccionesAtravesables() {
		return [ izquierda, arriba, abajo, derecha ].filter({ direccion => direccion.puedeMoverseA(self) })
	}

}

// TAL VEZ CREAR UN FACTORY PARA ESTOS INDIVIDUOS
object milei inherits Enemigo {

	var property armadura = 1.2
	var property danio = 3.75

	override method image() = "milei/quieto_mirando_derecha.png"

	override method sePuedeAtravesar() = true
	
	override method recibirDanio(cantidad) {
		vida 
	}

	override method colisionarCon(enemigo) {} // TODO PLANTEAR COMPORTAMIENTO	

}

object fidel inherits Enemigo {

	var property armadura = 2
	var property danio = 10

	override method image() = "old_man/quieto_mirando_derecha.png"

	override method sePuedeAtravesar() = true

	override method colisionarCon(enemigo) {} // TODO PLANTEAR COMPORTAMIENTO

}

object principal inherits Individuo {

	method image() = "principal/quieto_mirando_derecha.png"

	override method sePuedeAtravesar() = true

	override method colisionarCon(enemigo) {
		vida = vida - enemigo.danio()
	}

}

