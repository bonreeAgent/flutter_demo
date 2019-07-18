# Flutter 基础 Widget —— 文本框
本节讲 Flutter 文本框的使用。

主要讲以下两种文本框 Widget 的使用 :
1. [Text](https://docs.flutter.io/flutter/widgets/Text-class.html)
2. [RichText](https://docs.flutter.io/flutter/widgets/RichText-class.html)


## [1. Text](https://docs.flutter.io/flutter/widgets/Text-class.html)
Text 就是显示文本的 Widget。

### 代码所在位置

flutter_widget_demo/lib/text/TextWidget.dart

### Text 快速上手
Text 的最简单使用方式就是在 Text 里传入要显示的文字：
```
Text("Hello Flutter");// Text 里传入要显示的文字
```

将 Text 赋值给 Scaffold 的 body 参数，就可以把 Text 显示在一个页面上：
```
import 'package:flutter/material.dart';

void main() => runApp(TextWidget());

class TextWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter UI基础Widget -- 文本")),
        body: Text("Hello Flutter")
      ),
    );
  }
}
```

运行后的效果为：

![](https://user-gold-cdn.xitu.io/2019/3/9/16961317c48d2398?w=849&h=346&f=jpeg&s=41698)

这是最简单的 Text 使用方法，如果需要更复杂的效果，比如设置字体大小、颜色等，就需要了解 Text 的各种参数的使用。
### Text 的必选参数：data
Text 的内容 data 是必选参数。

### Text 可选参数里经常用到的参数：TextStyle
TextStyle 是 Text 里经常要用到的参数，用来定义 Text 显示的样式，如 颜色、大小、背景灯。

#### TextStyle 快速上手
这里有一个 TextStyle 的 Demo:
```
Text(
    "Hello Flutter",
    style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
        background: new Paint()..color = Colors.yellow,
        ),
    )
```
TextStyle 定义了 字体颜色、大小和背景，运行后的效果为：

![](https://user-gold-cdn.xitu.io/2019/3/9/1696150d014f9483?w=847&h=299&f=jpeg&s=42902)

如果要使用更多的效果，就需要了解 TextStyle 的各种参数和使用方法。

#### TextStyle 的构造参数及参数说明
先看 TextStyle 的构造参数：
```
class TextStyle extends Diagnosticable {

  const TextStyle({
    this.inherit = true,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.locale,
    this.foreground,
    this.background,
    this.shadows,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.debugLabel,
    String fontFamily,
    List<String> fontFamilyFallback,
    String package,
  }) : fontFamily = package == null ? fontFamily : 'packages/$package/$fontFamily',
       _fontFamilyFallback = fontFamilyFallback,
       _package = package,
       assert(inherit != null),
       assert(color == null || foreground == null, _kColorForegroundWarning);
       
    ...
}
```

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| inherit | bool | 是否继承父 Text 的样式，默认为 true<br>如果为false，且样式没有设置具体的值，则采用默认值：白色、字体大小 10px、sans-serif 字体 | 可选 |
| color | Color | 文字的颜色 | 可选 |
| fontSize | double | 文字的大小 | 可选 |
| fontWeight | FontWeight | 字体粗细 | 可选 |
| fontStyle | FontStyle | 是否在字体中倾斜字形 | 可选 |
| letterSpacing | double | 字母之间的间隔 | 可选 |
| wordSpacing | double | 单词之间的间隔 | 可选 |
| textBaseline| TextBaseline | 用于对齐文本的水平线 | 可选 |
| height | double | 文本的高度<br>但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。 | 可选 |
| locale | Locale | 用于选择用户语言和格式设置首选项的标识符| 可选 |
| foreground | Paint | 文本的前景色 | 可选 |
| background | Paint | 文本的背景色 | 可选 |
| shadows | List< ui.Shadow> | 在文本下方绘制阴影 | 可选|
| decoration | TextDecoration | 文本的线条 | 可选 |
| decorationColor | Color | TextDecoration 线条的颜色 | 可选 |
| decorationStyle | TextDecorationStyle | TextDecoration 线条的样式| 可选 |
| debugLabel | String | 文本样式的描述<br>无实际用处 | 可读 |
| fontFamily | String | 用于设置使用哪种自定义字体 | 可读 |
| fontFamilyFallback | String | 字体列表，当前面的字体找不到时，会在这个列表里依次查找 | 可读 |
| package | String | 用于设置使用哪种自定义字体 | 可读 |

可以看到 TextStyle 只有可选参数，没有必选参数。

* TextDecoration：文本的线条
    
    文本的线条，包含四种：
    1. TextDecoration.underline：下划线
    2. TextDecoration.overline：上划线
    3. TextDecoration.lineThrough：中划线
    4. TextDecoration.none：不划线
* decorationStyle：文本线条的种类

    文本线条的种类，包含有五中：
    
    1. TextDecorationStyle.solid：实线
    
        ![](https://user-gold-cdn.xitu.io/2019/4/16/16a2675503be3e75?w=280&h=88&f=jpeg&s=13182)
    2. TextDecorationStyle.double：两条线
    
        ![](https://user-gold-cdn.xitu.io/2019/4/16/16a26757e9577102?w=390&h=130&f=jpeg&s=14168)
    3. TextDecorationStyle.dotted：点虚线
    
        ![](https://user-gold-cdn.xitu.io/2019/3/9/169616473a977a44?w=308&h=120&f=jpeg&s=12785)
    
    4. TextDecorationStyle.dashed：间隔虚线（比点要长）
    
        ![](https://user-gold-cdn.xitu.io/2019/3/9/1696164a2eb25def?w=286&h=94&f=png&s=8761)
    
    5. TextDecorationStyle.wave：波浪线
    
        ![](https://user-gold-cdn.xitu.io/2019/3/9/1696164ed165f9a3?w=278&h=102&f=jpeg&s=12958)

### Text 其他参数说明

我们可以在 Text 的构造函数里找到 Text 的所有参数，下面是 Text 构造函数：
```
class Text extends StatelessWidget {

  const Text(this.data, {
    Key key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) : assert(data != null),
       textSpan = null,
       super(key: key);
    
    ...
}
```

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| `data` | String | 要显示的文字 | 必选 |
| `key` | Key | Widget 的标识 | 可选 |
| `style` | TextStyle | 文本样式 | 可选 |
| `strutStyle` | StrutStyle | 设置每行的最小行高 | 可选 |
| `textAlign` | TextAlign | 文本的对齐方式 | 可选 |
| `textDirection` | TextDirection | 文字方向 | 可选 |
| `locale` | Locale | 用于选择用户语言和格式设置首选项的标识符| 可选 |
| `softWrap` | bool | 是否支持软换行符<br>如果是 false 的话，这个文本只有一行，水平方向是无限的 | 可选 |
| `overflow` | TextOverflow | 文本的截断方式 | 可选 |
| `textScaleFactor` | double | 代表文本相对于当前字体大小的缩放因子<br>默认值为1.0| 可选 |
| `maxLines` | int | 显示的最大行数 | 可选 |
| `semanticsLabel` | String | 给文本加上一个语义标签<br>没有实际用处 | 可选 |

从构造函数里也可以看到只有 data 是必选参数，其余都是可选参数。


* `textAlign`：文本的对齐方式

    文本的对齐方式，有六种：
    
    1. TextAlign.left：左对齐
    2. TextAlign.right：右对齐
    3. TextAlign.center：居中对齐
    4. TextAlign.start：从文字开始的那个方向对齐，如果文字方向从左到右，就左对齐，否则是右对齐。
    5. TextAlign.end：从文字开始的相反方向对齐，如果文字方向从左到右，就右对齐，否则是左对齐。
    6. TextAlign.justify
    
* `textDirection`：文字方向
    
    文字方向有两种:
    
    1. TextDirection.ltr：文字方向从左到右
    2. TextDirection.ltr：文字方向从右到左
* `overflow`：文本的截断方式
    
    当要显示的内容超了之后，文本的截断方式有三种：
    1. TextOverflow.ellipsis：多余文本截断后以省略符“...”表示
    2. TextOverflow.clip：剪切多余文本，多余文本不显示
    3. TextOverflow.fade：将多余的文本设为透明


### Text 的命名构造函数：Text.rich()

Text 除了默认的构造函数外，还有命名构造函数：`Text.rich()`，`Text.rich()` 的定义为：
```
/// Creates a text widget with a [TextSpan].
  const Text.rich(this.textSpan, {
    Key key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) 
```
`Text.rich()` 需要传入 TextSpan，可以显示多种样式的 text，具体使用可以查看下面介绍的 RichText，使用方法是一样的。

## [2. RichText](https://docs.flutter.io/flutter/widgets/RichText-class.html)
一个富文本 Text，可以显示多种样式的 text。

### 代码所在位置

flutter_widget_demo/lib/text/RichTextWidget.dart

### RichText 快速上手
RichText 要传入 TextSpan 数组，每个 TextSpan 是一个独立的文本，可以定义自己的 Style，使用如下：
```
RichText(
    text: TextSpan(children: [
      TextSpan(text: "Hello", style: TextStyle(color: Colors.blue)),
      TextSpan(text: "Flutter", style: TextStyle(color: Colors.red))
    ]),
  )
```

把 RichText 使用 TextSpan 放到一个页面的完整 Demo 如下：
```
import 'package:flutter/material.dart';

void main() => runApp(RichTextWidget());

class RichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Flutter UI基础Widget -- 文本")),
          body: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Hello", style: TextStyle(color: Colors.blue)),
              TextSpan(text: "Flutter", style: TextStyle(color: Colors.red))
            ]),
          )),
    );
  }
}
```
运行效果如下：

![](https://user-gold-cdn.xitu.io/2019/3/9/169616d0c55b31ea?w=214&h=66&f=jpeg&s=8989)

### RichText 的必选参数：TextSpan
如果我们需要对一个 Text 内容的不同部分按照不同的样式显示，这时就可以使用 TextSpan，它代表文本的一个片段，然后把不同的 TextSpan 组合起来。

#### TextSpan 的构造函数及参数说明
TextSpan 的构造函数如下：
```
class TextSpan extends DiagnosticableTree {
  const TextSpan({
    this.style,
    this.text,
    this.children,
    this.recognizer,
  });
  ...
}
```

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| style | TextStyle | 文本样式 | 可选 |
| text | String | 要显示的文字 | 可选 |
| children | List< TextSpan> | 子 TextSpan | 可选 |
| recognizer | GestureRecognizer | 一个手势识别器，它将接收到达此文本范围的事件。 | 可选 |

### RichText 其余参数说明
RichText 的构造函数：
```
class RichText extends LeafRenderObjectWidget {

  const RichText({
    Key key,
    @required this.text,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.locale,
    this.strutStyle,
  }) : assert(text != null),
  ...
}
```

| 参数名字 | 参数类型 | 意义 |必选 or 可选 |
| -- | -- | -- | -- |
| key | Key | Widget 的标识 | 可选 |
| text | TextSpan | 文字片段 | 必选 |
| textAlign | TextAlign | 文本的对齐方式 | 可选 |
| textDirection | TextDirection | 文字方向 | 可选 |
| softWrap | bool | 是否支持软换行符<br>如果是 false 的话，这个文本只有一行，水平方向是无限的 | 可选 |
| overflow | TextOverflow | 文本的截断方式 | 可选 |
| textScaleFactor | double | 代表文本相对于当前字体大小的缩放因子<br>默认值为1.0| 可选 |
| maxLines | int | 显示的最大行数 | 可选 |
| locale | Locale | 用于选择用户语言和格式设置首选项的标识符| 可选 |
| strutStyle | StrutStyle | 设置每行的最小行高 | 可选 |

从红也可以看到 RichText 的必选参数是 text，text 的类型是 TextSpan，除了 text 参数, RichText 的大部分参数和 Text 一样。


## Flutter 使用自定义字体
可以在 Flutter 中使用不同的字体。例如，我们可能会使用设计人员创建的自定义字体，或者其它第三方的字体，如 Google Fonts 中的字体。本节将介绍如何为 Flutter 应用配置字体，并在渲染文本时使用它们。

在 Flutter中 使用字体分两步完成：
1. 首先在 pubspec.yaml 中声明它们，以确保它们会打包到应用程序中。
2. 然后通过 TextStyle 属性使用字体。

### 在 pubspec.yaml 中声明
要将字体打文件打包到应用中，和使用其它资源一样，要先在 pubspec.yaml 中声明它。然后将字体文件复制到在 pubspec.yaml 中指定的位置。如：
```
flutter:
  fonts:
    - family: Raleway
      fonts:
        - asset: assets/fonts/Raleway-Regular.ttf
        - asset: assets/fonts/Raleway-Medium.ttf
          weight: 500
        - asset: assets/fonts/Raleway-SemiBold.ttf
          weight: 600
    - family: AbrilFatface
      fonts:
        - asset: assets/fonts/abrilfatface/AbrilFatface-Regular.ttf
```
### 使用字体
```
// 声明文本样式
const textStyle = const TextStyle(
  fontFamily: 'Raleway',
);

// 使用文本样式
var buttonText = const Text(
  "Use the font for this text",
  style: textStyle,
);
```
### Package 中的字体
要使用 Package 中定义的字体，必须提供 package 参数。例如，假设上面的字体声明位于 my_package 包中。然后创建 TextStyle 的过程如下：
```
const textStyle = const TextStyle(
  fontFamily: 'Raleway',
  package: 'my_package', //指定包名
);
```
如果在 package 包内部使用它自己定义的字体，也应该在创建文本样式时指定 package 参数，如上例所示。

一个包也可以只提供字体文件而不需要在 pubspec.yaml 中声明。 这些文件应该存放在包的 lib/ 文件夹中。字体文件不会自动绑定到应用程序中，应用程序可以在声明字体时有选择地使用这些字体。假设一个名为 my_package 的包中有一个字体文件：
```
lib/fonts/Raleway-Medium.ttf
```
然后，应用程序可以声明一个字体，如下面的示例所示：
```
 flutter:
   fonts:
     - family: Raleway
       fonts:
         - asset: assets/fonts/Raleway-Regular.ttf
         - asset: packages/my_package/fonts/Raleway-Medium.ttf
           weight: 500
```
lib/ 是隐含的，所以它不应该包含在 asset 路径中。

在这种情况下，由于应用程序本地定义了字体，所以在创建 TextStyle 时可以不指定 package 参数：
```
const textStyle = const TextStyle(
  fontFamily: 'Raleway',
);
```

