import 'package:flutter/material.dart';
import 'package:reports/screen/center_teacher_screen.dart';

class HomeArroundScreen extends StatefulWidget {
  _HomeArroundScreenState createState() => _HomeArroundScreenState();
}

class _HomeArroundScreenState extends State<HomeArroundScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/home_arround1.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.asset('assets/home_arround2.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CenterTeacherScreen()));
                    },
                    child: Image.asset(
                      'assets/home_arround3.png',
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 25,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
