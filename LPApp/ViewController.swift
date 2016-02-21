//
//  ViewController.swift
//  LPApp
//
//  Created by Stephen Rowe on 1/2/16.
//  Copyright © 2016 Stephen Rowe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    // Text field delegate handles the user input into the text field.
    
    @IBOutlet weak var oneRepMaxTextField: UITextField!
    @IBOutlet weak var liftLabel: UILabel!
    @IBOutlet weak var programButton: UIBarButtonItem!
    @IBOutlet weak var liftPicker: UIPickerView!
    
    //Programmatically Define a UITextField
    let trainingMaxTextField = UITextField(frame: CGRectMake(20,100,80,40))
    
    //trainingMaxTextField.placeholder = "Enter Texxt Here"
    
    
    var one_rep_max: Int? = 0
    var lol: Int?
    var training_max: Int?
    let lift_data = ["Bench", "Squats", "Deadlifts", "OHP", "Bench Hypertrophy"]
    var chosen_lift = "Bench"
    let bench = BenchHeavy()
    let squats = Squats()
    let lift_list = LiftList()
    var training_max_list : [Double] = [] // TODO: Use the training_max-list to store and increment as we improve. 


    override func viewDidLoad() {
        super.viewDidLoad()
        trainingMaxTextField.placeholder = "Enter Training Max"
        trainingMaxTextField.font = UIFont.systemFontOfSize(15)
        trainingMaxTextField.borderStyle = UITextBorderStyle.RoundedRect
        trainingMaxTextField.returnKeyType = UIReturnKeyType.Done
        trainingMaxTextField.delegate = self
        self.view.addSubview(trainingMaxTextField)
        
        
        
        oneRepMaxTextField.delegate = self //Identifies the delegate as this class/ViewController
        
        liftPicker.dataSource = self // Identifies the dataSource as this class/ViewController
        liftPicker.delegate = self // Identifies the delegate as this class/ViewController
        
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
        if textField === oneRepMaxTextField {
            oneRepMaxTextField.text! = ""
        }
        else if textField === trainingMaxTextField {
            trainingMaxTextField.text! = ""
        }
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField === oneRepMaxTextField {
            one_rep_max = Int(oneRepMaxTextField.text!)
            if one_rep_max != nil {
                if one_rep_max <= 0 {
                    liftLabel.text = "Please enter a positive integer"
                    liftLabel.text = String(bench.percents[0])
                }
                else{
                    training_max = ComputeTrainingMax(one_rep_max!)
                    liftLabel.text = "Training Max: " + String(training_max!)
                    trainingMaxTextField.text = String(training_max!)
                }
            }
            else {
                liftLabel.text = "Invalid. Please Enter only integers"
            }
        }
        if  textField === trainingMaxTextField {
            training_max = Int(trainingMaxTextField.text!)
            if training_max != nil {
                if training_max <= 0 {
                    liftLabel.text = "Please enter a positive integer into Training Max box"
                }
                else {
                    liftLabel.text = "Training Max: " + String(training_max!)
                }
            }
        }
        
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         if programButton === sender {
            
            one_rep_max = Int(oneRepMaxTextField.text!)
            let destinationViewController = segue.destinationViewController as! SetRepTableViewController
            destinationViewController.sent_percents = ChoosePerecentArray(chosen_lift)
            destinationViewController.reps = ChooseRepArray(chosen_lift)
            
            if let value = training_max {
                
                destinationViewController.received_training_max = value
                print("lol")
                
                //destinationViewController.percents = lift_dictionary["Bench"]!.percents
            }
            
        }
    }
    
    @IBAction func unwindSetRepTableView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? SetRepTableViewController{
            if let num_reps = sourceViewController.num_reps {
                if num_reps > 1 {
                    oneRepMaxTextField.text = String(one_rep_max! + 1)
                    training_max! +=  5
                    trainingMaxTextField.text! = String(training_max!)
                }
            }
        }
        
        
    }
    
    // MARK: LiftPicker DataSource and Delegates
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lift_data.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return lift_data[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        liftLabel.text = lift_data[row]
        chosen_lift = lift_data[row]
    }
    
    
    // MARK: Strings
    func ChooseRepArray(lift: String) -> [Int] {
        return lift_list.rep_dictionary[lift]!
    }
    func ChoosePerecentArray(lift: String) -> [Double] {
        return lift_list.percent_dictionary[lift]!
    }


}

