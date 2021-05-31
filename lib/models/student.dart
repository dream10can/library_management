class Student {
  int id;

  String name;

  String age;

  Student(Map<String, dynamic> obj) {
    id = obj['id'];

    name = obj['name'];

    age = obj['age'];
  }

  // this come from database and we conver it to dart obj
  Student.fromMap(Map<String, dynamic> map) {
    id = map['id'];

    name = map['name'];

    age = map['age'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
    };

    return map;
  }
}
