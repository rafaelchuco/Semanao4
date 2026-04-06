import Foundation

enum TipoTraccion {
    case Delantera
    case Trasera
    case Doble
}


class Vehiculo {
    
    var marca: String
    var modelo: String
    var fabricante: String
    var anho: Int
    var nroPasajeros: Int
    
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int) {
        self.marca = marca
        self.modelo = modelo
        self.fabricante = fabricante
        self.anho = anho
        self.nroPasajeros = nroPasajeros
    }
    
    func obtenerInformacion() -> String {
        return " \(marca) \(modelo) - \(fabricante) (\(anho)) | Pasajeros: \(nroPasajeros)"
    }
}

protocol Accesorios {
    func tieneSillaCueros() -> Bool
    func tieneAireAcondicionado() -> Bool
}

class Sedan: Vehiculo {
    
}

class SUV: Vehiculo {
    
    var tipoTraccion: TipoTraccion
    
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int, tipoTraccion: TipoTraccion) {
        self.tipoTraccion = tipoTraccion
        super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros)
    }
    
    override func obtenerInformacion() -> String {
        return super.obtenerInformacion() + " | Tracción: \(tipoTraccion)"
    }
}

class SUVHibrido: SUV {
    
    var autonomiaKm: Int
    
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int, tipoTraccion: TipoTraccion, autonomiaKm: Int) {
        self.autonomiaKm = autonomiaKm
        super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros, tipoTraccion: tipoTraccion)
    }
}

class SUVDeluxeHibrido: SUVHibrido, Accesorios {
    
    override func obtenerInformacion() -> String {
        return super.obtenerInformacion() + " | Autonomía: \(autonomiaKm) km | Deluxe"
    }
    
    func tieneSillaCueros() -> Bool {
        return true
    }
    
    func tieneAireAcondicionado() -> Bool {
        return true
    }
}

class Autobus: Vehiculo {
    
}

class AutobusElectrico: Autobus {
    
    var autonomia: Int
    
    init(marca: String, modelo: String, fabricante: String, anho: Int, nroPasajeros: Int, autonomia: Int) {
        self.autonomia = autonomia
        super.init(marca: marca, modelo: modelo, fabricante: fabricante, anho: anho, nroPasajeros: nroPasajeros)
    }
    
    override func obtenerInformacion() -> String {
        return super.obtenerInformacion() + " |  Autonomía: \(autonomia) km"
    }
}


let sedan = Sedan(marca: "Toyota", modelo: "Corolla", fabricante: "Japón", anho: 2022, nroPasajeros: 5)

let suv = SUV(marca: "Ford", modelo: "Explorer", fabricante: "USA", anho: 2023, nroPasajeros: 7, tipoTraccion: .Doble)

let suvDeluxe = SUVDeluxeHibrido(
    marca: "BMW",
    modelo: "X5 Hybrid",
    fabricante: "Alemania",
    anho: 2024,
    nroPasajeros: 5,
    tipoTraccion: .Doble,
    autonomiaKm: 80
)

let busElectrico = AutobusElectrico(
    marca: "Volvo",
    modelo: "E-Bus",
    fabricante: "Suecia",
    anho: 2023,
    nroPasajeros: 40,
    autonomia: 300
)

// Mostrar resultados
print(sedan.obtenerInformacion())
print(suv.obtenerInformacion())
print(suvDeluxe.obtenerInformacion())

print("Silla de cuero:", suvDeluxe.tieneSillaCueros())
print("Aire acondicionado:", suvDeluxe.tieneAireAcondicionado())

print(busElectrico.obtenerInformacion())
