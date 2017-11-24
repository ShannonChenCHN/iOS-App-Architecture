//
//  VIPERPresenter.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Foundation



protocol VIPERGreetingView: class {
    func setGreeting(_ greeting: String!)
    func setGreetingButtonEnabled(_ enabled: Bool!)
}

protocol VIPERGreetingProvider {
    func provideGreetingData()
    func updatePerson(name: String!)
}


/// Presenter: contains the UI related (but UIKit independent) business logic, invokes methods on the Interactor.
class VIPERGreetingPresenter : VIPERGreetingOutput, VIPERGreetingViewEventHandler {
    
    weak var view: VIPERGreetingView!               // 持有 View
    var greetingProvider: VIPERGreetingProvider!    // 持有 Interactor
    
    // MARK: 接收来自 View 的事件
    func showGreeting() {
        // 让 Interactor 提供数据
        self.greetingProvider.provideGreetingData()
    }
    
    func updatePerson(name: String?) {
        
        // 告诉 Interactor 去更新数据
        if let name = name, name.characters.count > 0{
            self.greetingProvider.updatePerson(name: name)
        }
        
    }
    
    func didChangeNameInput(_ input: String?) {
        if let name = input, name.characters.count > 0  {
            
            self.view.setGreetingButtonEnabled(true)
            
        } else {
            self.view.setGreetingButtonEnabled(false)
        }
    }
    
    // MARK: 接到 Interactor 提供数据的通知
    func receiveGreetingData(_ greetingData: VIPERGreetingData) {
        
        let greeting = greetingData.greeting + ", " + greetingData.subject + "!"
        
        // 更新 View
        self.view.setGreeting(greeting)
    }
}
