import 'package:flutter/material.dart';
import 'package:library_management/responsive_utill.dart';
import 'package:library_management/widgets/homePageLarge.dart';
import 'package:library_management/widgets/home_page_medium.dart';
import 'check_user_seen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget widget;

    switch (getScreenSize(MediaQuery.of(context).size.width)) {
      case ScreenSize.small:
        widget = CheckUserIntro();
        break;
      case ScreenSize.medium:
        widget = HomePageMedium();
        break;
      case ScreenSize.large:
        widget = HomePageLarge();
        break;
    }

    return widget;
  }
}
