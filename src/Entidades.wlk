import wollok.game.*
import direcciones.*

class Entidad {

	var property position = game.center()

	method image()

	method avanzar(direccion)

	method colisionar(colisionado)

	method colisionarCon(colisionado)

	method sePuedeAtravesar()

}

class Individuo inherits Entidad {

	var property armadura = 0
	var property vida = 100

	method moverse(direccion) {
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		}
	}

	override method avanzar(direccion) {
		self.position(direccion.posicion(self.position()))
	}

	override method colisionar(colisionado) {
		self.colisionarCon(colisionado)
//		colisionado.colisionarCon(self)
	}

	method vida() {
		return vida
	}

	method recibirDanio(cantidad) {
		vida = vida - (cantidad / armadura)
	}
	
	override method sePuedeAtravesar() = true

}

class Enemigo inherits Individuo {

	method direccionMasConveniente(direcciones) {
		return direcciones.min{ direccion => direccion.posicion(self.position()).distance(principal.position()) }
	}

	

}

class Proyectil inherits Entidad {
	
	var direccionDeMovimiento 
	
	override method avanzar(direccion){
		super(direccionDeMovimiento)
	}
}

class Shooter inherits Enemigo {

// determinar si disparar en posicion de PP o moverse 
// para dispararle manteniendo la distancia 
	method dispararHaciaJugador() {
	}

}

class Stalker inherits Enemigo {

	var property danio = 10

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

	override method image() = "milei/quieto_mirando_derecha.png"

	override method sePuedeAtravesar() = true

	override method colisionarCon(enemigo) {
	} // TODO PLANTEAR COMPORTAMIENTO	

}

object fidel inherits Enemigo {

	override method image() = "old_man/quieto_mirando_derecha.png"

	override method colisionarCon(enemigo) {
	}

}

object principal inherits Individuo {

	override method image() = "principal/quieto_mirando_derecha.png"

	override method colisionarCon(enemigo) {
		self.recibirDanio(enemigo.danio())
		game.say(self, "me quedan " + self.vida() + " puntos de vida")
	}

}

