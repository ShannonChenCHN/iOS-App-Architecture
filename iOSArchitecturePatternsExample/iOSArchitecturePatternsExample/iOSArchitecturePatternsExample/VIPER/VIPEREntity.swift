//
//  VIPEREntity.swift
//  iOSArchitecturePatternsExample
//
//  Created by ShannonChen on 2017/10/10.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

import Foundation

/// Entity (usually more complex e.g. NSManagedObject)
/// It is a plain data object, not the data access layer, because that is a responsibility of the Interactor.
struct VIPERPerson {
    var name: String?
    
}
