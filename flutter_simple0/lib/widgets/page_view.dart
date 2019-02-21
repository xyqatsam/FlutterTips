import 'package:flutter/material.dart';

class PageViewWapper extends StatefulWidget {

  PageViewWapper({
    Key key,
    @required this.pageController,
    @required this.pages,
    this.onPageChanged
    }): super(key:key);

    final PageController pageController;
    final List<Widget> pages;
    final ValueChanged<int> onPageChanged;
  @override
  State<StatefulWidget> createState() => PageViewWapperState();
}

class PageViewWapperState extends State<PageViewWapper> {

  
 
  @override
  Widget build(BuildContext context) {
    
    return PageView.builder(
      controller: widget.pageController,
      
      itemCount: widget.pages.length,
      itemBuilder: (BuildContext context, int index)  {
        return widget.pages[index];
      },
      onPageChanged:widget.onPageChanged,
    );
  }
}