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
	
	method accionar()

}

class Enemigo inherits Individuo {

	var property armadura = 0
	const property objetivo

}

class Proyectil inherits Individuo {

	override method colisionarCon(individuo) {
		game.removeVisual(self)
	}

	override method avanzar(direccion) {
		super(direccion)
	}

	override method sePuedeAtravesar() = true
	
	override method danio(){
		super()
		game.removeVisual(self)
	}

	override method accionar(){
		self.avanzar(direccionALaQueMira)
	}
}

class Shooter inherits Enemigo {

	override method sePuedeAtravesar() = true

	method lanzarProyectil(direccion) {
		const bala = new Proyectil(direccionALaQueMira = direccion, danio = danio, nombre = "bala")
		game.addVisualIn(bala, direccion.posicion(self.position()))
	}
 
	override method colisionarCon(colision) {
	}
	
	override method accionar(){
		self.lanzarProyectil(direccionALaQueMira)
		//TODO hacer que mueva las balas
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
	
	override method accionar(){
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
		
	override method accionar(){
		//curarse pasivamente?
	}

}

