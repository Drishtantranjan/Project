import 'package:docs/docs.dart';
import 'package:go_router/go_router.dart';

import '../transition.dart';

const _primaryName = 'docs';

final _docsRoutes = [
  goRoute(
    path: DocsRoutes.privacyPolicyPath(),
    builder: (context, state) => const PrivacyPolicyPage(),
  ),
  goRoute(
    path: DocsRoutes.termsAndConditionsPath(),
    builder: (context, state) => const TermsAndConditionsPage(),
  ),
];

class DocsRoutes {
  static List<GoRoute> get routes => _docsRoutes;
  static String privacyPolicyPath() =>
      '/$_primaryName/${PrivacyPolicyPage.pageName}';
  static String termsAndConditionsPath() =>
      '/$_primaryName/${TermsAndConditionsPage.pageName}';
}
