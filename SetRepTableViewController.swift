//
//  SetRepTableViewController.swift
//  LPApp
//
//  Created by Stephen Rowe on 1/2/16.
//  Copyright © 2016 Stephen Rowe. All rights reserved.
//

import UIKit

class SetRepTableViewController: UITableViewController {
    
    // Define set reps array here to store data!
    let bench = BenchHeavy()
    var training_max:Int?
    var received_training_max = 0
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        training_max = received_training_max
        
        

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
        let cell = tableView.dequeueReusableCellWithIdentifier("SetRepTableViewCell", forIndexPath: indexPath) as! SetRepTableViewCell
        
        let rep_number: Int = bench.reps[indexPath.row]
        let percent : Double = bench.percents[indexPath.row]
        if let val = training_max {
            cell.setRepLabel.text = String(rep_number) + " x  " + String(RoundToNearestFive(percent * Double(val)))
        }


        return cell
    }
    
    @IBAction func unwindToSetRep(sender: UIStoryboardSegue) {
       // if let sourceViewController = sender.sourceViewController as? ViewController, new_one_rep_max = sourceViewController.one_rep_max {
            //one_rep_max = new_one_rep_max
        //}
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
