class Student {
  int id;

  String name;

  String age;

  String idNum;

  String phoneNum,
      bookName,
      author,
      category,
      isbn,
      dateBorrow,
      dateEnd,
      description;

  Student(Map<String, dynamic> obj) {
    id = obj['id'];

    name = obj['name'];

    age = obj['age'];

    idNum = obj['idNum'];

    phoneNum = obj['phoneNum'];

    bookName = obj['bookName'];

    author = obj['author'];

    category = obj['category'];

    isbn = obj['isbn'];

    dateBorrow = obj['dateBorrow'];

    dateEnd = obj['dateEnd'];

    description = obj['description'];
  }

  // this come from database and we conver it to dart obj
  Student.fromMap(Map<String, dynamic> map) {
    id = map['id'];

    name = map['name'];

    age = map['age'];

    idNum = map['idNum'];

    phoneNum = map['phoneNum'];

    bookName = map['bookName'];

    author = map['author'];

    category = map['category'];

    isbn = map['isbn'];

    dateBorrow = map['dateBorrow'];

    dateEnd = map['dateEnd'];

    description = map['description'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'idNum': idNum,
      'phoneNum': phoneNum,
      'bookName': bookName,
      'author': author,
      'category': category,
      'isbn': isbn,
      'dateBorrow': dateBorrow,
      'dateEnd': dateEnd,
      'description': description,
    };

    return map;
  }
}
