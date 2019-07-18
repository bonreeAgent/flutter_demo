# MaterialApp 与 Scaffold
在前面创建的 Flutter APP 的代码里，可以看到 MaterialApp 和 Scaffold 的使用，在写 Flutter APP 的 UI 时，都必须要用到这两个。


* MaterialApp

    MaterialApp 表示当前应用的风格是 Material Design。为了使用其他已经封装好的 Material Design 风格的 Widget，就必须使用 MaterialApp。因此 MaterialApp 经常是 Flutter Widget 树里的第一个元素，就是 Root Widget。



    
* Scaffold

    Scaffold 实现了 Material Design 的基本布局结构，例如 AppBar、Drawer、SnackBar 等，所以为了使用这些布局，也必须要使用 Scaffold，所以一个 Flutter App 的 基本结构就是：Root Widget 是 MaterialApp ，然后 MaterialApp 的 子Widget 就是 Scaffold，然后我们在 Scaffolfd 的 子Widget 里写UI。


```!
MaterialApp 大部分情况下要作为 Flutter 的 根Widget，并且 MaterialApp 和 Scaffold 经常是一起搭配使用的。
```


## MaterialApp 使用
MaterialApp 总共有 25 个属性，这里不全部介绍了，只介绍用到的几个，其他后面章节用到的，用到的时候在介绍。

* `title`
    
    String 类型

    这个 title 是出现在 Android 的任务管理器上或者是 iOS 程序切换管理器中
    
    ```
    MaterialApp(
        title: 'Flutter Demo',
    }
    ```

    运行如下图：
    

    ![](https://user-gold-cdn.xitu.io/2019/4/9/169fff2a6dbdaa14?w=469&h=848&f=png&s=83284)
    
* `color`

    Color 类型
    
    该颜色为 Android 中程序切换中应用图标背景的颜色.
    
    ```
    MaterialApp(
        color: Colors.red,
    }
    ```

    运行效果如下：
    
    ![](https://user-gold-cdn.xitu.io/2019/4/9/169fff30a026fe6f?w=469&h=848&f=png&s=82527)
* `theme`

    ThemeData 类型

    设置 Flutter App 的主题，比如颜色、字体等。
    
* `home`
    
    Widget 类型

    进入程序后显示的第一个页面，必须是 Scaffold。
    
    ```
    MaterialApp(
        home: Scaffold(
           ...
        )
    )    
    ```
    ***home*** 是 MaterialApp 一个很重要的属性，它是 Widget 类型，必须要赋值。
    
    比如这里我们返回一个 Text 的 Widget，如下面的代码：
    ```
    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    
    void main() => runApp(MyApp());
    
    class MyApp extends StatelessWidget {
      // This widget is the root of your application.
      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return MaterialApp(
          home: Center(
            child: Text("Hello World"),
          ),
        );
      }
    }
    ```
    运行后如下图：
    
    ![](https://user-gold-cdn.xitu.io/2019/4/9/16a0000dbd87776f?w=354&h=702&f=png&s=26241)
    可以看到文字下面有两条黄线，这两条黄线是 Flutter 的警告，告诉你不能这么用。

    那怎么用呢？这里就需要用到 `Scaffold`。
    
## Scaffold 使用
`Scaffold` 是实现 Material Design 基本视觉布局结构的 Widget,它被设计为 MaterialApp 的顶级容器，会自动填满屏幕，而且会自动适配不同的屏幕，例如刘海屏等。

Scaffold 总共有 16 个属性，以下是现在使用到的几个属性：

* `appBar`

    AppBar 类型
    
    就是顶部的标题栏，不设置的话就不会显示。

* `backgroundColor`

    Color类型
    
    背景颜色
* `body`

    Widget 类型
    
    就是 Scaffold 要显示的主要内容。

    `body` 是 Widget 类型，是 `Scaffold` 的最重要的属性，也是实际要显示的 UI。
    
    如下是一个简单的 Flutter APP 的代码，有 MaterialAp，有 Scaffold：

    ```
    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    
    void main() => runApp(MyApp());
    
    class MyApp extends StatelessWidget {
      // This widget is the root of your application.
      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text("Hello World!"),
            ),
          ),
        );
      }
    }
    ```
    
    它的运行效果如下：
    
    ![](https://user-gold-cdn.xitu.io/2019/4/9/16a00007ba4f8e27?w=354&h=702&f=png&s=24883)
    这个 Flutter APP 的 Widget树 的结构如下：
    
    ![](https://user-gold-cdn.xitu.io/2019/3/3/16941a66024d638d?w=960&h=720&f=png&s=11687)    
        


## Flutter APP 的 Widget 树
因为大部分情况下要用 Material APP 和 Scaffold，所以 Flutter APP 的 Widget 树经常是这样子的：

![](https://user-gold-cdn.xitu.io/2019/3/16/16985f2580c6a945?w=337&h=422&f=png&s=8250)

代码为：
```
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: ...
        )
    );
}

```

## 需要给 Android 和 iOS 各写一份 UI 吗？
因为 MaterialApp 是 Material Design 的，适用于 Android ，那有的同学可能有疑问，如果使用 MaterialApp，是不是就只能在 Android 上使用，iOS 上就不能使用，所以要写两份代码吗？

当然不是这样子：

1. 因为在实际开发过程中，大部分都是一份设计图，所以所以只需要按照设计图开发就行了。这种情况，只需要写一份代码就 OK，而且推荐选择 Material Design 的，因为目前来说 Flutter 对 Material Design 的 Widget 支持的更多，Cupertino 的 Widget 比较少，而且即使选了 Material Design ，你还是可以按照设计稿去写 UI，同时一部分 Cupertino 风格的 Widget 也能 在 Material Design 里使用。

2. 如果你们的 APP 确实有两份设计图，一份 Material Design 的，一份 Cupertino 的，那也没有关系，因为可以在 Widget 里通过 if-else 返回不同的 Widget。


