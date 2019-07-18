# 信息流 ListView 的实现

![](https://user-gold-cdn.xitu.io/2019/4/13/16a14dc2d60ec4f3?w=449&h=768&f=jpeg&s=80631)

上图是显示的是正在热映的电影的信息流，本节要实现这个信息流。



## 正在热映的信息流页面

#### 将信息流页面在单独的类里实现
因为信息流页面的实现比较复杂，所以为了使代码结构清晰，又需要对原来的代码进行重构，这次将信息流页面的代码提取出来，在单独的类里实现。

新建一个文件 HotMoviesListWidget.dart,代码为：
```
import 'package:flutter/material.dart';

class HotMoviesListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HotMoviesListWidgetState();
  }
}

class HotMoviesListWidgetState extends State<HotMoviesListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('正在热映'),
    );
  }
}
```
然后将 HotWidget.dart 里正在热映的代码从：
```
children: <Widget>[
      Center(
        child: Text('正在热映'),
      ),
      Center(
        child: Text('即将上映'),
      )
    ]
```
改为:
```
children: <Widget>[
      HotMoviesListWidget(),
      Center(
        child: Text('即将上映'),
      )
    ]
```

#### 使用 ListView 实现信息流
很明显，要实现信息流，需要用到 ListView。

#### HotMovieData：上映电影的信息
新建一个文件 HotMovieData.dart，在这个文件里创建存储上映电影信息的类 HotMovieData：
```
class HotMovieData{
  String title;
  double rating;
  String directors;
  String casts;
  int watchedPeople;
  String images;

  HotMovieData(this.title,this.rating,this.directors,this.casts,this.watchedPeople,this.images);
}
```

#### HotMovieItemWidget：ListView 里 item 的布局
新建一个文件 HotMovieItemWidget.dart 用来实现信息流 ListView 里 item 的布局。

item 的布局解析之后如下：
![](https://user-gold-cdn.xitu.io/2019/4/13/16a154e59bd0a633?w=1018&h=334&f=jpeg&s=93914)

而且 item 里要显示数据，所以要在 item 里传入 HotMovieData 的数据，加到 HotMovieItemWidget 的构造函数里：
```
class HotMovieItemWidget extends StatefulWidget {
  HotMovieData hotMovieData;

  HotMovieItemWidget(this.hotMovieData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HotMovieItemWidgetState();
  }
}
```

最后实现的代码为：
```
import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/HotMovieData.dart';

class HotMovieItemWidget extends StatefulWidget {
  HotMovieData hotMovieData;

  HotMovieItemWidget(this.hotMovieData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HotMovieItemWidgetState();
  }
}

class HotMovieItemWidgetState extends State<HotMovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            widget.hotMovieData.images,
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.hotMovieData.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.hotMovieData.rating.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text('导演: ' + widget.hotMovieData.directors,
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  Text('主演: ' + widget.hotMovieData.casts,
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.hotMovieData.watchedPeople.toString()+'人看过',style: TextStyle(color: Colors.red,fontSize: 14),),
                OutlineButton(
                  child: Text('购票',style: TextStyle(fontSize: 16),),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.red
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
```

#### ListView：信息流实现
在 HotMoviesListWidget.dart 文件里加入 ListView 了。

* 首先加入数据

    在 HotMoviesListWidgetState 里，增加一个变量 hotMovies：
    ```
    List<HotMovieData> hotMovies = new List<HotMovieData>();
    ```
    在 HotMoviesListWidgetState 的 initState() 生命周期里为 hotMovies 赋值：
    ```
    @override
      void initState() {
        // TODO: implement initState
        super.initState();
        var data = HotMovieData('反贪风暴4', 6.3, '林德禄', '古天乐/郑嘉颖/林峯', 29013,
            'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551353482.webp');
        setState(() {
          hotMovies.add(data);
          hotMovies.add(data);
          hotMovies.add(data);
          hotMovies.add(data);
          hotMovies.add(data);
          hotMovies.add(data);
        });
      }
    ```
* ListView

    然后使用 ListView：
    ```
      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return ListView.separated(
            itemCount: hotMovies.length,
            itemBuilder: (context, index) {
              return HotMovieItemWidget(hotMovies[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
                color: Colors.black26,
              );
            },
          );
      }
    ```
    运行后的效果为：
    
    ![](https://user-gold-cdn.xitu.io/2019/4/13/16a155bbb4d57106?w=413&h=768&f=jpeg&s=73898)
    
    然后会发现 ListView 的头部有一段空白区域，是因为当 ListView 没有和 AppBar 一起使用的时候，头部就会有一个 padding，为了去掉 padding ,可以使用 MediaQuery.removePadding:
    ```
      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.separated(
            itemCount: hotMovies.length,
            itemBuilder: (context, index) {
              return HotMovieItemWidget(hotMovies[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
                color: Colors.black26,
              );
            },
          ),
        );
      }
    ```
    然后，运行的效果就会正常：
    
    ![](https://user-gold-cdn.xitu.io/2019/4/13/16a155f0b70e2954?w=413&h=768&f=jpeg&s=76014)

最后 HotMoviesListWidget.dart 里的代码会改成：
```
import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/HotMovieData.dart';
import 'package:flutter_doubanmovie/HotMovieItemWidget.dart';

class HotMoviesListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HotMoviesListWidgetState();
  }
}

class HotMoviesListWidgetState extends State<HotMoviesListWidget> {
  List<HotMovieData> hotMovies = new List<HotMovieData>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = HotMovieData('反贪风暴4', 6.3, '林德禄', '古天乐/郑嘉颖/林峯', 29013,
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551353482.webp');
    setState(() {
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
        itemCount: hotMovies.length,
        itemBuilder: (context, index) {
          return HotMovieItemWidget(hotMovies[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
      ),
    );
  }
}
```