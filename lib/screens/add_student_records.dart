import 'package:flutter/material.dart';
import 'package:library_management/database/sql_lite_library.dart';
import 'package:library_management/models/student.dart';
import 'package:library_management/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_management/widgets/textFormFieldDesign.dart';

final recordsList = FutureProvider.autoDispose<List>((ref) {
  return DpStudent().allCourses();
});

class StudentScreenRecord extends StatefulWidget {
  @override
  _StudentScreenRecordState createState() => _StudentScreenRecordState();
}

class _StudentScreenRecordState extends State<StudentScreenRecord> {
  final _studentName = TextEditingController();

  final _studentAge = TextEditingController();

  final _idNum = TextEditingController();

  final _phoneNum = TextEditingController();

  final _bookName = TextEditingController();

  final _authorName = TextEditingController();

  final _isbn = TextEditingController();

  final _description = TextEditingController();

  final _formState = GlobalKey<FormState>();

  List<String> options = <String>[
    'Fantasy',
    'Adventure',
    'Romance',
    'Contemporary',
    'Mystery',
    'Horror',
    'Technology',
    'Education'
  ];
  String dropdownValue = 'Technology';

  DateTime _selectedDataBorrow = DateTime.now();

  DateTime _selectedDataEnd = DateTime.now();

  Future<void> _pickedDateBorrow(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDataBorrow,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != _selectedDataBorrow) {
      setState(() {
        _selectedDataBorrow = picked;
      });
    }
  }

  Future<void> _pickedDateEnd(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDataBorrow,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != _selectedDataEnd) {
      setState(() {
        _selectedDataEnd = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Details'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Form(
          key: _formState,
          child: ListView(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _studentName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please Enter information';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      icon: Icon(Icons.info),
                      hintText: 'Student name',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldDesign(
                    infoController: _studentAge,
                    message: 'Enter Age Of Student',
                    inputType: TextInputType.number,
                    hintText: 'Student age',
                    iconDesign: Icons.add_box,
                  ),
                  SizedBox(height: 20.0),
                  TextFormFieldDesign(
                    infoController: _idNum,
                    message: 'Enter Id Number Of Student',
                    inputType: TextInputType.number,
                    hintText: 'ID Num',
                    iconDesign: Icons.perm_identity,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldDesign(
                    infoController: _phoneNum,
                    message: 'Enter Phone Num Of Student',
                    inputType: TextInputType.number,
                    hintText: 'Phone Num',
                    iconDesign: Icons.phone_android,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldDesign(
                    infoController: _bookName,
                    message: 'Enter Book Name',
                    inputType: TextInputType.text,
                    hintText: 'Book Name',
                    iconDesign: Icons.library_books,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldDesign(
                    infoController: _authorName,
                    message: 'Enter Author Name',
                    inputType: TextInputType.text,
                    hintText: 'Autor Name',
                    iconDesign: Icons.person,
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  DropdownButton<String>(
                    hint: Text(
                      'Categeory of Book',
                      style: TextStyle(color: Colors.black),
                    ),
                    isDense: true,
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15.0,
                    ),
                    selectedItemBuilder: (BuildContext context) {
                      return options.map((String value) {
                        return Text(
                          dropdownValue,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        );
                      }).toList();
                    },
                    items:
                        options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormFieldDesign(
                    infoController: _isbn,
                    message: 'Enter ISBN Code',
                    inputType: TextInputType.number,
                    hintText: 'ISBN Name',
                    iconDesign: Icons.person,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("${_selectedDataBorrow.toLocal()}".split(' ')[0]),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                    onPressed: () => _pickedDateBorrow(context),
                    child: Text('Date Of Borrow'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("${_selectedDataEnd.toLocal()}".split(' ')[0]),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                    onPressed: () => _pickedDateEnd(context),
                    child: Text('Date Of End'),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter the Description';
                      }

                      return null;
                    },
                    controller: _description,
                    minLines: 3,
                    maxLines: null,
                    decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: 'Description',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      elevation: 4.0,
                      onSurface: Colors.grey,
                    ),
                    child: Text(
                      'Add Records',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      if (_formState.currentState.validate()) {
                        final name = _studentName.text;

                        final age = _studentAge.text;

                        final idNum = _idNum.text;

                        final phoneNum = _phoneNum.text;

                        final bookName = _bookName.text;

                        final authorName = _authorName.text;

                        final isbn = _isbn.text;

                        final description = _description.text;

                        Student stud = Student({
                          'name': name,
                          'age': age,
                          'idNum': idNum,
                          'phoneNum': phoneNum,
                          'bookName': bookName,
                          'author': authorName,
                          'category': dropdownValue,
                          'isbn': isbn,
                          'dateBorrow': _selectedDataBorrow.toString(),
                          'dateEnd': _selectedDataEnd.toString(),
                          'description': description,
                        });

                        print(stud.name);

                        print(stud.age);

                        print(
                            'info , $idNum , $phoneNum , $bookName , $authorName  , $dropdownValue , $isbn , ${_selectedDataBorrow.toString()} , ${_selectedDataEnd.toString()}, $description');

                        print(stud.toString());

                        final add = context.read(addRecords);
                        add.createLibrary(stud);

                        final stuSuccessfulyAdded = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Student Added'),
                        );

                        ScaffoldMessenger.of(context)
                            .showSnackBar(stuSuccessfulyAdded);

                        final getStudList = context.read(studListData);

                        getStudList.allCourses();

                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
