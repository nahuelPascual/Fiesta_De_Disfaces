import Disfraz.*

class Fiesta {
	const fecha
	var invitados
	const lugar
	
	method esUnBodrio() = invitados.forEach{inv=>!inv.estaConforme()}
	method mejorDisfraz() = invitados.map{inv=>inv.disfraz()}.max{disfr=>disfr.puntuacion()}
	method intercambiar(p1, p2) {
		if (!self.estaInvitado(p1) || !self.estaInvitado(p2)) return false;
		return (!p1.estaConforme() || !p2.estaConforme()) && 
				p1.estaConforme(p2.disfraz()) && p2.estaConforme(p1.disfraz())
	}
	method estaInvitado(persona) = invitados.any{invitado=>invitado==persona}
	method agregarAsistente(asist) {
		if (invitados.any{inv=>inv==asist}) throw new Exception("ya está invitado")
		if (asist.disfraz()==sinDisfraz) throw new Exception("debe tener disfraz")
	}
	method fiestaInolvidable() = invitados.forEach{inv=>inv.esSexy() && inv.estaConforme()}
}
