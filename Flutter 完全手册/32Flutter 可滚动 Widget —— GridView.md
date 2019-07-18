# Flutter 可滚动 Widget —— GridView

GridView 是一个可以构建二维网格列表的 可滚动Widget。



## GridView 的快速上手
GridView 和 ListView 一样，有五种用法：

### 1.使用默认的构造函数，给 children 属性赋值
#### 代码所在位置

flutter_widget_demo/lib/gridview/GridViewDefaultWidget.dart

#### 使用方法
使用默认构造函数写 GridView，只适用于那些只有少量 子Widget 的 GridView。

demo 如下：
```
import 'package:flutter/material.dart';

void main() => runApp(GridViewDefaultWidget());

class GridViewDefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
          appBar: AppBar(title: new Text('Flutter 可滚动Widget -- GridView')),
          body: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
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
          )),
    );
  }
}
```

运行效果如下：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a00350cf908d83?w=428&h=768&f=png&s=54701)

### 2.使用 GridView.count
#### 代码所在位置

flutter_widget_demo/lib/gridview/GridViewCountWidget.dart

#### 使用方法
GridView.count 的定义如下：
```
  GridView.count({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    @required int crossAxisCount,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    List<Widget> children = const <Widget>[],
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.down,
  })
```
相比于默认构造函数，其实是将默认构造函数里的 gridDelegate 属性，拆分成了 crossAxisCount、mainAxisSpacing、crossAxisSpacing 和 childAspectRatio。

使用 GridView.count 的 demo 如下：
```
import 'package:flutter/material.dart';

void main() => runApp(GridViewCountWidget());

class GridViewCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
          appBar: AppBar(title: new Text('Flutter 可滚动Widget -- GridView')),
          body: GridView.count(
            crossAxisCount: 3,
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
          )),
    );
  }
}
```


运行效果如下：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a00350cf908d83?w=428&h=768&f=png&s=54701)

### 3.使用 GridView.extent
#### 代码所在位置

flutter_widget_demo/lib/gridview/GridViewExtentWidget.dart

#### 使用方法
GridView.extent 的定义如下：
```
  GridView.extent({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    @required double maxCrossAxisExtent,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    List<Widget> children = const <Widget>[],
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.down,
  })
```
这里类似于 GridView.count,因为 GridView.count 相当于 GridView+SliverGridDelegateWithFixedCrossAxisCount，而 GridView.extent 相当于 GridView+SliverGridDelegateWithFixedCrossAxisCount。

和 GridView.count 的布局算法不同。

使用 GridView.extent 的 demo 如下：
```
import 'package:flutter/material.dart';

void main() => runApp(GridViewExtentWidget());

class GridViewExtentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
          appBar: AppBar(title: new Text('Flutter 可滚动Widget -- GridView')),
          body: GridView.extent(
            maxCrossAxisExtent: 300,
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
          )),
    );
  }
}
```


运行效果如下：


