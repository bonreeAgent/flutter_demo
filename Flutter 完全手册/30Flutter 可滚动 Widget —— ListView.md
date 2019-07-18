# Flutter 可滚动Widget —— ListView
ListView 是可以线性排列 子Widget 的可滚动Widget。ListView 可以和数据绑定用来实现瀑布流。



## ListView 的快速上手
有四种使用 ListView 的方法：

### 1.使用默认的构造函数，给 children 属性赋值
#### 代码所在位置

flutter_widget_demo/lib/listview/ListViewDefaultWidget.dart

#### 使用方法
使用默认构造函数写 ListView，需要给 children 属性赋值，但只适用于那些只有少量 子Widget 的 ListView,ListView 创建的时候，其 子Widget 也会一起创建。

Demo 如下：
```
import 'package:flutter/material.dart';

main() => runApp(new ListViewDefaultWidget());

class ListViewDefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Test',
        home: new Scaffold(
            appBar:
                new AppBar(title: new Text('Flutter 可滚动Widget -- ListView')),
            body: ListView(
              children: <Widget>[
                ListTile(title: Text('Title1')),
                ListTile(title: Text('Title2')),
                ListTile(title: Text('Title3')),
                ListTile(title: Text('Title4')),
                ListTile(title: Text('Title5')),
                ListTile(title: Text('Title6')),
                ListTile(title: Text('Title7')),
                ListTile(title: Text('Title8')),
                ListTile(title: Text('Title9')),
                ListTile(title: Text('Title10')),
                ListTile(title: Text('Title11')),
                ListTile(title: Text('Title12')),
                ListTile(title: Text('Title13')),
                ListTile(title: Text('Title14')),
                ListTile(title: Text('Title15')),
                ListTile(title: Text('Title16')),
                ListTile(title: Text('Title17')),
                ListTile(title: Text('Title18')),
                ListTile(title: Text('Title19')),
              ],
            )));
  }
}
```
运行效果为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a0030d4ed358bc?w=428&h=768&f=png&s=51013)

### 2.使用 ListView.builder,可用于和数据绑定实现大量或无限的列表
#### 代码所在位置

flutter_widget_demo/lib/listview/ListViewBuilderWidget.dart

#### 使用方法
ListView.builder 可以用于构建大量或无限的列表，是因为 ListView.builder 只会构建那些实际可见的 子Widget。

ListView.builder 的定义为：
```
  ListView.builder({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    this.itemExtent,
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.down,
  }) 
    ...
```
大部分属性都和 ListView 的默认构造函数一样，除了这两个：

* int itemCount

    代表 子Widget 的数量，虽然是可选的，但是还是建议赋值，可以让 ListView 预估最大滑动距离，从而提升性能。如果为null，则子节点数由[itemBuilder]返回null的最小索引确定。
* @required IndexedWidgetBuilder itemBuilder

    itemBuilder 用于创建实际可见的 子Widget，只有索引大于或等于零且小于 itemCount 才会调用 itemBuilder。
    
下面写一个数据和 ListView.builder 绑定使用的例子:
```
import 'package:flutter/material.dart';

void main() => runApp(ListViewBuilderWidget(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

class ListViewBuilderWidget extends StatelessWidget {
  final List<String> items;

  ListViewBuilderWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(title: new Text('Flutter 可滚动Widget -- ListView')),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
```
运行后的效果为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a0031169d33646?w=428&h=768&f=png&s=51443)


要实现一个无限循环列表，只要不给 itemCount 赋值就行，如下：
```
ListView.builder(
    padding: EdgeInsets.all(8.0),
    itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text('Title $index'),);
    },
)
```

### 3.使用 ListView.separated，具有分割项的 ListView.builder
#### 代码所在位置

flutter_widget_demo/lib/listview/ListViewSeparatedWidget.dart

#### 使用方法
看 ListView.separated 的定义：
```
ListView.separated({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    @required IndexedWidgetBuilder itemBuilder,
    @required IndexedWidgetBuilder separatorBuilder,
    @required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
  })
  ...
```

相比 ListView.builder 多了一个 separatorBuilder，separatorBuilder就是用于构建分割项的，而且 itemBuilder、separatorBuilder、itemCount 都是必选的。

使用的 demo 如下：
```
import 'package:flutter/material.dart';

void main() => runApp(ListViewSeparatedWidget(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

class ListViewSeparatedWidget extends StatelessWidget {
  final List<String> items;

  ListViewSeparatedWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(title: new Text('Flutter 可滚动Widget -- ListView')),
        body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              constraints: BoxConstraints.tightFor(height: 10),
              color: Colors.orange,
            );
          },
        ),
      ),
    );
  }
}
```

运行效果为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a003177d842417?w=428&h=768&f=png&s=55038)

### 4.使用 ListView.custom，需要使用 SliverChildDelegate
#### 代码所在位置

flutter_widget_demo/lib/listview/ListViewCustomWidget.dart

#### 使用方法

SliverChildDelegate 提供了定制 子Widget 的能力。

