import wollok.game.*
import obstaculosTutorial.*
import testMapa.*

object configuracionMapaTutorial {
	/*
		ACA VAN A ESTAR LAS CONFIGURACIONES DEL MAPA TUTORIAL, CUALQUIER CAMBIO QUE SE QUIERA REALIZAR SE TENDRA QUE 
		HACER A PARTIR DE ACA.
	*/
	const mapaTutorial = new Mapa()
	
	method cargarMapaTutorial(){
		const listaMuros = [muroNorte, muroSur, muroOeste, muroEste, muroSuroOeste, muroNoroOeste, muroNoroEste, muroSuroEste]
		mapaTutorial.setearMarcoInicial(23, 23, listaMuros)	
		mapaTutorial.colocarPiso(21, 21, piso) // Setear el piso 2 numeros menos que el marco del mapa
		self.colocarHabitacionSpawn()
		self.colocarHabitacionDisparo()
		self.colocarHabitacionPelea()
	}
	
	method colocarHabitacionSpawn(){
		pincel.pintarVerticalmente(16,25, 23, muroOeste)
		pincel.pintarVerticalmente(16,21, 19, muroOeste)
		pincel.pintarHorizontalmente(15,18, 25, muroSur)
	}
	
	method colocarHabitacionDisparo(){
		pincel.pintarHorizontalmente(15,18, 8, muroSur)
		pincel.pintarHorizontalmente(6,18, 5, muroSur)
	}
	
	method colocarHabitacionPelea(){
		pincel.pintarVerticalmente(16,19, 13, muroOeste)
		pincel.pintarVerticalmente(16,11, 5, muroOeste)
	}
}
