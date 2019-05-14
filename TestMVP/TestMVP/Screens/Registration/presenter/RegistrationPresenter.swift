//
//  RegistrationPresenter.swift
//  TestMVP
//
//  Created by imac on 11/5/2019.
//  Copyright © 2019 Esraa. All rights reserved.
//

import Foundation

class RegistrationPresenter{
    var registrationDelegate: RegistrationDelegate?
    
    init() {
        // here we can send the NW Services
    }
    func setDelegate(delegate: RegistrationDelegate){
        self.registrationDelegate = delegate
    }
    
    func register(email: String, password: String, phone:String){
        var count = 0
        if email.isEmpty{
            self.registrationDelegate?.registrationDidFailed(message: "email can't be blank")
        }else{ count += 1 }
        if password.isEmpty{
            self.registrationDelegate?.registrationDidFailed(message: "password can't be blank")
        }else{ count += 1 }
        if phone.isEmpty{
            self.registrationDelegate?.registrationDidFailed(message: "phone can't be blank")
        }else{ count += 1 }
        
        if(count == 3){
            self.registrationDelegate?.registrationDidSucceed()
        }
    }
}
