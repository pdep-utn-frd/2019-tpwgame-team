
import wollok.game.*

object isaaac {
	var property monedas = 0

	var property position = game.at(3,3)
	method image() = "isaaac.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method agarrarMoneda(){
		monedas += 1
	}
	method agarro20(){
		return monedas >= 20
	}
	}

	

