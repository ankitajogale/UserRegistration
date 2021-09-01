//
//  SignUpVC.swift
//  DemoApplication
//
//  Created by sachin toskar on 12/08/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet var userNameTxt: UITextField!
    @IBOutlet var userEmailIdTxt: UITextField!
    @IBOutlet var userPasswordTxt: UITextField!
    @IBOutlet var confirmPasswordTxt: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //button
        signUpButton.layer.cornerRadius = 15
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.borderColor = UIColor.white.cgColor
    }
    
  
    @IBAction func signUp(_ sender: Any) {
      guard  let name = userNameTxt.text, let email = userEmailIdTxt.text, let pass = userPasswordTxt.text,
           let confirmPass = confirmPasswordTxt.text else {
              return
           }
        
        if name.isEmpty && email.isEmpty && pass.isEmpty &&  confirmPass.isEmpty{
                alertMsg()
              }
        
        let isValidateName = self.validation.validateName(name: name)
           if (isValidateName == false) {
              print("Incorrect Name")
              return
           }
           let isValidateEmail = self.validation.validateEmailId(emailID: email)
           if (isValidateEmail == false) {
              print("Incorrect Email")
              return
           }
           let isValidatePass = self.validation.validatePassword(password: pass)
           if (isValidatePass == false) {
              print("Incorrect Pass")
              return
           }
           let isValidatePhone = self.validation.validatePassword(password: confirmPass)
           if (isValidatePhone == false) {
              print("Incorrect confirmPass")
              return
           }
           if (isValidateName == true || isValidateEmail == true || isValidatePass == true || isValidatePhone == true) {
            if (pass == confirmPass){
             let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
              self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
        }
    }




