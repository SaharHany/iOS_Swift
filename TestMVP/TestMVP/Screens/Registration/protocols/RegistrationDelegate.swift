//
//  RegistrationDelegate.swift
//  TestMVP
//
//  Created by imac on 11/5/2019.
//  Copyright © 2019 Esraa. All rights reserved.
//

import Foundation

protocol RegistrationDelegate {
    
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
    
}
