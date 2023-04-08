import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

T useViewModel<T extends ViewModel>() {
  final T? viewModel = ViewModelProvider.of<T>(useContext())?.viewModel;
  assert(viewModel != null, 'No ViewModel of type $T found in context');
  return viewModel!;
}

class ViewModelProvider<T extends ViewModel> extends InheritedWidget {
  final T viewModel;
  const ViewModelProvider({
    super.key,
    required super.child,
    required this.viewModel,
  });

  static ViewModelProvider<T>? of<T extends ViewModel>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

abstract class ViewModel {
  ViewModel();
  void dispose() {}
}
