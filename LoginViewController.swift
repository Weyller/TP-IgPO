//
//  LoginViewController.swift
//  igPO
//
//  Created by eleves on 2017-06-21.
//  Copyright © 2017 Mario Geneau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var aTitle: UILabel!
    @IBOutlet weak var aFieldUser: UITextField!
    @IBOutlet weak var aFieldPass: UITextField!
    @IBOutlet weak var aFieldRePass: UITextField!
    @IBOutlet weak var aLabelRePass: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    //------------------
   
    @IBOutlet weak var BackView: UIView!
    
    //------------------
    
    var defaults = UserDefaults.standard
    var user: String!
    var password: String!
    
    //------------------
    @IBAction func aButton(_ sender: UIButton) {
        
        
        let userName = aFieldUser.text
        let userPassword = aFieldPass.text;
        let userRepeatPassword = aFieldRePass.text;
        //-------------
        
        if defaults.object(forKey: "PASSWORD") == nil {
            // Check for empty fields
            if((userName?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!)
            {
                // Display alert message
                
                displayMyAlertMessage("All fields are required");
                
                return;
            }
            //---------------------------------
            
            //Check if passwords match
            if(userPassword != userRepeatPassword)
            {
                // Display an alert message
                displayMyAlertMessage("Passwords do not match");
                return;
                
            }
            //---------------------------
            
        }//===============================
        
        if defaults.object(forKey: "PASSWORD") == nil {
            defaults.set(aFieldPass.text, forKey: "PASSWORD")
            defaults.set(aFieldUser.text, forKey: "USER")
            
            
            // Display alert message with confirmation.
            displayMyAlertMessage("Registration successfull. Thank you!")
            //---------------------------------
            setLabelandButton()
            
        }
        else {
            user = defaults.object(forKey: "USER") as! String!
            password = defaults.object(forKey: "PASSWORD") as! String!
            
            // Check for empty fields
            if((userName?.isEmpty)! || (userPassword?.isEmpty)!)
            {
                // Display alert message
                displayMyAlertMessage("all fields required");
                return;
            }
            //---------------------------------
            if password == aFieldPass.text && user == aFieldUser.text {
                performSegue(withIdentifier: "affichage", sender: nil)
            }
            else{
                // Display an alert message
                displayMyAlertMessage("User or Password do not match");
                return;
                //----------------------------------
            }
        }
        
        
        
    }
    
    
    
    //------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //resetUserDefaults()// Reset user and password to Default values
        setLabelandButton()
        
        BackView.layer.cornerRadius = 5;
        BackView.layer.borderWidth = 3;
        BackView.layer.borderColor = UIColor.white.cgColor
      //-------------------------------------------
        
    }
    
    // ------------------------
    func setLabelandButton(){
        if defaults.object(forKey: "PASSWORD") == nil {
            aTitle.text = "INSCRIPTION"
            aFieldRePass.isHidden = false
            
            aButton.setTitle("M'INSCRIRE", for: .normal)
            
        }
        else {
            aTitle.text = "ENTRER IDENTIFIANTS"
            aButton.setTitle("ENTRER", for: .normal)
            aFieldPass.text = ""
            aFieldUser.text = ""
            aLabelRePass.isHidden = true
            aFieldRePass.isHidden = true
            aFieldPass.isSecureTextEntry = true
        }
    }
    
    //------------------
    func displayMyAlertMessage(_ userMessage:String)
    {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
        
    }
    
    //--------------------
    func resetUserDefaults()
    {
        defaults.removeObject(forKey: "PASSWORD") // Reset password to Defaults
        defaults.removeObject(forKey: "USER") // Reset user to Defaults
        
    }
    

}
//===================================================
