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
		const listaMuros = [muroNorte, muroSur, muroOeste, muroEste]
		mapaTutorial.setearMarcoInicial(15, 15, listaMuros)	
		mapaTutorial.colocarPiso(13, 13, piso)
	}
	
}
