import 'package:auth/presentation/role_state.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:shared/shared.dart';

abstract class AuthData extends Equatable {
  @override
  bool get stringify => true;

  AuthData copyWith();
}

abstract class LoginData extends AuthData {
  final String password;
  final Role role;

  LoginData({
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [password, role];
}

class StudentLoginData extends LoginData {
  final String phone;
  final Country country;

  StudentLoginData({
    required this.phone,
    required this.country,
    required String password,
  }) : super(password: password, role: Role.student);

  @override
  StudentLoginData copyWith({
    String? phone,
    Country? country,
    String? password,
  }) {
    return StudentLoginData(
      phone: phone ?? this.phone,
      country: country ?? this.country,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [phone, country, password, role];
}

class TeacherLoginData extends LoginData {
  final String userId;

  TeacherLoginData({
    required this.userId,
    required String password,
  }) : super(password: password, role: Role.teacher);

  @override
  TeacherLoginData copyWith({
    String? userId,
    String? password,
  }) {
    return TeacherLoginData(
      userId: userId ?? this.userId,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [userId, password, role];
}

class AdminLoginData extends LoginData {
  final String userId;

  AdminLoginData({
    required this.userId,
    required String password,
  }) : super(password: password, role: Role.admin);

  @override
  AdminLoginData copyWith({
    String? userId,
    String? password,
  }) {
    return AdminLoginData(
      userId: userId ?? this.userId,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [userId, password, role];
}

class ForgotPasswordData extends AuthData {
  final String phone;
  final Country country;
  final String password;

  ForgotPasswordData({
    required this.phone,
    required this.country,
    this.password = "",
  });

  @override
  ForgotPasswordData copyWith({
    String? phone,
    Country? country,
    String? password,
  }) {
    return ForgotPasswordData(
      phone: phone ?? this.phone,
      country: country ?? this.country,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [phone, country, password];
}

class RegisterData extends AuthData {
  final String name;
  final String phone;
  final Country country;
  final String password;

  RegisterData({
    required this.name,
    required this.phone,
    required this.country,
    required this.password,
  });

  @override
  RegisterData copyWith({
    String? name,
    String? phone,
    Country? country,
    String? password,
  }) {
    return RegisterData(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [name, phone, country, password];
}

final authDataProvider = StateNotifierProvider<_AuthDataNotifier, AuthData?>(
    (ref) => _AuthDataNotifier());

class _AuthDataNotifier extends StateNotifier<AuthData?> {
  _AuthDataNotifier() : super(null);

  static Logger logger = Logger("AuthDataNotifier");

  void setLoginData(LoginData data) {
    state = data;
  }

  void setForgotPasswordData(ForgotPasswordData data) {
    state = data;
  }

  void setRegisterData(RegisterData data) {
    state = data;
  }

  void clear() {
    logger.fine("Auth data: $state");
    logger.fine("Clearing auth data");
    state = null;
  }
}
