//
//  SignInVC.swift
//  DemoApplication
//
//  Created by sachin toskar on 12/08/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet var emailIDTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var erroShowLbl: UILabel!
    
    @IBOutlet var signInButton: UIButton!
    var validation = Validation()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigatin effect
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
        //Button Action
        signInButton.layer.cornerRadius = 15
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        
    }

    @IBAction func signUpbtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        
        if emailIDTxt.text == "" && passwordTxt.text == "" {
            alertMsg()
            print("Fill all data")
        }
        guard let email = emailIDTxt.text, let pass = passwordTxt.text
        else {
              return
           }
        
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
           if (isValidateEmail == false) {
            incorrectAlertMsg()
            print("Incorrect Email")
            return
           }
        let isValidatePass = self.validation.validatePassword(password: pass)
           if (isValidatePass == false) {
              print("Incorrect Password")
              return
        }
         
        if (isValidateEmail == true || isValidatePass == true ) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomePageVC") as? HomePageVC
            self.navigationController?.pushViewController(vc!, animated: true)
           }
        }
        
    
    @IBAction func forgotBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResetPasswordVC") as? ResetPasswordVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func facebookBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomePageVC") as? HomePageVC
        self.navigationController?.pushViewController(vc!, animated: true)      }
    @IBAction func googleBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomePageVC") as? HomePageVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

extension UIViewController {
    public func alertMsg(){
        let alert = UIAlertController(title: "Alert", message: "enter all detail", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      }
        public func incorrectAlertMsg(){
        let alert = UIAlertController(title: "Alert", message: "Enter all correct data", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      }
    
}


