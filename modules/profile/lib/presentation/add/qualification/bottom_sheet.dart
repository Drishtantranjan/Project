// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:profile/presentation/add/button.dart';
import 'package:profile/presentation/add/provider.dart';
import 'package:profile/presentation/add/qualification/item.dart';
import 'package:profile/presentation/text_field.dart';
import 'package:styles/styles.dart';

class ProfileAddEducationBottomSheet extends HookWidget {
  const ProfileAddEducationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final educationHandler =
        useDropdownHandler(items: ["B.Tech", "B.A", "M.Tech", "M.A", "Ph.D"]);
    final universityHandler = useTextFieldHandler();
    final courseHandler = useTextFieldHandler();
    final specializationHandler = useTextFieldHandler();
    final gradesHandler = useTextFieldHandler(keyboardType: const TextInputType.numberWithOptions(decimal: true));
    final yearOfPassingHandler = useTextFieldHandler(imeNext: false, keyboardType: TextInputType.number);
    final uploadCertificateHandler =
        useFileUploadHandler(acceptedExts: ["pdf", "jpg", "png", "jpeg"]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Add Education").titleLarge(color: defaultBlackColor),
        const SizedBox(height: 19),
        ProfileTextField(label: "Education", handler: educationHandler),
        ProfileTextField(label: "University", handler: universityHandler),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: ProfileTextField(label: "Course", handler: courseHandler),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 2,
              child: ProfileTextField(
                  label: "Specialization", handler: specializationHandler),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 1,
              child: ProfileTextField(
                  label: "Grades (in %)", handler: gradesHandler),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 1,
              child: ProfileTextField(
                  label: "Year of Passing Out", handler: yearOfPassingHandler),
            ),
          ],
        ),
        ProfileTextField(
            label: "Upload your Certificate",
            handler: uploadCertificateHandler),
        AddButton(onAdd: () {
          Navigator.of(context).pop(ProfileQualificationData(
            education: educationHandler.text,
            university: universityHandler.text,
            course: courseHandler.text,
            specialization: specializationHandler.text,
            grades: gradesHandler.text,
            yearOfPassing: yearOfPassingHandler.text,
            certificate: "",
          ));
        })
      ],
    );
  }
}
