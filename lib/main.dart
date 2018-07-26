import 'package:flutter/material.dart';
import 'package:flutter_gank/ui/girl_list_page.dart';
import 'package:flutter_gank/ui/info_list_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  var _tabTitleList = ["ALL", "ANDROID", "IOS", "福利"];
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitleList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: setupTabs(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: setupPages(_tabTitleList),
        controller: _tabController,
      ),
      drawer: Drawer(
        child: setupDrawer(),
      ),
    );
  }

  setupTabs() {
    return _tabTitleList
        .map((title) => Tab(
              text: title,
            ))
        .toList();
  }

  setupPages(List<String> tabTitleList) {
    return tabTitleList.map((title) {
      if (title == "福利") {
        return GirlListPage(title);
      } else {
        return InfoListPage(title);
      }
    }).toList();
  }

  setupDrawer() {
    var textStyle = TextStyle(color: Colors.black, fontSize: 15.0);

    return Column(
      children: <Widget>[
        DrawerHeader(
          child: Icon(
            Icons.person,
            size: 50.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.perm_contact_calendar,
                size: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "ReadMe",
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.library_books,
                size: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "更多项目",
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
