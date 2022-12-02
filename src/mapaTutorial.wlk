import wollok.game.*
import obstaculosTutorial.*
import testMapa.*
import textos.*

object configuracionMapaTutorial {
	/*
		ACA VAN A ESTAR LAS CONFIGURACIONES DEL MAPA TUTORIAL, CUALQUIER CAMBIO QUE SE QUIERA REALIZAR SE TENDRA QUE 
		HACER A PARTIR DE ACA.
	*/
	const mapaTutorial = new Mapa()
	
	method cargarMapaTutorial(){
		const listaMuros = [muroHorizontal, muroVertical, muroSuroOeste, muroNoroOeste, muroNoroEste, muroSuroEste]
		mapaTutorial.setearMarcoInicial(23, 23, listaMuros)	
		mapaTutorial.colocarPiso(21, 21, piso) // Setear el piso 2 numeros menos que el marco del mapa
		self.colocarHabitacionSpawn()
		self.colocarHabitacionDisparo()
		self.colocarHabitacionPelea()
		pincel.pintar(16, 18, muroCruz)
		pincel.pintar(20, 17, portal)
	}
	
	method colocarHabitacionSpawn(){
		pincel.pintar(16, 26, muroTNorte)
		pincel.pintarVerticalmente(16,25, 23, muroVertical)
		pincel.pintarVerticalmente(16,21, 19, muroVertical)
		pincel.pintarHorizontalmente(15,18, 25, muroHorizontal)
		pincel.pintar(26, 18, muroTEste)
		pincel.pintar(23, 22, spawn)
		self.colocarEntidad(tutorialMovimiento, game.at(20, 24))
	}
	
	method colocarHabitacionDisparo(){
		pincel.pintarHorizontalmente(15,18, 8, muroHorizontal)
		pincel.pintarHorizontalmente(6,18, 5, muroHorizontal)
		pincel.pintar(4, 18, muroTOeste)
		self.colocarEntidad(tutorialAtaque, game.at(12, 24))
	}
	
	method colocarHabitacionPelea(){
		pincel.pintarVerticalmente(16,19, 13, muroVertical)
		pincel.pintarVerticalmente(16,11, 5, muroVertical)
		pincel.pintar(16, 4, muroTSur)
		self.colocarEntidad(escapandoUNQ, game.at(12, 17))
	}
	
	//Esto se puede reemplazar por game.addVisualIn(elemento, posicion)
	method colocarEntidad(entidad, posicion){ 
		entidad.position(posicion)
		game.addVisual(entidad)
	}
}
