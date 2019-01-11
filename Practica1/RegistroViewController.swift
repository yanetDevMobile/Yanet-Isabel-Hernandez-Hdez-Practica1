//
//  RegistroViewController.swift
//  Practica1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var alertRegistro: UILabel!
    @IBOutlet weak var contraseñaTxt: UITextField!
    @IBOutlet weak var telefonoTxt: UITextField!
    @IBOutlet weak var numeroEmpleadoTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var conContraseñaTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var alertContraseña: UILabel!
    @IBOutlet weak var alertTelefono: UILabel!
    @IBOutlet weak var alertNumeroEmpleado: UILabel!
    @IBOutlet weak var alertCorreo: UILabel!
    @IBOutlet weak var alertConfContraseña: UILabel!
    @IBOutlet weak var alertNName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func registrarBtn(_ sender: UIButton) {
        if((nameTxt.text?.isEmpty)! || (conContraseñaTxt.text?.isEmpty)!||(emailTxt.text?.isEmpty)! || (numeroEmpleadoTxt.text?.isEmpty)! || (telefonoTxt.text?.isEmpty)!  || (contraseñaTxt.text?.isEmpty)!){
            alertRegistro.text = "Complete todos los cambios para  continuar con el registro"
            
        }else{
            alertRegistro.text = "Registro Exitoso"
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
