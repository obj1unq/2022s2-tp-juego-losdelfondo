import wollok.game.*
import obstaculos.*

object pincel {
	
	method pintar(px, py, objeto) {
		return objeto.nuevo(game.at(px, py))
	}
	
	method pintarVerticalmente(px, py, pl, objeto) {
		new Range(start= py, end= pl).forEach{ y =>
			self.pintar(px, y, objeto)
		}
	}
	
	method pintarHorizontalmente(px, py, pl, objeto) {
		new Range(start= px, end= pl).forEach{ x =>
			self.pintar(x, py, objeto)
		}
	}
}



object mapa {
	
	
}
