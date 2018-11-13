import Disfraz.*

class Invitado {
	var edad
	var property disfraz = sinDisfraz
	var personalidad
	
//	constructor(age, disfr){
//		edad=age
//		disfraz=disfr
//	}
	
	method esViejo() = edad>50
	method esJoven() = edad<30
	method esSexy() = personalidad.esSexy(self)
	method estaConforme() = self.estaConforme(disfraz)
	method estaConforme(traje) = traje.puntuacion()>10 && self.condicionAdicional(traje)
	method condicionAdicional(traje) = true
}

class Personalidad { method esSexy(persona) }
object alegre inherits Personalidad { override method esSexy(persona)=false }
object tacirno inherits Personalidad { override method esSexy(persona)=persona.esJoven() }
//object cambiante { }

class Caprichoso inherits Invitado {
	override method condicionAdicional(traje) = traje.nombre().length()%2 == 0
}
class Pretensioso inherits Invitado {
	override method condicionAdicional(traje) = traje.antiguedad().days()<30
}
class Numerologo inherits Invitado {
	var cifra
	constructor(val) {
		cifra = val
	}
	override method condicionAdicional(traje) = traje.puntuacion() == cifra
}
