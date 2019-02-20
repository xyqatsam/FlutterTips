import 'package:flutter/material.dart';

class BottomNavnWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavWidgetSate();
}

class _BottomNavWidgetSate extends State<BottomNavnWidget>   {
  int _mCurrentIndex = 0;
  final _defultColor = Colors.blue;
  List<NavModel> _navItems;
  
  initNavItems() {
    _navItems = [
      NavModel(icon: Icons.home,color: _defultColor,name: '首页'),
      NavModel(icon: Icons.email,color: _defultColor,name: '邮件'),
      NavModel(icon: Icons.event,color: _defultColor,name: '事件'),
      NavModel(icon: Icons.edit,color: _defultColor,name: '设置'),
    ];
  }

  @override
  void initState() {
    super.initState();
    initNavItems();
  }

  @override
  Widget build(BuildContext context) {
   
    return BottomNavigationBar(
      fixedColor: Colors.pink,
      
      type: BottomNavigationBarType.fixed,
      // items: buildBottomNavigationBarItem(_navItems).toList(),
      items: buildBottomNavigationBarItem(_navItems).toList(),
      currentIndex: _mCurrentIndex,
      onTap: (int index) {
          setState(() {
            _mCurrentIndex = index;
           
          });
        },
    );
  }


  List<BottomNavigationBarItem> buildBottomNavigationBarItem(List<NavModel> items) {
    return items.map((item) => BottomNavigationBarItem(
      activeIcon: Icon(item.icon,color: Colors.pink),
      icon: Icon(
        item.icon,
        color:item.color
      ),
      title: Text(item.name)
    )).toList();
  }
}

class NavModel {
  NavModel({
    Key key,
    @required this.icon,
    @required this.color,
    @required this.name,
  });
  IconData icon;
  Color color;
  String name;
}