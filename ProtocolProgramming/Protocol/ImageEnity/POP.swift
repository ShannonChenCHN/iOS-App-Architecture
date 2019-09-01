//
//  POP.swift
//  ImageEnity
//
//  Created by ShannonChen on 2019/9/1.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation
import UIKit

/// A image with name and data
protocol NamedImageData {
    var name: String { get }
    var data: Data { get }
    init(name: String, data: Data)
}

/// A image with name and data, and also can be persisted
protocol ImageDataPersisting: NamedImageData {
    init(name: String, contentsOf url: URL) throws
    func save(to url: URL) throws
//    func compress(withQuality compressionQuality: Double) -> Self?
}

extension ImageDataPersisting {
    init(name: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(name: name, data: data)
    }
    
    func save(to url: URL) throws {
        try self.data.write(to: url)
    }
    
//    func compress(withQuality compressionQuality: Double) -> Self? {
//        guard let uiImage = UIImage.init(data: self.data) else {
//            return nil
//        }
//        guard let jpegData = uiImage.jpegData(compressionQuality: CGFloat(compressionQuality)) else {
//            return nil
//        }
//        return Self(name: self.name, data: jpegData)
//    }
}

/// A image with name and data, and also can be compressed
protocol ImageDataCompressing: NamedImageData {
    func compress(withQuality compressionQuality: Double) -> Self?
}

extension ImageDataCompressing {
    func compress(withQuality compressionQuality: Double) -> Self? {
        guard let uiImage = UIImage.init(data: self.data) else {
            return nil
        }
        guard let jpegData = uiImage.jpegData(compressionQuality: CGFloat(compressionQuality)) else {
            return nil
        }
        return Self(name: self.name, data: jpegData)
    }
}

/// A image with name and data, and also can be encoded in base64
protocol ImageDataEncoding: NamedImageData {
    var base64Encoded: String { get }
}

extension ImageDataEncoding {
    var base64Encoded: String {
        return self.data.base64EncodedString()
    }
}


/// A image with name and data, and also can be persisted and compressed and  encoded in base64
struct MyImage: ImageDataPersisting, ImageDataCompressing, ImageDataEncoding {
    var name: String
    var data: Data
}


