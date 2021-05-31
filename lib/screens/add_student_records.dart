import 'package:flutter/material.dart';
import 'package:library_management/database/sql_lite_library.dart';
import 'package:library_management/models/student.dart';
import 'package:library_management/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recordsList = FutureProvider.autoDispose<List>((ref) {
  return DpStudent().allCourses();
});

class StudentScreenRecord extends StatelessWidget {
  final _studentName = TextEditingController();

  final _studentAge = TextEditingController();

  final _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Details'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Form(
          key: _formState,
          child: Column(
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
              TextFormField(
                controller: _studentAge,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Age Of Student';
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  icon: Icon(Icons.add_box),
                  hintText: 'Student age',
                ),
              ),
              SizedBox(height: 20.0),
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

                    Student stud = Student({'name': name, 'age': age});

                    print(stud.name);

                    print(stud.age);

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
        ),
      ),
    );
  }
}
