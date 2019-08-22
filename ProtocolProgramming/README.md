# Protocol-Oriented Programming

### 什么是面向协议编程

不同于传统的（单）继承，Swift 中的 Protocol 不仅可以给某一单个类型增加新的功能，而且可以给所有遵循指定的协议的任意类型增加新的功能。

Swift 中的 Protocol 可以继承，而且可以通过 Protocol extension 提供默认实现。

比较推荐的使用方式是把逻辑拆分成多个小的 Protocol 中，每个 Protocol 做的事情都是具体的、独立的。比如一个商品根据其特点可以遵循 purchasable、serializable、searchable 这三个协议。


### OOP VS. POP


POP 和 OOP 不是对立的关系，它们其实是相互关联的。

优先使用组合，而不是继承。

传统 OOP 存在的缺陷：
- 基类做了太多的事情，其中有些功能并不是每个子类所需要的
- 因为基类中集合了各种不同的功能，如果另一个不相关的类也有一部分功能与该基类一样，但此时却不能实现代码复用，因为它没有继承这个基类


### Swift Language Guide 中关于 Protocol 的介绍
- Protocol Syntax
- Protocol Requirements
- Method Requirements
- Mutating Method Requirements
- Initializer Requirements
- Protocol as Types
- Delegation
- Adding Protocol Conformance with an Extension
- Collections of Protocol Types
- Protocol Inheritance
- Class-Only Protocols
- Protocol Composition
- Checking for Protocol Conformance
- Optional Protocol Requirements
- Protocol Extensions


### 参考
- [Protocol (object-oriented programming) - Wikipedia](https://en.wikipedia.org/wiki/Protocol_(object-oriented_programming))
- [Protocols — The Swift Programming Language (Swift 5.1)
](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [What is protocol-oriented programming?](https://www.hackingwithswift.com/example-code/language/what-is-protocol-oriented-programming)
- [Is there a difference between Swift 2.0 protocol extensions and Java/C# abstract classes?](https://stackoverflow.com/questions/30943209/is-there-a-difference-between-swift-2-0-protocol-extensions-and-java-c-abstract?noredirect=1&lq=1)
- [What is Protocol Oriented Programming in Swift? What added value does it bring?](https://stackoverflow.com/a/37530506)




A very good simple usage of POP:
https://www.youtube.com/watch?v=AySlYrel7fc

WWDC video
https://developer.apple.com/videos/play/wwdc2016/419
https://developer.apple.com/videos/play/wwdc2015/414
https://developer.apple.com/videos/play/wwdc2015/411/





https://medium.com/nsistanbul/protocol-oriented-programming-in-swift-ad4a647daae2
https://medium.com/ios-os-x-development/how-protocol-oriented-programming-in-swift-saved-my-day-75737a6af022
https://academy.realm.io/posts/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/
https://www.toptal.com/swift/introduction-protocol-oriented-programming-swift
http://chris.eidhof.nl/post/protocol-oriented-programming/
https://www.appcoda.com/protocol-oriented-programming/
https://www.raywenderlich.com/814-introducing-protocol-oriented-programming-in-swift-3
https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift


