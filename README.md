# iOS-App-Architecture
A journey of diving into iOS app architecture.

## 目录
- [大纲](#大纲)
- [阅读笔记](#阅读笔记)
- [Example Project](#example-project)
- [参考资料](#参考资料)


## 大纲
- [重构](https://github.com/ShannonChenCHN/iOSLevelingUp/issues/78)
  - 为什么要重构？
  - 什么情况下需要重构？
  - 如何重构？

- 架构
  - 我们讨论架构究竟是在讨论什么？
    - 解耦
    - 响应式
    - 抽象
    - 数据流
      - Flux
      - Redux
  - 什么是架构，架构就是高大上？
  - 架构与业务的关系
  - iOS 移动端的架构
- [如何成为一名合格的、优秀的架构师？](https://github.com/ShannonChenCHN/iOS-App-Architecture/issues/5)

- 设计模式
  - 什么是设计模式？
  - 为什么会出现设计模式，设计模式真的很神奇吗？
  - 设计模式与实战
  - iOS 开发中常用的设计模式
    - MVC
    - [MVVM](https://github.com/ShannonChenCHN/iOS-App-Architecture/issues/7)
    - MVP
    - VIPER
    - 通知
    - 观察者KVO
    - 工厂模式
    - 类簇模式
    - 命令模式
    - [单例模式](https://github.com/ShannonChenCHN/iOSLevelingUp/issues/69)
- [编程范式](https://github.com/ShannonChenCHN/iOSLevelingUp/issues/22)
  - 函数式编程
  - 函数响应式编程
    - [ReactiveCocoa](https://github.com/ShannonChenCHN/iOSLevelingUp/issues/91)
    - RxSwift

## 博客
- [浅谈 iOS 应用架构](https://github.com/ShannonChenCHN/iOS-App-Architecture/issues/6)

## 阅读笔记
- [读『杂谈: MVC/MVP/MVVM』](https://github.com/ShannonChenCHN/iOS-App-Architecture/issues/1)
- [读 『如何写好一个UITableView』](https://github.com/ShannonChenCHN/iOS-App-Architecture/issues/2)
- [读『iOS应用架构谈』系列](https://github.com/ShannonChenCHN/iOS-App-Architecture/issues/3)
- [读『 iOS Architecture Patterns: Demystifying MVC, MVP, MVVM and VIPER 』](https://github.com/ShannonChenCHN/iOS-App-Architecture/issues/4)



## Example Project
- [ArchitecturePatternsExample](https://github.com/ShannonChenCHN/iOS-App-Architecture/tree/master/ArchitecturePatternsExample)：分别用 MVC、MVP 和 MVVM 实现的一个示例 demo
- [ListDemo/Example](https://github.com/ShannonChenCHN/iOS-App-Architecture/tree/master/ListDemo/Example)：基于 UITableView 实现的列表 demo
- [FunctionalProgrammingExample](https://github.com/ShannonChenCHN/iOS-App-Architecture/tree/master/FunctionalProgrammingExample)：学习函数式编程的 demo，自己通过封装 Objective-C 代码实现函数式风格的接口
- [ReactiveCocoaExamples](https://github.com/ShannonChenCHN/iOS-App-Architecture/tree/master/ReactiveCocoa)： 学习 ReactiveCocoa 相关的 demo
- [iOSArchitecturePatternsExample](https://github.com/ShannonChenCHN/iOS-App-Architecture/tree/master/iOSArchitecturePatternsExample)：分别 MVC、MVP、MVVM 和 VIPER 实现的一个示例 demo


## 参考资料
- [Apple's MVC Pattern - Apple Developer Documentation](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)

- iOS 应用架构谈系列（Casa Taloyum）：
  - [iOS应用架构谈 开篇](http://casatwy.com/iosying-yong-jia-gou-tan-kai-pian.html) 
  - [iOS应用架构谈 view层的组织和调用方案](http://casatwy.com/iosying-yong-jia-gou-tan-viewceng-de-zu-zhi-he-diao-yong-fang-an.html)
  - [iOS应用架构谈 网络层设计方案](http://casatwy.com/iosying-yong-jia-gou-tan-wang-luo-ceng-she-ji-fang-an.html)
  - [iOS应用架构谈 本地持久化方案及动态部署](http://casatwy.com/iosying-yong-jia-gou-tan-ben-di-chi-jiu-hua-fang-an-ji-dong-tai-bu-shu.html) 
  - [iOS应用架构谈 组件化方案](http://casatwy.com/iOS-Modulization.html)

- [猿题库 iOS 客户端架构设计（蓝晨钰）](http://gracelancy.com/blog/2016/01/06/ape-ios-arch-design/)

- [objc.io - Issue 1 Lighter View Controllers系列](https://www.objc.io/issues/1-view-controllers/)

- [objc.io - Issue 13 Architecture](https://www.objc.io/issues/13-architecture/)

- [iOS Architecture Patterns: Demystifying MVC, MVP, MVVM and VIPER ](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52?source=userActivityShare-83b58fb60d90-1496985895)（[中译版](http://www.cocoachina.com/ios/20160108/14916.html)）

- [初始化模式（禅与 Objective-C 编程艺术）](https://github.com/oa414/objc-zen-book-cn/#初始化模式)

- [Protocols（禅与 Objective-C 编程艺术）](https://github.com/oa414/objc-zen-book-cn/#protocols)

- [面向切面编程（禅与 Objective-C 编程艺术）](https://github.com/oa414/objc-zen-book-cn/#面向切面编程)

- [MrPeak杂货铺-系列文章](http://mrpeak.cn)
  -  [iOS应用层架构之CDD](http://mrpeak.cn/blog/cdd/)
  - [iOS应用架构现状分析](http://mrpeak.cn/blog/ios-arch/)
  - [深度重构UIViewController](http://mrpeak.cn/blog/controller/)
  - [如何深度重构UIViewController实例-直播界面](http://mrpeak.cn/blog/controller-demo/)

- [Lightweight iOS View Controllers（yalantis官方博客）](https://yalantis.com/blog/lightweight-ios-view-controllers-separate-data-sources-guided-mvc/)

- [杂谈: MVC/MVP/MVVM](http://www.jianshu.com/p/eedbc820d40a)

- [WWDC 2014-Session 224: Core iOS Application Architectural Patterns](https://developer.apple.com/videos/play/wwdc2014/224/)

- [WWDC 2014-Session 229: Advanced iOS Application Architecture and Patterns](https://developer.apple.com/videos/play/wwdc2014/229/)

- [Cocoa Design Patterns - Apple Developer Documentation](https://developer.apple.com/legacy/library/documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaDesignPatterns/CocoaDesignPatterns.html)

- [iOS 组件化和路由](https://github.com/ShannonChenCHN/iOSLevelingUp/issues/40) 

- [skyming/Trip-to-iOS-Design-Patterns](https://github.com/skyming/Trip-to-iOS-Design-Patterns)

- [MVVM和Controller瘦身实践](https://github.com/LeoMobileDeveloper/Blogs/blob/master/iOS/MVVM%20and%20Controller%20thin.md)
- [优雅的开发TableView](https://github.com/LeoMobileDeveloper/Blogs/blob/master/Swift/Elegant%20TableView.md)

- 谈谈 MVX 系列
  - [谈谈 MVX 中的 Model](http://draveness.me/mvx-model.html)
  - [谈谈 MVX 中的 View](http://draveness.me/mvx-view.html)
  - [谈谈 MVX 中的 Controller](http://draveness.me/mvx-controller.html)
  - [浅谈 MVC、MVP 和 MVVM 架构模式](http://draveness.me/mvx.html)

- [喵神：单向数据流动的函数式 View Controller](https://onevcat.com/2017/07/state-based-viewcontroller/)

- [marty-suzuki/iOSDesignPatternSamples](https://github.com/marty-suzuki/iOSDesignPatternSamples/issues/7)

- [The Right Way to Architect iOS App with Swift - Limboy](http://limboy.me/tech/2017/06/22/the-right-way-to-ios-architecture.html)

- [Taming the Massive Controllers](https://academy.realm.io/posts/taming-massive-controller-altconf-2017-azam/)

- [安卓的 MVP 架构在 iOS 里面到底是什么](https://mp.weixin.qq.com/s?__biz=MzI0NzI1NzU5NA==&mid=2247483715&idx=1&sn=720cd59aa03cf4856b1bfaea47b6362c&chksm=e9b381d6dec408c054c20f62e50491e529fad790d805bf330364fc107dc28c0810f276b445a4&mpshare=1&scene=23&srcid=1008H6aDSqQf6LHPtUv9VrJk#rd)

- [strongself/The-Book-of-VIPER](https://github.com/strongself/The-Book-of-VIPER)：一群俄罗斯人写的专门讲 VIPER 的书 

- Flux 架构
  - [React Flux入门指南](http://www.cocoachina.com/webapp/20151008/13649.html)
  - [阮一峰：Flux 架构入门教程](http://www.ruanyifeng.com/blog/2016/01/flux.html)
  - [ iOS 开发中的 Flux 架构模式](https://juejin.im/entry/57972cdcc4c97100542c2ed4)
  - [reactjs/redux](https://github.com/reactjs/redux)

- Builder Pattern
  - [Builder Pattern 在 Objective-C 中的使用](http://limboy.me/tech/2015/02/07/builder-pattern.html)
  - [iOS 创建对象的姿势](http://mrpeak.cn/blog/ios-init/)

- 类簇
  - [Zen and the Art of the Objective-C Craftsmanship: class cluster](https://github.com/objc-zen/objc-zen-book#class-cluster)

- 面向切面编程（Aspect Oriented Programming）
  - [面向切面编程之 Aspects 源码解析及应用](http://wereadteam.github.io/2016/06/30/Aspects/)
  - [Zen and the Art of the Objective-C Craftsmanship: Aspect Oriented Programming](https://github.com/objc-zen/objc-zen-book#aspect-oriented-programming)

- 相关书籍
  - [Objective-C编程之道](https://book.douban.com/subject/6920082/)
  - [Cocoa Design Patterns](https://book.douban.com/subject/3688896/)
