//
//  EmpleadoViewController.swift
//  Practica1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import CoreData

class EmpleadoViewController: UIViewController {

    @IBOutlet weak var puestoLbl: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var avisoLbl: UILabel!
    @IBOutlet weak var numeroEmpleado: UITextField!
    @IBOutlet weak var correoTxt: UITextField!
    @IBOutlet weak var puestoTxt: UITextField!
    @IBOutlet weak var nombreTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
      
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func addButton(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let empleado = Empleado(context: context)
        empleado.nombre = nombreTxt.text
        empleado.puesto = puestoTxt.text
        empleado.correo = correoTxt.text
        empleado.numeroEmpleado = numeroEmpleado.text
        appDelegate.saveContext()
        avisoLbl.text = "Informacion guardada correctamente"
        nombre.text = empleado.nombre
        puestoLbl.text = empleado.puesto
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
