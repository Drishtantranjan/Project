import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

class ProfilePicker extends StatelessWidget {
  const ProfilePicker({
    super.key,
    required this.onImageSelected,
    required this.onImageError,
    required this.image,
    required this.initialImage,
  });

  final void Function(XFile) onImageSelected;
  final void Function(PlatformException) onImageError;
  final XFile? image;
  final String initialImage;

  Future<void> getLostData() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      onImageSelected(response.file!);
    } else {
      onImageError(response.exception!);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => getLostData());
    return SizedBox(
      width: 110,
      height: 110,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              backgroundImage: (image != null
                  ? FileImage(File(image!.path))
                  : NetworkImage(initialImage)) as ImageProvider<Object>?,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: SizedBox(
              width: 24,
              height: 24,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: const Color(0xff004ecd),
                onPressed: () async {
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    onImageSelected(pickedFile);
                  }
                },
                child: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
