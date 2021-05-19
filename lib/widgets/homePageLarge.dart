import 'package:flutter/material.dart';
import 'package:library_management/widgets/custom_Clipper_image.dart';

class HomePageLarge extends StatefulWidget {
  @override
  _HomePageLargeState createState() => _HomePageLargeState();
}

class _HomePageLargeState extends State<HomePageLarge> {
  double _deviceHeight;

  double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;

    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ClipPath(
        clipper: CustomClipperImage(),
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          child: Column(
            children: [
              _logo(),
              _loginButton(),
              _registerButton(),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(top: 80),
      width: _deviceWidth,
      height: _deviceHeight * 0.40,
      decoration: BoxDecoration(),
      child: ClipOval(
        child: Image.asset('images/book_page.png'),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      width: 400.0,
      height: 40.0,
      decoration: BoxDecoration(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          elevation: 10.0,
          primary: Colors.white,
          onPrimary: Colors.blueAccent,
          onSurface: Colors.grey,
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      width: 400.0,
      height: 40.0,
      decoration: BoxDecoration(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          elevation: 10.0,
          primary: Colors.white,
          onPrimary: Colors.blueAccent,
          onSurface: Colors.grey,
        ),
        child: Text(
          'Register',
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () {},
      ),
    );
  }
}
