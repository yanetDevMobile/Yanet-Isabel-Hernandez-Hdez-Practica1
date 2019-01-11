//
//  PersonasVisitaViewController.swift
//  Practica1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class PersonasVisitaViewController: UIViewController {
 var arrayContac : [Persona] = helpers.init().leerContactos();

    @IBOutlet weak var listaPersonasTbl: UITableView!
    var selectPerson : String!

   // let persona2 =  Persona.init(nombre:"Juan", fechanacimiento: "02/04/1990", domicilio: "Ciudad de Mexico ", edad: "28 años", parentesco: "Primo")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaPersonasTbl.delegate = self
        self.listaPersonasTbl.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nameUser: String!
        nameUser = selectPerson
            if segue.identifier == "segue" {
            //Obtenemos la referencia del siguiente view controller
            let rutasViewControler = segue.destination as! RutasViewController
            //Aqui pasas la variable de información al siguiente view controller
            rutasViewControler.nombre = nameUser
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
extension PersonasVisitaViewController: UITableViewDelegate,  UITableViewDataSource{
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return arrayContac.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Celda")
        cell.textLabel?.text  = arrayContac[indexPath.row].nombre
       
        if(arrayContac[indexPath.row].nombre == "Pedro" || arrayContac[indexPath.row].nombre == "Juan"){
            cell.accessoryType = .detailDisclosureButton
        }
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(arrayContac[indexPath.row].nombre == "Pedro" || arrayContac[indexPath.row].nombre == "Juan"){
                selectPerson = arrayContac[indexPath.row].nombre
               self.performSegue(withIdentifier: "segue", sender: nil)
            
        }

    }
}

