import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

TabController useCoursesTab(WidgetRef ref) {
  final coursesTab = ref.watch(coursesTabProvider);
  final tabController = useTabController(initialLength: 2, initialIndex: coursesTab.index);
  useEffect(() {
      listener() {
        if (tabController.index == 0) {
          ref.read(coursesTabProvider.notifier).setLeft();
        } else {
          ref.read(coursesTabProvider.notifier).setRight();
        }
      }

      tabController.addListener(listener);
      return () {
        tabController.removeListener(listener);
      };
    }, [tabController]);
    return tabController;
}