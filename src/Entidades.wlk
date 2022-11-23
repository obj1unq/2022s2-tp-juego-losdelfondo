import wollok.game.*
import direcciones.*

class Entidad {

	var property nombre
	var property direccionALaQueMira = abajo
	var property position = game.center()
	var property danio

	method sePuedeAtravesar()

}

class Individuo inherits Entidad {

	var property vida = 100

	method image() = nombre.toString() + "/" + "quieto_mirando_" + direccionALaQueMira.toString() + ".png"
	// TODO cambiar nombre de assets y borrar pasos intermedios

	method colisionarCon(colisionado)

	method moverse(direccion) {
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		}
	}

	method avanzar(direccion) {
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
	const property objetivo

	method accionar()

}

class Proyectil inherits Individuo {
	
	override method image() = "objetos" + "/Sprite-test-Moneda.png"

	override method colisionarCon(individuo) {
		game.removeVisual(self)
	} 

	override method sePuedeAtravesar() = true

	override method danio() {
		game.removeVisual(self)
		return (super())
	}

}

class Shooter inherits Enemigo {

	const property balas = []

	override method sePuedeAtravesar() = true

	method lanzarProyectil(direccion) {
		
		const bala = new Proyectil(direccionALaQueMira = direccion, danio = danio, nombre = "bala")
		balas.add(bala)
		game.addVisualIn(bala, direccion.posicion(self.position()))
		game.say(shooter, "ahora hay " + balas.size() + "balas en el juego" )
	// como hacer para instanciar, meterlo a una coleccion y no usar "bala" para nombrarlos a todos?
	}

	override method colisionarCon(colision) {
	}

	override method accionar() {
		balas.forEach({ bala => bala.avanzar(bala.direccionALaQueMira())})
		self.lanzarProyectil(direccionALaQueMira)

	}

}

class Stalker inherits Enemigo {

	override method sePuedeAtravesar() = true

	method direccionMasConveniente(direcciones) {
		return direcciones.min{ direccion => direccion.posicion(self.position()).distance(objetivo.position()) }
	}

	method moverHaciaJugador() {
		var direccionMasConveniente = self.direccionMasConveniente(self.direccionesAtravesables())
		self.moverse(direccionMasConveniente)
	}

	method direccionesAtravesables() {
		return [ izquierda, arriba, abajo, derecha ].filter({ direccion => direccion.puedeMoverseA(self) })
	}

	override method colisionarCon(colisionado) {
	}

	override method accionar() {
		self.moverHaciaJugador()
	}

}

class Principal inherits Individuo {

	override method sePuedeAtravesar() = true

	override method image() = "principal/quieto_mirando_derecha.png"

	method colisionar(colisionado) {
		self.colisionarCon(colisionado)
	}

	override method colisionarCon(enemigo) {
		self.recibirDanio(enemigo.danio())
	}

}

