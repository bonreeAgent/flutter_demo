# Flutter 基础 Widget —— BottomSheet
本节讲 Flutter [BottomSheet](https://docs.flutter.io/flutter/material/BottomSheet-class.html) 的使用。

BottomSheet 是从底部弹出来的对话框，总共分为两种，而且每种的使用方式都不同：

1. PersistentBottomSheet：持续的底部对话框

    持续的 BottomSheet，当 BottomSheet 弹出时，会一直覆盖在 APP 的界面上，而且背景是透明的，所以你还可以和界面有其他交互，且点击背景不能让 PersistentBottomSheet 消失。除非点击返回，PersistentBottomSheet 才会消失。
    
    
    PersistentBottomSheet 的创建和显示的方法：
    
    * 可以用 Scaffold 的 `showBottomSheet()` 方法
    * 也可以设置 Scaffold 的 `bottomSheet` 参数。 
2. ModalBottomSheet：有半透明背景的对话框

    ModalBottomSheet 类似一个 Dialog，有一个半透明的背景层，点击背景，ModalBottomSheet 会消失。 
    
    ModalBottomSheet 的创建和显示的方法：
    * 只能使用 `showModalBottomSheet()` 方法。
    

```!
在使用显示 BottomSheet 的方法的时候，必须要注意这些方法只能在 Scaffold 的 子Widget 里使用，因为这些方法需要用到 Scaffold 的 Context，如果和 Scaffold 在同一层，那么就要使用 Builder。
```


## BottomSheet

这里先介绍一下 BottomSheet，然后在介绍使用方法。

## BottomSheet 的构造函数及参数说明
BottomSheet 的构造函数为：
```
class BottomSheet extends StatefulWidget {
  const BottomSheet({
    Key key,
    this.animationController,
    this.enableDrag = true,
    this.elevation = 0.0,
    @required this.onClosing,
    @required this.builder
  }) 
  ...
}
```

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| key | Key | Widget 的标识 | 可选 |
| animationController | AnimationController | 控制 BottomSheet 的动画 | 可选 |
| enableDrag | bool | BottomSheet 是否可以拖动<br>默认为true，可以向上拖、向下拖或者向下滑动关闭 BottomSheet| 可选 |
| elevation | double | BottomSheet 相对于其父级放置的z坐标，这可以控制 BottomSheet 的阴影大小<br>默认值为0.0，该值必须>=0 | 可选 |
| onClosing | VoidCallback | 当 BottomSheet 关闭的时候调用<br>这个事件可能会多次调用 | 必选 |
| builder | WidgetBuilder | BottomSheet 要显示的内容 | 必选 |

# PersistentBottomSheet：持续的底部对话框

PersistentBottomSheet 的创建和显示的方法：
    
1. 可以用 Scaffold 的 `showBottomSheet()` 方法
2. 也可以设置 Scaffold 的 `bottomSheet` 参数。


## 1. showBottomSheet()

#### 代码所在位置

flutter_widget_demo/lib/bottomsheet/ShowPersistentBottomSheetWidget.dart

#### showBottomSheet() 方法的定义及参数说明
showBottomSheet() 方法的定义为:
```
PersistentBottomSheetController<T> showBottomSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
}) {
  assert(context != null);
  assert(builder != null);
  return Scaffold.of(context).showBottomSheet<T>(builder);
}
```
| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| context | BuildContext | 应用上下文 | 必选 |
| builder | WidgetBuilder | 要显示的 BottomSheet  | 必选 |

#### showBottomSheet() 的使用
showBottomSheet() 使用的完整 Demo 如下：
```
import 'package:flutter/material.dart';

main() => runApp(new ShowPersistentBottomSheetWidget());

class ShowPersistentBottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
          appBar:
              new AppBar(title: new Text('Flutter UI Widget -- BottomSheet')),
          body: Builder(
            builder: (context) {
              return RaisedButton(
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) => BottomSheet(
                          onClosing: () {},
                          builder: (context) => Container(
                                height: 200.0,
                                color: Colors.blue,
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('dismissBottomSheet'),
                                  ),
                                ),
                              )));
                },
                child: Text('showBottomSheet'),
              );
            },
          )),
    );
  }
}
```

运行后的效果为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a000c0850831a0?w=428&h=768&f=png&s=47145)

