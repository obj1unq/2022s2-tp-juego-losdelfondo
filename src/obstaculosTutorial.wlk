import wollok.game.*
import obstaculos.*

object piso {
	method nuevo(posicion) {
		return game.addVisual(new Piso(position = posicion, image="assets/pisos/pebble_brown_0_new.png"))
	}
}

object puerta {
	/*	
	El objeto puerta define una nueva puerta en el mapa, a partir de una posicion e 
	imagen dada.	
	*/
	method nuevo(posicion, imagen) {
		return (new Puerta(position = posicion, image = imagen))
	}
}

object muroNorte {
	/*El objeto obstaculo define un nuevo obstaculo en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image="assets/muros/shallow_water_wave_south_new.png"))
	}
}

object muroSur {
	/*El objeto obstaculo define un nuevo obstaculo en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image="assets/muros/shallow_water_wave_north_new.png"))
	}
}

object muroEste {
	/*El objeto obstaculo define un nuevo obstaculo en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image="assets/muros/shallow_water_wave_west_new.png"))
	}
}

object muroOeste {
	/*El objeto obstaculo define un nuevo obstaculo en el mapa, a partir de una posicion.*/
	method nuevo(posicion) {
		return game.addVisual(new Muro(position = posicion, image="assets/muros/shallow_water_wave_east_new.png"))
	}
}
