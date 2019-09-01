//
//  Logoutable.swift
//  LogoutableExample
//
//  Created by ShannonChen on 2019/9/1.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


protocol Logoutable {
    func logout()
}

extension Logoutable {
    func logout() {
        //Perform Logout
        print("Logout User")
    }
}
