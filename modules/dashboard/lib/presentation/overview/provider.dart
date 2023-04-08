import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'page_state.dart';

final pageProvider =
    StateNotifierProvider<_PageNotifier, int>((ref) => _PageNotifier(0));

class _PageNotifier extends StateNotifier<int> {
  _PageNotifier(int state) : super(state);

  void setIndex(int index) {
    state = index;
  }

  PageState get currentPage => pages[state];
}

enum CourseTab {
  left,
  right,
}

final coursesTabProvider = StateNotifierProvider<CoursesTabNotifier, CourseTab>(
    (ref) => CoursesTabNotifier());

class CoursesTabNotifier extends StateNotifier<CourseTab> {
  CoursesTabNotifier(): super(CourseTab.left);

  void setLeft() {
    state = CourseTab.left;
  }

  void setRight() {
    state = CourseTab.right;
  }
  
}