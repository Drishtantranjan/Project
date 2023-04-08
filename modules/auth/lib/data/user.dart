import 'package:shared/shared.dart';

class User {
  final String id;
  final String userName;
  final String? photoUrl;
  final String role;
  final String name;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.role,
    required this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      userName: json['userName'],
      role: json['role'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': 'authenticated',
      'id': id,
      'name': name,
      'userName': userName,
      'role': role,
      'photoUrl': photoUrl,
    };
  }
}

class UserConvertor extends MapBoxConvertor<User> {
  @override
  User? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }
    return User.fromJson(map);
  }

  @override
  Map<String, dynamic>? toMap(User? value) {
    return value?.toJson();
  }
}
