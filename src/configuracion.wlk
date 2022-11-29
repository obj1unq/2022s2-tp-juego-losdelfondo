import wollok.game.*
import direcciones.*
import Entidades.*
import mapaTutorial.*

object manager {

	var entidades

	method colocarPersonajes() {
		configuracionMapaTutorial.colocarEntidad(principal, game.at(23, 22))
		configuracionMapaTutorial.colocarEntidad(maquinaExpendedora, game.at(8, 25))
		configuracionMapaTutorial.colocarEntidad(fidel, game.at(10, 11))
	}

	method configurarTeclas() {
		keyboard.w().onPressDo({ principal.moverse(arriba)})
		keyboard.a().onPressDo({ principal.moverse(izquierda)})
		keyboard.s().onPressDo({ principal.moverse(abajo)})
		keyboard.d().onPressDo({ principal.moverse(derecha)})
		keyboard.j().onPressDo({ principal.atacar(principal.direccionALaQueMira())})
	}

	method configurarEntidades(pjs) {
		entidades = []
		entidades = pjs
	}

}

