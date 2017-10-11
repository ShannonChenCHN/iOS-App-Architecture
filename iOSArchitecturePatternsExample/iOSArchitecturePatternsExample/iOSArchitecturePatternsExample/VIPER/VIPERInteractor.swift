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



/// Transport data structure (not Entity)
struct VIPERGreetingData {
    let greeting: String
    let subject: String
}


/// Interactor: Manipulate data and use cases
/// It contains business logic related to the data (Entities) or networking, like creating new instances of entities or fetching them from the server
class VIPERGreetingInteractor : VIPERGreetingProvider {
    
    weak var output: VIPERGreetingOutput!
    
    
    func provideGreetingData() {
        
        let person = VIPERPerson(name: "David") // usually comes from data access layer
        if let name = person.name {
            let subject = name + " " + "Stern"
            let greeting = VIPERGreetingData(greeting: "Hello", subject: subject)
            self.output.receiveGreetingData(greeting)
        }
    }
}
