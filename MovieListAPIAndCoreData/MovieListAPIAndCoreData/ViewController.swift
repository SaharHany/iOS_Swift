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
    
    var currMovie : NSManagedObject?
    
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
    //    self.movImg.image = UIImage(named:(currMovie.image))
        
        
        
        self.titleLabel.text  = currMovie!.value(forKey: "title") as? String
        
        self.genreLabel.text  = currMovie!.value(forKey: "genre") as? String
        self.ratingLabel.text = currMovie!.value(forKey: "rating") as? String
        self.releaseYearLabel.text = currMovie!.value(forKey: "releaseYear") as? String
        
        let url = URL(string :(currMovie!.value(forKey: "image") as? String)!)
        
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

