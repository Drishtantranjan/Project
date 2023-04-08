import 'package:auth/domain/validate_field_use_case.dart';
import 'package:shared/viewmodel_provider.dart';

class SetPasswordViewModel extends ViewModel {
  SetPasswordViewModel(this._validateFieldUseCase);

  final ValidateFieldUseCase _validateFieldUseCase;

  String? validatePassword(String value) {
    return _validateFieldUseCase.validatePassword(value);
  }

  String? validateConfirmPassword(String value, String password) {
    return _validateFieldUseCase.validateConfirmPassword(value, password);
  }
}