* PersistentBottomSheet 的关闭

    PersistentBottomSheet 出现时,TitleBar 的右上角会多一个返回的按钮，可以关闭 PersistentBottomSheet，因为 PersistentBottomSheet 无法通过点击背景关闭。
    
    或者在 BottomSheet 里使用 `Navigator.of(context).pop();` 来关闭 PersistentBottomSheet。
    
## 2. Scaffold 的 bottomSheet 参数
就是直接给 Scaffold 的 bottomSheet 参数赋 BottomSheet 的实例，这样 Scaffold 一创建的时候就会显示 BottomSheet。

#### 代码所在位置

flutter_widget_demo/lib/bottomsheet/PersistentBottomSheetWidgetWidget.dart

#### bottomSheet 的使用
完整 Demo 如下：
```
import 'package:flutter/material.dart';

main() => runApp(new PersistentBottomSheetWidgetWidget());

class PersistentBottomSheetWidgetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Flutter UI Widget -- BottomSheet')),
        body: Builder(
          builder: (context) {
            return RaisedButton(
              onPressed: () {},
              child: Text('showBottomSheet'),
            );
          },
        ),
        bottomSheet: BottomSheet(
            onClosing: () {},
            builder: (context) => Container(
                  height: 200.0,
                  color: Colors.blue,
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('dismissBottomSheet'),
                    ),
                  ),
                )),
      ),
    );
  }
}
```

运行效果和上面的一样。

# ModalBottomSheet：有半透明背景的对话框

ModalBottomSheet 的创建和显示的方法：

* 只能使用 `showModalBottomSheet()` 方法。

#### 代码所在位置

flutter_widget_demo/lib/bottomsheet/ShowModalBottomSheetWidget.dart

## showModalBottomSheet() 方法的定义及参数说明
showModalBottomSheet() 方法的定义如下：
```
Future<T> showModalBottomSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
}) {
  assert(context != null);
  assert(builder != null);
  assert(debugCheckHasMaterialLocalizations(context));
  return Navigator.push(context, _ModalBottomSheetRoute<T>(
    builder: builder,
    theme: Theme.of(context, shadowThemeOnly: true),
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  ));
}
```
| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| context | BuildContext | 应用上下文 | 必选 |
| builder | WidgetBuilder | 要显示的 BottomSheet  | 必选 |

#### showModalBottomSheet() 的使用
可以看到 showModalBottomSheet()  和 showBottomSheet() 的参数一样，所以使用方法也一样，直接把第一个 Demo 里的方法名替换为 showModalBottomSheet()。

完整 Demo 如下：
```
import 'package:flutter/material.dart';

main() => runApp(new ShowModalBottomSheetWidget());

class ShowModalBottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
          appBar:
              new AppBar(title: new Text('Flutter UI Widget -- BottomSheet')),
          body: Builder(
            builder: (context) {
              return RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheet(
                          onClosing: () {},
                          builder: (context) => Container(
                                height: 200.0,
                                color: Colors.blue,
                                child: Center(
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('dismissBottomSheet'),
                                  ),
                                ),
                              )));
                },
                child: Text('showBottomSheet'),
              );
            },
          )),
    );
  }
}
```

运行效果为：

![](https://user-gold-cdn.xitu.io/2019/4/9/16a000c84b8fe2bc?w=428&h=768&f=png&s=42081)


可以看到 ModalBottomSheet 弹出来时，背景是半透明的，点击半透明的背景也能关闭 ModalBottomSheet。