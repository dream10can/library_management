import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_management/RegisterData/authentication.dart';
import 'package:library_management/animation/animation.dart';
import 'package:library_management/database/sql_lite_library.dart';

final authentication = Provider<AuthenTication>(
  (ref) {
    return AuthenTication();
  },
);

final buttonLoginAnimation = ChangeNotifierProvider<AnimationPysicalContainer>(
  (ref) {
    return AnimationPysicalContainer();
  },
);

final addRecords = Provider<DpStudent>((ref) {
  return DpStudent();
});

final studListData = ChangeNotifierProvider<DpStudent>(
  (ref) {
    return DpStudent();
  },
);
