//
//  VIPERViewController.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

protocol VIPERGreetingViewEventHandler {
    
//    func updatePerson(name: String!)
    func didTapShowGreetingButton()
}

class VIPERViewController: UIViewController, VIPERGreetingView, UITextFieldDelegate {
    
    // MARK: Properties
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    var eventHandler: VIPERGreetingViewEventHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        // sends user action
        self.eventHandler.didTapShowGreetingButton()
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    // update view by Presenter
    func setGreeting(_ greeting: String) {
        self.greetingLabel.text = greeting
    }

}
