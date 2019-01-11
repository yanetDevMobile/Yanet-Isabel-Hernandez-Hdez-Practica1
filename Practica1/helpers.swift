//
//  helpers.swift
//  Practica1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation
class helpers{
    
    func leerContactos(_ contactos:[Int] = [0])->[Persona]{
        let contacto1 = Persona.init(nombre: "Pedro", fechanacimiento: "12/01/1992", domicilio: "Av Aztecas", edad: "26 años",parentesco: "Primo")
        let contacto2 = Persona.init(nombre: "Saul", fechanacimiento: "09/01/1991", domicilio: "Totonacas ", edad: "27 años",parentesco: "Tio")
        let contacto3 = Persona.init(nombre: "Lucy", fechanacimiento: "13/01/1990", domicilio: "Ciudad de Mexico ", edad: "28 años", parentesco: "Hermana")
        let contacto4 = Persona.init(nombre: "Juan", fechanacimiento: "02/04/1990", domicilio: "Ciudad de Mexico ", edad: "28 años", parentesco: "Primo")
        let contacto5 = Persona.init(nombre: "Carlos", fechanacimiento: "02/03/1995", domicilio: "Ciudad de Mexico ", edad: "23 años", parentesco: "Hermano")
        var   arrayContac = [contacto1,contacto2 ,contacto3, contacto4, contacto5];
        //var mySetPuestosA : Set <Evento> = [evento1,evento2,evento3];
        return arrayContac
    }
    
   
    
    

func registros(_registros:[Int] = []) -> [RegistroEmpleado] {
    let registro = RegistroEmpleado.init(nombre: "ok", puesto: "ok", numeroEmpleado: "ok", correoElec: "ok")
    var arrayRegistro  = [registro]
    return arrayRegistro

}

}

