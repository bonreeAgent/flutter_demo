# Flutter 基础 Widget —— SnackBar 和 Builder 的使用

本文讲 Flutter 的 SnackBar 及 Builder。

SnackBar 是 Flutter 的底部消息提示，在使用 SnackBar 的时候，需要用到 Builder ，Builder 也是 Widget，Builder 可以用闭包的方式创建 子Widget，使得 子Widget 可以使用 父Widget 的上下文，这里你可能还不太好理解，下面看具体的案例。

# [SnackBar](https://docs.flutter.io/flutter/material/SnackBar-class.html)
![](https://user-gold-cdn.xitu.io/2019/2/26/1692a75eadbc4ff0?w=3000&h=3000&f=png&s=33761)
SnackBar 是具有可选操作的轻量级消息提示，在屏幕的底部显示。


## SnackBar 的快速上手
SnackBar 需要用 `Scaffold.of(context).showSnackBar()` 来显示，使用方式如下：
```
Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('SnackBar'), duration: Duration(seconds: 5)));
```

完整代码如下，点击按钮，然后弹出一个提示：
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SnackBarBuilderWidget());

class SnackBarBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter UI Widget -- SnackBar 及 Builder")),
        body: RaisedButton(
          child: Text('Show SnackBar'),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('SnackBar'), duration: Duration(seconds: 5)));
          },
        ),
      ),
    );
  }
}
```

但是如果这么写，运行后，就会报如下的错误：
```
I/flutter ( 8385): ══╡ EXCEPTION CAUGHT BY GESTURE ╞═══════════════════════════════════════════════════════════════════
I/flutter ( 8385): The following assertion was thrown while handling a gesture:
I/flutter ( 8385): Scaffold.of() called with a context that does not contain a Scaffold.
I/flutter ( 8385): No Scaffold ancestor could be found starting from the context that was passed to Scaffold.of(). This
I/flutter ( 8385): usually happens when the context provided is from the same StatefulWidget as that whose build
I/flutter ( 8385): function actually creates the Scaffold widget being sought.
I/flutter ( 8385): There are several ways to avoid this problem. The simplest is to use a Builder to get a context that
I/flutter ( 8385): is "under" the Scaffold. For an example of this, please see the documentation for Scaffold.of():
I/flutter ( 8385):   https://docs.flutter.io/flutter/material/Scaffold/of.html
I/flutter ( 8385): A more efficient solution is to split your build function into several widgets. This introduces a
I/flutter ( 8385): new context from which you can obtain the Scaffold. In this solution, you would have an outer widget
I/flutter ( 8385): that creates the Scaffold populated by instances of your new inner widgets, and then in these inner
I/flutter ( 8385): widgets you would use Scaffold.of().
I/flutter ( 8385): A less elegant but more expedient solution is assign a GlobalKey to the Scaffold, then use the
I/flutter ( 8385): key.currentState property to obtain the ScaffoldState rather than using the Scaffold.of() function.
```
提示 Scaffold.of(context) 里的 context 没有 Scaffold，找不到 Scaffold，所以报错了，为什么会出现这个问题？

首先，看一下 context 是从哪里来的，context 是从 build 函数里传过来的：
```
Widget build(BuildContext context) {
    ...
}
```
build 函数里传来的 context 是其 父Widget，也就是 MyApp 的 context，而  MyApp 的 context 里当然没有 Scaffold，所以会报 context 里没有 ScaffoldScaffold 的错误。 那么怎么解决这个问题呢？有两个方法：

1. 使用 Builder Widget
2. 将使用 SnackBar 的 Widget 拆分出来

## 1. 使用 Builder

#### 代码所在位置

flutter_widget_demo/lib/snackbar/SnackBarBuilderWidget.dart

#### Builder 的构造函数及参数说明
Builder 的构造函数为：
```
class Builder extends StatelessWidget {
  const Builder({
    Key key,
    @required this.builder
  }) : assert(builder != null),
       super(key: key);
    ...
}
```
| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| key | Key | Widget 的标识 | 可选 |
| builder | WidgetBuilder | 创建 子Widget | 必选 |

Builder 的必选参数是 WidgetBuilder，接下里介绍一下 WidgetBuilder 的使用。

#### WidgetBuilder
WidgetBuilder 是一个函数，定义为：
```
typedef WidgetBuilder = Widget Function(BuildContext context);
```
应该说 WidgetBuilder 函数实现了 Builder Widget 的核心功能，Builder 只是 WidgetBuilder 的封装，在有的地方，其实是直接使用 WidgetBuilder 的。

#### Builer 的使用
Builder 的使用方法如下：
```
home: Scaffold(
    appBar: AppBar(title: Text("Flutter UI Widget -- SnackBar 及 Builder")),
    body: Builder(
      builder: (context) => RaisedButton(
        child: Text('Show SnackBar'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('SnackBar'),
              duration: Duration(seconds: 5)));
        },
      ),
    ),
),
```
Builder 使用 WidgetBuilder 来创建子 Widget。例如上面的例子，使用 Builder，Builder 是一个闭包，将 Scaffold 的 context 传递给 子Widget，这样 SnackBar 使用的 context 就是 Scaffold 的 context。

完整代码如下：
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SnackBarBuilderWidget());

class SnackBarBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter UI Widget -- SnackBar 及 Builder")),
        body: Builder(
          builder: (context) => RaisedButton(
                child: Text('Show SnackBar'),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('SnackBar'),
                      duration: Duration(seconds: 5)));
                },
              ),
        ),
      ),
    );
  }
}
```

运行效果如下：
    
![](https://user-gold-cdn.xitu.io/2019/4/9/16a000385b379abf?w=428&h=768&f=png&s=42690)

## 2. 将使用 SnackBar 的 Widget 拆分出来

#### 代码所在位置

flutter_widget_demo/lib/snackbar/SnackBarNoBuilerWidget.dart

#### 拆分方法
将使用 SnackBar 的 Widget 拆分出来后，SnackBar 的 Widget 使用的 context 就是 Scaffold 的 context。

代码如下：
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SnackBarNoBuilerWidget());

class SnackBarNoBuilerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Flutter UI基础Widget -- SnackBar")),
          body: SnackBarWidget()),
    );
  }
}

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Show SnackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('SnackBar'), duration: Duration(seconds: 5)));
      },
    );
  }
}
```

## 总结
两种方式，使用 Builder Widget，或者将 SnackBar 拆分出来，都可以实现底部消息提示，但是建议使用 Builder。

## SnackBar 的构造函数及参数说明
SnackBar 的构造函数为：
```
class SnackBar extends StatelessWidget {
  const SnackBar({
    Key key,
    @required this.content,
    this.backgroundColor,
    this.action,
    this.duration = _kSnackBarDisplayDuration,
    this.animation,
  }) : assert(content != null),
       assert(duration != null),
       super(key: key);
    ...   
}
```
| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| key | Key | Widget 的标识 | 可选 |
| content | Widget | SnackBar 显示的主要内容 | 必选 |
| backgroundColor | Color | SnackBar 的背景色 | 可选 |
| action | SnackBarAction | SnackBar 的按钮 | 可选 |
| duration | Duration | SnackBar 显示的时间<br>默认是4.0s | 可选 |
| animation | Animation<double> | SnackBar 显示和消失的动画 | 可选 |


