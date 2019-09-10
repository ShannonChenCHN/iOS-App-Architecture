//
//  Step4.swift
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
//protocol Resource {
//    associatedtype Result
//    var url: URL { get }
//    func parse(json: [AnyHashable:Any]) -> Result
//}
//
//struct UserResource: Resource {
//    let url = URL(string: "/users/current")!
//    func parse(json: [AnyHashable : Any]) -> User {
//        return User(json: json)
//    }
//}
//
//struct EpisodeResource: Resource {
//    let url = URL(string: "/episodes/latest")!
//    func parse(json: [AnyHashable : Any]) -> Episode {
//        return Episode(json: json)
//    }
//}
//
//class Webservice {
//    private func load<R: Resource>(resource: R) -> R.Result {
//        URLSession.shared.dataTask(with: resource.url)
//        // load asynchronously, parse the JSON, etc. For the sake of the example, we directly return an empty result.
//        let json: [AnyHashable:Any] = [:]
//        return resource.parse(json: json)
//    }
//
//    func test() {
//
//        let user = self.load(resource: UserResource())
//        let episode = self.load(resource: EpisodeResource())
//    }
//}
