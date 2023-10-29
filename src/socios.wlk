import actividades.*

class Socios {
	const actsRealizadas = [] 
	const maxActs
	const property edad
	const property idiomas
	
	method esAdoradorDelSol() = actsRealizadas.all({a => a.sirveParaBroncearse()})
	
	method actsEsforzadas() = actsRealizadas.filter({a => a.implicaEsfuerzo()})
	
	method agregarActsRealizadas(acts) {
		if(actsRealizadas.size() + acts.size() > maxActs) {
			self.error("Se sobrepaso el limite de actividades echas")
		}
		actsRealizadas.addAll(acts)
	}
}

class SocioTranquilo inherits Socios {
	
	method atraeAct(unaActividad) = unaActividad.cuantosDiasLleva() > 4
}

class SocioCoherente inherits Socios {
	
	method atraeAct(unaActividad) = (self.esAdoradorDelSol() and unaActividad.sirveParaBroncear()) or unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socios {
	
	method atraeAct(unaActividad) = not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}
