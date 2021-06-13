import 'package:flutter/cupertino.dart';
import 'package:library_management/models/student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DpStudent extends ChangeNotifier {
  List studList = [];

  static Database _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'library.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int v) {
        //create all tables
        // When creating the db, create the table
        db.execute(
            "create table library(id integer primary key autoincrement, name varchar(50) , age varchar(50) , idNum varchar(50), phoneNum varchar(50) , bookName varchar(50) , author varchar(50) , category varchar (50), isbn varchar(50) , dateBorrow varchar(50) , dateEnd varchar(50) , description varchar(200))");
      },
    );

    return _db;
  }

  Future<int> createLibrary(Student student) async {
    //return the same object this is singleton
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    //This method helps insert a map of [values] into the specified [table] and returns the id of the last inserted row.
    return db.insert('library', student.toMap());
  }

  Future<void> allCourses() async {
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    final data = await db.query('library');

    studList = data;

    notifyListeners();
  }

//will give back the row number that delete it

  Future<int> deleteCourse(int id) async {
    Database db = await createDatabase();

    return db.delete('library', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateCourse(Student course) async {
    Database db = await createDatabase();

    return await db.update(
      'library',
      course.toMap(),
      where: 'id = ?',
      whereArgs: [course.id],
    );
  }
}
