//
//  Manager.swift
//  Employee-Manager
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class Manager: Person {

    override func getSalary(salary: Float) -> Float {
        return salary * 3
    }
}
