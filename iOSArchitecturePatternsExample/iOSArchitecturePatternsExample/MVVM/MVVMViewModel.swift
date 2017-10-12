//
//  MVVMViewModel.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Foundation

/// View Model
class MVVMViewModel : GreetingViewModelProtocol {
    
    var person: MVVMPerson   // owns model
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)  // user action binding -> update view
        }
    }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    
    required init(person: MVVMPerson) {
        self.person = person
    }
    
    // MARK: Updates Model
    func updatePerson(name: String!) {
        self.person = MVVMPerson(name: name)
    }
    
    // update model
    func showGreeting() {
        if let name =  self.person.name {
            self.greeting = "Hello" + ", " + name + "!"  // -> user action binding -> update view
        }
    }
}
