import 'package:auth/domain/validate_field_use_case.dart';
import 'package:shared/viewmodel_provider.dart';
import 'package:intl_phone_field/countries.dart';

class RegisterViewModel extends ViewModel {
  final ValidateFieldUseCase _validateFieldUseCase;

  RegisterViewModel(this._validateFieldUseCase);

  String? validatePhone(String value, Country country) {
    return _validateFieldUseCase.validatePhoneNumber(
        value, country.minLength, country.maxLength);
  }

  String? validateName(String value) {
    return _validateFieldUseCase.validateName(value);
  }
}
