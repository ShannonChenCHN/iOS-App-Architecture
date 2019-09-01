//
//  ViewController.swift
//  ImageEnity
//
//  Created by ShannonChen on 2019/9/1.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

/**
 Protocol Oriented Programming in Swift. by Károly Nyisztor
 https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift
 
 类的方式 VS. POP 的方式
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test
        createImage()
        createMyImage()
        
    }

    func createImage() {
        
        let image = Image(name: "Pic", data: Data(repeating: 0, count: 100))
        print(image.base64Encoded)
        
        do {
            // persist image
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let imageURL = documentDirectory.appendingPathComponent("MyImage")
            try image.save(to: imageURL)
            print("Image saved successfully to path \(imageURL)")
            
            // load image from persistence
            let storedImage = try Image.init(name: "MyRestoredImage", contentsOf: imageURL)
            print("Image loaded successfully from path \(imageURL)")
        } catch {
            print(error)
        }
    }
    
    func createMyImage() {
        let image = MyImage(name: "Pic", data: Data(repeating: 0, count: 100))
        print(image.base64Encoded)
        
        do {
            // persist image
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let imageURL = documentDirectory.appendingPathComponent("MyImage")
            try image.save(to: imageURL)
            print("Image saved successfully to path \(imageURL)")
            
            // load image from persistence
            let storedImage = try MyImage.init(name: "MyRestoredImage", contentsOf: imageURL)
            print("Image loaded successfully from path \(imageURL)")
        } catch {
            print(error)
        }
    }

}

