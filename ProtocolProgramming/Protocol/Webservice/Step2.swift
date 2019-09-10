//
//  Step2.swift
//  Webservice
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


 
//struct User {
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
//struct Episode {
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
//struct Resource<A> {
//    let url: URL
//    let parse: ([AnyHashable:Any]) -> A
//}
//
//class Webservice {
//    let userRes = Resource<User>(url: URL(string: "/users/current")!, parse: User.init)
//    let episodeRes = Resource<Episode>(url: URL(string: "/episodes/latest")!, parse: Episode.init)
//
//
//    private func load<A>(resource: Resource<A>) -> A {
//        URLSession.shared.dataTask(with: resource.url)
//        // load asynchronously, parse the JSON, etc. For the sake of the example, we directly return an empty result.
//        let json: [AnyHashable:Any] = [:] // should come from the server
//        return resource.parse(json)
//    }
//
//    func test() {
//
//        // 现在，我们不需要通过模拟任何东西来测试user和episode了，它们只是简单的 struct 值，只需要给 load 这一个方法写测试
//        let user = self.load(resource: userRes)
//        let episode = self.load(resource: episodeRes)
//    }
//}

