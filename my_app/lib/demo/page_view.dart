import 'package:flutter/material.dart';
import 'dart:math';

class ContentTestPage extends StatelessWidget {
  const ContentTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256), 1),
    );
  }
}

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final List<ContentTestPage> _pages = [];

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      _pages.add(const ContentTestPage());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分页视图'),
        titleTextStyle: const TextStyle(color: Colors.black87),
      ),
      body: _creatNormalView(),
    );
  }

  Widget _creatNormalView() {
    return PageView.builder(
      itemCount: _pages.length,
      itemBuilder: (context, index) => _pages[index],
    );
  }
}
