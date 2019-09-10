//
//  main.swift
//  ProtocolNetworking
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

// https://onevcat.com/2016/12/pop-cocoa-2/

import Foundation



let request = UserRequest(name: "Trump")
request.send { user in
    if let user = user {
        print("\(user.message) from \(user.name)")
    }
}
