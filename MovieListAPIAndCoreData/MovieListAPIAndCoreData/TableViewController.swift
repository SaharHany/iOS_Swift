//
//  TableViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import Network
import CoreData

class TableViewController:

UITableViewController , AddingProtocol{
    
    //var movies = [Movie]()
    var movies = Array<NSManagedObject>()

    let monitor = NWPathMonitor()
    var checkConn = true
    
    func addMovie(movie: NSManagedObject) {
        movies.append(movie)
        self.tableView.reloadData()
    }
    
   
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
    }
    override func viewDidLoad() {
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                self.checkConn = true
                print("Internet connection is on.")
            } else {
                self.checkConn = false
                print("There's no internet connection.")
            }
        }
        let queue = DispatchQueue(label: "InternetConnectionMonitor")

        monitor.start(queue: queue)
        
        if self.checkConn == true {
        let url = URL(string : "https://api.androidhive.info/json/movies.json")
        
        let request = URLRequest (url : url!) // mnnsa4 n3ml forced unwrapping
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        let managerContext = appDelegate.persistentContainer.viewContext
            
        let task = session.dataTask(with: request) { (data, response, error) in
             do{
                
                let entity = NSEntityDescription.entity(forEntityName: "Movies", in: managerContext)
                
                var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                
                for currmovie in output{
                    let movie = NSManagedObject(entity: entity!, insertInto: managerContext)
                    movie.setValue(currmovie["title"] as! String ,forKey: "title")
                    
                    movie.setValue(Float(currmovie["rating"] as! NSNumber), forKey: "rating")
                    
                    movie.setValue(Int(currmovie["releaseYear"] as! NSNumber) , forKey: "releaseYear")
                    
                    movie.setValue(currmovie["image"] as! String, forKey: "image")
                    
                   var genreArr = currmovie["genre"] as! [String]
                    
                    movie.setValue(genreArr.description, forKey: "genre")

                    
                    do{
                        try managerContext.save()
                        self.movies.append(movie)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }

                    }catch let error as NSError{
                        print(error.localizedDescription)
                    }
                    

                }
                

            }catch{
                print("Error")
            }
        }
            task.resume()

        }else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let managerContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"Movies")
            do{
                movies = try managerContext.fetch(fetchRequest)
            }catch {
                print("error")
            }
        }

        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
     

    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("here")
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        print("cell config")
        // Configure the cell...
      //  cell.imageView?.image = UIImage(named: movies[indexPath.row].image)
       // cell.textLabel?.text = movies[indexPath.row].title
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "title") as! String
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.destination.restorationIdentifier=="addView" {
           
            let addViewCon = segue.destination as! AddViewController
            
            addViewCon.tableVC = self
            
        }else if segue.destination.restorationIdentifier=="detailsView"{
            let viewCon = segue.destination as! ViewController
            
            var movIndex = self.tableView.indexPathForSelectedRow?.row
            viewCon.currMovie = movies[movIndex!]
        }
        
        
        
    }
    

}
