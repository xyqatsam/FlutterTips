import 'package:flutter/material.dart';

 class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  List<String> _items;
  void buildItems() {
    _items = [
      'A','B','C','D','E','F','G'
    ];
  }
  @override
  void initState() {
    super.initState();
    buildItems();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context,index) {
              return ListTile(title: Text('${_items[index]}'));
            },
            padding: EdgeInsets.all(15.0),
      ),  
    );
  }
}