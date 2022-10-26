import wollok.game.*

object arriba{
	
	method posicion(posicion)= posicion.up(1) 
	
	method puedeMoverseA(personaje){
		return self.posicion(personaje.position()).allElements().all({elemento => elemento.sePuedeAtravesar()})
	}
}

object abajo{
	
	method posicion(posicion)= posicion.down(1)	
	
	method puedeMoverseA(personaje){
		return self.posicion(personaje.position()).allElements().all({elemento => elemento.sePuedeAtravesar()})
		
	}
}

object derecha{
	
	method posicion(posicion)= posicion.right(1)
	
	method puedeMoverseA(personaje){
		return self.posicion(personaje.position()).allElements().all({elemento => elemento.sePuedeAtravesar()})
		
	}
}

object izquierda{
	
	method posicion(posicion)= posicion.left(1)
	
	method puedeMoverseA(personaje){
		return self.posicion(personaje.position()).allElements().all({elemento => elemento.sePuedeAtravesar()})
		
	}
}