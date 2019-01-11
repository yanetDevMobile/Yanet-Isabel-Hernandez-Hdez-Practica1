//
//  RecuperarContraseñaViewController.swift
//  Practica1
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class RecuperarContrasen_aViewController: UIViewController {

    @IBOutlet weak var alertSend: UILabel!
    @IBOutlet weak var correoTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     var registro  = Registro.init(nombre: "Yanet", confContraseña:"Isabel", fechaNac: "20/02/1992", numeroEmpleado: "345678", correoElec: "yanet@gmail", telefono: "556789990", contraseña: "Isabel")
    
    func validarRegistro() -> Bool{
        var bandera = false
        if(registro.correoElec == correoTxt.text){
            bandera = true
        }else {
            bandera = false
            
            
        }
        return bandera
    }

    @IBAction func sendBtn(_ sender: UIButton) {
        if(validarRegistro()){
            alertSend.text = "Se le ha enviado un correo, revise su bandeja"
        }else{
            alertSend.text = "Verifique su correo electronico"
        }
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
