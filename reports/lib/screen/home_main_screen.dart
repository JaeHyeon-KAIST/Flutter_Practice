import 'package:flutter/material.dart';
import 'package:reports/screen/home_arround_screen.dart';

class HomeMainScreen extends StatefulWidget {
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeArroundScreen()));
                },
                child: Image.asset('assets/home_main1.png'),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Expanded(child: Image.asset('assets/home_main1.png')),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.asset('assets/home_main2.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Image.asset('assets/home_main3.png')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Image.asset('assets/home_main4.png')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Image.asset('assets/home_main5.png')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Image.asset('assets/home_main6.png')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Image.asset('assets/home_main7.png')),
                ],
              ),
              Container(
                width: double.infinity,
                height: 5.8,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
