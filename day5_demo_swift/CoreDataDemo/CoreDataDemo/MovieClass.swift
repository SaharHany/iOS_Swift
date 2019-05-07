//
//  MovieClass.swift
//  CoreDataDemo
//
//  Created by JETS Mobile Lab-10 on 5/7/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class MovieClass {
    var title = ""
    var releaseYear = 2000
    var rate :Float = 0.0 //lw mktbt4 float hi3tbrha double
    
    init(title : String , releaseYear: Int, rate:Float) {
        self.title = title
        self.rate = rate
        self.releaseYear = releaseYear
    }
}
