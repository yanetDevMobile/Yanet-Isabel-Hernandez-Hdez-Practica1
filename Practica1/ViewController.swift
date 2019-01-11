//
//  ViewController.swift
//  Practica1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    }

    var registro  = Registro.init(nombre: "Yanet", confContraseña:"Isabel", fechaNac: "20/02/1992", numeroEmpleado: "345678", correoElec: "yanet@gmail", telefono: "556789990", contraseña: "Isabel")
    
    
    @IBOutlet weak var userText: UITextField!
    
  
    @IBOutlet weak var contraseñaText: UITextField!
     @IBOutlet weak var textAlert: UILabel!
    
    func validarRegistro() -> Bool{
        var bandera = false
        if(registro.nombre == userText.text && registro.contraseña == contraseñaText.text){
          bandera = true
        }else {
            bandera = false
            
            
        }
         return bandera
        }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var shoulbe = false
        if(validarRegistro()){
            shoulbe = true
        }else{
        textAlert.text = "EL USUARIO NO EXISTE"
            
        }
        return shoulbe
        
    }
   
    
    
    @IBAction func iniciaSesionBtn(_ sender: UIButton) {
        let uriString = "\(Constantes.URL_DESA.apiWSLogin)?username=\(userText.text!)&password=\(contraseñaText.text!.toBase64())"
        let request = URLRequest(url: URL(string:uriString)!)
        let task = URLSession.shared.dataTask(with: request){
            (data, response,error) in
            if(error != nil){
                print("Se produjo un error\(error)")
            }else{
                if let info = data
                {
                    do{
                        var jsonResult = try JSONDecoder().decode(loginResult.self, from: info)
                        print(jsonResult)
                        DispatchQueue.main.async {
                            if jsonResult.status{
                               print(jsonResult)
                                
                            }else{
                                print(jsonResult)
                                
                            }
                        }
                    }catch{
                        
                    }
                }
            }
            
        }
        task.resume()

        
    }
    @IBAction func loginBtn(_ sender: UIButton) {
        let uriString = "\(Constantes.URL_DESA.apiWSLogin)?username=\(userText.text!)&password=\(contraseñaText.text!.toBase64())"
        let request = URLRequest(url: URL(string:uriString)!)
        let task = URLSession.shared.dataTask(with: request){
            (data, response,error) in
            if(error != nil){
                print("Se produjo un error\(error)")
            }else{
                if let info = data
                {
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: info) as![String: AnyObject]
                        print(jsonResult)
                    }catch{
                        
                    }
                }
            }
            
        }
        task.resume()
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nameUser: String!
         nameUser = registro.nombre
       
            if segue.identifier == "segue" {
           //Obtenemos la referencia del siguiente view controller
            let welcomeViewControler = segue.destination as! WelcomeViewController
            //Aqui pasas la variable de información al siguiente view controller
            welcomeViewControler.nombre = nameUser
        }
    }
   // MARK: - AlertController
    
        func buttonPressed(_ sender: Any) {
            let alerta: UIAlertController = UIAlertController.init(title: "App dice", message: "EL usuario no coincide", preferredStyle: UIAlertController.Style.alert);
            
            let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
            
            let okAlerta2 = UIAlertAction.init(title: "Cancelar", style: .destructive, handler: nil)
            
            alerta.addAction(okAlerta)
            alerta.addAction(okAlerta2)
            
            present(alerta, animated: true, completion: nil);
            
        }
    
}


