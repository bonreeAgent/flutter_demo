# Flutter 可滚动Widget -- CustomScrollView
[CustomScrollView](https://docs.flutter.io/flutter/widgets/CustomScrollView-class.html) 是可以使用 slivers 来自定义滑动效果的可滚动Widget。

## 代码所在位置

flutter_widget_demo/lib/customccrollview/CustomScrollViewWidget.dart

## CustomScrollView 的使用
CustomScrollView 里面可以添加多个 Widget，而且可以为 Widget 提供复杂的滑动效果，需要为其 slivers 参数赋值，而且 slivers 参数只能接受特定的 Widget，例如：
```
CustomScrollView(
  slivers: <Widget>[
    const SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Demo'),
      ),
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Text('grid item $index'),
          );
        },
        childCount: 20,
      ),
    ),
    SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('list item $index'),
          );
        },
      ),
    ),
  ],
)
```

CustomScrollView 在一个页面使用的 Demo 为：
```
import 'package:flutter/material.dart';

void main() => runApp(CustomScrollViewWidget());

class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar:
            AppBar(title: new Text('Flutter 可滚动Widget -- CustomScrollView')),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Demo'),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

运行后的效果为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a0032d73000327?w=428&h=768&f=png&s=80748)

## CustomScrollView 的构造函数及参数说明
CustomScrollView 的构造函数为：
```
class CustomScrollView extends ScrollView {
  const CustomScrollView({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    Key center,
    double anchor = 0.0,
    double cacheExtent,
    this.slivers = const <Widget>[],
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.down,
  })
  ...
}
```
| 参数名字 | 参数类型|	意义 |	必选 or 可选 |
| -- | -- | -- | -- |
| key |Key | Widget 的标识 | 可选 |
| scrollDirection |	Axis | 滑动的方向<br>默认为 Axis.vertical，垂直方向可滑动 |	可选 |
| reverse |	bool |控制 CustomScrollView 里列表项的排列顺序，是按照插入顺序排，还是按照插入顺序相反的方向排序。<br>默认为 false，就是按照插入顺序排序，第一个插入的在头部<br>，当 reverse 为 true 时，第一个插入的会在底部 |可选 |
|controller	|ScrollController|可以控制 CustomScrollView 滚动的位置<br>ScrollController 提供以下的几个功能：<br>1.设置 CustomScrollView 滑动的初始位置<br>2.可以控制 CustomScrollView 是否存储和恢复滑动的位置<br>3.可以读取、设置当前滑动的位置<br>可以继承 ScrollController 实现自定义的功能<br>当 primary 为 true 时，controller 必须为 null|	可选|
|primary|bool|是否是与父级关联的主滚动视图<br>当为 true 时，即使 CustomScrollView 里没有足够的内容也能滑动	|可选|	
|physics|ScrollPhysics|设置 CustomScrollView 的滚动效果<br>值必须为 ScrollPhysics 的子类，比如有如下的值：<br>AlwaysScrollableScrollPhysics():可以让 CustomScrollView 里没有足够的内容也能滑动<br>ScrollPhysics():CustomScrollView 在没有足够的内容的时候不能滑动| 可选|
| shrinkWrap| bool |是否根据列表项的总长度来设置 CustomScrollView 的长度，默认值为 false。<br>当 shrinkWrap 为 false 时，CustomScrollView 会在滚动方向扩展到可占用的最大空间<br>当 shrinkWrap 为 true 时，CustomScrollView 在滚动方向占用的空间就是其列表项的总长度，但是这样会很耗性能，因为当其列表项发生变化时，CustomScrollView 的大小会重新计算|可选|
| center | Key | 放在 CustomScrollView 中间的 子Widget 的 key | 可选 |
| anchor | double | CustomScrollView 开始滑动的偏移量<br>如果 anchor 为 0.0，则 CustomScrollView 的 子Widget 从头开始排列<br>如果 anchor 为 0.5，则 CustomScrollView 的 子Widget 从中间开始排列<br>如果 anchor 为 1.0，则 CustomScrollView 的 子Widget 从底部开始排列 |可选|
|cacheExtent|double|CustomScrollView 可见部分的前面和后面的区域可以用来缓存列表项，<br>这部分区域的 item 即使不可见，也会加载出来，所以当滑动到这个区域的时候，缓存的区域就会变的可见，<br>cacheExtent 就表示缓存区域在可见部分的前面和后面有多少像素|可选|
| slivers |List\<Widget>| CustomScrollView 的列表项 |可选|
|semanticChildCount|int|提供语义信息的列表项的数量<br>默认为 CustomScrollView 的 item 的数量|可选|
| dragStartBehavior	| DragStartBehavior	| 确定处理拖动开始行为的方式。<br>如果设置为[DragStartBehavior.start]，则在检测到拖动手势时将开始滚动拖动行为<br>如果设置为[DragStartBehavior.down]，它将在首次检测到向下事件时开始|可选|

CustomScrollView 的 slivers 属性的值，只能是以 Sliver 开头的一系列 Widget：

* SliverList
* SliverFixedExtentList
* SliverGrid
* SliverPadding
* SliverAppBar


