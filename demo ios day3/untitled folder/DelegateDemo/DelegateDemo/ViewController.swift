//
//  ViewController.swift
//  DelegateDemo
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ClearProtocol{
    func clear() {
        myTextField.text = ""
    }
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func sendBtn(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //3mlna el casting bl as! 3a4an unwrapping lakn lw Int aw ay datatype hn3ml blakwas
        let secVC = segue.destination as! SecondViewController
        
        secVC.str = myTextField.text!
        secVC.firstVC = self
    }


}

