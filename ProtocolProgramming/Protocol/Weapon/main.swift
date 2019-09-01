//
//  main.swift
//  Weapon
//
//  Created by ShannonChen on 2019/9/1.
//  Copyright © 2019 xianglongchen. All rights reserved.
//

import Foundation

/// You can create blueprints for vars and funcs. Creating a var in a
/// protocol lets your classes to conform that protocol with forcing
/// to define that variables. In this example, we force developer to
/// add name, canFire and canCut vars to weapon he/she created using
/// Weapon protocol
protocol Weapon {
    var name: String { get }
    var canFire: Bool { get }
    var canCut: Bool { get }
}

protocol Fireable {
    var magazineSize: Int { get }
}

protocol Cuttable {
    var weight: Double { get }
    var steel: String { get }
}

extension Weapon {
    var canFire: Bool { return self is Fireable }
    var canCut: Bool { return self is Cuttable }
}

/// longsword is a weapon with ability to cut.
struct LongSword: Weapon, Cuttable {
    let name: String
    let steel: String
    let weight = 7.2
    let canFire = false
    let canCut = true
}

/// ak47 is also a weapon with ability to fire bullets.
struct AK47: Weapon, Fireable {
    let name = "AK47"
    let magazineSize = 30
    let canFire = true
    let canCut = false
}

/// I extend Bombable protocol from Fireable. With this new protocol, // I wanted to add maxDistance feature.
protocol Bombable: Fireable {
    var maxDistance: Double { get }
}

/// Then I create brand new Weapon, Howitzer
/// So this extensibility made my code base more flexible. Consider,
/// I do not want maxDistance in Fireable but Bombable.
struct Howitzer: Weapon, Bombable {
    let maxDistance: Double = 100 // in km
    let name = "Howitzer"
    let magazineSize = 1
}


let longclaw = LongSword(name: "Longclaw", steel: "Valyrian")
print(longclaw.name)
print(longclaw.canCut)
print(longclaw.canFire)

let ak47 = AK47()
print(ak47.name)
print(ak47.canCut)
print(ak47.canFire)
