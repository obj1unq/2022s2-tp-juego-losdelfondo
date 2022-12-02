import wollok.game.*
import direcciones.*
import pantallas.*
import obstaculosTutorial.*

class Entidad {

	var property nombre
	var property direccionALaQueMira = abajo
	var property position = game.center()
	var property danio = 1
	var property vida = 100
	var property image = self.visualPosicionado()

	method sePuedeAtravesar()

	method vida() {
		return vida
	}

	method recibirDanio(cantidad) {
		self.recibirDanioVisual()
		vida = vida - cantidad
		if (vida <= 0) {
			self.morirme()
		} else {
		}
	}

	method recibirDanioVisual() {
		//game.schedule(500, { self.alternarVisualDanio()})
		self.alternarVisualDanio()
	}
	
	method alternarVisualDanio() {
		
		game.schedule(500, { self.visualDanioPosicionado()})
		game.schedule(500, { self.visualPosicionado()}) 
		
//		if (image == direccionALaQueMira) {
//			image = self.visualPosicionado().toString() + "_danio.png"
//		} else {
//			image = self.visualPosicionado()
//		}
	}
	
	method visualPosicionado() {
		return (self.nombre() + "/" + self.direccionALaQueMira().toString() + ".png")
	}
	
	method visualDanioPosicionado(){
		return (self.nombre() + "/" + self.direccionALaQueMira().toString() + "_danio.png")
	}

	method morirme() {
		game.removeVisual(self)
	}

	method image() = self.visualPosicionado()

}

class Individuo inherits Entidad {

	method colisionarCon(colisionado) {
	}

	method moverse(direccion) {
		direccionALaQueMira = direccion
		image = self.visualPosicionado()
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		} else {
			self.noPudeAvanzar(direccion)
		}
	}

	method noPudeAvanzar(direccion) {
	}

	method avanzar(direccion) {
		self.position(direccion.posicion(self.position()))
	}

	override method nombre() {
		return nombre.toString()
	}

}

class Enemigo inherits Individuo {

	var property armadura = 0
	const property objetivo = principal

	method accionar()
	
	method esAtravesado(personaje){}

}

class Proyectil inherits Individuo {

	const velocidad = 500

	override method image() = self.visualPosicionado()

	override method colisionarCon(individuo) {
		game.removeVisual(self)
	}

	override method noPudeAvanzar(direccion) {
		self.morirme()
	}

	override method morirme() {
		super()
		game.removeTickEvent("movimiento de proyectil" + nombre.toString())
	}

	method serDisparadoPor(personaje) {
		self.position(direccionALaQueMira.posicion(personaje.position()))
		game.addVisual(self)
		game.onTick(velocidad, "movimiento de proyectil" + self.nombre(), { self.moverse(direccionALaQueMira)})
	}

	override method sePuedeAtravesar() = true

	override method danio() {
		self.morirme()
		return (super())
	}

	override method visualPosicionado() {
		return "proyectiles/" + self.nombre() + ".png"
	}

//	override method recibirDanioVisual(){}
	
	method esAtravesado(personaje){}

}

class Shooter inherits Enemigo {

	const proyectiles = [ "donut", "candy" ]
	var cantidadDeBalas = 0

	override method moverse(direccion) {
	}

	override method avanzar(direccion) {
	}

	override method sePuedeAtravesar() = false

	method lanzarProyectil(direccion) {
		const bala = new Proyectil(direccionALaQueMira = direccion, danio = danio, nombre = proyectiles.anyOne())
		bala.serDisparadoPor(self)
		cantidadDeBalas += 1
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
		gameOver.iniciar()
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
		portal.cambiarEstado()
	}
	
	method puedeAtravesarPortal(){
		return portal.puertaActiva()
	}
	
	
	method atravesarPortal(_portal){
		if(_portal == portal){
			portal.esAtravesado(self)		
		} 
	}
	
}

object maquinaExpendedora inherits Shooter (danio = 10, nombre = "maquina") {

}

object fidel inherits Stalker(danio = 20, nombre = "fidel") {

}

