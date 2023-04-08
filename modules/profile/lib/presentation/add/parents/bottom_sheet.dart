import 'package:flutter/material.dart';
import 'package:profile/presentation/add/button.dart';
import 'package:profile/presentation/add/provider.dart';

import 'package:profile/presentation/text_field.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

enum Parent { father, mother, guardian }

class ParentDetailsUpdateBottomSheet extends HookWidget {
  const ParentDetailsUpdateBottomSheet({super.key, required this.parent, this.details});

  final Parent parent;
  final ProfileParentsData? details;

  String get title {
    switch (parent) {
      case Parent.father:
        return "Father";
      case Parent.mother:
        return "Mother";
      case Parent.guardian:
        return "Guardian";
    }
  }

  String get actionLabel {
    if (details == null) {
      return "Add";
    } else {
      return "Update";
    }
  }

  @override
  Widget build(BuildContext context) {
    final nameHandler = useTextFieldHandler(
      keyboardType: TextInputType.name,
    );
    final occupationHandler = useTextFieldHandler();
    final qualificationHandler = useDropdownHandler(items: ["B.Tech", "B.A", "M.Tech", "M.A", "Ph.D"]);
    final phoneHandler = useTextFieldHandler(
      keyboardType: TextInputType.phone,
    );
    final emailHandler = useTextFieldHandler(
      keyboardType: TextInputType.emailAddress,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$actionLabel $title Details").titleLarge(color: defaultBlackColor),
        const SizedBox(height: 11),
        const Text("Please enter the details").bodyLarge(color: defaultDarkGreyColor),
        const SizedBox(height: 15),
        ProfileTextField(label: "Name", handler: nameHandler),
        ProfileTextField(label: "Occupation", handler: occupationHandler),
        ProfileTextField(label: "Qualification", handler: qualificationHandler),
        ProfileTextField(label: "Phone Number", handler: phoneHandler),
        ProfileTextField(label: "Email Address", handler: emailHandler, isRequired: false),
        AddButton(onAdd: () {
          Navigator.of(context).pop(ProfileParentsData(
            name: nameHandler.text,
            occupation: occupationHandler.text,
            qualification: qualificationHandler.controller.text,
            email: emailHandler.text,
            phone: phoneHandler.text,
          ));
        }),
      ],
    );
  }
}