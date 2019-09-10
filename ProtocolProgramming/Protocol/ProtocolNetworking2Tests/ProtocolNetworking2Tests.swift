//
//  ProtocolNetworking2Tests.swift
//  ProtocolNetworking2Tests
//
//  Created by ShannonChen on 2019/9/2.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import XCTest
@testable import ProtocolNetworking2

struct LocalFileClient: Client {
    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        switch r.path {
        case "/users/trump":
            guard let fileURL = Bundle(for: ProtocolNetworking2Tests.self).url(forResource: "users-trump", withExtension: "") else {
                fatalError()
            }
            guard let data = try? Data(contentsOf: fileURL) else {
                fatalError()
            }
            handler(T.Response.parse(data: data))
        default:
            fatalError("Unknown path")
        }
    }

    // 这里只是为了满足 `Client` 的要求，实际我们不会发送请求
    let host = ""
}

class ProtocolNetworking2Tests: XCTestCase {
    
    func testUserRequest() {
        let client = LocalFileClient()
        client.send(UserRequest(name: "trump")) {
            user in
            XCTAssertNotNil(user)
            XCTAssertEqual(user!.name, "Donald Trump")
        }
    }

}
