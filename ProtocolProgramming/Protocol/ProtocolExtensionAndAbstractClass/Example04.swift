//
//  Example04.swift
//  ProtocolExtensionAndAbstractClass
//
//  Created by xianglongchen on 2019/8/22.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


/*
 Protocols extensions 不能存储值
 */

protocol Named {
    var firstname: String {
        get set
    }
    
    var lastname: String {
        get set
    }
    
    var fullName: String {
        get
    }
}

extension Named {
    //    var firstname: String = "Trump" // Extensions must not contain stored properties
    var fullName: String {
        return firstname + " " + lastname
    }
}

struct Person: Named {
    var firstname: String
    var lastname: String
    init(firstname: String, lastname: String) {
        self.firstname = firstname
        self.lastname = lastname
    }
}

func runExample04() {
    let Trump = Person(firstname: "Donald", lastname: "Trump")
    print(Trump.fullName)
}
