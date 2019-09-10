//
//  Request.swift
//  ProtocolNetworking
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    /// 添加一个关联类型，我们可以将回调参数进行抽象，而不是具体的类型（比如 User）
    associatedtype Response
    
    var host: String { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    send(handler: @escaping (Response?) -> Void)
    
    /// 解析服务器返回的数据
    func parse(data: Data) -> Response?
}

extension Request {

    /// 为了任意请求都可以通过同样的方法发送，我们将发送的方法定义在 Request 协议扩展上
    func send(handler: @escaping (Response?) -> Void) {
        let url = URL(string: host.appending(path))!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // 在示例中我们不需要 `httpBody`，实践中可能需要将 parameter 转为 data
        // request.httpBody = ...
        
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            // 处理结果
            if let data = data, let res = self.parse(data: data) {
                DispatchQueue.main.async { handler(res) }
            } else {
                DispatchQueue.main.async { handler(nil) }
            }
        }
        task.resume()
    }
}


struct UserRequest: Request {
    typealias Response = User
    
    let name: String
    
    let host = "https://api.ctrip.com"
    var path: String {
        return "/users/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
    
    func parse(data: Data) -> User? {
        return User(data: data)
    }
}


/*
 最大的问题在于，Request 管理了太多的东西。一个 Request 应该做的事情应该仅仅是定义请求入口和期望的响应类型，而现在 Request 不光定义了 host 的值，还对如何解析数据了如指掌。最后 send 方法被绑死在了 URLSession 的实现上，而且是作为 Request 的一部分存在。这是很不合理的，因为这意味着我们无法在不更改请求的情况下更新发送请求的方式，它们被耦合在了一起。这样的结构让测试变得异常困难，我们可能需要通过 stub 和 mock 的方式对请求拦截
 */
