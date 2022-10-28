import wollok.game.*
import obstaculos.*

object pincel {
	
	method pintar(px, py, imagen) {
		return obstaculo.nuevo(game.at(px, py), imagen)
	}
	
	method pintarVerticalmente(px, py, pl, imagen) {
		new Range(start= py, end= pl).forEach{ y =>
			self.pintar(px, y, imagen)
		}
	}
	
	method pintarHorizontalmente(px, py, pl, imagen) {
		new Range(start= px, end= pl).forEach{ x =>
			self.pintar(x, py, imagen)
		}
	}
}



object mapa {
	
	
}
