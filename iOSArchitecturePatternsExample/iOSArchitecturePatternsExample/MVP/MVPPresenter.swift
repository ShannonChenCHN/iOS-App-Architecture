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

    // 用于更新 view 的接口
    func setGreeting(_ greeting: String!)
    func setGreetingButtonEnabled(_ enabled: Bool!)
}

/// Presenter
class MVPPresenter: MVPGreetingViewPresenter {
    
    unowned let view: MVPGreetingView  // 持有 view
    var person: MVPPerson              // 持有 model
    
    required init(view: MVPGreetingView, person: MVPPerson) {
        self.view = view
        self.person = person
    }
    
    
    // MARK: 接收 view 传递过来的事件
    func updatePerson(name: String?) {
    
        // 更新 Model
        if let name = name, name.characters.count > 0 {
            self.person = MVPPerson(name: name)
        }
        
    }
    

    func showGreeting() {
    
        if let name =  self.person.name {
        
            // 处理数据
            let greeting = "Hello" + ", " + name + "!"
            
            // 更新 view
            self.view.setGreeting(greeting)
        }
    }
    
    func didChangeNameInput(_ input: String?) {
    
        // 更新 view
        if let name = input, name.characters.count > 0  {
            
            self.view.setGreetingButtonEnabled(true)
            
        } else {
            self.view.setGreetingButtonEnabled(false)
        }
    }

}
