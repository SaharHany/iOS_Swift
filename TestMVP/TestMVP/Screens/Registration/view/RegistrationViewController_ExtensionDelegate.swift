//
//  RegistrationViewController_ExtensionDelegate.swift
//  TestMVP
//
//  Created by imac on 11/5/2019.
//  Copyright © 2019 Esraa. All rights reserved.
//

import Foundation

extension RegistrationViewController : RegistrationDelegate{
    
    func registrationDidSucceed() {
        // go to second screen
          print("succeded")
    }
    
    func registrationDidFailed(message: String) {
        print(message)
    }
    
}
