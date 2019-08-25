# Protocol-Oriented Programming

## 什么是面向协议编程

不同于传统的（单）继承，Swift 中的 Protocol 不仅可以给某一单个类型增加新的功能，而且可以给所有遵循指定的协议的任意类型增加新的功能。

Swift 中的 Protocol 可以继承，而且可以通过 Protocol extension 提供默认实现。

比较推荐的使用方式是把逻辑拆分成多个小的 Protocol 中，每个 Protocol 做的事情都是具体的、独立的。比如一个商品根据其特点可以遵循 purchasable、serializable、searchable 这三个协议。


## OOP VS. POP


POP 和 OOP 不是对立的关系，它们其实是相互关联的。

优先使用组合，而不是继承。

传统 OOP 存在的缺陷：
- 基类做了太多的事情，其中有些功能并不是每个子类所需要的
- 因为基类中集合了各种不同的功能，如果另一个不相关的类也有一部分功能与该基类一样，但此时却不能实现代码复用，因为它没有继承这个基类


## Swift Language Guide 中关于 Protocol 的介绍


### 1. What is Protocol


### 2. Protocol Syntax


1. 基本语法跟 OC 中的 Protocol 差不多。

2. 如果一个 class 既遵循协议，又继承了父类，则在定义这个类时，父类放在最前面，协议跟在后面。

### 3. Property Requirements

1. Protocol 中可以声明 instance property 和 type property，不管是 stored property 还是 computed property，我们只需要声明属性名和数据类型即可。

2. 但是，Protocol 中声明的属性一定要指明是 gettable 还是兼有 gettable 和 settable。

3. Protocol 中声明的属性一定要是 var 类型。

### 4. Method Requirements


### 5. Mutating Method Requirements


### 6. Initializer Requirements


### 7. Protocol as Types


### 8. Delegation

### 9. Adding Protocol Conformance with an Extension


### 10. Collections of Protocol Types


### 11. Protocol Inheritance


### 12. Class-Only Protocols


### 13. Protocol Composition

### 14. Checking for Protocol Conformance


### 15. Optional Protocol Requirements


### 16. Protocol Extensions


### 参考
- [Protocol (object-oriented programming) - Wikipedia](https://en.wikipedia.org/wiki/Protocol_(object-oriented_programming))
- [Protocols — The Swift Programming Language (Swift 5.1)
](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [What is protocol-oriented programming?](https://www.hackingwithswift.com/example-code/language/what-is-protocol-oriented-programming)
- [iOS Swift 3 Beginners Tutorial: Protocol-Oriented Views - Build An Animation Library in Swift 3](https://www.youtube.com/watch?v=AySlYrel7fc)🎬
- [Is there a difference between Swift 2.0 protocol extensions and Java/C# abstract classes?](https://stackoverflow.com/questions/30943209/is-there-a-difference-between-swift-2-0-protocol-extensions-and-java-c-abstract?noredirect=1&lq=1)
- [What is Protocol Oriented Programming in Swift? What added value does it bring?](https://stackoverflow.com/a/37530506)
- 相关的 WWDC 视频 🎬
  - [Protocol-Oriented Programming in Swift - WWDC](https://developer.apple.com/videos/play/wwdc2015/408/)
  - https://developer.apple.com/videos/play/wwdc2016/419
  - https://developer.apple.com/videos/play/wwdc2015/414
  - https://developer.apple.com/videos/play/wwdc2015/411/




- [面向协议编程与 Cocoa 的邂逅 (上) - OneV's Den](https://onevcat.com/2016/11/pop-cocoa-1/)
- [面向协议编程并不是一颗银弹 - InfoQ](http://www.infoq.com/cn/articles/protocol-oriented-programming-is-not-a-silver-bullet)（Protocol Oriented Programming is Not a Silver Bullet）
- [Swift 面向协议编程入门](https://github.com/xitu/gold-miner/blob/master/TODO/introduction-to-protocol-oriented-programming-in-swift.md)（Introduction to Protocol Oriented Programming in Swift）
- [从 Swift 的面向协议编程说开去 - bestswifter](https://bestswifter.com/pop/)
- [真刀真枪 面向协议编程 - Realm Academy](https://academy.realm.io/cn/posts/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/)
- [Introducing Protocol-Oriented Programming in Swift 3 - Ray Wenderlich](https://www.raywenderlich.com/148448/introducing-protocol-oriented-programming)
- [UIKit 里如何面向协议编程](https://github.com/xitu/gold-miner/blob/master/TODO/ios-9-tutorial-series-protocol-oriented-programming-with-uikit.md)

https://medium.com/nsistanbul/protocol-oriented-programming-in-swift-ad4a647daae2
https://medium.com/ios-os-x-development/how-protocol-oriented-programming-in-swift-saved-my-day-75737a6af022
https://academy.realm.io/posts/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/
https://www.toptal.com/swift/introduction-protocol-oriented-programming-swift
http://chris.eidhof.nl/post/protocol-oriented-programming/
https://www.appcoda.com/protocol-oriented-programming/
https://www.raywenderlich.com/814-introducing-protocol-oriented-programming-in-swift-3
https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift


