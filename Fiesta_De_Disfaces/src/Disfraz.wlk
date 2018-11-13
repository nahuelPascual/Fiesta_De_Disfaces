class Disfraz {
	const nombre
	const fechaConfeccion
	var caracteristicas 
	
	constructor(name, fecha){
		nombre=name
		fechaConfeccion=fecha
	}	
	
	method puntuacion(persona) = caracteristicas.sum{c=>c.puntuacion(persona)}
	method antiguedad() = fechaConfeccion - new Date()
}

object sinDisfraz { }
/* Caracteristicas */
class Gracioso {
	var nivelDeGracia
//	constructor(gracia) super() {
//		
//	}
	method puntuacion(persona) = nivelDeGracia * self.multiplicador(persona)
	method multiplicador(persona) = if (persona.esViejo()) 3 else 1
}
class Tobara {
	const fechaDeCompra
	method puntuacion(persona) = if (self.estaGastado()) 5 else 3
	method estaGastado() = self.diasDesdeCompra()>1
	method diasDesdeCompra() = (new Date() - fechaDeCompra).days()
}
class Careta {
	const personaje
	method puntuacion() = personaje.puntuacion()
}
object mickeyMouse { const property puntuacion = 8}
object osoCarolina { const property puntuacion = 6}
class Sexy {
	method puntuacion(persona) = if (persona.esSexy()) 15 else 2
}