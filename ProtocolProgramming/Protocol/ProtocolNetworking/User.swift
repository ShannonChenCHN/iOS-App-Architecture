//
//  User.swift
//  ProtocolNetworking
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


struct User {
    let name: String
    let message: String
    
    /// 将输入的数据 (从网络请求 API 获取) 解析为 JSON 对象，
    /// 然后从中取出 name 和 message，并构建代表 API 返回的 User 实例
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            return nil
        }
        guard let name = obj["name"] as? String else {
            return nil
        }
        guard let message = obj["message"] as? String else {
            return nil
        }
        
        self.name = name
        self.message = message
    }
}
