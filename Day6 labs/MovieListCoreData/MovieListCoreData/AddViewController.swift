//
//  AddViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var ratingTF: UITextField!
    
    @IBOutlet weak var releaseTF: UITextField!
    
    
    @IBOutlet weak var genreTF: UITextField!
    
    
    @IBOutlet weak var imageTF: UITextField!
    
    var tableVC : AddingProtocol?

    @IBAction func addMovBtn(_ sender: UIButton) {
     
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managerContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Movies", in: managerContext)
        
        let movie = NSManagedObject(entity: entity!, insertInto: managerContext)
        
        movie.setValue(titleTF.text! ,forKey: "title")
        
        movie.setValue(Float(ratingTF.text!)!, forKey: "rating")
        print("rating:")
        print(Float(ratingTF.text!)!)
        movie.setValue(Int(releaseTF.text!)! , forKey: "releaseYear")
        print("release:")

        print(Int(releaseTF.text!)!)
        movie.setValue(imageTF.text! , forKey: "image")
        
        movie.setValue(genreTF.text!, forKey: "genre")
        
        do{
            try managerContext.save()
            tableVC?.addMovie(movie: movie)
            
        }catch let error as NSError{
            print(error.localizedDescription)
        }
                    
        self.navigationController?.popViewController(animated: true)

    }
    
    
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
