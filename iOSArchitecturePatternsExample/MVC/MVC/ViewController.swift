//
//  ViewController.swift
//  MVC
//
//  Created by ShannonChen on 2017/10/9.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit


/// View + Controller
class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    // Model
    var person: Person!
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // layout code goes here or layout through xib/storyboard
        
        
        // Assembling of MVC
        let model = Person(name: "David")
        self.person = model  // `self` is a combination of view and controller
        
        // Update view
        showGreeting()
    }

    
    // MARK: User Action
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        // Update model
        if let name = self.nameField.text, name.characters.count > 0 {
            self.person = Person(name: name)
        }
        
        // Update view
        showGreeting()
    }
    
    // MARK: Private Methods
    func showGreeting() {
        if let name =  self.person.name {
            let greeting = "Hello" + ", " + name + "!"
            self.greetingLabel.text = greeting
        }
    }

}

