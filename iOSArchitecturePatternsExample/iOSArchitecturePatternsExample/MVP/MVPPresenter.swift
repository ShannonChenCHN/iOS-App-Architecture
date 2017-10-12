//
//  MVPPresenter.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Foundation

/// Any view that used with the presenter `MVPPresenter` must conform to the protocol `GreetingView`
protocol MVPGreetingView: class {
    func setGreeting(_ greeting: String) // p -> update view
}

/// Presenter
class MVPPresenter: MVPGreetingViewPresenter {
    
    unowned let view: MVPGreetingView
    var person: MVPPerson
    
    required init(view: MVPGreetingView, person: MVPPerson) {
        self.view = view
        self.person = person
    }
    
    
    // MARK: Update Model
    func updatePerson(name: String!) {
        self.person = MVPPerson(name: name)
    }
    
    // MARK: Update View(passive)
    func showGreeting() {
        if let name =  self.person.name {
            let greeting = "Hello" + ", " + name + "!"
            self.view.setGreeting(greeting)
        }
    }

}
