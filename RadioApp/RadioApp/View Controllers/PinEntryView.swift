//  PinEntryView.swift
//  DPaez013-P5
//
//  Created by David Paez on 03/30/2020.
//
//  PROGRAMMER: David Paez
//  PANTHERID: 6073392
//  CLASS: COP 4655 RH1
//  INSTRUCTOR: Steve Luis
//  ASSIGNMENT: Programming Assignment #5
//  DUE: Thursday 04/02/2020

import UIKit

class PinEntryViewController: UIViewController {
    
    // outlet collections for digits and buttons
    @IBOutlet var digits: [UILabel]!
    @IBOutlet var buttons: [UIButton]!
    
    // index to keep track of which label we're on
    var index: Int = 0
    var pinNumber: String = "" // final pin number
    
    // Pin Database shared object
    let myPinDatabase = PinDatabase.sharedInstance
    
    // what appears first
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // give the label's a border and set the text to empty
        for i in 0...digits.count-1{
            digits[i].layer.borderWidth = 2.0
            digits[i].layer.cornerRadius = 8
            digits[i].text = ""
        }
    }
    
    // if one of the buttons are pressed
    @IBAction func buttonPressed(_ sender: AnyObject) {
        // if the index is less than 4, so the appropriate amount of digits are given
        if (index < 4)
        {
            digits[index].text = String(sender.tag) // change corresponding label
            pinNumber = pinNumber + String(sender.tag) // add number to pinNumber
            index += 1 // increase index
        }
        
        if (index == 4) // exceeds allowed amount of digits
        {
            checkPin(pinNum:pinNumber) // check if the pinNumber is a valid pin
            index = 0 // set the index back to 0
            pinNumber = "" // set the pinNumber back to empty
        }
    }
    
    func checkPin(pinNum:String)
    {
        // return pin if found if not return nil
        let foundPin = myPinDatabase.searchForPin(pinNumber: pinNum)
        
        // if pin is found
        if (foundPin != nil)
        {
            // resets labels back to empty
            for i in 0...self.digits.count-1{
                self.digits[i].text = ""
            }
            
            // switch to browser view and send it the pin data
            var browserViewController: BrowserViewController
            if let arrController = tabBarController?.viewControllers {
                for vc in arrController {
                    if vc is BrowserViewController {
                        browserViewController = vc as! BrowserViewController
                        browserViewController.pin = foundPin
                        self.tabBarController?.selectedIndex = 1
                    }
                }
            }

        }
        else // pin was not found
        {
            let title = "\(pinNum) is incorrect"
            let message = "Please try again using another pin."
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            // clears last pin
            let doneAction = UIAlertAction(title: "Done", style: .cancel,
                                             handler: { (action) -> Void in
                for i in 0...self.digits.count-1{
                    self.digits[i].text = ""
                }
            })
            ac.addAction(doneAction)
            
            // presents the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
}
