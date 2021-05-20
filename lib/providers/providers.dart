import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_management/RegisterData/authentication.dart';
import 'package:library_management/animation/animation.dart';

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
