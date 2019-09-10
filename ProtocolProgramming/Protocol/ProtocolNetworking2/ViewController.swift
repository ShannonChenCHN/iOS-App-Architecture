//
//  ViewController.swift
//  ProtocolNetworking2
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        URLSessionClient().send(UserRequest(name: "Trump")) { user in
            if let user = user {
                print("\(user.message) from \(user.name)")
            }
        }
    }


}

