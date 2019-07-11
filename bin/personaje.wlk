import coleccionables.* 

import wollok.game.*

object isaaac {
	var property monedas = 0

	var property position = game.at(3,3)
	method image() = "isaaac.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method agarrarMoneda(moneda){
		game.removeVisual(moneda)
		juego.restarMoneda()
		monedas += 1
		game.say(self,"Me quedan: " + juego.monedasenpantalla().toString())
		
		juego.verSiTermina()
	}
	}

object juego{
	const tiposdemoneda = ["coin1.png","coin2.png"]
	var property  monedasenpantalla = 0
	method restarMoneda(){
		monedasenpantalla -= 1
	}
	method agregarMoneda(){
		monedasenpantalla += 1
		game.addVisualIn(new Moneda(image = tiposdemoneda.anyOne(), valor = 1.randomUpTo(10)), game.at(1.randomUpTo(game.width()).roundUp(), 1.randomUpTo(game.height()).roundUp()))
		
	}
	method noHayMonedas(){
		return monedasenpantalla == 0
	}
	method verSiTermina(){
		if (self.noHayMonedas()){
			game.say(isaaac ,"JUEGO TERMINADO" )
			game.removeTickEvent("AgregarMoneda")
			game.say(isaaac , "Presione Enter para cerrar")
			keyboard.enter().onPressDo {game.stop() }
			
		}
	}
}
	

