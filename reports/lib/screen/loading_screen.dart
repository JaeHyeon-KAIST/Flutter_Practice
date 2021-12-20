import 'package:flutter/material.dart';
import 'package:reports/main.dart';

class LoadingScreen extends StatefulWidget {
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Expanded(flex: 1, child: SizedBox()),
                Expanded(child: Image.asset('assets/loading1.png')),
              ],
            ),
            SizedBox(
              child: ElevatedButton(
                child: Text("next"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Starting()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
