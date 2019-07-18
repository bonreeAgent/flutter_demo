# Flutter 布局 Widget —— 流式布局

流式布局：页面元素的宽度可以按照屏幕分辨率进行适配调整，但整体布局不变。

在 Flutter 中的流式布局是：
[Wrap](https://docs.flutter.io/flutter/widgets/Wrap-class.html)

* 为什么需要流式布局？

    前面讲到的，在 Flex、Row、Column 中，当 子Widget 的大小超过 主轴的大小后，就会报 layout 的 overflowed 错误 ，会在界面上看到黄黑色的条。


这个问题也可以用流式布局解决，将上面代码的 Row 换成 Wrap:
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
            appBar: new AppBar(title: new Text('Flutter 布局Widget -- 流式布局')),
            body: Wrap(
              children: <Widget>[Text('Hello Flutter ' * 100)],
            )));
  }
}
```
运行后的效果就为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a00277ff1f9ad0?w=836&h=950&f=jpeg&s=317364)


# Wrap

Wrap 会把超出屏幕显示范围的 Widget 自动换行，所以称为流式布局。

## 代码所在位置

flutter_widget_demo/lib/wrap/WrapWidget.dart

## Wrap 的快速上手
Wrap 需要设置主轴方向，默认的主轴方向为水平方向，给其 children 参数添加 子Widget 即可，例如：

```
Wrap(
  direction: Axis.horizontal,
  children: <Widget>[
    ...
  ]
)

```

Wrap 在一个页面使用的完整 Demo 如下:
```
import 'package:flutter/material.dart';

main() => runApp(new WrapWidget());

class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Test',
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Flutter 布局Widget -- 流式布局')),
            body: Wrap(
              direction: Axis.horizontal,
              spacing: 8.0, // 主轴 方向间距
              runSpacing: 12.0, // 交叉轴 方向间距
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.start,
              children: <Widget>[
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('A')),
                  label: new Text('AAAAAAAA'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('M')),
                  label: new Text('BBBBBB'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('H')),
                  label: new Text('CCCCCCCCC'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('DDDDDDDD'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('EEEEEEEE'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('FFFFFFFFFFFFFFFF'),
                ),
              ],
            )));
  }
}
```
运行效果：


![](https://user-gold-cdn.xitu.io/2019/4/9/16a002845670f9aa?w=860&h=668&f=jpeg&s=85897)

## Wrap 的构造函数及参数说明
Wrap 的构造函数为：
```
class Wrap extends MultiChildRenderObjectWidget {
  Wrap({
    Key key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    List<Widget> children = const <Widget>[],
  }) : super(key: key, children: children);
  ...
}
```

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| key | Key | Widget 的标识 | 可选 |
| direction | Axis | 主轴的方向<br>默认是 Axis.horizontal | 可选 |
| alignment | WrapAlignment | 子Widget 在主轴上的对齐方式，默认值为WrapAlignment.start<br>WrapAlignment 的值和 MainAxisAlignment 的一样 | 可选 |
| runAlignment | WrapAlignment | Wrap 会自动换成或换列，runAlignment 就是每行或每列的对齐方式，如果主轴为水平方向，就是每行，如果主轴为竖直方向，就是每列，默认值为WrapAlignment.start<br>WrapAlignment 的值和 MainAxisAlignment 的一样 | 可选 |
| runSpacing | double | 每行或每列之间的间距<br>默认是0.0 | 可选 |
| crossAxisAlignment | WrapCrossAlignment | 子Widget 在交叉轴上的对齐方式，WrapCrossAlignment.start<br>WrapCrossAlignment 的值和 MainAxisAlignment 的一样 | 可选 |
| textDirection | TextDirection | 表示 子Widget 在主轴方向上的布局顺序 | 可选 |
| verticalDirection | VerticalDirection | 表示 子Widget 在交叉轴方向上的布局顺序 | 可选 |
| children | List< Widget> | Wrap布局 里排列的内容 | 可选 |


