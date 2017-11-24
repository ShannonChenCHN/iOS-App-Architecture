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
    
    // 持有 model
    var person: MVVMPerson?
    
    var greeting: String?
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    var nameInputDidChange: ((GreetingViewModelProtocol, Bool) -> ())?
    
    
    required init(person: MVVMPerson) {
        self.person = person
    }
    
    /** 接收 view 传递过来的事件 **/
    
    func updatePerson(name: String?) {
        
        if let name = name, name.characters.count > 0 {
            self.person = MVVMPerson(name: name)
        }
    }
    
    func showGreeting() {
        if let name =  self.person?.name {
            // 处理数据
            self.greeting = "Hello" + ", " + name + "!"
            
            // 处理事件
            self.greetingDidChange?(self)
        }
    }
    
    func didChangeNameInput(_ input: String?) {
        // 更新 view
        if let name = input, name.characters.count > 0  {
            
            // 数据绑定：数据一改，对应的 view 就更新（实际上，一般采用 RxSwift 来实现，但是这里简单处理了）
            self.nameInputDidChange?(self, true)
            
        } else {
            self.nameInputDidChange?(self, false)
        }
        
    }
}
