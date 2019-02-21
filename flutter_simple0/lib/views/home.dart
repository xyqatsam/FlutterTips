import 'package:flutter/material.dart';

import 'package:flutter_simple0/widgets/bottom_nav.dart';
import 'package:flutter_simple0/widgets/page_view.dart';
import 'package:flutter_simple0/views/web.dart';
import 'package:flutter_simple0/views/video.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
   final String title;
  @override
  State<StatefulWidget> createState() {
    
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  List<NavModel> _items;
  List<Widget> _pages;
  var _pageController =PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    _buildNav();
  }

  _buildNav() {
    _items = [
      NavModel(
        title: "webview",
        icon: Icons.home
      ),
      NavModel(
        title: "video",
        icon: Icons.edit
      ),
    ];

    _pages = [
      WebPage(),
      VideoPage(),
      Text('thirdPage')
    ];
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageViewWapper(
      
        pageController: _pageController,
        pages: _pages,
        onPageChanged: (int index) {
          debugPrint('index-> $index');
        },
        ),
      bottomNavigationBar:BottomNavBarWidget(
        items: _items,
        fixedColor: Colors.pink,
        onTap: (int index){
          debugPrint('abc $index');
          _pageController.animateToPage(
            index,
            duration: Duration(seconds: 2),
            curve: ElasticOutCurve(0.8)
            );
        },
        )
    );
  }
}