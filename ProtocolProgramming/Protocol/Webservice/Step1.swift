//
//  Step1.swift
//  Webservice
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation


/*
 核心逻辑：根据 url，发送请求，得到 json，json 解析
 */
 
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
//
//class Webservice {
//    func loadUser() -> User? {
//        let json = self.load(URL(string: "/users/current")!)
//        return User(json: json)
//    }
//
//    func loadEpisode() -> Episode? {
//        let json = self.load(URL(string: "/episodes/latest")!)
//        return Episode(json: json)
//    }
//
//    private func load(_ url: URL) -> [AnyHashable:Any] {
//        URLSession.shared.dataTask(with: url)
//        // etc.
//        return [:] // should come from the server
//    }
//
//    func test() {
//        // 这里我们需要给三个方法写测试
//        let json = self.load(URL(string: "/users/3566262")!)
//        let user = self.loadUser()  // 该方法内部依赖了 load 方法，需要借助 mock 或者 stub 的方式来模拟测试
//        let episode = self.loadEpisode()
//
//        // 什么是 stub？https://onevcat.com/2014/05/kiwi-mock-stub-test/
//    }
//}


