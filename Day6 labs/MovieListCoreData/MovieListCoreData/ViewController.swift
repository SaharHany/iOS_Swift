//
//  ViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var movImg: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    var currMovie : NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movImg.image = UIImage(named:(currMovie!.value(forKey: "image") as? String)!)
        self.titleLabel.text  = currMovie!.value(forKey: "title") as? String
        
        self.genreLabel.text  = currMovie!.value(forKey: "genre") as? String
         self.ratingLabel.text = String(currMovie.value(forKey: "rating") as! Float)
        self.releaseYearLabel.text = String(currMovie.value(forKey: "releaseYear") as! Int)
        print("fetching rating:")
        print(currMovie!.value(forKey: "rating"))
        print("fetching rating:")
        print(currMovie!.value(forKey: "releaseYear"))
        
        
    }


}

