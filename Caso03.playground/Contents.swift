

// Clase Base
class Persona {
    var nombre: String
    var edad: Int

    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }

    func presentarse() {
        print("👋 Hola, soy \(nombre) y tengo \(edad) años.")
    }
}

// Clase Hija: Estudiante
class Estudiante: Persona {
    var curso: String

    init(nombre: String, edad: Int, curso: String) {
        self.curso = curso
        super.init(nombre: nombre, edad: edad)
    }

    override func presentarse() {
        print("👨‍🎓 Soy el estudiante \(nombre), tengo \(edad) años y estudio \(curso).")
    }
}

// Clase Hija: Profesor
class Profesor: Persona {
    var especialidad: String

    init(nombre: String, edad: Int, especialidad: String) {
        self.especialidad = especialidad
        super.init(nombre: nombre, edad: edad)
    }

    override func presentarse() {
        print("👨‍🏫 Soy el profesor \(nombre), tengo \(edad) años y enseño \(especialidad).")
    }
}


// Comprobación/

let estudiante = Estudiante(nombre: "Rafael", edad: 20, curso: "Programación")
let profesor = Profesor(nombre: "Jaime", edad: 45, especialidad: "Moviles")

estudiante.presentarse()
profesor.presentarse()
