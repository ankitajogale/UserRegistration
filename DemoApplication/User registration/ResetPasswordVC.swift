//
//  ResetPasswordVC.swift
//  DemoApplication
//
//  Created by sachin toskar on 12/08/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {
    @IBOutlet var resetTxt: UITextField!
    @IBOutlet var resetButton: UIButton!
    
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
       //button
        resetButton.layer.cornerRadius = 15
        resetButton.layer.borderWidth = 2
        resetButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        guard let email = resetTxt.text else {
                   return
        }
        
        if email.isEmpty {
           alertMsg()
        }
         let isValidateEmail = self.validation.validateEmailId(emailID: email)
                  if (isValidateEmail == false) {
                   print("incorrect email")
                     return
                  }
          
        if (isValidateEmail == true ) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreatePassword") as? CreatePassword
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
