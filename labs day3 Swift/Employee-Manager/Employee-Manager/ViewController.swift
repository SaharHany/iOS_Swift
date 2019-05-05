//
//  ViewController.swift
//  Employee-Manager
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var salaryTF: UITextField!
    
    
    @IBAction func employeeBtn(_ sender: UIButton) {
        var salStr = self.salaryTF.text
        var sal = Float(salStr!)
        print(sal!)
        var emp = Employee.init()
        var empSal = emp.getSalary(salary: sal!)
        calcLabel.text = String(empSal)
    

    }
    @IBAction func managerBtn(_ sender: UIButton) {
    
        var salStr = self.salaryTF.text
        var sal = Float(salStr!)
        print(sal!)
        var mgr = Manager.init()
        var mgrSal = mgr.getSalary(salary: sal!)
        calcLabel.text = String(mgrSal)

    }
    
    @IBOutlet weak var calcLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

