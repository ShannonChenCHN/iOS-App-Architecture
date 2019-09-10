//
//  Request.swift
//  ProtocolNetworking2
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
    associatedtype Response: Decodable
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
}

/// 将 Request 里的 send 方法和 host 移动到了 Client 里
protocol Client {
//    func send(_ r: Request, handler: @escaping (Request.Response?) -> Void) // 编译报错
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)
    
    var host: String { get }
}

/// 请求不应该也不需要知道如何解析得到的数据，这项工作应该交给 Response 来做
/// 所以，我们将 Request 里的 parse 方法移到了 Decodable 里
protocol Decodable {
    static func parse(data: Data) -> Self?  // 这是一个静态方法
}


/// 现在发送请求的部分和请求本身分离开了，而且我们使用协议的方式定义了 Client。
/// 除了 URLSessionClient 以外，我们还可以使用任意的类型来满足这个协议，并发送请求。
/// 这样网络层的具体实现和请求本身就不再相关了
struct URLSessionClient: Client {
    let host = "https://api.ctrip.com"
    
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            if let data = data, let res = T.Response.parse(data: data) {
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
    
    var path: String {
        return "/users/\(name)"
    }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]

}

