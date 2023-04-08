import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../role_state.dart';

final roleProvider = StateNotifierProvider<_RoleNotifier, Role>(
    (ref) => _RoleNotifier(Role.student));

class _RoleNotifier extends StateNotifier<Role> {
  _RoleNotifier(Role state) : super(state);

  void switchRole() {
    state = state == Role.student ? Role.teacher : Role.student;
  }

  void setTeacherRole() {
    state = Role.teacher;
  }

  void setStudentRole() {
    state = Role.student;
  }
}
