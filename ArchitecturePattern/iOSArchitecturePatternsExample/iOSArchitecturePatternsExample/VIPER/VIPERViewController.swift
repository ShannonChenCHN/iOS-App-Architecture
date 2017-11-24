//
//  VIPERViewController.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

protocol VIPERGreetingViewEventHandler {
    
    // 提供处理事件的接口
    func updatePerson(name: String?)
    func showGreeting()
    func didChangeNameInput(_ input: String?)
}

class VIPERViewController: UIViewController, VIPERGreetingView, UITextFieldDelegate {
    
    // MARK: Properties
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    var eventHandler: VIPERGreetingViewEventHandler!  // 持有 presenter

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // 布局代码
        // ...
        
        // 把事件交给 provider 处理
        self.eventHandler.showGreeting()
        
        // 注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(VIPERViewController.textFieldDidChangeText(_:)), name: .UITextFieldTextDidChange, object: self.nameField)
    }


    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: User Action
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        // 把事件交给 presenter 处理
        self.eventHandler.showGreeting()
    }
    
    
    func textFieldDidChangeText(_ notification: NSNotification) {
        
        if let object = notification.object as? UITextField, object == self.nameField {
            self.eventHandler.didChangeNameInput(self.nameField.text)
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.nameField {
            self.eventHandler.updatePerson(name: textField.text)
        }
    }
    
    // MARK: 提供接口给 Presenter 来更新 view
    func setGreeting(_ greeting: String!) {
        self.greetingLabel.text = greeting
    }
    
    func setGreetingButtonEnabled(_ enabled: Bool!) {
        self.showGreetingButton.isEnabled = enabled
    }

}
