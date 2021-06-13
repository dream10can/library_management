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
  void initState() {
    super.initState();

    final checkStudDp = context.read(studListData);

    checkStudDp.allCourses();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;

    _deviceWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      elevation: 4.0,
                      child: Column(
                        children: [
                          ListTile(
                            trailing: FittedBox(
                              fit: BoxFit.fill,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print('pressed');
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 30.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('pressed');
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      size: 30.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: Icon(
                              Icons.info_outline_rounded,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Name: ${stud.name}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              'IDNum: ${stud.idNum}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(color: Colors.white),
                                        children: [
                                          textSpanDesign('Age', FontWeight.w900,
                                              Colors.white),
                                          textSpanNormal(
                                              stud.age, Colors.grey[200]),
                                          textSpanDesign('Phone Num',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(
                                              stud.phoneNum, Colors.grey[200]),
                                          textSpanDesign('BookName',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(
                                              stud.bookName, Colors.grey[200]),
                                          textSpanDesign('Author',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(
                                              stud.author, Colors.grey[200]),
                                          textSpanDesign('Category',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(
                                              stud.category, Colors.grey[200]),
                                          textSpanDesign('ISBN',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(
                                              stud.isbn, Colors.grey[200]),
                                          textSpanDesign('Date of borrow',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(
                                              stud.dateBorrow.split(' ')[0],
                                              Colors.grey[200]),
                                          textSpanDesign('Date of end',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(
                                              stud.dateEnd.split(' ')[0],
                                              Colors.grey[200]),
                                          textSpanDesign('Description',
                                              FontWeight.w900, Colors.white),
                                          textSpanNormal(stud.description,
                                              Colors.grey[200]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Container(
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
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  TextSpan textSpanNormal(String textData, Color color) {
    return TextSpan(
      text: '$textData\n',
      style: TextStyle(
        color: color,
      ),
    );
  }

  TextSpan textSpanDesign(String textData, FontWeight fontWeight, Color color) {
    return TextSpan(
      text: '$textData: ',
      style: TextStyle(fontWeight: fontWeight, color: color),
    );
  }
}
