import wollok.game.*
import direcciones.*

class Entidad {
	
	var property direccion = abajo

	var property position = game.center()

	method image()

	method avanzar(direccion)

	method colisionarCon(colisionado)

	method sePuedeAtravesar()

}

class Individuo inherits Entidad {

	var property vida = 100

	method moverse(direccion) {
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		}
	}

	override method avanzar(direccion) {
		self.position(direccion.posicion(self.position()))
	}

	method vida() {
		return vida
	}

	method recibirDanio(cantidad) {
		vida = vida - cantidad 
	}

}

class Enemigo inherits Individuo {

	var property armadura = 0

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

class Proyectil inherits Entidad {
	
	var danio

	var direccionDeMovimiento

	override method image() = {// buscar foto de proyectil
	}
	
	override method colisionarCon(individuo){
		game.removeVisual(self)
	}


	override method avanzar(direccion) {
		super(direccionDeMovimiento)
	}
	
	override method sePuedeAtravesar() = true
	
}

class Shooter inherits Enemigo {
	
	var property danio
	
	var property direccionALaQueApunta 
	
	override method sePuedeAtravesar() = true

	method lanzarProyectil(direccion) {
		const bala = new Proyectil(direccionDeMovimiento = direccionALaQueApunta, danio = danio)
		game.addVisualIn(bala, direccionALaQueApunta.posicion(self.position()))
	}

}

class Stalker inherits Enemigo {

	var property danio = 10

	override method sePuedeAtravesar()= true
}

object fidel inherits Stalker {

	override method image() = "old_man/quieto_mirando_derecha.png"

	override method colisionarCon(enemigo) {
	}

}

object principal inherits Individuo {
	
	override method sePuedeAtravesar()= true

	override method image() = "principal/quieto_mirando_derecha.png"

	method colisionar(colisionado){
		self.colisionarCon(colisionado)
		colisionado.colisionarCon(self)
	}

	override method colisionarCon(enemigo) {
		self.recibirDanio(enemigo.danio())
		game.say(self, "me quedan " + self.vida() + " puntos de vida")
	}

}

