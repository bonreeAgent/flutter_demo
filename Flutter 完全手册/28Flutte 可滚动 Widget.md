# Flutte 可滚动 Widget
前面介绍的 Flex、Row、Column 都是不可滑动的，如果当 子Widget 的大小超过 Flex、Row或Column 之后，就会报 OverLoad，会在界面上看到黄黑色的条；还有一种情况就是需要在页面上显示很多的列表项。所以为了显示这些长度超过屏幕范围的 Widget 和 列表项，Flutter 提供了多种 可滚动的Widget，这些 可滚动Widget 的使用范围都不同，虽然也有 ScrollView 和 ListView,但和 Android、iOS 里的用法都略有不同，下面会仔细介绍。

## SingleChildScrollView
```!
SingleChildScrollView 是只能包含一个 子Widget 的可滚动Widget。如果有很多 子Widget，那么需要用 ListBody 或者 Column 或者其他 Widget 来嵌套这些 子Widget，然后在 SingleChildScrollView 里使用。
```

## ListView
```!
ListView 是可以线性排列 子Widget 的可滚动Widget。ListView 可以和数据绑定用来实现瀑布流。如果有很多 子Widget，能使用 ListView 的就不要使用 SingleChildScrollView，因为 ListView 的性能比 SingleChildView 好。
```
#### ListView 的辅助 Widget
还有一些 Widget 可以辅助 ListView 的使用，例如：

1. ListTile：一个固定高度的行，通常包含一些文本，以及一个行前或行尾图标。

2. Stepper：一个 Material Design 步骤指示器，显示一系列步骤的过程

3. Divider：一个逻辑1像素厚的水平分割线，两边都有填充

## CustomScrollView
```!
CustomScrollView 是可以使用 slivers 来自定义滑动效果的可滚动Widget。
```

#### slivers
slivers 指的是以 Sliver 开头的一系列 Widget，例如：SliverList、SliverGrid、SliverAppBar 等，Sliver 有“小片”的意思，在 Flutter 中，指的是具有特定滚动效果的可滚动块，它们只能用在 CustomScrollView 里，多个 Sliver 拼在 CustomScrollView 里来实现特定的效果。

#### CustomScrollView 也可以实现 ListView 的功能
CustomScrollView 使用 SliverList 可以实现和 ListView 一样的功能，所以：

1. CustomScrollView 不像  SingleChildScrollView 一样只能包含一个 子Widget，
2. CustomScrollView 可以实现比 ListView 更复杂的滑动效果，例如：吸顶，所以当 ListView 不能实现一些滑动效果时，就应该使用 CustomScrollView，但是如果没有特殊的效果，而是数据展示，就使用 ListView。

## GridView
```!
GridView 是一个可以构建二维网格列表的 可滚动Widget。
```
## PageView
```
PageView 是可以一页一页滑动的 可滚动Widet。
```

接下来介绍各种 可滚动Widget 的具体用法。