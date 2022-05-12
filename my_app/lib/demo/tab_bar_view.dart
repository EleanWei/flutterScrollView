import 'package:flutter/material.dart';
import 'package:my_app/demo/page_view.dart';
import 'dart:math';

// 1. TabBar 导航标题，设置为AppBar的Bottom, 配置 indicator 和 label
// 2. TabBarView 分页组件，是对PageView的封装，通常与TabBar联动
// 3. TabController 控制和监听组件的状态

class KeepAliveContentPage extends StatefulWidget {
  const KeepAliveContentPage({Key? key}) : super(key: key);

  @override
  _KeepAliveContentState createState() => _KeepAliveContentState();
}

class _KeepAliveContentState extends State<KeepAliveContentPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256), 1),
    );
  }
}

class TabBarViewPage extends StatefulWidget {
  const TabBarViewPage({Key? key}) : super(key: key);

  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> _pages = [];
  final List<String> _tabBarTitles = [];
  late TabController _tabController;

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      _pages.add(const KeepAliveContentPage());
      // _pages.add(const ContentTestPage());
      _tabBarTitles.add('page$i');
    }
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() {
      final currentIndex = _tabController.index;
      debugPrint('$currentIndex');
      if (currentIndex == _pages.length - 1) {
        _tabController.animateTo(0);
      }
    });
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组合分页视图'),
        titleTextStyle: const TextStyle(color: Colors.black87),
        bottom: _creatTabBar(),
      ),
      body: _creatTabBarView(),
    );
  }

  TabBar _creatTabBar() {
    return TabBar(
        controller: _tabController,
        tabs: _tabBarTitles.map((e) => Tab(text: e)).toList());
  }

  TabBarView _creatTabBarView() {
    return TabBarView(controller: _tabController, children: _pages);
  }
}
