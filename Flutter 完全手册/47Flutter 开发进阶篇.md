# Flutter 开发进阶篇

前面对 Flutter 的开发有了比较全面的介绍，但这些并不足以让我们掌握到 Flutter 的精髓，所以我们也需要对 Flutter 的一些特性进行深入的研究和分析。

Flutter 开发进阶篇就是对前面介绍过的 Flutter 特性的深入分析和理解。

## Flutter UI 渲染过程 —— Widget，Element，RenderObject

前面讲了 Flutter  采用了 react-style 的框架，并不是直接将 Widget 绘制在屏幕上。Flutter 将 Widget 渲染到屏幕上，总共经过了三个步骤：

![](https://user-gold-cdn.xitu.io/2019/3/8/1695dd3ad9e9ac16?w=337&h=500&f=png&s=10213)

1. 创建 Widget 树
2. 根据 Widget 树创建 Element 树
3. 根据 Element 树创建 RenderObject 树


运行下面的Flutter代码：
```
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  MyApp();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("Flutter渲染 -- Widget，Element，RenderObject"),),
          body: Column(
            children: <Widget>[
              RaisedButton(onPressed: (){},child: Text("Button"),),
              Text("Hello Flutter!")
            ],
          )
        )
    );
  }

}
```
可以看到如下的运行界面：

![](https://user-gold-cdn.xitu.io/2019/4/9/169fffdf04c38ad4?w=438&h=786&f=png&s=41493)
对应的是如下的三种视图树：

![](https://user-gold-cdn.xitu.io/2019/3/8/1695dc61558264df?w=1295&h=879&f=png&s=62135)

这三种视图树是怎么形成的呢？请看下面的 Flutter UI  渲染流程，就能明白。
### Flutter UI 渲染流程

![](https://user-gold-cdn.xitu.io/2019/3/8/1695dd3ad9e9ac16?w=337&h=500&f=png&s=10213)

在 `runApp` 运行之后，就开始执行 Flutter UI 的渲染流程：

#### 1. 首先会创建一个 Widget 树
在 Flutter 中 Widget 只是为 Element 提供配置信息，并不用于真正的渲染。而且当 StatefulWidget 调用 `setState()` 之后，Widget 都会重新创建；特别是当你使用动画的时候，Widget 甚至每帧都会重建。


那就有一个问题，Widget每帧都重建，不会有性能问题吗？

答案是不会，因为 Widget 只包含配置信息，不包含渲染，是很轻量的，所以即使每帧都重建，所以也不会有性能问题。

在 Flutter 开发 UI 界面都是使用 Widget。

#### 2. 创建 Element 树

遍历 Widget 树时，通过调用 Widget 的 `createElement()` 方法，会创建对应的 Element 树。

在上面的视图树的图中，MaterialApp 对应的 Element 我写得是 MaterialApp 内的所有 Element，是因为 MaterialApp 有很多 Widget 组合而成，因此包含很多 Element，所以这里省略成了 MaterialApp 内的所有 Element，Scaffold 同理。这里每一个 Widget对应一个 Element。

而且由上面的视图树可知，Element 与 Widget 和 RenderObject 都有联系，Element 持有 Widget 和 RenderObject 的实例。

Element 树是不会重建的，只会进行更新，因为旧的 Widget 保存在 Element 里，当状态发生变化 Widget树 重建的时候，新生成的 Widget树 就会与保存在 Element 里旧的 Widget树 进行对比，发现变化的时候会更新 Element，Element 在更新 RenderObject。Element 的主要工作就是对比，是三个视图树里的核心部分。这个机制保证了虽然 Widget 每帧都重建，但是 Element 却只会更新变化的部分，因此保证了性能没有问题。


#### 3. 创建 RenderObject 树
当Element `mount` 的时候，就会创建 RenderObject，RenderObject 就是实际负责渲染的部分，因此 RenderObject 的操作是很昂贵的，所以要尽可能的复用，而不是创建新的。

RenderObject 是通过 Widget 的 `createRenderObject()` 方法创建的，但并不是每一个 Widget 都有 RenderObjcet，只有 RenderObjectWidget(Widget的一个子类) 类型的 Widget 才有 RenderObjcet，例如上面视图树的 MyApp Widget 就没有 RenderObject，因为 MyApp 只是一层包装而已，如果自己没 有RenderObject,就会使用子类的 RenderObject。

## 总结
Flutter 使用三级视图树来渲染，就是为了提升渲染的性能。

* Widget 

    Widget 只含有配置信息，不负责渲染，非常轻量，因此可以大量频繁的创建。

* Element 

    Element 负责 diff，只更新变化的部分。

* RenderObject 

    RenderObject 负责渲染。
