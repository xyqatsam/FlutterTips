import 'package:flutter/material.dart';
import 'views/home/home.dart';
import 'views/main/bottom_nav.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'simple',
      home: Index(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70
      ),
    );
  }
}

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: _buildAppBar(),
        body: TabBarView(
          children: <Widget>[
            // Icon(Icons.ac_unit),
            HomePage(),
            Icon(Icons.access_alarm),
            Icon(Icons.bluetooth),
          ],
        ),
        bottomNavigationBar: BottomNavnWidget(),
      ),
    );
  }

  Widget _buildAppBar() => AppBar(
          title: Text('zy'),
          elevation: 5.0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'navigation menu',
            onPressed: () => debugPrint('menu pressed') ,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
               tooltip: 'search menu',
            onPressed: () => debugPrint('search pressed') ,
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.pinkAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.send)),
              Tab(icon: Icon(Icons.label)),
              Tab(icon: Icon(Icons.ac_unit))
            ],
          ),
        );
}



void main() => runApp(MyApp());


