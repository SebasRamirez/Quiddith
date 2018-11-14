object mercadoDeEscobas{
	var valorArbitrario
	
	method valorArbitrario(){
		return valorArbitrario
	}
}
class Equipo{
	var jugadores 
	
	method jugadores(){
		return jugadores
	}
	method promedio(){
		return jugadores.map({jugador => jugador.habilidad()}).sum()/jugadores.size()
	}
	
	method tieneJugadorEstrella(equipoContrario){
		return jugadores.any({jugador => jugador.jugadorEstrella(equipoContrario)})
	}
	
	
	method jugarContra(otroEquipo){
		
	}
}


class Escoba{
	var salud 
	var fabricacion
	
	method velocidadEscoba(){
		return (80 - (new Date().year() - fabricacion)) * (salud / 100)
	}
	
	}

class Jugador{
	var skill
	var peso
	var escoba
	var equipo
	
	method nivelManejoEscoba(){
		return skill / peso
	}
	method velocidadJugador(){
		return escoba.velocidadEscoba() * self.nivelManejoEscoba()
	}
	
	method habilidad()
	
	method lePasaEltrapoA(jugador){
		return self.habilidad() > jugador.habilidad() * 2 
	}
	
	method esGroso(){
		return self.habilidad() > equipo.promedio() && self.velocidadJugador() > mercadoDeEscobas.valorArbitrario()
	}
	
	method jugadorEstrella(equipoContrario){
		return equipoContrario.all({jugador => self.lePasaEltrapoA(jugador)})
	}		
}

class Cazador inherits Jugador{
	var fuerza 
	var punteria
	var property tieneQuaffle 
	

	
	override method habilidad(){
		return self.velocidadJugador() + skill + punteria * fuerza 
	}
method agarrarQuaffle(){
	tieneQuaffle = true
}	
/*method jugar(){
	if(self.quaffle()){
		
	}
}*/
}

class Guardian inherits Jugador{
	var fuerza
	var reflejos
	
	
	override method habilidad(){
		return self.velocidadJugador() + skill + reflejos + fuerza
	}
}

class Golpeador inherits Jugador{
	var fuerza
	var punteria
	

	override method habilidad(){
		return self.velocidadJugador() + skill + punteria + fuerza
	}
}

class Buscador inherits Jugador{
	var vision
	var reflejos
	
	
	override method habilidad(){
		return self.velocidadJugador() + skill + reflejos* vision
	}
}








