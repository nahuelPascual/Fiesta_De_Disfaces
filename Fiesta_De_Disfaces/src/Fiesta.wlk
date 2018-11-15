import Disfraz.*

class Fiesta {
	const fecha
	const invitados = []
	const lugar
	
	method esUnBodrio() = invitados.forEach{inv=>!inv.estaConforme()}
	method mejorDisfraz() = invitados.map{inv=>inv.disfraz()}.max{disfr=>disfr.puntuacion()}
	
	method puedenIntercambiarDisfraz(p1, p2) {
		if (!self.estaInvitado(p1) || !self.estaInvitado(p2)) return false
		return self.algunoDisconforme(p1, p2) && self.quierenIntercambiar(p1, p2)
	}
	method estaInvitado(persona) = invitados.any{invitado=>invitado==persona}
	method algunoDisconforme(p1, p2) = !p1.estaConforme() || !p2.estaConforme()
	method quierenIntercambiar(p1, p2) = p1.estaConforme(p2.disfraz()) && p2.estaConforme(p1.disfraz())
	
	method agregarAsistente(invitado) {
		self.validarInvitado(invitado)
		invitados.add(invitado)
	}
	method validarInvitado(invitado) {
		if (self.estaInvitado(invitado)) throw new Exception("esta persona ya está invitada a la fiesta")
		if (!invitado.tieneDisfraz()) throw new Exception("los invitados deben tener disfraz para poder asistir a la fiesta")
	}
}

object fiestaInolvidale inherits Fiesta {
	override method validarInvitado(invitado){
		super(invitado)
		if(!invitado.esSexy()) throw new Exception ("esta persona no es sexy, no puede ser invitada")
		if(!invitado.estaConforme()) throw new Exception ("esta persona no esta conforme con su disfraz, no puede ser invitada")
	}
}
