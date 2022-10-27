import wollok.game.*


class Direccion{
	
	method posicion(_posicion_)
	
	method puedeMoverseA(personaje){
		return self.posicion(personaje.position()).allElements().all({elemento => elemento.sePuedeAtravesar()})
	}
}

class Arriba inherits Direccion{
	
	override method posicion(posicion)= posicion.up(1) 
	
}

class Abajo inherits Direccion{
	
	override method posicion(posicion)= posicion.down(1)	
	

}

class Derecha inherits Direccion{
	
	override method posicion(posicion)= posicion.right(1)
	

}

class Izquierda inherits Direccion{
	
	override method posicion(posicion)= posicion.left(1)
	

}