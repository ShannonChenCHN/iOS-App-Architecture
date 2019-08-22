//
//  Example03.swift
//  ProtocolExtensionAndAbstractClass
//
//  Created by xianglongchen on 2019/8/22.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


/*
 Protocols 可以选择使用静态派发还是动态派发
 */

protocol P {
    func a()
}

extension P {
    func a() { print("default implementation of A") }
    func b() { print("default implementation of B") }
}

struct S: P {
    func a() { print("specialized implementation of A") }
    func b() { print("specialized implementation of B") }
}


func runExample03() {
    //let p: P = S()
    let p = S()
    p.a() // -> "specialized implementation of A"
    p.b() // -> "default implementation of B"
}
