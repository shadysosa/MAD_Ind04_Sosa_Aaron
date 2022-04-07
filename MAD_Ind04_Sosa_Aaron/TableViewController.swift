//
//  TableViewController.swift
//  MAD_Ind04_Sosa_Aaron
//
//  Created by Nicole Sosa on 4/6/22.
//

import UIKit


struct Table: Decodable{
    var name: String
    var nickname: String
}

class TableViewController: UITableViewController {
    
    
    //remove toolbar and nav control from lecture
   /* override func viewWillAppear( _ animated: Bool){
        super.viewWillAppear(true)
        // Hide the navigation bar and toolbar.
        self.navigationController?.setNavigationBarHidden(
          true, animated: true)
        self.navigationController?.setToolbarHidden(true,
          animated: true)
      } */
    /* PROJ 3 STUFF
    // array filled with state names
    let stateArray = [ "Alabama" , "Alaska" , "Arizona" , "Arkansas" , "California" , "Colorado" , "Connecticut" , "Delaware" , "Florida" , "Georgia" , "Hawaii" , "Idaho" , "Illinois" , "Indiana" , "Iowa" , "Kansas" , "Kentucky" , "Louisiana" , "Maine" , "Maryland" , "Massachusetts" , "Michigan" , "Minnesota" , "Mississippi" , "Missouri" , "Montana" , "Nebraska" , "Nevada" , "New Hampshire" , "New Jersey" , "New Mexico" , "New York" , "North Carolina" , "North Dakota " , "Ohio" , "Oklahoma" , "Oregon" , "Pennsylvania" , "Rhode Island " , "South Carolina" , "South Dakota" , "Tennessee" , "Texas" , "Utah" , "Vermont" ,  "Virginia" , "Washington" , "West Virginia" , "Wisconsin" , "Wyoming" ]
    // array filled with state nicknames
    let nicknameArray = [ "Yellowhammer State" , "The Last Frontier" , "The Grand Canyon State" , "The Natural State" , "The Golden State" , "The Centennial State" , "The Constitution State", "The First State" , "The Sunshine State" , "The Peach State" , "The Aloha State" , "The Gem State" , "Prairie State" , "The Hoosier State" , "The Hawkeye State" , "The Sunflower State" , "The Bluegrass State" , "The Pelican State" , "The Pine Tree State" , "The Old Line State" , "The Bay State" , "The Great Lakes State" , "The North Star State" , "The Magnolia State",  "The Show Me State" ,  "The Treasure State" , "The Cornhusker State" , "The Silver State" , "The Granite State" , "The Garden State" , "The Land of Enchantment" ,  "The Empire State" , "The Tar Heel State" , "The Peace Garden State" , "The Buckeye State" , "The Sooner State" , "The Beaver State" , "The Keystone State" , "The Ocean State" , "The Palmetto State" , "Mount Rushmore State" , "The Volunteer State" , "The Lone Star State" ,"The Beehive State" , "The Green Mountain State" , "The Old Dominion State" , "The Evergreen State" , "The Mountain State" , "The Badger State" , "The Equality or Cowboy State"]
  */
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        struct table: Decodable{
            let test: Int
            let name: String
            let nickname: String
            //let table = Array<(name: String, nickname: String)>()
         
        }
        */
        // took this from lecture slides, wasn even able to get the rectangle php to print :(
        
        let urlString = "https://cs.okstate.edu/~aasosa/api.php"
        guard let url = URL(string: urlString) else{
            print ("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            (data, response, error) in
            guard error == nil else{
                print("URL session error: \(error!)")
                return
            }
            
            guard let data = data else{
                print("No data recieved")
                return
            }
            do{
                let json = try JSONDecoder().decode(Table.self , from:data)
                print(Table.self)
                print(json)
            } catch let error as NSError {
                print("Error serializing JSON Data: \(error)")
            }
        }

        task.resume()
    }
        
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // didnt have any additional sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 50 rows for 50 states
        return 50
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //MyCell was the prototype cell identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)

        // Configure the cell...
        //simple cell configuration as seen in lecture notes
        // was going to fill these from an array where json translated data was stored
        cell.textLabel?.text =
        cell.detailTextLabel?.text =
        
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    
     /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // if statement that checks for issues, stores indexpath and sets ViewController as destination to seguea to
        if let indexPath = tableView.indexPathForSelectedRow,
           let destination = segue.destination as? ViewController{
            //print(indexPath.row)
            // hold over variable to moniter index row easier and not cause issues passing into array
           let tempVar = indexPath.row
            //stores the State name, flag, map, us map, and mileage in variables in the next viewcontroller
            destination.nameHolder = stateArray[tempVar]
            destination.flagHolder = stateFlag[tempVar]
            destination.usmapHolder = stateMap2[tempVar]
            destination.mapHolder = stateMap1[tempVar]
            destination.mileHolder = mileArray[tempVar]
            
       }
    }
      */
    

}
