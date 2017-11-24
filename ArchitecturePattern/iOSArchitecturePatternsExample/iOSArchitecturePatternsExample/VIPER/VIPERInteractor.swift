//
//  VIPERInteractor.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Foundation

protocol VIPERGreetingOutput: class {
    func receiveGreetingData(_ greetingData: VIPERGreetingData)
}



/// 用来转换数据结构的 model (not Entity)
struct VIPERGreetingData {
    let greeting: String
    let subject: String
}


/// Interactor: 处理数据相关的逻辑，比如借助 Services 创建新的 entity、或者通过 Managers 网络请求数据
class VIPERGreetingInteractor : VIPERGreetingProvider {
    
    
    var person: VIPERPerson?                 // 持有 model
    weak var output: VIPERGreetingOutput!   // 持有 presenter
    
    
    required init(person: VIPERPerson) {
        self.person = person
    }
    
    
    // 数据处理
    func provideGreetingData() {
    
        if let name = self.person?.name {
            let greeting = VIPERGreetingData(greeting: "Hello", subject: name)
            self.output.receiveGreetingData(greeting)
        }
    }
    
    func updatePerson(name: String!) {
    
        self.person = VIPERPerson(name: name)
    }
}
