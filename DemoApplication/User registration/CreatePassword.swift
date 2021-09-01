//
//  CreatePassword.swift
//  DemoApplication
//
//  Created by sachin toskar on 12/08/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class CreatePassword: UIViewController {

    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var confirmPasswordTxt: UITextField!
    @IBOutlet var createButton: UIButton!
    
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
        //button shape
        createButton.layer.cornerRadius = 15
        createButton.layer.borderWidth = 2
        createButton.layer.borderColor = UIColor.white.cgColor
        
    }
    

    @IBAction func createBtn(_ sender: Any) {
        guard let pass = passwordTxt.text, let confirmpass = confirmPasswordTxt.text
               else {
                     return
                  }
        if pass.isEmpty && confirmpass.isEmpty{
         alertMsg()
        }
    
        
        let isValidatePass = self.validation.validatePassword(password: pass)
                  if (isValidatePass == false) {
                     print("Incorrect pass")
                     return
                  }
        let isValidateConfirmPass = self.validation.validatePassword(password: confirmpass)
                  if (isValidateConfirmPass == false) {
                     print("Incorrect confirmPass")
                     return
               }
                
        if (isValidatePass == true || isValidateConfirmPass == true ) {
        if ( pass == confirmpass){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
        self.navigationController?.pushViewController(vc!, animated: true)
            
        }
        }
    }
}
