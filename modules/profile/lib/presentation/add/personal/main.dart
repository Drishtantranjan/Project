import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/presentation/add/button.dart';
import 'package:profile/presentation/add/provider.dart';
import 'package:profile/presentation/picker.dart';
import 'package:profile/presentation/text_field.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class ProfileAddPersonal extends HookConsumerWidget {
  const ProfileAddPersonal({super.key});

  String? _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    return null;
  }

  String? _validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone is required";
    }
    return null;
  }

  static final _logger = Logger("ProfileAddPersonal");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState<XFile?>(null);
    final firstNameHandler = useTextFieldHandler(
        validator: _validateFirstName, keyboardType: TextInputType.name);
    final lastNameHandler = useTextFieldHandler(
        validator: _validateLastName, keyboardType: TextInputType.name);
    final emailHandler = useTextFieldHandler(
        validator: _validateEmail, keyboardType: TextInputType.emailAddress);
    final phoneHandler = useTextFieldHandler(
      validator: _validatePhone,
      imeNext: false,
      keyboardType: TextInputType.phone,
    );

    useEffect(() {
      Future.delayed(Duration.zero).then((value) {
        final data = ref.read(pageDataProvider).personal;
        if (data == null) {
          return;
        }
        firstNameHandler.text = data.firstName;
        lastNameHandler.text = data.lastName;
        emailHandler.text = data.email;
        phoneHandler.text = data.phone;
        image.value = data.image;
      });
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 13, bottom: 29),
          alignment: Alignment.center,
          child: ProfilePicker(
            initialImage: "https://picsum.photos/200",
            image: image.value,
            onImageSelected: (file) {
              image.value = file;
            },
            onImageError: (error) {
              _logger.warning(error.message);
            },
          ),
        ),
        const Text("Basic Details").titleMedium(color: defaultBlackColor),
        ProfileTextField(
            label: "First name", handler: firstNameHandler, paddingTop: 15),
        ProfileTextField(label: "Last name", handler: lastNameHandler),
        ProfileTextField(label: "Email Address", handler: emailHandler),
        ProfileTextField(
            label: "Phone Number", handler: phoneHandler, isVerified: true),
        NextButton(onNext: () {
          final ProfilePersonalAddData data = ProfilePersonalAddData(
            firstName: firstNameHandler.text,
            lastName: lastNameHandler.text,
            email: emailHandler.text,
            phone: phoneHandler.text,
            image: image.value,
          );
          ref.read(pageDataProvider.notifier).setPersonalData(data);
          ref.read(pageDataProvider.notifier).setAddress();
        }),
      ],
    );
  }
}
