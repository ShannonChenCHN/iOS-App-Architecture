## [Using CocoaPods to Modularize a Big iOS App](https://product.hubspot.com/blog/architecting-a-large-ios-app-with-cocoapods)

1. 将一个 APP 拆成多个 sub-app 的好处（多人团队的情况下）：

- 缩短 build 时间，提高合并代码的效率
- 各 sub-app 可以单独 deploy，单独测试
- 基于路由

2. 灵感来源：Web 开发中的模块化

3. CocoaPods 管理依赖

核心基础库、公共库、各业务组件分别都做成私有 pod。
主项目中通过 podfile 将各 pod 引入进来合成一个 app。

## [Update: How We're Building iOS Apps Today](https://product.hubspot.com/blog/update-how-were-building-ios-apps-today)

使用 Modular APP 时面临的几个问题：

- splitting the app into sub-apps didn’t prevent us from having to synchronize dependencies when bringing the app together to ship. 
- there is an overhead associated with maintaining multiple Xcode workspaces for each sub-app (multiple project level settings, multiple podfiles, multiple Xcodes open on your desktop). 【To avoid this overhead we moved to using a single XCode workspace and a single podfile, both of which had multiple app targets (one for each sub-app).】
- most importantly, we underestimated the number of cross-app user flows there would be. 

所以，最终作者所在的团队采用了将多个sub-app 合成一个 APP 开发的方式，并采用了 Redux 技术来管理状态。

> The important point is the approach you take should match the mission of your team and your business.