![](https://user-gold-cdn.xitu.io/2019/4/9/16a0035889074fb6?w=428&h=768&f=png&s=45048)


### 4.使用 GridView.builder,可用于和数据绑定实现大量或无限的列表

#### 代码所在位置

flutter_widget_demo/lib/gridview/GridViewBuilderWidget.dart

#### 使用方法
GridView.builder 可以和数据绑定，用于构建大量或无限的列表。而且只会构建那些实际可见的 子Widget。

GridView.builder 的定义如下：
```
  GridView.builder({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    @required this.gridDelegate,
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    int semanticChildCount,
  }) 
```

多了和 ListView.builder 类似的 itemCount 和 itemBuilder 属性，用法也是一样的:
```
import 'package:flutter/material.dart';

void main() => runApp(GridViewBuilderWidget(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

class GridViewBuilderWidget extends StatelessWidget {
  final List<String> items;

  GridViewBuilderWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(title: new Text('Flutter 可滚动Widget -- GridView')),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
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

运行效果如下：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a0035bec84de94?w=428&h=768&f=png&s=69326)

### 5.使用 GridView.custom

#### 代码所在位置

flutter_widget_demo/lib/gridview/GridViewCustomWidget.dart

#### 使用方法

GridView.custom 的定义如下：
```
const GridView.custom({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    @required this.gridDelegate,
    @required this.childrenDelegate,
    double cacheExtent,
    int semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.down,
  }) 
```
增加了 childrenDelegate 的属性，类型为 SliverChildDelegate，具有定制 子Widget 的能力，和 ListView.custom 里的一样，所以用法也一样:
```
import 'package:flutter/material.dart';

void main() => runApp(GridViewCustomWidget(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

class GridViewCustomWidget extends StatelessWidget {
  final List<String> items;

  GridViewCustomWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(title: new Text('Flutter 可滚动Widget -- GridView')),
        body: GridView.custom(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
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
运行效果如下：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a00350cf908d83?w=428&h=768&f=png&s=54701)

## GridView 的构造函数及参数说明
GridView 的构造函数，会发现 GridView 的大部分属性都和 ListView 一样：
```
class GridView extends BoxScrollView {
  GridView({
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    @required this.gridDelegate,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    List<Widget> children = const <Widget>[],
    int semanticChildCount,
  })
  ...
}
```
| 参数名字 | 参数类型|	意义 |	必选 or 可选 |
| -- | -- | -- | -- |
| key |Key | Widget 的标识 | 可选 |
| scrollDirection |	Axis | 滑动的方向<br>默认为 Axis.vertical，垂直方向可滑动 |	可选 |
| reverse |	bool |控制 GridView 里列表项的排列顺序，是按照插入顺序排，还是按照插入顺序相反的方向排序。<br>默认为 false，就是按照插入顺序排序，第一个插入的在头部<br>，当 reverse 为 true 时，第一个插入的会在底部 |可选 |
|controller	|ScrollController|可以控制 GridView 滚动的位置<br>ScrollController 提供以下的几个功能：<br>1.设置 GridView 滑动的初始位置<br>2.可以控制 GridView 是否存储和恢复滑动的位置<br>3.可以读取、设置当前滑动的位置<br>可以继承 ScrollController 实现自定义的功能<br>当 primary 为 true 时，controller 必须为 null|	可选|
|primary|bool|是否是与父级关联的主滚动视图<br>当为 true 时，即使 GridView 里没有足够的内容也能滑动	|可选|	
|physics|ScrollPhysics|设置 GridView 的滚动效果<br>值必须为 ScrollPhysics 的子类，比如有如下的值：<br>AlwaysScrollableScrollPhysics():可以让 GridView 里没有足够的内容也能滑动<br>ScrollPhysics():GridView 在没有足够的内容的时候不能滑动| 可选|
| shrinkWrap| bool |是否根据列表项的总长度来设置 GridView 的长度，默认值为 false。<br>当 shrinkWrap 为 false 时，GridView 会在滚动方向扩展到可占用的最大空间<br>当 shrinkWrap 为 true 时，GridView 在滚动方向占用的空间就是其列表项的总长度，但是这样会很耗性能，因为当其列表项发生变化时，GridView 的大小会重新计算|可选|
|padding|EdgeInsetsGeometry|GridView 的内边距|可选|
| gridDelegate | SliverGridDelegate  |  控制 GridView 中 子Widget 布局的委托。<br>SliverGridDelegate 的实现有两个：<br>SliverGridDelegateWithMaxCrossAxisExtent：横轴  子Widget 为固定长度的布局算法<br>SliverGridDelegateWithFixedCrossAxisCount：横轴 子Widget 为固定数量的布局算法 | 必选 |
|addAutomaticKeepAlives|bool|是否用 AutomaticKeepAlive 来包列表项,默认为 true<br>在一个 lazy list 里，如果 子Widget 为了保证自己在滑出可视界面时不被回收，就需要把 addAutomaticKeepAlives 设为 true<br>当 子Widget 不需要让自己保持存活时，为了提升性能，请把 addAutomaticKeepAlives 设为 false<br>如果 子Widget 自己维护其 KeepAlive 状态，那么此参数必须置为false。|可选|
| addRepaintBoundaries|bool|是否用 RepaintBoundary 来包列表项，默认为 true<br>当 addRepaintBoundaries 为 true 时，可以避免列表项重绘，提高性能<br>但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加 RepaintBoundary 反而会更高效。|可选|
|addSemanticIndexes|bool|是否用 IndexedSemantics 来包列表项,默认为 true<br>使用 IndexedSemantics 是为了正确的用于辅助模式|可选|
|cacheExtent|double|GridView 可见部分的前面和后面的区域可以用来缓存列表项，<br>这部分区域的 item 即使不可见，也会加载出来，所以当滑动到这个区域的时候，缓存的区域就会变的可见，<br>cacheExtent 就表示缓存区域在可见部分的前面和后面有多少像素|可选|
|children|List\<Widget>|GridView 的列表项|可选|
|semanticChildCount|int|提供语义信息的列表项的数量<br>默认为 GridView 的 item 的数量|可选|