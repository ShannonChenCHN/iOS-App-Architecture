# Protocol Oriented Programming in Swift


## 一、Protocol 语法概览（Swift）

基本上与 Objective-C 一致：
- 定义 Protocol
- Protocol 可以作为一个匿名类型来使用
- 可以在一个类的 Extension 中遵循某个 Protocol
- Protocol 可以继承

比 Objective-C 更牛的特性：
- 支持 struct、enumeration 值类型
- 在使用 Protocol 声明一个函数参数类型或者变量类型时，可以组合多个 Protocol
- Protocol Extension 支持添加默认实现


## 二、什么是面向协议编程

> “Don’t start with a class, start with a protocol.”

**什么是 Protocol？**

维基百科中的定义：
> Protocol is a term used by particular object-oriented programming languages with a variety of specific meanings, which other languages may term interface or trait.
>
> Protocol when used otherwise is akin to a Communication protocol, indicating the chain of interactions between the caller and the object.

苹果官方文档的定义：
> A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol. …




Protocol 是一个抽象的接口声明，定义了一些规范——声明了实体类需要实现的方法、属性，以及其他一些要求。




```Swift
// An example of a protocol
protocol Hashable {
    var hashValue: Int { get }
    func hash(into hasher: inout Hasher)
}
```

> 在 Swift 中，苹果更推荐使用值类型而不是 class。

Swift Protocol 的三个核心特性：
- protocol inheritance：既保留了 OOP 的继承特性，又弥补了 struct、enum 这些值类型不支持继承的缺陷
- protocol compositions：通过组合来实现“多继承”
- protocol extensions：提供默认实现


### 1. OOP VS. POP


POP 和 OOP 不是对立的关系，它们其实是相互关联的，在实践 POP 时，我们依然还需要依赖 OOP 的三大特性。所以，POP 和 OOP 是需要结合使用的，而不是孤立存在的。

设计模式：**优先使用组合，而不是继承**。

传统 OOP 存在的缺陷：
- 基类做了太多的事情，其中有些方法和属性并不是每个子类所需要的（这样会导致代码复杂度上升，不好维护，做单元测试也不好做）
- 太依赖继承，如果想要另一个类中的功能，就只能在父类中重新实现一遍了（大多数语言都不支持多继承）
- 继承层级太多时，在不同的类里面跳来跳去，编写代码或者修复 bug 都会变得非常棘手
- struct 和 enum 不能支持继承


```
 父类       ABC

子类  A BC  AB  AC  ABC
```

图 1

POP 带来的优点：
- protocol 更像是一个蓝图，而不是一个父类，protocol 只是一个抽象描述，告诉遵循者要实现什么。
- 一个类型（包括值类型和引用类型）可以遵循多个不同的协议，所以我们可以将多个不同类别的功能拆分到不同的 Protocol 中去，这样既既减轻了基类的负担（甚至可以不要基类），又提高了代码的可复用性
- 我们可以给一个类型新增已经实现好的功能，而不去改它父类的实现


和我们之前看到的金字塔结构不一样，面向协议所提倡的是扁平化和去嵌套的代码：

```
协议             A    B    C 

实体类型   A   B+C   A+B  A+C A+B+C 
```

图 2 

### 2. 一些例子

- [Protocol Oriented Programming in Swift](https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift)

### 3. Swift Protocol 和多继承

通过 Swift 中的 Protocol 的组合，可以实现类似于 C++、Python 中的多继承，也就是一个类可以继承多个“父类”的功能。


多继承存在的问题：
- 方法/属性冲突：比如我们定义一个动物（类）既是狗（父类1）也是猫（父类2），两个父类都有“叫”这个方法。那么当我们调用“叫”这个方法时，它就不知道是狗叫还是猫叫了。
- 数据（属性）存储的问题：比如我们现在有一个 File 类，InputFile 和 OutputFile 都继承了 File 类，IOFile 同时继承了 InputFile 和 OutputFile 类，那么 File 类中定义的属性，在 IOFile 中应该保存几分呢？

Swift 中 Protocol extension 和多继承的区别：
- Protocol 不允许在两个不同的 Protocol extension 中同时实现一样的方法（Java 中使用过不允许“实现多继承”，只允许“声明多继承”来控制的。）
- Protocol 不仅仅适用于 class，还适用于 struct、enum 等值类型
- Protocol extension 中不允许存储值，只能提供方法的实现


