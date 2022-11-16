import wollok.game.*
import direcciones.*

class Entidad {

	var property position = game.center()

	method image()

	method avanzar(direccion)

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
	
	

// determinar si disparar en posicion de PP o moverse 
// para dispararle manteniendo la distancia 
//	method dispararHaciaJugador() {
//		if (self.estaEnLineaConJugador()) {
//			self.lanzarProyectil(self.direccionADisparar(principal))
//		} else {
//		// deberia moverse para estar en linea con el jugador
//		}
//	}

	method estaEnLineaConJugador() {
		return (self.estaEnMismaFilaConJugador() or self.estaEnMismaColumnaConJugador())
	}

	method estaEnMismaFilaConJugador() {
		return ( self.position().x() == principal.position().x() )
	}

	method estaEnMismaColumnaConJugador() {
		return ( self.position().y() == principal.position().y() )
	}

	method lanzarProyectil(direccion) {
		const bala = new Proyectil(direccionDeMovimiento = direccion, danio = 15)
		game.addVisualIn(bala, direccion.posicion(self.position()))
	}

	method direccionADisparar(individuo) {
		// TODO buscar como retornar la direccion necesaria
	}

}

class Stalker inherits Enemigo {

	var property danio = 10

//
}

// TAL VEZ CREAR UN FACTORY PARA ESTOS INDIVIDUOS
object milei inherits Shooter {

	override method image() = "milei/quieto_mirando_derecha.png"

	override method sePuedeAtravesar() = true

	override method colisionarCon(enemigo) {
	} // TODO PLANTEAR COMPORTAMIENTO	

}

object fidel inherits Stalker {
	
	override method position() = game.at(1,1)

	override method image() = "old_man/quieto_mirando_derecha.png"

	override method colisionarCon(enemigo) {
	}

}

object principal inherits Individuo {
	
	override method position() = game.at(15,15)

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

