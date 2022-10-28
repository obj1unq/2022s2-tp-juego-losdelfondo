import wollok.game.*
import direcciones.*

object principal {

	var property position = game.center()

	method image() = "principal/quieto_mirando_derecha.png"

	method moverse(direccion) {
		if (direccion.puedeMoverseA(self)) {
			self.avanzar(direccion)
		}
	}

	method avanzar(direccion) {
		self.position(direccion.posicion(self.position()))
	}
	

}

