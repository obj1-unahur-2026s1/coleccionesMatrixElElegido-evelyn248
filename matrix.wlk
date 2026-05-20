object neo {
    var energia = 100
            
    method esElegido() = true

    method vitalidad() = energia / 10

    method saltar(){energia = energia - energia/2}
   
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

        
    method esElegido() = false

    method cambiarVitalidad(unValor){vitalidad = unValor}
    
    method saltar(){
        vitalidad = vitalidad - 1
        estaCansado = !estaCansado
    }

    method vitalidad() = vitalidad

}

object trinity {
      
        
    method esElegido() = false

    method vitalidad() = 0

    method saltar(){}

}

object nave{

    const pasajeros =[neo, morfeo, trinity]

    method cantidadDePasajeros() = pasajeros.size()
    

    method agregarPasajero(unPasajero) {pasajeros.add(unPasajero)}

    method bajarPasajero(unPasajero) {pasajeros.remove(unPasajero)}

    method pasajeroMayorVitalidad() {
        return 
            pasajeros.max ({ p => p.vitalidad() })
    }

    method pasajeroMenorVitalidad() {
        return pasajeros.min({p => p.vitalidad()})
    }

    method vitalidadEquilibrada() {
        return 
            self.pasajeroMayorVitalidad().vitalidad() <= (self.pasajeroMenorVitalidad().vitalidad() * 2)
      
    }

    method estaElElegido(){
        return 
            pasajeros.any({p => p.esElegido()})
    }

    method chocarNave(){
        pasajeros.forEach({p => 
            p.saltar()
            self.bajarPasajero(p)
            })
    }

    method acelerarNave(){
        pasajeros.filter({
            p => not p.esElegido()
        }).forEach({
            p => p.saltar()
        })

    }
} 