import coleccionables.* 

import wollok.game.*

object isaac {
	var property monedas = 0
	var property image = "isaac.png"
	var property position = game.at(3,3)

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
	method moverseArriba(){
		 self.move(self.position().up(1))
		image = "isaacatras.png"
	}
	method moverseAbajo(){
		self.move(self.position().down(1))
		image = "isaac.png"
	}
	method moverseDerecha(){
		self.move(self.position().right(1))
		image = "isaacderecha.png"
	}
	method moverseIzquierda(){
		self.move(self.position().left(1))
		image = "isaacizqurida.png"
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
			game.say(isaac ,"JUEGO TERMINADO" )
			game.removeTickEvent("AgregarMoneda")
			game.say(isaac , "Presione Enter para cerrar")
			keyboard.enter().onPressDo {game.stop() }
			
		}
	}
}
	

