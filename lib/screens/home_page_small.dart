import 'package:flutter/material.dart';
import 'package:library_management/providers/providers.dart';
import 'package:library_management/screens/landing_page.dart';

import 'package:library_management/widgets/custom_Clipper_image.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageSmall extends StatefulWidget {
  @override
  _HomePageSmallState createState() => _HomePageSmallState();
}

class _HomePageSmallState extends State<HomePageSmall> {
  double _deviceHeight;

  double _deviceWidth;

  final _password = TextEditingController();

  final _username = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _loginAction() async {
    final readAnimationbutton = context.read(buttonLoginAnimation);

    readAnimationbutton.animationPysicalWidget();

    if (_formKey.currentState.validate()) {
      final user = context.read(authentication).user;

      final password = context.read(authentication).password;

      if (user == _username.text && password == _password.text) {
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setBool('seen', true);
        final sucessfulLogin = SnackBar(
          content: Text(
            'successfuly Login',
          ),
          backgroundColor: Colors.green,
        );

        ScaffoldMessenger.of(context).showSnackBar(sucessfulLogin);

        _username.clear();
        _password.clear();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return LandingPage();
            },
          ),
        );
      } else {
        _username.clear();
        _password.clear();
        Navigator.of(context).pop();

        final userNotFound = SnackBar(
          content: Text('user not register'),
          backgroundColor: Colors.red,
        );

        ScaffoldMessenger.of(context).showSnackBar(userNotFound);
      }
    }
  }

  void _registerAction() async {
    final readAnimationbutton = context.read(buttonLoginAnimation);

    readAnimationbutton.animationPysicalWidget();
    if (_formKey.currentState.validate()) {
      await Future.delayed(Duration(microseconds: 1000));
      context.read(authentication).register(_username.text, _password.text);

      _username.clear();
      _password.clear();

      final sucessfulyRegister = SnackBar(
        content: Text(
          'successfuly Register',
        ),
        backgroundColor: Colors.green,
      );

      ScaffoldMessenger.of(context).showSnackBar(sucessfulyRegister);

      Navigator.of(context).pop();
    }
  }

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
      height: _deviceHeight * 0.35,
      decoration: BoxDecoration(),
      child: ClipOval(
        child: Image.asset('images/book_page.png'),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      width: _deviceWidth * 0.70,
      height: _deviceHeight * 0.07,
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
        onPressed: () async {
          _editBottomSheetLogin(context, 'Login', _loginAction);
        },
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      width: _deviceWidth * 0.70,
      height: _deviceHeight * 0.06,
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
        onPressed: () {
          _editBottomSheetLogin(context, 'Register', _registerAction);
        },
      ),
    );
  }

  void _editBottomSheetLogin(context, String buttonName, Function action) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 500.0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: _buildBottomsheet(buttonName, action),
          ),
        );
      },
    );
  }

  Padding _buildBottomsheet(String buttonName, action) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some Text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    icon: Icon(
                      Icons.login,
                      size: 20.0,
                    ),
                    hintText: 'Enter Your Name',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.0)),
                    icon: Icon(Icons.remove_red_eye_outlined),
                    hintText: 'Enter Your Password',
                  ),
                ),
              ],
            ),
          ),
          Consumer(
            builder: (context, watch, widget) {
              final animatedbutton = watch(buttonLoginAnimation);

              return AnimatedContainer(
                duration: Duration(seconds: 1),
                margin: EdgeInsets.only(top: 60.0),
                width: 30.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    elevation: 4.0,
                    primary: animatedbutton.isFlat
                        ? Colors.white
                        : Colors.blueAccent,
                    onPrimary: animatedbutton.isFlat
                        ? Colors.blueAccent
                        : Colors.white,
                    onSurface: Colors.grey,
                  ),
                  child: Text(
                    buttonName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: action,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
