import 'package:auth/domain/validate_field_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:routes/routes.dart';

class AuthDIInjector extends DIInjector {
  final _getIt = GetIt.instance;
  @override
  void inject() {
    _getIt.registerLazySingleton<ValidateFieldUseCase>(() => ValidateFieldUseCase());
  }
}
