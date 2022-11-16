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
		const altoMaximo = centroMapa.y() + (alto/2).truncate(0)
		const altoMinimo = centroMapa.y() - (alto/2).truncate(0)
		const anchoMaximo = centroMapa.x() + (ancho/2).truncate(0)
		const anchoMinimo = centroMapa.x() - (ancho/2).truncate(0)
		pincel.pintar(anchoMinimo, altoMinimo, listaMuro.get(4))
		pincel.pintar(anchoMinimo, altoMaximo, listaMuro.get(5))
		pincel.pintar(anchoMaximo, altoMaximo, listaMuro.get(6))
		pincel.pintar(anchoMaximo, altoMinimo, listaMuro.get(7))
		pincel.pintarHorizontalmente(anchoMinimo+1, altoMinimo, anchoMaximo-1, listaMuro.get(1))
		pincel.pintarHorizontalmente(anchoMaximo-1, altoMaximo, anchoMinimo+1, listaMuro.get(0))
		pincel.pintarVerticalmente(anchoMinimo, altoMinimo+1, altoMaximo-1, listaMuro.get(2))
		pincel.pintarVerticalmente(anchoMaximo, altoMaximo-1, altoMinimo+1, listaMuro.get(3))
		
	}
	
	method colocarPiso(ancho, alto, pisoAColocar){
		const altoMaximo = centroMapa.y() + (alto/2).truncate(0)
		const altoMinimo = centroMapa.y() - (alto/2).truncate(0)
		const anchoMaximo = centroMapa.x() + (ancho/2).truncate(0)
		const anchoMinimo = centroMapa.x() - (ancho/2).truncate(0)
		(altoMinimo..altoMaximo).forEach({
			nivel => 
			pincel.pintarHorizontalmente(anchoMinimo, nivel, anchoMaximo, pisoAColocar)
		})
	}
}
