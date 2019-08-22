//
//  Example01.swift
//  ProtocolExtensionAndAbstractClass
//
//  Created by xianglongchen on 2019/8/22.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


/*
 Protocol extensions 既支持引用类型（class）又支持值类型（struct, enum）
 
 */
protocol Runable {
    func run()
}

extension Runable {
    func run() {
        print("run...")
    }
}

struct Dog: Runable {
    func bark() {
        print("bark...")
    }
}

class Man: Runable {
    var name: String
    init(name: String) {
        self.name = name
    }
}

func runExample01() {
    let dog = Dog.init()
    let Jim = Man.init(name: "Jim")
    dog.bark()
    Jim.run()
    dog.run()
}

