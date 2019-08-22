//
//  Example02.swift
//  ProtocolExtensionAndAbstractClass
//
//  Created by xianglongchen on 2019/8/22.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation

/*
 Protocol extensions 可以限制使用场景
 */
extension Collection where Self.Iterator.Element: Comparable {
    var best: Self.Iterator.Element? {
        guard self.count > 0 else {
            return nil
        }
        
        var best = self.first!
        for element in self {
            if element > best {
                best = element
            }
        }
        return best
    }
}

func runExample02() {
    let numbers = [3, 45, 11, 24, 76, 44]
    print(numbers.best ?? 0)
}
