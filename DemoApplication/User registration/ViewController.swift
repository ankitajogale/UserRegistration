//
//  ViewController.swift
//  DemoApplication
//
//  Created by sachin toskar on 12/08/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation bar
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = false
        //button shape
        signInButton.layer.cornerRadius = 20
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.black.cgColor
        
        signUpButton.layer.cornerRadius = 20
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.borderColor = UIColor.white.cgColor
    }

    @IBAction func signInBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInVC") as? SignInVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)    }
    
}

