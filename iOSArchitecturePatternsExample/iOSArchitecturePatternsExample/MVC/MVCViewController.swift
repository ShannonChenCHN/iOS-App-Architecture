//
//  MVCViewController.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

/// MVCViewController == View + Controller
class MVCViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    // Model
    var person: MVCPerson!
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // layout code goes here or layout through xib/storyboard
                
        // Update view
        showGreeting()
    }
    
    
    // MARK: User Action
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        // Update view
        showGreeting()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Update model
        if let name = self.nameField.text, name.characters.count > 0 {
            self.person = MVCPerson(name: name)
        }
    }
    
    // MARK: Private Methods
    private func showGreeting() {
        if let name =  self.person.name {
            let greeting = "Hello" + ", " + name + "!"
            self.greetingLabel.text = greeting
        }
    }

}
