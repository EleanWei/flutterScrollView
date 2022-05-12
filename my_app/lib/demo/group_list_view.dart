import 'package:flutter/material.dart';

// 分组的实现 是基于ListView滚动视图实现
// 将一个Section： headerView + cells 组装成一个完成的item返回

class GroupListItem {
  String sectionTitle = '';
  List<String> itemTitles = [];
}

class GroupListViewPage extends StatefulWidget {
  const GroupListViewPage({Key? key}) : super(key: key);

  @override
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListViewPage> {
  final List<GroupListItem> _groupItems = [];
  final controller = ScrollController();

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      GroupListItem item = GroupListItem();
      item.sectionTitle = '第$i个分组';
      item.itemTitles = ['第一个', '第二个'];
      _groupItems.add(item);
    }

    // controller.addListener(() {
    //   debugPrint('${controller.offset}');
    // });

    // controller.animateTo(0, duration: duration, curve: curve)

    super.initState();
  }

  @override
  void dispose() {
    // !!!! controller一定要记得释放
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分组列表'),
        titleTextStyle: const TextStyle(color: Colors.black87),
      ),
      body: _creatList(),
    );
  }

  Widget _creatList() {
    return ListView.builder(
        controller: controller,
        shrinkWrap: true,
        itemBuilder: _creatSectionItem,
        itemCount: _groupItems.length);
  }

  Widget _creatSectionItem(BuildContext context, int index) {
    if (index >= _groupItems.length) {
      return Container();
    }
    GroupListItem item = _groupItems[index];
    List<Widget> views = [];
    // section header
    views.add(_creatSectionHeader(item));

    // cell
    views.addAll(_creatCells(item));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: views,
    );
  }

  Widget _creatSectionHeader(GroupListItem item) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 75),
      child: Text(
        item.sectionTitle,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
    );
  }

  List<Widget> _creatCells(GroupListItem item) {
    List<Widget> cells = [];
    for (int i = 0; i < item.itemTitles.length; i++) {
      cells.add(
        ListTile(
          title: Text(item.itemTitles[i]),
        ),
      );
    }
    return cells;
  }
}
