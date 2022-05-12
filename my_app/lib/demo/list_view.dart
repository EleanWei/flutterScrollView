import 'package:flutter/material.dart';
import 'package:my_app/demo/horizontal_list_view.dart';
import 'package:my_app/demo/grid_list_view.dart';
import 'package:my_app/demo/group_list_view.dart';
import 'package:my_app/demo/page_view.dart';
import 'package:my_app/demo/tab_bar_view.dart';

// ListView ScrollView =》 BoxScrollView =》 ListView
// GridView ScrollView =》 BoxScrollView =》 GridView
// PageView 对ScrollView封装
// TabBarView 对PageView的封装

class ListViewDemoHomePage extends StatefulWidget {
  const ListViewDemoHomePage({Key? key}) : super(key: key);

  @override
  _ListViewDemoHomeState createState() => _ListViewDemoHomeState();
}

class _ListViewDemoHomeState extends State<ListViewDemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple),
        home: const ListViewHomePage());
  }
}

class ListViewHomePage extends StatefulWidget {
  const ListViewHomePage({Key? key}) : super(key: key);

  @override
  _ListViewHomePageState createState() => _ListViewHomePageState();
}

class _ListViewHomePageState extends State<ListViewHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 滚动组件'),
        titleTextStyle: const TextStyle(color: Colors.black87),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Text('1'),
            title: const Text('分组列表'),
            onTap: _groupListView,
          ),
          ListTile(
            leading: const Text('2'),
            title: const Text('横向列表'),
            onTap: _horizontalListView,
          ),
          ListTile(
            leading: const Text('3'),
            title: const Text('网格列表'),
            onTap: _gridListView,
          ),
          ListTile(
            leading: const Text('4'),
            title: const Text('分页'),
            onTap: _pageView,
          ),
          ListTile(
            leading: const Text('5'),
            title: const Text('标签栏分页'),
            onTap: _tabBarView,
          ),
        ],
      ),
    ));
  }

  void _groupListView() {
    _pushPage(const GroupListViewPage());
  }

  void _horizontalListView() {
    _pushPage(const HorizontalListViewPage());
  }

  void _gridListView() {
    _pushPage(const GridListViewPage());
  }

  void _pageView() {
    _pushPage(const PageViewPage());
  }

  void _tabBarView() {
    _pushPage(const TabBarViewPage());
  }

  void _pushPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
