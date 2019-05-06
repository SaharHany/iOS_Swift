//
//  AddViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var ratingTF: UITextField!
    
    @IBOutlet weak var releaseTF: UITextField!
    
    
    @IBOutlet weak var genreTF: UITextField!
    
    
    @IBOutlet weak var imageTF: UITextField!
    
    
    @IBAction func addMovBtn(_ sender: UIButton) {
        var mov = Movie()
        mov.title = titleTF.text!
        mov.image = imageTF.text!
        mov.rating = Float(ratingTF.text!)!
        mov.releaseYear = Int(releaseTF.text!)!
        var genreText = genreTF.text!
        genreText = genreText.replacingOccurrences(of: "[", with: "")
        genreText = genreText.replacingOccurrences(of: "]", with: "")

        var genreArr = genreText.split(separator: ",")
        for item in genreArr{
            var str = item
            mov.genre.append(String(str))
        }
        
        tableVC?.addMovie(movie: mov)
        

    }
    
    var tableVC : AddingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
