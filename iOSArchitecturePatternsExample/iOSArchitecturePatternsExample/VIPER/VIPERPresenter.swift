//
//  VIPERPresenter.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Foundation



protocol VIPERGreetingView: class {
    func setGreeting(_ greeting: String)
}

protocol VIPERGreetingProvider {
    func provideGreetingData()
}


/// Presenter: contains the UI related (but UIKit independent) business logic, invokes methods on the Interactor.
class VIPERGreetingPresenter : VIPERGreetingOutput, VIPERGreetingViewEventHandler {
    
    weak var view: VIPERGreetingView!
    var greetingProvider: VIPERGreetingProvider!
    
    // pass user action to interactor
    func didTapShowGreetingButton() {
        self.greetingProvider.provideGreetingData()
    }
    
    // Fetch data from interactor, and update UI
    func receiveGreetingData(_ greetingData: VIPERGreetingData) {
        
        let greeting = greetingData.greeting + " " + greetingData.subject
        self.view.setGreeting(greeting)
    }
}
