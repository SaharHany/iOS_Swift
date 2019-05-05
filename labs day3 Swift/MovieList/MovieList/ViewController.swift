//
//  ViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movImg: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    var currMovie : Movie!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.movImg.image = UIImage(named:(currMovie.image))
        self.titleLabel.text  = currMovie.title
        
        self.genreLabel.text  = currMovie.genre.description
        self.ratingLabel.text = String(currMovie.rating)
        self.releaseYearLabel.text = String(currMovie.releaseYear)
    }


}

