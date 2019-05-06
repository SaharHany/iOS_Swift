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
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        var mov1 = Movie ()
        mov1.title = "Dawn of the Planet of the Apes"
        mov1.releaseYear = 2014
        mov1.rating = 8.3
        mov1.genre = ["Action","Drama","Sci-Fi"]
        mov1.image = "1.jpg"
        movies.append(mov1)
        
        var mov2 = Movie ()

        mov2.title = "District 9"
        mov2.releaseYear = 2009
        mov2.rating = 8
        mov2.genre = ["Action","Sci-Fi","Thriller"]
        mov2.image = "2.jpg"
        movies.append(mov2)

        var mov3 = Movie ()

        mov3.title = "Transformers: Age of Extinction"
        mov3.releaseYear = 2014
        mov3.rating = 6.3
        mov3.genre = ["Action","Adventure","Sci-Fi"]
        mov3.image = "3.jpg"
        
        movies.append(mov3)

        var mov4 = Movie ()

        mov4.title = "X-Men: Days of Future Past"
        mov4.releaseYear = 2014
        mov4.rating = 8.4
        mov4.genre = ["Action","Sci-Fi","Thriller"]
        mov4.image = "4.jpg"
        movies.append(mov4)

        var mov5 = Movie ()

        mov5.title = "The Machinist"
        mov5.releaseYear = 2004
        mov5.rating = 7.8
        mov5.genre = ["Drama","Thriller"]
        mov5.image = "5.jpg"
        movies.append(mov5)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.imageView?.image = UIImage(named: movies[indexPath.row].image)
        cell.textLabel?.text = movies[indexPath.row].title

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
