import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key, required this.isChecked, required this.onCheckChanged});

  final bool isChecked;
  final void Function(bool) onCheckChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      fillColor: MaterialStateProperty.all(secondaryColor90),
      checkColor: secondaryColor15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: isChecked,
      onChanged: (value) {
        onCheckChanged(value == true);
      },
    );
  }
}
