//
//  ViewController.swift
//  LogoutableExample
//
//  Created by ShannonChen on 2019/9/1.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

/**
 https://medium.com/ios-os-x-development/how-protocol-oriented-programming-in-swift-saved-my-day-75737a6af022
 
 解决了两个问题：
 1. 因为不需要所有的 Controller 都具备这个 logout 的功能，所以基类中添加这个方法不太好，因此，我们定义了一个 Logoutable 协议，在各个需要 logout 功能的类中遵循这个协议
 2. 基类中实现的好处是继承基类后可以复用代码，现在改成遵循 Logoutable 协议后，就需要通过 Protocol Extension 来添加默认实现了。
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
//    func logout() {
//        //Perform Logout
//        print("Logout User")
//    }


}

