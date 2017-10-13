//
//  MVVMViewController.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit

/// Any view model that used with the view `MVVMViewController` must conform to the protocol `GreetingViewModelProtocol`
protocol GreetingViewModelProtocol: class {
    
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
    var nameInputDidChange: ((GreetingViewModelProtocol, Bool) -> ())? {get set}
    init(person: MVVMPerson)
    
    // 提供处理事件的接口
    func updatePerson(name: String?)
    func showGreeting()
    func didChangeNameInput(_ input: String?)
}


/// MVVMViewController 其实就是 View
class MVVMViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    // View Model
    var viewModel: GreetingViewModelProtocol! {  // 持有 view model
        didSet {
            // 响应 view model 的数据更新：（实际上，一般采用 RxSwift 来实现数据绑定，但是这里简单处理了）
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
            
            self.viewModel.nameInputDidChange = { [unowned self] viewModel, isEnabled in
                self.showGreetingButton.isEnabled = isEnabled
            }
        }
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.viewModel.showGreeting()
        
        // 注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(MVCViewController.textFieldDidChangeText(_:)), name: .UITextFieldTextDidChange, object: self.nameField)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    
    // MARK: User Action -> 处理事件，并传给 View model 处理（实际上，一般采用 RxSwift 来实现事件绑定，但是这里简单处理了）
    
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        self.viewModel.showGreeting()
    }
    
    
    func textFieldDidChangeText(_ notification: NSNotification) {
        
        if let object = notification.object as? UITextField, object == self.nameField {
            self.viewModel.didChangeNameInput(self.nameField.text)
        }
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.nameField {
            self.viewModel.updatePerson(name: textField.text)
        }
        
    }

}
