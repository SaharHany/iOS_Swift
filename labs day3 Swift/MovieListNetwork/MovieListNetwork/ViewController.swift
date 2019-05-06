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
        // Do any additional setup after loading the view, typically from a nib.
    //    self.movImg.image = UIImage(named:(currMovie.image))
        self.titleLabel.text  = currMovie.title
        
        self.genreLabel.text  = currMovie.genre.description
        self.ratingLabel.text = String(currMovie.rating)
        self.releaseYearLabel.text = String(currMovie.releaseYear)
        
        let url = URL(string :currMovie.image)
        
        let request = URLRequest (url : url!) // mnnsa4 n3ml forced unwrapping
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.downloadTask(with: request) { (data, response, error) in
            
            do{
                var output = try! Data(contentsOf: data!)
                
                DispatchQueue.main.async {
                    self.movImg.image = UIImage(data: output)
                }
                
            }catch{
                print("Error")
            }
        }
        task.resume()
        super.viewDidLoad()

    }


}

