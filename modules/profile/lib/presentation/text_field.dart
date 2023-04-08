import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:styles/styles.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.label,
    required this.handler,
    this.isRequired = true,
    this.isVerified = false,
    this.paddingTop = 0,
    this.paddingBottom = 23,
    this.isDisabled = false,
  });

  final String label;
  final ProfileFieldHandler handler;
  final bool isRequired;
  final bool isVerified;
  final double paddingTop;
  final double paddingBottom;
  final bool isDisabled;

  Widget renderField() {
    if (handler is ProfileTextFieldHandler) {
      final handler = this.handler as ProfileTextFieldHandler;
      return TextField(
        controller: handler.controller,
        enabled: !isDisabled,
        keyboardType: handler.keyboardType,
        textInputAction:
            handler.imeNext ? TextInputAction.next : TextInputAction.done,
        style: type.bodyLarge!.copyWith(color: defaultBlackColor),
        decoration: InputDecoration(
          suffixIcon: isVerified
              ? const Icon(Icons.check_circle, color: greenColor)
              : null,
          isDense: true,
          isCollapsed: false,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        maxLines: handler.multiline ? null : 1,
      );
    } else if (handler is ProfileDropdownHandler) {
      final handler = this.handler as ProfileDropdownHandler;
      return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: defaultWhiteColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: defaultLightGreyColor),
        ),
        child: ValueListenableBuilder(
            valueListenable: handler.controller,
            builder: (context, value, child) {
              return DropdownButton(
                isDense: true,
                iconSize: 35,
                value: handler.controller.text,
                underline: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                style: type.bodyLarge!.copyWith(color: defaultBlackColor),
                isExpanded: true,
                items: handler.items
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e).bodyLarge(color: defaultBlackColor),
                      ),
                    )
                    .toList(),
                onChanged: (value) => handler.controller.text = value ?? "",
              );
            }),
      );
    } else if (handler is ProfileFileUploadHandler) {
      final handler = this.handler as ProfileFileUploadHandler;
      return Material(
        color: defaultWhiteColor,
        child: InkWell(
          onTap: () {
            handler.pickFile();
          },
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: defaultLightGreyColor),
            ),
            child: ValueListenableBuilder(
                valueListenable: handler.controller,
                builder: (context, value, child) {
                  return Row(
                    children: [
                      const Text("Browse Files")
                          .bodyLarge(color: defaultBlackColor),
                    ],
                  );
                }),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label).titleSmall(color: defaultDarkGreyColor),
              if (isRequired) const Text(" *").titleSmall(color: primaryColor),
            ],
          ),
          const SizedBox(height: 5),
          renderField(),
        ],
      ),
    );
  }
}

abstract class ProfileFieldHandler {}

class ProfileTextFieldHandler extends ProfileFieldHandler {
  final bool imeNext;
  TextEditingController controller;
  final String? Function(String)? validator;
  String? Function(String)? onValidate;
  final TextInputType keyboardType;
  final bool multiline;

  String get text => controller.text;
  set text(String value) => controller.text = value;

  ProfileTextFieldHandler({
    required this.imeNext,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.multiline = false,
  });

  bool get isValid => validator == null || validator!(controller.text) == null;

  bool validate() {
    if (onValidate != null) {
      onValidate!(controller.text);
    }
    return isValid;
  }
}

ProfileTextFieldHandler useTextFieldHandler({
  String? initialText,
  String? Function(String)? validator,
  TextInputType? keyboardType,
  bool imeNext = true,
}) {
  final controller = useTextEditingController(text: initialText);
  final handler = useMemoized<ProfileTextFieldHandler>(
      () => ProfileTextFieldHandler(
            controller: controller,
            imeNext: imeNext,
            validator: validator,
            keyboardType: keyboardType ?? TextInputType.text,
          ),
      [controller, validator]);
  return handler;
}

class DropdownDataItem {
  final String value;
  final String label;

  DropdownDataItem({
    required this.value,
    required this.label,
  });
}

class DropdownController extends ValueNotifier<String> {
  DropdownController(String value) : super(value);

  String get text => value;
  set text(String value) => this.value = value;
}

class ProfileDropdownHandler extends ProfileFieldHandler {
  final DropdownController controller;
  final List<String> items;

  String get text => controller.text;

  ProfileDropdownHandler({required this.controller, required this.items});
}

DropdownController useDropdownController({
  String? initialItem,
}) {
  final controller = useMemoized<DropdownController>(() {
    return DropdownController(initialItem ?? "");
  }, [initialItem]);
  return controller;
}

ProfileDropdownHandler useDropdownHandler({
  required List<String> items,
  String? initialItem,
}) {
  final controller = useDropdownController(initialItem: initialItem);
  final newItems = useMemoized<List<String>>(() {
    if (initialItem != null && !items.contains(initialItem)) {
      return [initialItem, ...items];
    }
    if (initialItem == null && items.isNotEmpty) {
      return ["", ...items];
    }
    return items;
  }, [items]);
  final handler = useMemoized<ProfileDropdownHandler>(
      () => ProfileDropdownHandler(controller: controller, items: newItems),
      [controller]);
  return handler;
}

class FileUploadController extends ValueNotifier<XFile?> {
  FileUploadController({required this.acceptedExts}) : super(null);

  final List<String> acceptedExts; // image/jpeg, image/png, image/gif

  XFile? get text => value;
  set text(XFile? value) => this.value = value;
}

class ProfileFileUploadHandler extends ProfileFieldHandler {
  final FileUploadController controller;

  ProfileFileUploadHandler({required this.controller});

  XFile? get file => controller.text;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: controller.acceptedExts,
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      controller.text = XFile(file.path);
    } else {
      // User canceled the picker
    }
  }
}

FileUploadController useFileUploadController({
  required List<String> acceptedExts,
}) {
  final controller = useMemoized<FileUploadController>(() {
    return FileUploadController(acceptedExts: acceptedExts);
  }, [...acceptedExts]);
  return controller;
}

ProfileFileUploadHandler useFileUploadHandler({
  required List<String> acceptedExts,
}) {
  final controller = useFileUploadController(acceptedExts: acceptedExts);
  final handler = useMemoized<ProfileFileUploadHandler>(
      () => ProfileFileUploadHandler(controller: controller), [controller]);
  return handler;
}
