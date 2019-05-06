//
//  TableViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-10 on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class TableViewController:

UITableViewController , AddingProtocol{
    func addMovie(movie: Movie) {
        movies.append(movie)
        self.tableView.reloadData()
    }
    
    var movies = [Movie]()

    @IBAction func addBtn(_ sender: UIBarButtonItem) {
    }
    override func viewDidLoad() {
        let url = URL(string : "https://api.androidhive.info/json/movies.json")
        
        let request = URLRequest (url : url!) // mnnsa4 n3ml forced unwrapping
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            do{
                var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                
                for currmovie in output{
                    var movie = Movie()
                    movie.title = currmovie["title"] as! String
                    movie.rating = Float(currmovie["rating"] as! NSNumber)
                    movie.releaseYear = Int(currmovie["releaseYear"] as! NSNumber)
                    movie.image = currmovie["image"] as! String
                    movie.genre = currmovie["genre"] as! [String]
                    self.movies.append(movie)
                    print(movie.title)
                }
                
                
            }catch{
                print("Error")
            }
        }
        task.resume()
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
        cell.textLabel?.text = movies[indexPath.row].title

        let url = URL(string : movies[indexPath.row].image)
        
        let request = URLRequest (url : url!) // mnnsa4 n3ml forced unwrapping
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.downloadTask(with: request) { (data, response, error) in
            
            do{
                var output = try! Data(contentsOf: data!)
                
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: output)
                }
                
            }catch{
                print("Error")
            }
        }
        task.resume()
        
        
        
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
