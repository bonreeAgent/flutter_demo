# Widget 的深度理解

为了更好的使用 Widget，还需要深入了解以下有关 Widget 的特点。

## Everything is a Widget
在 Android 中，UI 显示的容器是 Activity，iOS 显示 UI 的容器是 ViewController，在 Flutter 中，这些都是 Widget 的功能，Widget 不仅是 View，也是 Flutter UI 的容器，而且布局也是使用的 Widget，监听点击事件也是 Widget，实现动画也是用 Widget，设置 Padding 也是用 Widget，设置透明度也是用 Widget，所以说 Everything is a Widget。

## 组合大于继承
在 Android 中，要想实现自定义的 View 时，都是实现一个 View 的子类，或者继承已有的 View。iOS 也是同样的，要想实现自定义的 View 时，要么实现一个 UIView 的子类，或者继承已有的 View。

但在 Flutter 中，要实现一个自定义的 Widget，最好通过组合其他 Widget 来实现，而不是用继承。

因为在 Flutter 中，Widget 组合大于继承。


## Widget 是 `UI 的配置信息`

Flutter 的 UI 渲染采用的是 react-style 的框架，所以 Widget 并不会直接用于渲染，而只是 `UI 的配置信息`。

## Widget 是 `一次性的`

当 Flutter App 启动时，会 build 一个 Widget 树，然后读取 Widget 树的配置去渲染 UI，当你想要改变 UI 时，并不能通过更改 Widget 的值来刷新 UI，而是通过更改状态，触发 build ，重新新建一个全新的 Widget 树，通过和原来的 Widget 树进行对比，来刷新 UI，所以每次刷新 UI，Widget 都会重建，所以 Widget 是 `一次性的`。

## Widget 是 `不可变的`
根据 Flutter UI 的渲染过程，会首先建立一个 Widget 树，而且这个 Widget 树只会创建一次，当状态发生变化时，不是更改原来的 Widget，而是重新创建，所以 Widget 是 `不可变的`。

## Widget 是 `轻量的`

如果要改变 UI ，就调用方法重新 build 一个 Widget 树，虽然 Widget 树重新创建了，但是并不会引起 UI 的全部刷新，而是会对比前后 Widget 树变化的部分，只刷新变的部分，因此即使 Widget 随便创建消耗，也不会影响性能，所以 Widget 是 `轻量的`。


## 根据有无状态来区分 Widget

Widget 根据有无 State(状态) 分为：
    
* StatelessWidget：无状态信息的 Widget
* StatefulWidget：有状态信息的 Widget

#### StatelessWidget
StatelessWidget 没有 State。

#### StatefulWidget
StatefulWidget 有两部分组成：

1. Widget
2. State

#### 为什么要有 StatelessWidget 和 StatefulWidget ？
StatelessWidget 没有状态，创建完后 UI 就不可以在更改。

但在实际中，往往会有这样的场景：点击一个 Button，然后引起了 UI 界面的变化，所以还需要 UI 可以变化的 Widget。UI 可以变化的 Widget 就是 StatefulWidget。

#### StatelessWidget 为什么无法让 UI 发生变化？
因为 StatelessWidget 没有 State ，所以无法触发 build Widget，导致 Widget 树不会创建，因此就无法让 UI 发生变化。

#### StatefulWidget 为什么可以让 UI 发生变化？

那么如何让 UI 发生变化呢？

Flutter 是这么做的，引入了 State(状态) ，Widget 是不可变的，那么把可变的部分存在 State 里，当 State 变化时，会重新 build Widget，让 Widget树 发生变化，从而更新 UI。

#### 如果 StatefulWidget 的 子Widget 里有 StatelessWidget，那么能不能让这个 StatelessWidget 的 UI 发生改变？
当然可以。当一个 StatelessWidget 的 父Widget 是 StatefulWidget 时，StatefulWidget 的状态发生变化触发 build Widget 的时候，StatelessWidget 也可以重建，所以当然是可以的。

#### StatefulWidget 和 StatelessWidget 之间如何选择
StatefulWidget 和 StatelessWidget 的区别：
```!
StatefulWidget 是有 State 的，StatelessWidget 是无 State 的。
```

当你以后选择用 StatelessWidget 还是 StatefulWidget 时，只要考虑 UI 是否需要改变，如果需要改变，就用 StatefulWidget，不需要改变，就用 StatelessWidget。



# Widget 的使用方法
接下来开始介绍 Widget 如何使用，因为 Widget 有上百个，无法一一介绍，所以我只会介绍经常用到的 Widget，这些经常用到的 Widget 可以分为以下五类：

* 基础 Widget
* 手势识别 Widget
* 布局 Widget
* 容器类 Widget
* 可滚动 Widget

虽然只会介绍一部分 Widget 的使用方法，但是使用 Widget 的步骤都是一样的，只要掌握了这些步骤，就可以熟练使用 Flutter 中的所有 Widget。

## 使用 Widget 的步骤
    
所以使用 Widget 我们要遵照以下三个步骤：
    
1. 先找到 Widget 的构造函数。
2. 看构造函数的哪些参数是必选的，哪些参数是可选的，必选的参数必须要赋值，可选的根据需要来赋值。
3. 为了更灵活的使用 Widget，需要知道 Widget 每个参数的作用和使用方法。

## 本手册里的示例代码

本手册里的所有示例代码，都上传到 [Github](https://github.com/koudle/The-Guide-to-the-Flutter) 上了，[点击](https://github.com/koudle/The-Guide-to-the-Flutter) 下载代码。

代码里有两个目录：

* flutter_widget_demo 
* flutter_doubanmovie 


### flutter_widget_demo 

flutter_widget_demo目录下的 Flutter 工程是手册里介绍的 Widget 的 Demo 代码。

#### 使用方法

在VS Code 中，打开本目录下的工程即可。

1. `File` -> `Open...`

2. 选中 flutter_widget_demo 目录，然后点击 `Open`
    
    ![](https://user-gold-cdn.xitu.io/2019/4/17/16a2aa70cc13bdcf?w=1690&h=988&f=jpeg&s=194514)

#### 注意事项
 Demo 代码里都有 `main()` 方法 和 `MaterialApp` ，主要是为了方便读者复制代码，在自己的独立 Flutter APP 里运行，在实际开发 APP 过程中，不会这样子开发。



想要知道 Flutter APP 实际如何开发，请看 `Flutter实战篇`。

### flutter_doubanmovie 

flutter_doubanmovie目录下的 Flutter 工程是 Flutter 实战里仿写的豆瓣电影APP的代码。

#### 使用方法

在VS Code 中，打开本目录下的工程即可。

1. `File` -> `Open...`

2. 选中 flutter_doubanmovie 目录，然后点击 `Open`

    ![](https://user-gold-cdn.xitu.io/2019/4/17/16a2aa75ca9303cb?w=1690&h=988&f=jpeg&s=194659)