延伸阅读：
- [Python 中的多重继承](https://www.liaoxuefeng.com/wiki/897692888725344/923030524000032)
- [Java 为什么不支持多继承？](https://www.zhihu.com/question/24317891)
- [Effective C++ 40：明智地使用多继承](https://harttle.land/2015/09/07/effective-cpp-40.html)



## 四、POP 不是银弹

## 五、Protocol 语法的详细介绍


### 1. Protocol Syntax


1. 基本语法跟 OC 中的 Protocol 差不多。

2. 如果一个 class 既遵循协议，又继承了父类，则在定义这个类时，父类放在最前面，协议跟在后面。

### 2. Property Requirements

1. Protocol 中可以声明 instance property 和 type property，不管是 stored property 还是 computed property，我们只需要声明属性名和数据类型即可。

2. 但是，Protocol 中声明的属性一定要指明是 gettable 还是兼有 gettable 和 settable。

3. Protocol 中声明的属性一定要是 var 类型。

### 3. Method Requirements


### 4. Mutating Method Requirements


### 5. Initializer Requirements


### 6. Protocol as Types


### 7. Delegation

### 8. Adding Protocol Conformance with an Extension


### 9. Collections of Protocol Types


### 10. Protocol Inheritance


### 11. Class-Only Protocols


### 12. Protocol Composition


### 13. Checking for Protocol Conformance


### 14. Optional Protocol Requirements

延伸阅读：
- [Protocol composition in Swift and Objective-C - Jesse Squires](https://www.jessesquires.com/blog/protocol-composition-in-swift-and-objc/)


### 15. Protocol Extensions

### 16. Method Dynamic Dispatch


延伸阅读：
- [如何给 Objective-C 中的 Protocol 添加默认实现？](https://github.com/ShannonChenCHN/iOSDevLevelingUp/issues/3#issuecomment-371439914)


## 参考
- OOP 相关
  - [面向对象程序设计 - Wikipedia](https://zh.wikipedia.org/wiki/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E7%A8%8B%E5%BA%8F%E8%AE%BE%E8%AE%A1)
  - [IF YOU'RE SUBCLASSING, YOU'RE DOING IT WRONG](https://krakendev.io/blog/subclassing-can-suck-and-heres-why)
  - [All evidence points to OOP being bullshit](https://content.pivotal.io/blog/all-evidence-points-to-oop-being-bullshit)
  - [Object Oriented Programming is an expensive disaster which must end](http://www.smashcompany.com/technology/object-oriented-programming-is-an-expensive-disaster-which-must-end)
  - [Object Oriented Programming is exceptionally bad](https://www.leaseweb.com/labs/2015/08/object-oriented-programming-is-exceptionally-bad/)
- POP 基本介绍
  - [Protocol (object-oriented programming) - Wikipedia](https://en.wikipedia.org/wiki/Protocol_(object-oriented_programming))
  - [Protocols — The Swift Programming Language (Swift 5.1)
](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
  - [What is protocol-oriented programming?](https://www.hackingwithswift.com/example-code/language/what-is-protocol-oriented-programming)
  - [How Protocol Oriented Programming in Swift saved my day? - NIkant Vohra - Medium](https://medium.com/ios-os-x-development/how-protocol-oriented-programming-in-swift-saved-my-day-75737a6af022)⭐️
- POP 教程
  - [Protocol Oriented Programming in Swift](https://www.pluralsight.com/guides/protocol-oriented-programming-in-swift)⭐️
  - [Introducing Protocol-Oriented Programming in Swift 3 - Ray Wenderlich](https://www.raywenderlich.com/814-introducing-protocol-oriented-programming-in-swift-3)
  - [iOS Swift 3 Beginners Tutorial: Protocol-Oriented Views - Build An Animation Library in Swift 3](https://www.youtube.com/watch?v=AySlYrel7fc)🎬⭐️
  - [Protocol Oriented Programming in Swift - NSIstanbul - Medium](https://medium.com/nsistanbul/protocol-oriented-programming-in-swift-ad4a647daae2)
- 社区讨论
  - [Is there a difference between Swift 2.0 protocol extensions and Java/C# abstract classes?](https://stackoverflow.com/questions/30943209/is-there-a-difference-between-swift-2-0-protocol-extensions-and-java-c-abstract?noredirect=1&lq=1)
  - [What is Protocol Oriented Programming in Swift? What added value does it bring?](https://stackoverflow.com/a/37530506)
  - [Protocol Oriented Programming is Not a Silver Bullet - Chris Eidhof](http://chris.eidhof.nl/post/protocol-oriented-programming/)（[中文翻译版](http://www.infoq.com/cn/articles/protocol-oriented-programming-is-not-a-silver-bullet)）⭐️
  - [从 Swift 的面向协议编程说开去 - bestswifter](https://bestswifter.com/pop/)⭐️
- Protocol Extension 和派发机制⭐️
  - [The Best of What's New in Swift - by Mike Ash](https://mikeash.com/pyblog/friday-qa-2015-06-19-the-best-of-whats-new-in-swift.html)
  - [关于面向协议编程之协议扩展与动态、静态派发](http://lijun.xyz/2017/02/12/Protocol-Extension/)
  - [从Protocol Extension看Swift 派发机制](https://xiaozhuanlan.com/topic/4176502398)
  - [性能考虑 - Swifter - Swift 必备tips](https://swifter.tips/performance/)
- WWDC 视频 🎬
  - [Protocol-Oriented Programming in Swift - WWDC](https://developer.apple.com/videos/play/wwdc2015/408/)⭐️
  - [Protocol and Value Oriented Programming in UIKit Apps](https://developer.apple.com/videos/play/wwdc2016/419)⭐️
  - [Building Better Apps with Value Types in Swift](https://developer.apple.com/videos/play/wwdc2015/414)⭐️
  - [Swift in Practice](https://developer.apple.com/videos/play/wwdc2015/411/)
- [面向协议编程与 Cocoa 的邂逅 (上) - OneV's Den](https://onevcat.com/2016/11/pop-cocoa-1/)
- [Practical Protocol-Oriented-Programming -  - Realm Academy](https://academy.realm.io/posts/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/)（[中文翻译版](https://academy.realm.io/cn/posts/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/)）
- [UIKit 里如何面向协议编程](https://github.com/xitu/gold-miner/blob/master/TODO/ios-9-tutorial-series-protocol-oriented-programming-with-uikit.md)
- https://www.toptal.com/swift/introduction-protocol-oriented-programming-swift
- https://www.appcoda.com/protocol-oriented-programming/




