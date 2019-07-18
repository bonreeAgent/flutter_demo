# Flutter 布局 Widget


## 单子Widget布局 和 多子Widget布局

布局Widget 按照可以包含的 子Widget 的数量分为：

* 单子Widget布局：就是布局 Widget 只能含有一个 子Widget 的

    例如前面例子里出现的：
    ```
    Center(
         child: Text(content),
    )
    ```
    Center 就是 单子Widget 的布局，它的 子Widget 属性是`child`，而且只能有一个。
* 多子Widget布局：就是布局 Widget 可以含有 多个子Widget的

    如下面的例子：
    ```
    Column(
        children: <Widget>[
            Text(content),
            Text(content),
            ...
        ]
    )
    ```
    Column 就是 多子Widget 的布局，它的 子Widget 属相是`children`，可以有多个，是 Widget 数组。

可以明显的看到，区分 单子Widget布局 还是 多子Widget布局，就看是 `child` 还是 `children`。`child` 就是 单子Widget，只能包含一 Widget；`children` 就是 多子Widget，包含的是 Widget 数组。

## 布局方式

布局 Widget 还可以按照为子元素排布的方式分为：

* 弹性布局Widget
* 线性布局Widget
* 流式布局Widget
* 层叠布局Widget


因为在使用中，我们都是按照子元素排布的方式来使用的，所以接下来就主要讲一下这几种排布方式。