首先看 ListView.custom 的定义：
```
  const ListView.custom({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    this.itemExtent,
    @required this.childrenDelegate,
    double cacheExtent,
    int semanticChildCount,
  })
```
childrenDelegate 为必选参数，在看如何实现 SliverChildDelegate，发现 SliverChildDelegate 是一个抽象类，SliverChildDelegate 的 build 方法可以对单个 子Widget 进行自定义处理，而且 SliverChildDelegate 有个默认实现 SliverChildListDelegate，所以我们用 SliverChildListDelegate 来实现 ListView.custom，代码如下：
```
import 'package:flutter/material.dart';

void main() => runApp(ListViewCustomWidget(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

class ListViewCustomWidget extends StatelessWidget {
  final List<String> items;

  ListViewCustomWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(title: new Text('Flutter 可滚动Widget -- ListView')),
        body: ListView.custom(
          childrenDelegate: SliverChildListDelegate(<Widget>[
            ListTile(title: Text('Title1')),
            ListTile(title: Text('Title2')),
            ListTile(title: Text('Title3')),
            ListTile(title: Text('Title4')),
            ListTile(title: Text('Title5')),
            ListTile(title: Text('Title6')),
            ListTile(title: Text('Title7')),
            ListTile(title: Text('Title8')),
            ListTile(title: Text('Title9')),
            ListTile(title: Text('Title10')),
            ListTile(title: Text('Title11')),
            ListTile(title: Text('Title12')),
            ListTile(title: Text('Title13')),
            ListTile(title: Text('Title14')),
            ListTile(title: Text('Title15')),
            ListTile(title: Text('Title16')),
            ListTile(title: Text('Title17')),
            ListTile(title: Text('Title18')),
            ListTile(title: Text('Title19')),
          ]),
        ),
      ),
    );
  }
}
```
运行效果为：
![](https://user-gold-cdn.xitu.io/2019/4/9/16a0030d4ed358bc?w=428&h=768&f=png&s=51013)
 
 
 ## ListView 的构造函数及参数使用
首先看 ListView 的构造函数:
```
class ListView extends BoxScrollView {
  ListView({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    this.itemExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    List<Widget> children = const <Widget>[],
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
| reverse |	bool |控制 ListView 里列表项的排列顺序，是按照插入顺序排，还是按照插入顺序相反的方向排序。<br>默认为 false，就是按照插入顺序排序，第一个插入的在头部<br>，当 reverse 为 true 时，第一个插入的会在底部 |可选 |
|controller	|ScrollController|可以控制 ListView 滚动的位置<br>ScrollController 提供以下的几个功能：<br>1.设置 ListView 滑动的初始位置<br>2.可以控制 ListView 是否存储和恢复滑动的位置<br>3.可以读取、设置当前滑动的位置<br>可以继承 ScrollController 实现自定义的功能<br>当 primary 为 true 时，controller 必须为 null|	可选|
|primary|bool|是否是与父级关联的主滚动视图<br>当为 true 时，即使 ListView 里没有足够的内容也能滑动	|可选|	
|physics|ScrollPhysics|设置 ListView 的滚动效果<br>值必须为 ScrollPhysics 的子类，比如有如下的值：<br>AlwaysScrollableScrollPhysics():可以让 ListView 里没有足够的内容也能滑动<br>ScrollPhysics():ListView 在没有足够的内容的时候不能滑动| 可选|
| shrinkWrap| bool |是否根据列表项的总长度来设置 ListView的长度，默认值为 false。<br>当 shrinkWrap 为 false 时，ListView 会在滚动方向扩展到可占用的最大空间<br>当 shrinkWrap 为 true 时，ListView 在滚动方向占用的空间就是其列表项的总长度，但是这样会很耗性能，因为当其列表项发生变化时，ListView 的大小会重新计算|可选|
|padding|EdgeInsetsGeometry|ListView 的内边距|可选|
|itemExtent|double|itemExtent 指的是列表项的大小<br>如果滚动方向是垂直方向，则 itemExtent 代表的是 子Widget 的高度，<br>如果滚动方向为水平方向，则 itemExtent 代表的是 子Widget 的长度<br>如果 itemExtent 不为 null，则会强制所有 子Widget 在滑动方向的大小都为 itemExtent<br>指定 itemExtent 会比较高效，因为 子Widget 的高度就不需要在去计算，ListView 也可以提前知道列表的长度 |可选|
|addAutomaticKeepAlives|bool|是否用 AutomaticKeepAlive 来包列表项,默认为 true<br>在一个 lazy list 里，如果 子Widget 为了保证自己在滑出可视界面时不被回收，就需要把 addAutomaticKeepAlives 设为 true<br>当 子Widget 不需要让自己保持存活时，为了提升性能，请把 addAutomaticKeepAlives 设为 false<br>如果 子Widget 自己维护其 KeepAlive 状态，那么此参数必须置为false。|可选|
| addRepaintBoundaries|bool|是否用 RepaintBoundary 来包列表项，默认为 true<br>当 addRepaintBoundaries 为 true 时，可以避免列表项重绘，提高性能<br>但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加 RepaintBoundary 反而会更高效。|可选|
|addSemanticIndexes|bool|是否用 IndexedSemantics 来包列表项,默认为 true<br>使用 IndexedSemantics 是为了正确的用于辅助模式|可选|
|cacheExtent|double|ListView 可见部分的前面和后面的区域可以用来缓存列表项，<br>这部分区域的 item 即使不可见，也会加载出来，所以当滑动到这个区域的时候，缓存的区域就会变的可见，<br>cacheExtent 就表示缓存区域在可见部分的前面和后面有多少像素|可选|
|children|List\<Widget>|ListView 的列表项|可选|
|semanticChildCount|int|提供语义信息的列表项的数量<br>默认为 ListView 的 item 的数量|可选|
| dragStartBehavior	| DragStartBehavior	| 确定处理拖动开始行为的方式。<br>如果设置为[DragStartBehavior.start]，则在检测到拖动手势时将开始滚动拖动行为<br>如果设置为[DragStartBehavior.down]，它将在首次检测到向下事件时开始|可选|
    
