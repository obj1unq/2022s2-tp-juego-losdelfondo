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

class Mapa {
	
	const centroMapa = game.center()
	
	method setearMarcoInicial(ancho, alto, listaMuro){
		const altoMaximo = centroMapa.y() + (alto/2)
		const altoMinimo = centroMapa.y() - (alto/2)
		const anchoMaximo = centroMapa.x() + (ancho/2)
		const anchoMinimo = centroMapa.x() - (ancho/2)
		pincel.pintarHorizontalmente(anchoMinimo, altoMinimo, anchoMaximo, listaMuro.get(1))
		pincel.pintarHorizontalmente(anchoMaximo, altoMaximo, anchoMinimo, listaMuro.get(0))
		pincel.pintarVerticalmente(anchoMinimo, altoMinimo, altoMaximo, listaMuro.get(2))
		pincel.pintarVerticalmente(anchoMaximo, altoMaximo, altoMinimo, listaMuro.get(3))
		
	}
	
	method colocarPiso(ancho, alto, pisoAColocar){
		const altoMaximo = centroMapa.y() + (alto/2)
		const altoMinimo = centroMapa.y() - (alto/2)
		const anchoMaximo = centroMapa.x() + (ancho/2)
		const anchoMinimo = centroMapa.x() - (ancho/2)
		(altoMinimo..altoMaximo).forEach({
			nivel => 
			pincel.pintarHorizontalmente(anchoMinimo, nivel, anchoMaximo, pisoAColocar)
		})
	}
}
