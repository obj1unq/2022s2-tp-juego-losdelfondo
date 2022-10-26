import wollok.game.*
import direcciones.*

object principal {

	var property position = game.center()

	method image() = "principal/standing_Right.png"

	method moverse(direccion) {
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		}
	}

	method avanzar(direccion) {
		self.position(direccion.posicion(self.position()))
	}

}

