class AuthenTication {
  String user = '';

  String password = '';

  String register(String name, String passwordData) {
    user = name;
    password = passwordData;

    return 'Register successfuly';
  }
}
