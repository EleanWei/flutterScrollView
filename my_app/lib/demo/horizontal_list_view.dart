import 'package:flutter/material.dart';
import 'dart:math';

// 1. 设置滚动方向为横向
// 2. 使用SizeBox包装，固定高度
// 3. 构造方法 ListView.separated

class HorizontalListViewPage extends StatefulWidget {
  const HorizontalListViewPage({Key? key}) : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalListViewPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('横向滚动'),
          titleTextStyle: const TextStyle(color: Colors.black87),
        ),
        body: SizedBox(
          height: 100,
          child: _normalList(),
        ));
  }

  ListView _normalList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      children: _creatItems(),
    );
  }

  List<Widget> _creatItems() {
    List<Widget> items = [];
    for (int i = 0; i <= 20; i++) {
      items.add(Container(
        width: 100,
        height: 100,
        color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), 1),
      ));
    }
    return items;
  }

  ListView _separatorBuilderList() {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: _creatItem,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: 10,
            color: Colors.white,
          );
        },
        itemCount: 20);
  }

  Widget _creatItem(BuildContext context, int index) {
    return Container(
      width: 100,
      height: 100,
      color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256), 1),
    );
  }
}
