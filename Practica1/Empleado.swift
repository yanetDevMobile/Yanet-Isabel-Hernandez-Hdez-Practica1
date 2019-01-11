//
//  Empleado.swift
//  Practica1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import Foundation

class Empleado {
    
    var nombre : String
    var puesto : String
    var numeroEmpleado : String
    var correoElec:String
    init(nombre: String, puesto : String  numeroEmpleado:String, correoElec :String) {
        self.nombre = nombre
        self.numeroEmpleado = numeroEmpleado
        self.correoElec = correoElec
        self.puesto = puesto
    }
}
