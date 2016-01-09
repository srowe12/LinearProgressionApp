//
//  ViewController.swift
//  LPApp
//
//  Created by Stephen Rowe on 1/2/16.
//  Copyright © 2016 Stephen Rowe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // Text field delegate handles the user input into the text field.
    
    @IBOutlet weak var oneRepMaxTextField: UITextField!
    @IBOutlet weak var liftLabel: UILabel!
    @IBOutlet weak var programButton: UIBarButtonItem!
    var one_rep_max: Int? = 0
    var lol: Int?
    var training_max: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        oneRepMaxTextField.delegate = self //Identifies the delegate as this class/ViewController
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    // MARK: UITextFieldDelegate
    // What should the text field do when user interacts with it?
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder() //Give up being rist responder
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        oneRepMaxTextField.text! = ""
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        one_rep_max = Int(oneRepMaxTextField.text!)
        if one_rep_max != nil {
            if one_rep_max <= 0 {
                liftLabel.text = "Please enter a positive integer"
            }
            else{
                training_max = ComputeTrainingMax(one_rep_max!)
                liftLabel.text = "Training Max Fix Rounding: " + String(training_max!)
            }
        }
        else {
            liftLabel.text = "Invalid. Please Enter only integers"
        }
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         if programButton === sender {
                one_rep_max = Int(oneRepMaxTextField.text!)
                //self.one_rep_max = 5
                let destinationViewController = segue.destinationViewController as! SetRepTableViewController
            if let value = one_rep_max {
                destinationViewController.received_one_rep_max = value
            }
            
        }
    }
    
    // MARK: Math
    
    func ComputeTrainingMax(value: Int) -> Int {
        let training_max_double = Double(value) * 0.90
        return RoundNearestFive(training_max_double)
        
    }
    func RoundNearestFive(value: Double) -> Int {
        return 5 * Int(round(value / 5.0))
        
    }
    


}

