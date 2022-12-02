import wollok.game.*
import direcciones.*
import pantallas.*

class Entidad {

	var property nombre
	var property direccionALaQueMira = abajo
	var property position = game.center()
	var property danio = 1
	var property vida = 100

	method sePuedeAtravesar() 

	method vida() {
		return vida
	}

	method recibirDanio(cantidad) {
		vida = vida - cantidad
		if(vida <= 0){
			self.morirme()
		} else {}
	}

	method visualPosicionado() {
		return (self.nombre().toString() + "/" + self.direccionALaQueMira().toString() + ".png")
	}

	method image() = self.visualPosicionado()
	
	method morirme(){
		game.removeVisual(self)
	}
	
	method esAtravesado(personaje){}

}

class Individuo inherits Entidad {

	method colisionarCon(colisionado){}

	method moverse(direccion) {
		direccionALaQueMira = direccion
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		} else {
			self.noPudeAvanzar(direccion)
		}
	}
	
	method noPudeAvanzar(direccion){}

	method avanzar(direccion) {
		self.position(direccion.posicion(self.position()))
	}

}

class Enemigo inherits Individuo {

	var property armadura = 0
	const property objetivo = principal

	method accionar()

}

class Proyectil inherits Individuo {

	const velocidad = 300

	override method image() = self.visualPosicionado()

	override method colisionarCon(individuo) {
		game.removeVisual(self)
	}
	
	override method noPudeAvanzar(direccion){
		self.morirme()
	}
	
	override method morirme(){
		super()
		game.removeTickEvent("movimiento de proyectil" + nombre.toString())
		
	}

	method serDisparadoPor(personaje) {
		self.position(direccionALaQueMira.posicion(personaje.position()))
		game.addVisual(self)
		game.onTick(velocidad, "movimiento de proyectil" + nombre.toString(), {self.moverse(direccionALaQueMira)})
	}

	override method sePuedeAtravesar() = true

	override method danio() {
		self.morirme()
		return (super())
		
	}

}

class Shooter inherits Enemigo {
	
	var cantidadDeBalas = 0
	
	override method moverse(direccion) {}
	
	override method avanzar(direccion) {}

	override method sePuedeAtravesar() = false

	method lanzarProyectil(direccion) {
		const bala = new Proyectil(direccionALaQueMira = direccion, danio = danio, nombre = "bala" + cantidadDeBalas.toString())
		bala.serDisparadoPor(self)
		cantidadDeBalas+= 1
	}

	override method accionar() {
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

//Creacion de objetos

object principal inherits Individuo (danio = 50, nombre = "principal") {

	override method sePuedeAtravesar() = true

	override method morirme(){
		super()
		game.clear()
		game.boardGround(pantalla.gameOver())
	}

	method colisionar(colisionado) {
		self.atravesarPortal(colisionado)
		self.colisionarCon(colisionado)
	}

	override method colisionarCon(enemigo) {
		self.recibirDanio(enemigo.danio())
	}
	
	method atacar(direccion){
		game.getObjectsIn(direccion.posicion(self.position())).forEach({objeto => objeto.recibirDanio(danio)})
	}
	
	method atravesarPortal(portal){
		portal.esAtravesado(self)
	}
	
}

object maquinaExpendedora inherits Shooter (danio = 10, nombre = "maquina") {}

object fidel inherits Stalker(danio = 20, nombre = "fidel") {}


