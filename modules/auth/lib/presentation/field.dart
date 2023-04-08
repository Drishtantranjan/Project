import 'package:auth/presentation/assets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:shared/overlay.dart';
import 'package:styles/styles.dart';

import 'inlt.dart';
import 'input_decoration.dart';

class AuthTextFieldHandler {
  final bool imeNext;
  TextEditingController controller;
  final String? Function(String)? validator;
  String? Function(String)? onValidate;
  final TextInputType keyboardType;

  String get text => controller.text;
  set text(String value) => controller.text = value;

  AuthTextFieldHandler({
    required this.imeNext,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
  });

  bool get isValid => validator == null || validator!(controller.text) == null;

  bool validate() {
    if (onValidate != null) {
      onValidate!(controller.text);
    }
    return isValid;
  }
}

AuthTextFieldHandler useTextFieldHandler({
  String initialText = "",
  String? Function(String)? validator,
  TextInputType? keyboardType,
  bool imeNext = false,
}) {
  final controller = useTextEditingController(text: initialText);
  final handler = useMemoized<AuthTextFieldHandler>(
      () => AuthTextFieldHandler(
          controller: controller,
          imeNext: imeNext,
          validator: validator,
          keyboardType: keyboardType ?? TextInputType.text),
      [controller, validator]);
  return handler;
}

class AuthPasswordField extends HookWidget {
  const AuthPasswordField({
    super.key,
    this.labelText = "Password",
    required this.handler,
  });
  final String labelText;
  final AuthTextFieldHandler handler;

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(false);
    final focusNode = useFocusNode();

    useEffect(() {
      if (focusNode.hasFocus) {
        focusNode.requestFocus();
      }
      return () {};
    }, [showPassword.value]);

    return AuthField(
      focusNode: focusNode,
      obscureText: !showPassword.value,
      labelText: labelText,
      handler: handler,
      suffix: IconButton(
        constraints: const BoxConstraints(
          minHeight: 50,
          maxHeight: 50,
        ),
        onPressed: () {
          if (focusNode.hasFocus) {
            focusNode.nextFocus();
          }
          showPassword.value = !showPassword.value;
        },
        icon: imageAsset(
          width: showPassword.value ? 24 : 29,
          height: showPassword.value ? 24 : 29,
          color: defaultBlackColor,
          fit: BoxFit.contain,
          showPassword.value
              ? AssetProvider.eyeIcon
              : AssetProvider.hiddenEyeIcon,
        ),
      ),
    );
  }
}

void _useErrorMessageHandler({
  required AuthTextFieldHandler handler,
  required Function(String?) setError,
}) {
  useEffect(() {
    handler.onValidate = (value) {
      final error =
          handler.validator != null ? handler.validator!(value) : null;
      setError(error);
      return error;
    };
    return () {
      handler.onValidate = null;
    };
  }, [handler]);
}

typedef ToolTipCallback = void Function(String? toolTip);

ToolTipCallback useToolTip({
  required GlobalKey key,
}) {
  final context = useContext();
  final focusScopeNode = FocusScope.of(context);
  final mediaQuery = MediaQuery.of(context);
  OverlayManager overlayManager = useOverlayManager();
  final overlayEntry = useRef<OverlayEntry?>(null);
  showNow(String? toolTip) {
    if (toolTip != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject()! as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);
      final size = renderBox.size;
      showTooltip(
        textScaleFactor: mediaQuery.textScaleFactor,
        focusScopeNode: focusScopeNode,
        context: context,
        message: toolTip,
        size: size,
        offset: Offset(offset.dx + size.width / 2, offset.dy + size.height),
        onSet: (entry) {
          final prevEntry = overlayEntry.value;
          if (prevEntry != null) {
            overlayManager.hide(prevEntry);
          }
          overlayEntry.value = entry;
          if (entry != null) {
            overlayManager.show(entry);
          }
        },
      );
    }
  }

  return showNow;
}

class AuthField extends HookWidget {
  AuthField({
    super.key,
    required this.labelText,
    this.suffix,
    this.obscureText = false,
    required this.handler,
    this.focusNode,
  });

  final String labelText;
  final Widget? suffix;
  final bool obscureText;
  final AuthTextFieldHandler handler;
  final GlobalKey _key = GlobalKey();
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final errorMessage = useState<String?>(null);

    final showToolTip = useToolTip(key: _key);

    _useErrorMessageHandler(
        handler: handler,
        setError: (err) {
          errorMessage.value = err;
          showToolTip(err);
        });

    return TextField(
      focusNode: focusNode,
      textInputAction:
          handler.imeNext ? TextInputAction.next : TextInputAction.done,
      key: _key,
      onChanged: (value) {
        errorMessage.value = null;
      },
      keyboardType: handler.keyboardType,
      obscureText: obscureText,
      style: textTheme.bodyLarge!.copyWith(color: defaultBlackColor),
      controller: handler.controller,
      decoration: authFieldDecoration(
        label: labelText,
        labelStyle: textTheme.bodyLarge!.copyWith(color: defaultDarkGreyColor),
        contentPadding: const EdgeInsets.only(left: 15),
        suffix: suffix,
        errorMessage: errorMessage.value,
        onShowTooltip: () => showToolTip(errorMessage.value),
      ),
    );
  }
}

class AuthPhoneField extends HookWidget {
  AuthPhoneField({
    super.key,
    required this.handler,
    this.hintText = "Mobile Number",
    required this.onCountryChanged,
    this.initialCountry = const Country(
      name: "India",
      flag: "🇮🇳",
      code: "IN",
      dialCode: "91",
      minLength: 10,
      maxLength: 10,
    ),
  });
  final String hintText;
  final Function(Country) onCountryChanged;
  final AuthTextFieldHandler handler;
  final GlobalKey _key = GlobalKey();
  final Country initialCountry;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final errorMessage = useState<String?>(null);

    final showToolTip = useToolTip(key: _key);
    final focusNode = useFocusNode();

    _useErrorMessageHandler(
        handler: handler,
        setError: (err) {
          errorMessage.value = err;
          showToolTip(err);
        });

    return IntlPhoneField(
      focusNode: focusNode,
      key: _key,
      textInputAction:
          handler.imeNext ? TextInputAction.next : TextInputAction.done,
      onChanged: (value) {
        errorMessage.value = null;
      },
      disableLengthCheck: true,
      flagsButtonMargin:
          const EdgeInsets.only(left: 1, right: 10, top: 1, bottom: 1),
      flagsButtonPadding: const EdgeInsets.only(left: 10),
      initialCountryCode: initialCountry.code,
      keyboardType: handler.keyboardType,
      pickerDialogStyle: PickerDialogStyle(
        searchFieldPadding: const EdgeInsets.only(top: 10),
      ),
      dropdownTextStyle:
          textTheme.bodyLarge!.copyWith(color: defaultBlackColor),
      dropdownIcon: const Icon(Icons.arrow_drop_down, color: defaultBlackColor),
      dropdownIconPosition: IconPosition.trailing,
      showCountryFlag: true,
      controller: handler.controller,
      onCountryChanged: onCountryChanged,
      style: textTheme.bodyLarge!.copyWith(color: defaultBlackColor),
      dropdownDecoration: const BoxDecoration(
        color: grey99Color,
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(7), right: Radius.zero),
      ),
      decoration: authFieldDecoration(
        hint: hintText,
        contentPadding: const EdgeInsets.all(0),
        errorMessage: errorMessage.value,
        labelStyle: textTheme.bodyLarge!.copyWith(color: defaultDarkGreyColor),
        onShowTooltip: () => showToolTip(errorMessage.value),
      ),
    );
  }
}
