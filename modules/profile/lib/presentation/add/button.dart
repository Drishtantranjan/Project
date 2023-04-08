import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ActionButton(onAction: onNext, labelText: "Next");
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return ActionButton(onAction: onAdd, labelText: "Add");
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onAction, required this.labelText});
  final VoidCallback onAction;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      child: SecondaryButton(
        onPressed: onAction,
        labelText: labelText,
        width: 165,
        height: 43,
      ),
    );
  }
}

class AddLinkButton extends StatelessWidget {
  const AddLinkButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: defaultWhiteColor,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 7.5),
          child: Text(label).bodyMedium(color: secondaryColor),
        ),
      ),
    
    );
  }
}
