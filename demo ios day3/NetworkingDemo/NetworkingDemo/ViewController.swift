//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBAction func startTask(_ sender: UIButton) {
        let url = URL(string : "https://api.androidhive.info/json/movies.json")
        
        let request = URLRequest (url : url!) // mnnsa4 n3ml forced unwrapping
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            do{
            var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                var dict = output[0]
              
                print(dict["title"])

                print(dict["title"]!)
                DispatchQueue.main.async {
                    self.myLabel.text = dict["title"]! as? String
                }
                
            }catch{
                print("Error")
            }
        }
            task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

