import 'package:courses/courses.dart';
import 'package:go_router/go_router.dart';

import '../transition.dart';

const _primaryName = 'Courses';

final _coursesRoutes = [
  goRoute(
    path: CoursesRoutes.overviewHomepath(),
    builder: (context, state) => const BatchOverviewHomePage()),
  

];

class CoursesRoutes {
  const CoursesRoutes._();
  static List<GoRoute> get routes => _coursesRoutes;
 static String overviewHomepath()=>  '/$_primaryName/${BatchOverviewHomePage.pageName}';
}