class Actividades {
	const idiomas = #{}
	
	method idiomas() = idiomas
	method agregarIdiomas(unosIdiomas) {
		idiomas.addAll(unosIdiomas)
	}
	
	method implicaEsfuerzo() = true
	
	method sirveParaBroncearse() = true
	
	method cuantosDiasLleva()
	
	method esInteresante() = idiomas.size() > 1
	
	method esUnViaje()
	
	method esRecomendableParaSocio(unSocio) = self.esInteresante() and unSocio.leAtraeActividad(self) and not unSocio.actividades().contains(self)
}

class ActividadesDePlaya inherits Actividades {
	const largoPlaya
	
	override method cuantosDiasLleva() = largoPlaya / 500
	
	override method implicaEsfuerzo() = largoPlaya > 1200
	
	override method esUnViaje() = true
}

class ExcursionCiudad inherits Actividades {
	const property atraccionesAVisitar
	
	override method cuantosDiasLleva() = self.atraccionesAVisitar().div(2)
	
	override method implicaEsfuerzo() = self.atraccionesAVisitar().between(5, 8)
	
	override method sirveParaBroncearse() = false
	
	override method esInteresante() = super() or atraccionesAVisitar == 5
	
	override method esUnViaje() = true
}

class ExcursionCiudadTropical inherits ExcursionCiudad {
	
	override method atraccionesAVisitar() = super() + 1
	
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Actividades {
	const kmADeSenderosRecorrer
	const diasDeSolPorAnio
	
	override method cuantosDiasLleva() = kmADeSenderosRecorrer / 50
	
	override method implicaEsfuerzo() = kmADeSenderosRecorrer > 80
	
	override method sirveParaBroncearse() = diasDeSolPorAnio > 100 and kmADeSenderosRecorrer > 120
	
	override method esInteresante() = super() and diasDeSolPorAnio > 140
	
	override method esUnViaje() = true
}

class Gimnasia inherits Actividades {
	
	override method idiomas() = #{"español"}
	
	override method cuantosDiasLleva() = 1
	
	override method sirveParaBroncearse() = false
	
	override method esRecomendableParaSocio(unSocio) = unSocio.edad().between(20,30)
}

class TallerLiterario inherits Actividades {
	const libros = []
	
	method idiomasUsados() = libros.map({l => l.idioma()})
	
	override method cuantosDiasLleva() = libros.size() + 1
	
	method autores() = libros.map({l => l.autor()}).asSet()
	
	override method implicaEsfuerzo() = (libros.any({l => l.paginas() >= 500}) or self.autores().size() == 1) and libros.size() > 1
	
	override method sirveParaBroncearse() = false
	
	override method esRecomendableParaSocio(unSocio) = unSocio.idiomas().size() > 1
}

class Libro {
	const property idioma
	const property paginas
	const property autor
}