// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:dashboard/presentation/assets.dart';

import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class AddBatchBottomSheet extends HookWidget {
  const AddBatchBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    final codeController = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Enter Batch Code').titleLarge(color: defaultBlackColor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 26),
          child: TextField(
            controller: codeController,
            decoration: InputDecoration(
                isDense: true,
                constraints: const BoxConstraints(maxHeight: 50),
                hintText: "Batch code",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: defaultDarkGreyColor),
                  borderRadius: BorderRadius.circular(7),
                )),
          ),
        ),
        Center(
          child: SecondaryButton(
            onPressed: () {},
            labelText: "Join Now",
            width: 173,
          ),
        ),
        const SizedBox(height: 61)
      ],
    );
  }
}
