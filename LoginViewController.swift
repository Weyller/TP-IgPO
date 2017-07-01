//
//  LoginViewController.swift
//  igPO
//
//  Created by eleves on 2017-06-21.
//  Copyright © 2017 Mario Geneau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var retypePassword: UITextField!
    //------------------
    @IBAction func bouttonAcceder(_ sender: UIButton) {
        
        
        if user.text == "" || password.text == ""
        {
            return
        }
        if user.text == "user" && password.text == "password"
        {
           performSegue(withIdentifier: "affichage", sender: nil)
           
            
        }
        
        
    }
    //------------------
    
    
    @IBAction func bouttonInscription(_ sender: UIButton) {
        
        
    }
    
    
    
    
    //------------------
    override func viewDidLoad() {
        
       // <#code#>
    }

}
