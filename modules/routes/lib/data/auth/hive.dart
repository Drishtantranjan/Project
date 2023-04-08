import 'package:auth/data/user.dart';
import 'package:hive/hive.dart';
import 'package:shared/hive/box_holder.dart';
import 'package:shared/hive/box_operations.dart';
import 'package:shared/shared.dart';

class UserRole {
  static const String admin = "admin";
  static const String student = "student";
  static const String teacher = "teacher";
}

class AuthBox {
  static const String boxName = 'auth';
  const AuthBox._();

  static BoxOperations<User> useUser() {
    final boxHolder = useMemoized(() => BoxHolderValue(Hive.box(boxName)));
    return useBox<User>(
      boxHolder,
      'user',
      defaultValue: null,
      convertor: UserConvertor(),
    );
  }
}
