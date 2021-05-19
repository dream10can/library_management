import 'package:library_management/RegesterData/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authentication = Provider<AuthenTication>((ref) {
  return AuthenTication();
});
