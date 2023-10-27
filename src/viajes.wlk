class Viajes {
	const idiomas = #{}
	
	method idiomas() = idiomas
	
	method implicaEsfuerzo() = true
	
	method sirveParaBroncearse() = true
	
	method cuantosDiasLleva()
}

class ViajesDePlaya inherits Viajes {
	const largoPlaya
	
	override method cuantosDiasLleva() = largoPlaya / 500
	
	override method implicaEsfuerzo() = largoPlaya > 1200
}

class ExcursionCiudad inherits Viajes {
	const property atraccionesAVisitar
	
	override method cuantosDiasLleva() = self.atraccionesAVisitar() / 2
	
	override method implicaEsfuerzo() = self.atraccionesAVisitar().between(4, 9)
	
	override method sirveParaBroncearse() = false
}

class ExcursionCiudadTropical inherits ExcursionCiudad {
	
	override method atraccionesAVisitar() = super() + 1
	
	override method sirveParaBroncearse() = true
}