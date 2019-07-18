# Flutter 手势识别 Widget

## Flutter 通过 Widget 来处理手势事件
在前面讲 按钮 的时候，你会发现按钮有 onPressed 来响应点击事件，但是如果我让你去监听 Text 的点击事件，你会发现 Text 根本没有类似按钮的 onPressed 属性，那么如何去监听一个 Text 的点击事件呢？

那就需要使用专门处理手势事件的 Widget 来嵌套 Text，在 Flutter 中，手势事件识别也是通过 Widget 来实现的，通过这个，你也能更加明白 Everything is a Widget。

## Flutter 手势事件的分类
手势事件在 Flutter 中分为两层：

1. 第一层是原始的 pointer events(指针事件)

    它描述了屏幕上指针（例如，触摸，鼠标和触控笔）的位置和移动。例如：PointerDownEvent、PointerUpEvent 、PointerMoveEvent 、PointerCancelEvent 等。
    
    为了监听 pointer events，请使用 Listener Widget，但一般建议使用 GestureDetector Widget，就是下面要介绍的。
2. 第二层是可以对原始的事件识别成不同的手势

    第二层是对第一层原始 pointer event 事件进行识别后的手势，例如：单击、双击、长按、拖动等。
    
    为了识别不同的手势，请使用 GestureDetector Widget。
    
下来介绍 GestureDetector 的使用。

## Flutter 手势识别的 Widget —— GestureDetector
GestureDetector 是用于检测手势的 Widget。

## 代码所在位置

flutter_widget_demo/lib/gesture/GestureDetectorWidget.dart

## GestureDetector 快速上手
GestureDetector 的使用很简单，只要用 GestureDetector 嵌套要检测手势的 Widget 就行，然后在 GestureDetector 里实现想要监听的手势的方法就行。

例如，想要检测 Text 的点击事件，就可以这么用：
```
GestureDetector(
    child: Text('Hello Flutter'),
    onTap: (){
        print('tab Text');
    },
)
```

GestureDetector 在一个页面使用的完整 Demo 为：
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(GestureDetectorWidget());

class GestureDetectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter 手势识别Widget")),
        body: GestureDetector(
          child: Text('手势识别'),
          onTap: (){
            print('点击');
          },
          onDoubleTap: (){
            print('双击');
          },
          onLongPress:  (){
            print('长按');
          },
          onHorizontalDragStart: (DragStartDetails details){
            print('水平滑动');
          },
        ),
      ),
    );
  }
}
```


## GestureDetector 的构造函数及参数说明
为了知道 GestureDetector 支持哪些手势，我们可以看一下 GestureDetector 的构造函数：
```
class GestureDetector extends StatelessWidget {
  GestureDetector({
    Key key,
    this.child,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressUp,
    this.onLongPressDragStart,
    this.onLongPressDragUpdate,
    this.onLongPressDragUp,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.down,
  })
  ...
}
```
通过看 GestureDetector 构造函数的参数，就可以知道 GestureDetector 支持哪些收拾。

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| key | Key | Widget 的标识 | 可选 |
| child | Widget | 要检测手势事件的 Widget | 可选 |
| onTapDown | GestureTapDownCallback | 手指触摸屏幕时产生 onTapDown 事件 | 可选 |
| onTapUp | GestureTapDownCallback | 手指离开屏幕时产生 onTapUp 事件，之后便会触发 onTap 事件 | 可选 |
| onTap | GestureTapCallback | 点击事件 | 可选 |
| onTapCancel | GestureTapCancelCallback | 当触发 onTapDown 之后，取消点击，则会触发 onTapCancel，后面的 onTapDown 和 onTapUp 都不会在触发 | 可选 |
| onDoubleTap | GestureTapCallback | 双击事件 | 可选 |
| onLongPress | GestureLongPressCallback | 长按屏幕时触发，当监听了 onLongPress 事件时，则不能监听 onLongPressDragStart、onLongPressDragUpdate、onLongPressDragUp | 可选 |
| onLongPressUp | GestureLongPressUpCallback | 长按屏幕，手指离开屏幕时触发，当监听了 onLongPressUp 事件时，则不能监听 onLongPressDragStart、onLongPressDragUpdate、onLongPressDragUp | 可选 |
| onLongPressDragStart | GestureLongPressDragStartCallback | 长按屏幕，并准备开始拖动时触发，当监听了 onLongPressDragStart 事件时，则不能监听 onLongPress、onLongPressUp | 可选 |
| onLongPressDragUpdate | GestureLongPressDragUpdateCallback | 长按屏幕后并拖动时触发，当监听了 onLongPressDragUpdate 事件时，则不能监听 onLongPress、onLongPressUp  | 可选 |
| onLongPressDragUp | GestureLongPressDragUpCallback | 长按屏幕拖动，手指离开屏幕时触发，当监听了 onLongPressDragUp 事件时，则不能监听 onLongPress、onLongPressUp | 可选 |
| onVerticalDragDown | GestureDragDownCallback | 手指接触屏幕，并且可能会开始垂直移动时触发 | 可选 |
| onVerticalDragStart | GestureDragStartCallback | 手指接触屏幕，并且已经开始垂直移动时触发 | 可选 |
| onVerticalDragUpdate | GestureDragUpdateCallback | 手指接触屏幕，并且垂直移动时触发 | 可选 |
| onVerticalDragEnd | GestureDragEndCallback | 手指接触屏幕垂直移动，然后手指离开屏幕时触发 | 可选 |
| onVerticalDragCancel | GestureDragCancelCallback | 当 onVerticalDragDown 没有完成时就会触发 onVerticalDragCancel | 可选 |
| onHorizontalDragDown | GestureDragDownCallback | 手指接触屏幕，并且可能会开始水平移动时触发 | 可选 |
| onHorizontalDragStart | GestureDragStartCallback | 手指接触屏幕，并且已经开始水平移动时触发 | 可选 |
| onHorizontalDragUpdate | GestureDragUpdateCallback | 手指接触屏幕，并且水平移动时触发 | 可选 |
| onHorizontalDragEnd | GestureDragEndCallback |  手指接触屏幕水平移动，然后手指离开屏幕时触发 | 可选 |
| onHorizontalDragCancel | GestureDragCancelCallback | 当 onHorizontalDragDown 没有完成时就会触发 onHorizontalDragCancel | 可选 |
| onForcePressStart | GestureForcePressStartCallback | 手指与屏幕接触，并且当有足够的压力时才会触发<br>注意，这个事件仅在具有压力检测屏幕的设备上触发。 | 可选 |
| onForcePressPeak | GestureForcePressPeakCallback | 手指与屏幕接触，并且当有压力达到最大时触发<br>注意，这个事件仅在具有压力检测屏幕的设备上触发。  | 可选 |
| onForcePressUpdate | GestureForcePressUpdateCallback | 手指与屏幕接触，有足够的压力并在屏幕上移动时触发<br>注意，这个事件仅在具有压力检测屏幕的设备上触发。 | 可选 |
| onForcePressEnd | GestureForcePressEndCallback | 手指与屏幕分开时触发<br>注意，这个事件仅在具有压力检测屏幕的设备上触发。  | 可选 |
| onPanDown | GestureDragDownCallback | 手指与屏幕接触，并且可能开始移动时触发 | 可选 |
| onPanStart | GestureDragStartCallback | 手指与屏幕接触，并且开始移动时触发 | 可选 |
| onPanUpdate | GestureDragUpdateCallback | 手指在屏幕上移动时触发 | 可选 |
| onPanEnd | GestureDragEndCallback | 手指离开屏幕时触发 | 可选 |
| onPanCancel | GestureDragCancelCallback | 当 onPanDown 没有完成时触发 onPanCancel | 可选 |
| onScaleStart | GestureTapDownCallback | 手指与屏幕接触，并且即将有缩放操作时触发，初始值为 1.0 | 可选 |
| onScaleUpdate | GestureTapDownCallback | 手指与屏幕接触，并且有缩放操作时触发 | 可选 |
| onScaleEnd | GestureTapDownCallback | onScaleStart 之后，手指离开屏幕时触发 | 可选 |
| behavior | HitTestBehavior | 在命中测试期间，此手势检测器应如何表现。 | 可选 |
| excludeFromSemantics | bool | 是否从语义树中排除这些手势。因为 Widget   | 可选 |
| dragStartBehavior | DragStartBehavior | 确定处理拖动开始行为的方式。 | 可选 |

