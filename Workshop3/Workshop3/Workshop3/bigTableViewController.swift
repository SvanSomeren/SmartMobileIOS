//
//  bigTableViewController.swift
//  Workshop3
//
//  Created by issd on 16/03/2018.
//  Copyright © 2018 issd. All rights reserved.
//

import UIKit

class bigTableViewController: UITableViewController {
    

    var pirates = [Pirate]();
    var selectedPirate = Pirate();
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pirates.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseableCell", for: indexPath)
        let textstuff = pirates[indexPath.row];
        cell.textLabel?.text = textstuff.name;
        // Configure the cell...
        return cell
    }
    
    func loadJsonData()
    {
        let url = NSURL(string: "https://i886625.venus.fhict.nl/pirates.json")
        let request = NSURLRequest(url: url! as URL)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            do
               {
                    if (error == nil)
                        {
                            let jsonObject = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                            
                            self.parseJsonData(rawData: jsonObject) // Will be explained later
                        
                            }
                    else
                       {
                            print("Error with http request")
                            }
                    }
           catch
           {
            print("Error serializing JSON data")
           }
        }
        dataTask.resume();
    }
    
    func parseJsonData(rawData:Any)
    {
        if let jsonArray = rawData as? [[String:Any]]
            {
                for jsonDict in jsonArray
                    {
                        let newPirate = Pirate()
                        if let name = jsonDict["name"] as? String
                        {
                                newPirate.name = name
                        }
                        if let life = jsonDict["life"] as? String
                        {
                         newPirate.life = life
                        }
                        if let country = jsonDict["country_of_origin"] as? String
                        {
                             newPirate.countryOfOrigin = country
                        }
                        if let comments = jsonDict["comments"] as? String
                        {
                            newPirate.comments = comments
                        }
                        pirates.append(newPirate);
                    }
                }
        tableView.reloadData();
        }

    class Pirate
    {
        var name:String?
        var life:String?
        var countryOfOrigin:String?
        var comments:String?
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestScreen : infoViewController = segue.destination as! infoViewController
        selectedPirate = pirates[(tableView.indexPathForSelectedRow?.row)!]
        DestScreen.name = selectedPirate.name!;
        DestScreen.country = selectedPirate.countryOfOrigin!;
        DestScreen.comments = selectedPirate.comments!;
        DestScreen.life = selectedPirate.life!;
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
