//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Sayem on 3/22/17.
//  Copyright © 2017 Sayem. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    
    var toDoListArray:[ToDoModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let note1 = ToDoModel(title: "Office", message: "Attend the office timely")
        let note2 = ToDoModel(title: "Class", message: "Don't miss the Class at 5 PM")
        let note3 = ToDoModel(title: "Home", message: "Reach home safely and sounly")
        let note4 = ToDoModel(title: "Dinner", message: "Must have my dinner prperly")
        let note5 = ToDoModel(title: "Sleep", message: "You have to sleep with a sound environment")
        let note6 = ToDoModel(title: "Coding", message: "Don't forget about coding...")
        let note7 = ToDoModel(title: "Adda", message: "Adda is the best thing ever")
        let note8 = ToDoModel(title: "Again Sleep", message: "Sleeping again is good for health")
        
        
        toDoListArray.append(note1)
        toDoListArray.append(note2)
        toDoListArray.append(note3)
        toDoListArray.append(note4)
        toDoListArray.append(note5)
        toDoListArray.append(note6)
        toDoListArray.append(note7)
        toDoListArray.append(note8)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return toDoListArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell object created
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //label object searched in the cell's view hierchy
        
        let titleLabel = cell.viewWithTag(100) as! UILabel
        let messageLabel = cell.viewWithTag(200) as! UILabel

        
        //set the data for both lables
        
        // get the model object for this row
        
        let todoModel = toDoListArray[indexPath.row]
        titleLabel.text = todoModel.title
        messageLabel.text = todoModel.message
        
        configureCheckMark(for: cell, with: todoModel)
        
        return cell
    }

    
    // custom function for working of check button... 
    
    func configureCheckMark(for cell:UITableViewCell, with model:ToDoModel) {
        if model.isDone {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.toDoListArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
            //tableView.reloadData()  // simple update the list without animation
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
            //tableView.insertRows(at: [indexPath], with: .fade)
        }    
    }


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
