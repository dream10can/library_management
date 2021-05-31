import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_management/models/student.dart';

import 'package:library_management/providers/providers.dart';

import 'package:library_management/screens/add_student_records.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _deviceHeight;

  double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;

    _deviceWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return StudentScreenRecord();
                },
              ),
            );
          },
        ),
        appBar: AppBar(
          title: Text('Library'),
        ),
        body: Container(
          child: Consumer(
            builder: (context, watch, widget) {
              final records = watch(studListData);

              if (records.studList.isNotEmpty) {
                return ListView.builder(
                  itemCount: records.studList.length,
                  itemBuilder: (context, index) {
                    Student stud = Student.fromMap(records.studList[index]);
                    return Card(
                      child: ListTile(
                        title: Text(stud.name),
                        subtitle: Text(stud.age),
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  width: _deviceWidth,
                  height: _deviceHeight * 0.25,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'images/bookimage.png',
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      Text(
                        'No data Found',
                        style: TextStyle(
                            fontSize: 18.0, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
