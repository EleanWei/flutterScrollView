import 'package:flutter/material.dart';
import 'dart:math';

// 1. GridView 网格式布局组件
// 2. SliverGridDelegate 布局自定义代理
//    2.1 SliverGridDelegateWithFixedCrossAxisCount 固定个数 cell自适应等宽
//    2.2 SliverGridDelegateWithMaxCrossAxisExtent 设置最大宽度 cell自适应等宽
//        先尝试用最大宽度去填满视图的宽，需要N个（可能最后一个会展示不签），确定一行展示N个cell，
//        然后N个cell再均等宽度得到最终实际款呢

class GridListViewPage extends StatefulWidget {
  const GridListViewPage({Key? key}) : super(key: key);

  @override
  _GridListViewState createState() => _GridListViewState();
}

class _GridListViewState extends State<GridListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网格列表'),
        titleTextStyle: const TextStyle(color: Colors.black87),
      ),
      body: _creatListOfDelegetor(),
    );
  }

  Widget _creatList() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: _creatItems(),
    );
  }

  List<Widget> _creatItems() {
    List<Widget> items = [];
    for (int i = 0; i < 66; i++) {
      items.add(_creatItem());
    }
    return items;
  }

  Widget _creatItem() {
    final itemWH = (MediaQuery.of(context).size.width - 20) / 3.0;
    return Container(
      width: itemWH,
      height: itemWH,
      color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256), 1),
    );
  }

  Widget _creatListOfDelegetor() {
    List<Widget> items = [];
    for (int i = 0; i < 66; i++) {
      items.add(Container(
        color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), 1),
      ));
    }
    return _creatListOfMaxCrossAxisExtent(items);
  }

  Widget _creatListOfFixedCrossAxisCount(List<Widget> items) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.5,
      ),
      children: items,
    );
  }

  Widget _creatListOfMaxCrossAxisExtent(List<Widget> items) {
    double maxCrossAxisExtent = MediaQuery.of(context).size.width - 150;
    // 只要设置的最大宽度再  screen_w <= maxCrossAxisExtent < screen_w 实际一行都会展示2个cell
    // 原因是在这个区间的宽度 如果cell的宽度是maxCrossAxisExtent 填满屏幕需要2个cell，所以得出一行需要2个cell
    // 确定了个数 再均等宽度，那么每个cell就是 1/2 屏幕宽 （如果设置了间距，还需要减去间距再均等）

    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150, childAspectRatio: 1),
      children: items,
    );
  }
}
