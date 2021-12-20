import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Image.asset('assets/home_main8.png'),
            ),
            Tab(
              icon: Image.asset('assets/home_main9.png'),
            ),
            Tab(
              icon: Image.asset('assets/home_main10.png'),
            ),
            Tab(
              icon: Image.asset('assets/home_main11.png'),
            ),
          ],
        ),
      ),
    );
  }
}
