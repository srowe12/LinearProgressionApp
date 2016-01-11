//
//  SetRepTableViewController.swift
//  LPApp
//
//  Created by Stephen Rowe on 1/2/16.
//  Copyright © 2016 Stephen Rowe. All rights reserved.
//

import UIKit

class SetRepTableViewController: UITableViewController, UITextFieldDelegate {
    
    // Define set reps array here to store data!
    let bench = BenchHeavy()
    var training_max:Int?
    var received_training_max = 0
    var num_reps: Int?
    var percents: [Double] = []
    var sent_percents: [Double] = [] {
        didSet{
             percents = sent_percents
        }
    }
    var reps: [Int]?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        training_max = received_training_max
        saveButton.enabled = false
        for item in sent_percents {
            print(item)
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9 // Change to a class variable later!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequed using a cell identifier. I guess as we scroll we reuse them?
        //let reps = bench.reps[indexPath.row]
        
        //let rep_number: Int = bench.reps[indexPath.row]
        let rep_number = reps![indexPath.row]
        let percent : Double = percents[indexPath.row]
        var max_string: String?
        if let val = training_max {
            max_string = String(rep_number) + " x  " + String(RoundToNearestFive(percent * Double(val)))
        }
        if indexPath.row == 3
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("SetRepTableViewCell", forIndexPath: indexPath) as! SetRepTableViewCell
            
            cell.setRepLabel.text = max_string!
            cell.repTextField.delegate =  self
            cell.repTextField.text = "Hi"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("LolCell", forIndexPath: indexPath) as! CustomViewCell
            cell.setRepLabel.text = max_string!
        
            return cell
        
        }
        
    }
    
    
    // MARK: UITextFieldDelegate Methods
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
        saveButton.enabled = false
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder() //Give up being rist responder
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        // TODO: Validate input!
        num_reps = Int(textField.text!)
        saveButton.enabled = true
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if sender === saveButton {
            
        }
    }

    
}
