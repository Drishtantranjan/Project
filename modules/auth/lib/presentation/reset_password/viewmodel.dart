import 'package:auth/domain/validate_field_use_case.dart';
import 'package:shared/viewmodel_provider.dart';

class ResetPasswordViewModel extends ViewModel {
  final ValidateFieldUseCase _validateFieldUseCase;

  ResetPasswordViewModel(this._validateFieldUseCase);

  String? validatePassword(String value) {
    return _validateFieldUseCase.validatePassword(value);
  }

  String? validateConfirmPassword(String value, String password) {
    return _validateFieldUseCase.validateConfirmPassword(value, password);
  }
}