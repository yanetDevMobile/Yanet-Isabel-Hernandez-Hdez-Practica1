//
//  WelcomeViewController.swift
//  Practica1
//
//  Created by usuario on 1/8/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var nombre : String?
    @IBOutlet weak var nameUser: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameUser.text = nombre
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
