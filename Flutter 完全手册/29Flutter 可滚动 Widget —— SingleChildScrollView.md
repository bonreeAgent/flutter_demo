# Flutter 可滚动Widget —— SingleChildScrollView
本节讲 Flutter SingleChildScrollView。

SingleChildScrollView 是只能包含一个 子Widget 的可滚动Widget。
## 代码所在位置

flutter_widget_demo/lib/singlechildscrollview/SingleChildScrollViewWidget.dart
## SingleChildScrollView 的快速上手
SingleChildScroolView 可以让 Widget 具有滑动的功能，而且可以指定滚动的方向，其 child 参数就是你想要添加滚动功能的 Widget，例如：
```
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: <Widget>[Text('Hello Flutter ' * 100)],
  ),
)
```

可以将前面 子Widget 超过父容器时出现 overflowed 错误的代码更改为：
```
import 'package:flutter/material.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Test',
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Flutter 可滚动Widget -- SingleChildScrollView')),
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[Text('Hello Flutter ' * 100)],
              ),
            )));
  }
}
```
运行效果为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a002e5a827b677?w=852&h=350&f=jpeg&s=55063)


这里的文本内容没有了 overflowed 错误的黄黑色的条，而且可以在水平方向上滑动。

## SingleChildScrollView 的构造函数及参数说明
先看 SingleChildScrollView 的构造函数：
```
class SingleChildScrollView extends StatelessWidget {
  const SingleChildScrollView({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    bool primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.down,
  }) 
  ...
}
```

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| key | Key | Widget 的标识 | 可选 |
| scrollDirection | Axis | 滑动的方向<br>默认为 Axis.vertical，垂直方向可滑动 | 可选 |
| padding | EdgeInsetsGeometry | SingleChildScrollView 插入 子Widget 时的内边距 | 可选 |
| reverse | bool | 控制 SingleChildScrollView 是从头开始滑，还是从尾开始滑，默认为 false，就是从头开始滑<br>例如当 scrollDirection 为 Axis.vertical,即垂直方向可滑动，那么 reverse 为 false，就是从头部滑到底部，当 reverse 为 true 时，就是从底部滑到头部 | 可选 |
| primary | bool | 是否是与父级关联的主滚动视图<br>当为 true 时，即使 SingleChildScrollView 里没有足够的内容也能滑动，<br>当 scrollDirection 为 Axis.vertical，且 controller 为 null时，默认为 true
 | 可选 |
| physics | ScrollPhysics | 设置 SingleChildScrollView 的滚动效果<br>如果想让 SingleChildScrollView 里没有足够的内容也能滑动，则设置为 AlwaysScrollableScrollPhysics()<br>如果想让 SingleChildScrollView 在没有足够的内容的时候不能滑动，则设置为 ScrollPhysics() | 可选 |
| controller | ScrollController | 可以控制 SingleChildScrollView 滚动的位置<br>当 primary 为 true 时，controller 必须为 null<br>ScrollController 提供以下的几个功能：<br>1.设置 SingleChildScrollView 滑动的初始位置<br>2.可以控制 SingleChildScrollView 是否存储和恢复滑动的位置<br>3.可以读取、设置当前滑动的位置 | 可选 |
| children | List\<Widget> | SingleChildScrollView 的列表项 | 可选 |
| dragStartBehavior | DragStartBehavior | 确定处理拖动开始行为的方式。<br>如果设置为[DragStartBehavior.start]，则在检测到拖动手势时将开始滚动拖动行为<br>如果设置为[DragStartBehavior.down]，它将在首次检测到向下事件时开始 | 可选 |





