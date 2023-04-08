import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key, required this.isSelected, required this.label, required this.onTap});

  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(40),
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: onTap,
            child: Container(
              height: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: isSelected ? 19.5 : 20),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : grey99Color,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: isSelected ? Colors.transparent : defaultLightGreyColor,
                  width: isSelected ? 0 : 1,
                ),
              ),
              child: isSelected
                  ? Text(label).labelMedium(color: defaultWhiteColor)
                  : Text(label).bodyMedium(color: defaultDarkGreyColor),
            ),
          ),
        ),
      ],
    );
  }
}
