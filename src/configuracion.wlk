import wollok.game.*
import direcciones.*
import Entidades.*
import mapaTutorial.*

const facil = 3000
const normal = 2000
const dificil = 1000
const extremo = 500

object manager {

	var entidades = [fidel]

	method iniciarPersonajes() {
		configuracionMapaTutorial.colocarEntidad(principal, game.at(23, 22))
//		configuracionMapaTutorial.colocarEntidad(maquinaExpendedora, game.at(8, 25))
		configuracionMapaTutorial.colocarEntidad(fidel, game.at(10, 11))
	}

	method configurarColisiones(pj){
		game.onCollideDo(pj, { colisionado => pj.colisionar(colisionado) })
	}

	method iniciarTeclas() {
		keyboard.w().onPressDo({ principal.moverse(arriba)})
		keyboard.a().onPressDo({ principal.moverse(izquierda)})
		keyboard.s().onPressDo({ principal.moverse(abajo)})
		keyboard.d().onPressDo({ principal.moverse(derecha)})
		keyboard.j().onPressDo({ principal.atacar(principal.direccionALaQueMira())})
	}
	
	method empezarAccion(dificultad){
		self.configurarEntidades(entidades)
		self.accionarEntidades(dificultad)
	}

	method configurarEntidades(pjs) {
		pjs.forEach({pj => entidades.add(pj)})
	}

	method accionarEntidades(dificultad) {
		game.onTick(dificultad, "accionar del juego", { self.limpiarEntidadesMuertas()
		; self.ejecutarAccionar()
		})
	}

	method limpiarEntidadesMuertas() {
		entidades = entidades.filter({entidad => entidad.vida() > 0})
	}

	method ejecutarAccionar() {
		entidades.forEach({entidad => entidad.accionar()})
	}
	
	method agregarEntidad(entidad) {
		entidades.add(entidad)
	}

}

