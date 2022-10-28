import wollok.game.*

class Enemigo {
	
	method image()
	
	method sePuedeAtravesar()
}

object milei inherits Enemigo{
	
	var property position = game.at(0,10)

	override method image() = "milei/quieto_mirando_derecha.png"
	
	override method sePuedeAtravesar() = true

}
object fidel inherits Enemigo{

	var property position = game.at(20,20)

	override method image() = "old_man/quieto_mirando_derecha.png"
	
	override method sePuedeAtravesar() = true
}