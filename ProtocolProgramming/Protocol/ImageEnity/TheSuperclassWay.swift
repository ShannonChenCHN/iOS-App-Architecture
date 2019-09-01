//
//  Image.swift
//  ImageEnity
//
//  Created by ShannonChen on 2019/9/1.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation
import UIKit

class Image {
    fileprivate var imageName: String
    fileprivate var imageData: Data
    
    var name: String {
        return imageName
    }
    
    init(name: String, data: Data) {
        imageName = name
        imageData = data
    }
    
    // persistence
    func save(to url: URL) throws {
        try self.imageData.write(to: url)
    }
    
    convenience init(name: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(name: name, data: data)
    }
    
    // compression
    convenience init?(named name: String, data: Data, compressionQuality: Double) {
        guard let image = UIImage.init(data: data) else { return nil }
        guard let jpegData = image.jpegData(compressionQuality: CGFloat(compressionQuality)) else { return nil }
        self.init(name: name, data: jpegData)
    }
    
    // BASE64 encoding
    var base64Encoded: String {
        return imageData.base64EncodedString()
    }
}

