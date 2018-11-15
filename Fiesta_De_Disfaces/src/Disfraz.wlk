class Disfraz {
	const property nombre
	const fechaConfeccion
	const caracteristicas = #{} //set
	
	constructor(name, fecha){
		nombre=name
		fechaConfeccion=fecha
	}	
	
	method puntuacion(persona) = caracteristicas.sum{c=>c.puntuacion(persona)}
	method antiguedad() = fechaConfeccion - new Date()
	
	/* Código boilerplate 
	* method agregarCaracteristica(nuevaCaract) { caracteristicas.add(nuevaCaract) }
	*/
}

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
	method puntuacion(persona) = if (self.fuecompradoConAnticipacion()) 5 else 3
	method fuecompradoConAnticipacion() = self.diasDesdeCompra()>=2
	// se asume HOY como día de la fiesta
	method diasDesdeCompra() = (new Date().minusDays(fechaDeCompra)).days() 
}
object sexy {
	method puntuacion(persona) = if (persona.esSexy()) 15 else 2
}
class Careta {
	const personaje
	method puntuacion() = personaje.puntuacion()
}
class Personaje {
	const property puntuacion
	constructor(punt) {puntuacion=punt}
}
object mickeyMouse inherits Personaje(8) { }
object osoCarolina inherits Personaje(6) { }