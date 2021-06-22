import 'dart:async';

import 'package:flutter/material.dart';
import 'package:library_management/screens/home_page_small.dart';
import 'package:library_management/screens/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckUserIntro extends StatefulWidget {
  @override
  _CheckUserIntroState createState() => _CheckUserIntroState();
}

class _CheckUserIntroState extends State<CheckUserIntro> {
  Future _checkUserSeen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool _seen = (pref.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePageSmall()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        _checkUserSeen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Library Management System',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
              Image.asset('images/book_page.png'),
              Text(
                'Developed By Dream10CanDev With ❤',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
