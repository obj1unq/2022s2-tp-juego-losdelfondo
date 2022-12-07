import wollok.game.*

class Direccion {

	method posicion(_posicion_)

	method puedeMoverseA(personaje) {
		return self.posicion(personaje.position()).allElements().all({ elemento => elemento.sePuedeAtravesar() })
	}

}

object arriba inherits Direccion {

	override method posicion(posicion) = posicion.up(1)

}

object abajo inherits Direccion {

	override method posicion(posicion) = posicion.down(1)

}

object derecha inherits Direccion {

	override method posicion(posicion) = posicion.right(1)

}

object izquierda inherits Direccion {

	override method posicion(posicion) = posicion.left(1)

}

