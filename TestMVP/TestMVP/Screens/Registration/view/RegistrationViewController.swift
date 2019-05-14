//
//  ViewController.swift
//  TestMVP
//
//  Created by imac on 11/5/2019.
//  Copyright © 2019 Esraa. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController{
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    
    var registrationPresenter: RegistrationPresenter = RegistrationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registrationPresenter.setDelegate(delegate: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        registrationPresenter.register(email: emailLabel.text!, password: passwordLabel.text!, phone: phoneLabel.text!)
    }
    
    
    
}

