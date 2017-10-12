//
//  MVPViewController.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import UIKit


/// Any presenter that used with the view `MVPViewController` must conform to the protocol `GreetingViewPresenter`
protocol MVPGreetingViewPresenter {
    
    init(view: MVPGreetingView, person: MVPPerson)  // owns model
    
    func updatePerson(name: String!)    // V -> update model -> M
    func showGreeting()                 // M(V) -> update view(passive) -> V
}


/// MVPViewController == View
class MVPViewController: UIViewController, MVPGreetingView, UITextFieldDelegate {
    
    // MARK: Properties
    
    // View
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var showGreetingButton: UIButton!
    
    // Presenter
    var presenter: MVPGreetingViewPresenter! // owns presenter
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // layout code goes here or layout through xib/storyboard
        
        // sends action
        self.presenter.showGreeting()
    }
    
    
    // MARK: User Action -> P
    @IBAction func didTapButton(button: UIButton) {
        view.endEditing(true)
        
        // sends user action
        self.presenter.showGreeting()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // sends user action
        if let name = self.nameField.text, name.characters.count > 0 {
            self.presenter.updatePerson(name: name)
        }
    }
    
    // MARK: P -> Update View
    func setGreeting(_ greeting: String) {
        self.greetingLabel.text = greeting
    }
}
