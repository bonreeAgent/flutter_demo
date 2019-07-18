# 使用 ScopedModel 对豆瓣电影 App 进行重构
`正在优化中，24小时内完成`

本节使用 ScopedModel 对豆瓣电影 App 进行重构。

## ScopedModel
ScopedModel 是一个可以对状态进行管理的第三方库，该库是从 Fuchsia 的代码库中提取的。

### ScopedModel 的使用
使用 ScopedModel 进行状态管理，要用到这个库提供的三个类，掌握这三个类的使用，就掌握了 ScopedModel。这三个类分别是：

* Model
* ScopedModel
* ScopedModelDescendant

#### Model
Model 是类，用来存全局状态的，我们需要继承 Model 类来写自己的 Models，Models 里存放要共享的状态，例如 UserModel，存放 用户名、token 而且也可以监听到 Model 类里状态的变化。

#### ScopedModel
ScopedModel 是 Widget，