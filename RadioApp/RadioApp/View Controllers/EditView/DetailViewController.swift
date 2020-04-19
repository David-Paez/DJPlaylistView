//  DetailViewController.Swift
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

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    // fields necessary for pin details
    @IBOutlet var pinField: UITextField!
    @IBOutlet var urlField: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // creates edit button at top right
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editPin))
    }
    
    // pin object
    var pin: PinDatabase.Pin! {
        didSet {
            navigationItem.title = pin.pin + " goes to " + pin.url
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // when the view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pinField.text = pin.pin // shows the current pin
        urlField.text = pin.url // shows the current pin's url
    }
    
    // edit the current pin shown
    @IBAction func editPin (_ sender: AnyObject) {
        
        // clear first responder
        view.endEditing(true)
        
        // save changes to pin
        pin.pin = pinField.text ?? ""
        pin.url = urlField.text ?? ""
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // if background tapped
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // if return pressed, dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
