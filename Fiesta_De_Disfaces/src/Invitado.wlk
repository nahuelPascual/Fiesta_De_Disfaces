import Disfraz.*

class Invitado {
	var edad
	var property disfraz
	var property personalidad
	
	constructor(age, _personalidad){ 
		edad=age
		personalidad = _personalidad
	}
	
	method esViejo() = edad>50
	method esJoven() = edad<30
	method esSexy() = personalidad.esSexy(self)
	method estaConforme() = self.estaConforme(disfraz)
	method estaConforme(traje) = traje.puntuacion()>10 && self.condicionAdicional(traje)
	method condicionAdicional(traje) = true
	method tieneDisfraz() = disfraz==null
}

/* Personalidades */
object alegre { method esSexy(persona)=false }
object taciturno { method esSexy(persona)=persona.esJoven() }
object cambiante { 
	const personalidades = [alegre, taciturno]
	method esSexy(persona){ personalidades.anyOne().esSexy(persona) }
}

/* Tipos de invitado */
class Caprichoso inherits Invitado {
	override method condicionAdicional(traje) = traje.nombre().length().even()
}
class Pretensioso inherits Invitado {
	override method condicionAdicional(traje) = traje.antiguedad().days()<30
}
class Numerologo inherits Invitado {
	var cifra
	constructor(edad, personalidad, val) = super(edad, personalidad) {
		cifra = val
	}
	override method condicionAdicional(traje) = traje.puntuacion() == cifra
}

/*
 * var property (ejemplo Numerologo)
 * constructores y variables sin inicializar
 */
