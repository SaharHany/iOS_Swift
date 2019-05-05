//
//  SecondViewController.swift
//  DelegateDemo
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var str : String=""
    var firstVC : ClearProtocol?
    @IBAction func clear(_ sender: UIBarButtonItem) {
        firstVC?.clear() //chaining safe
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = str
        // Do any additional setup after loading the view.
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
