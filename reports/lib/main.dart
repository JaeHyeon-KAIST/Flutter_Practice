import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reports/screen/My_screen.dart';
import 'package:reports/screen/home_main_screen.dart';
import 'package:reports/screen/loading_screen.dart';
import 'package:reports/screen/location_screen.dart';
import 'package:reports/screen/market_screen.dart';
import 'package:reports/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}

class Starting extends StatefulWidget {
  _Starting createState() => _Starting();
}

class _Starting extends State<Starting> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reports',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        accentColor: Colors.red,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              HomeMainScreen(),
              LocationScreen(),
              MarketScreen(),
              MyScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
