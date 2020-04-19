//  NewPinView.swift
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
//  Some code remodified from Big Nerd Ranch

import UIKit

// New Pin View in charge of putting in new pin details
class NewPinView: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate
{
    // fields for the different pin details needed
    @IBOutlet var pinField: UITextField!
    @IBOutlet var urlField: UITextField!
    
    // pin database object which serves as model in MVC design
    var myPinDatabase: PinDatabase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addNewPin(_ sender: AnyObject) {
        // creates a new pin in the database as long as database has less than 10 pins
        if myPinDatabase.totalPins() < 10 {
            myPinDatabase.addPin(pin: pinField.text!, url: urlField.text!)
            self.navigationController?.popToRootViewController(animated: true)
        }
        else { // if more than 10 pins
            
            // send message saying max has been exceeded
            let title = "Max Number of Pins (10)"
            let message = "Can not add anymore, sorry."
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let doneAction = UIAlertAction(title: "Done", style: .cancel,
                                           handler: { (action) -> Void in
                print("Not added")
            })
            ac.addAction(doneAction)
            
            // presents the alert controller
            present(ac, animated: true, completion: nil)
        }
    }

    // stops editing if background tapped
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    // stops editing if return tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

