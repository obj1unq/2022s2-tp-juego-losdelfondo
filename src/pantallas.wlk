import wollok.game.*

class Pantalla {
	
	var property image
	const property position = game.at(0, 0) 
	
	method iniciar(){
		game.clear()
		game.addVisual(self)
	}
}


object gameOver inherits Pantalla (image= "assets/pantallas/gameover.jpeg" ) {}

object victoria inherits Pantalla (image= "assets/pantallas/ganaste.jpeg" ) {}

//object fondo inherits Pantalla (image= "assets/pantallas/fondoMapa.png" ) {} 
