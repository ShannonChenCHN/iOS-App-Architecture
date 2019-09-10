//
//  Step3.swift
//  Webservice
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation

//struct User: FromJSON {
//    var json: [AnyHashable: Any]
//    var name: String = ""
//    init(json: [AnyHashable: Any]) {
//        self.json = json
//        if let name = json["name"] as? String {
//            self.name = name
//        }
//    }
//}
//
//struct Episode: FromJSON {
//    var json: [AnyHashable: Any]
//    var title: String = ""
//    init(json: [AnyHashable: Any]) {
//        self.json = json
//        if let title = json["title"] as? String {
//            self.title = title
//        }
//    }
//}
//
//protocol FromJSON {
//    init(json: [AnyHashable: Any])
//}
//
//struct Resource<A: FromJSON> {
//    let url: URL
//}
//
//class Webservice {
//    let userRes = Resource<User>(url: URL(string: "/users/current")!)
//    let episodeRes = Resource<Episode>(url: URL(string: "/episodes/latest")!)
//
//    private func load<A>(resource: Resource<A>) -> A {
//        URLSession.shared.dataTask(with: resource.url)
//        // load asynchronously, parse the JSON, etc. For the sake of the example, we directly return an empty result.
//        let json: [AnyHashable:Any] = [:] // should come from the server
//        return A(json: json)
//    }
//
//    func test() {
//
//        // 但是这里存在的一个问题是，如果我们要加载一个数组呢？服务端返回的结果类似于 {"users": [User对象1, User对象2, ...]}
//        let user = self.load(resource: userRes)
//        let episode = self.load(resource: episodeRes)
//    }
//}
