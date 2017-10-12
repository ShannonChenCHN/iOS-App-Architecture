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
    init(person: MVVMPerson)
    
    func updatePerson(name: String!)
    func showGreeting()
}


/// MVVMViewController == View
class MVVMViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    // View Model
    var viewModel: GreetingViewModelProtocol! {  // owns view model
        didSet {
            // data binding
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // user action binding(In fact, we need some binding mechanism here,like RxSwift)
        self.viewModel.showGreeting()
    }
    
    // MARK: User Action
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        // user action binding(In fact, we need some binding mechanism here,like RxSwift)
        self.viewModel.showGreeting()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let name = self.nameField.text, name.characters.count > 0 {
            
            // user action binding(In fact, we need some binding mechanism here,like RxSwift)
            self.viewModel.updatePerson(name: name)
        }
    }

}
