import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({
    Key key,
    @required this.items,
    this.fixedColor,
    this.iconSize = 14,
    this.onTap,
    this.currentIndex = 0
    }):super(key: key);

    final List<NavModel> items;
    final Color fixedColor;
    final double iconSize;
    final ValueChanged<int> onTap;
    final currentIndex;
  @override
  State<StatefulWidget> createState() {
   
    return BottomNavBarWidgetStatus();
  }
}


class BottomNavBarWidgetStatus extends State<BottomNavBarWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      fixedColor: widget.fixedColor,
      onTap: (int index){
        setState(() {
         _currentIndex =index; 
         debugPrint('current onTapIndex: $index');
         if (widget.onTap !=null) {
           widget.onTap(index);
         }
         
        });
      },
      iconSize: widget.iconSize,
      items: _buildBottomNavItem(widget.items),
    );
  }

 

  List<BottomNavigationBarItem> _buildBottomNavItem(List<NavModel> items) {
    return items.map((item)=> BottomNavigationBarItem(
    title: Text(item.title),
    icon: Icon(item.icon),
    activeIcon: Icon(item.activeIcon ?? item.icon),
    backgroundColor: item.backgroundColor
    )).toList();
  }
}

class NavModel {
  const NavModel({
    @required this.title,
    @required this.icon,
    this.activeIcon,
    this.backgroundColor =Colors.white
  }) ;

  final String title;
  final IconData icon;
  final IconData activeIcon;
  final Color backgroundColor;
}