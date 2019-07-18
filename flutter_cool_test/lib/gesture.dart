
import 'package:flutter/material.dart';

class GestureDetectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
//        appBar: AppBar(title: Text("Flutter 手势识别Widget")),
        body: Center(
          child: GestureDetector(
            child: Text(
              '手势识别',
              style: TextStyle(fontSize: 30),
            ),
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
      ),
    );
  }
}