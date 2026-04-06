import Foundation

enum Paises {
    case Rusia
    case USA
    case China
}



class Tripulante {
    var nombre: String
    var especialidad: String

    init(nombre: String, especialidad: String) {
        self.nombre = nombre
        self.especialidad = especialidad
    }
}

class NaveEspacial {
    
    var nombre: String
    var pais: Paises
    
    init(nombre: String, pais: Paises) {
        self.nombre = nombre
        self.pais = pais
    }
    
    func obtenerInformacion() {
        print("Nave: \(nombre) | País: \(pais)")
    }
}

protocol ServiciosVitales {
    func estadoServiciosHigienicos() -> Bool
    func estadoCocina() -> Bool
}

class NaveEspacialMarte: NaveEspacial, ServiciosVitales {
    
    var tripulantes: [Tripulante]
    
    init(nombre: String, pais: Paises, tripulantes: [Tripulante]) {
        self.tripulantes = tripulantes
        super.init(nombre: nombre, pais: pais)
    }
    
    func estadoServiciosHigienicos() -> Bool {
        return true
    }
    
    func estadoCocina() -> Bool {
        return true
    }
    
    func mostrarTripulacion() {
        print("Tripulación:")
        for t in tripulantes {
            print("- \(t.nombre) | \(t.especialidad)")
        }
    }
}


// Crear tripulantes
let t1 = Tripulante(nombre: "Rafael", especialidad: "Ingeniero")
let t2 = Tripulante(nombre: "Luis", especialidad: "Piloto")

// Crear nave
let nave = NaveEspacialMarte(
    nombre: "MarsX",
    pais: .USA,
    tripulantes: [t1, t2]
)

// Mostrar información
nave.obtenerInformacion()
nave.mostrarTripulacion()

print("Servicios Higiénicos OK:", nave.estadoServiciosHigienicos())
print("Cocina OK:", nave.estadoCocina())
