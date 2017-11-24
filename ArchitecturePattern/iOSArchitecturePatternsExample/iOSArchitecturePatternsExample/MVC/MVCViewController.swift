//
//  MVCViewController.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

/// MVCViewController 其实是 View + Controller
class MVCViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    // Model
    var person: MVCPerson!  // 持有 model
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // subviews 布局代码
                
        // 更新 view
        showGreeting()
        
        // 注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(MVCViewController.textFieldDidChangeText(_:)), name: .UITextFieldTextDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: User Action
    
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        // 更新 view
        showGreeting()
    }
    
    
    func textFieldDidChangeText(_ notification: NSNotification) {
        
        // 更新 view
        if let name = self.nameField.text, name.characters.count > 0  {
            
            self.showGreetingButton.isEnabled = true
            
        } else {
            self.showGreetingButton.isEnabled = false
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 更新 model
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
