// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import 'address/main.dart';
import 'bottom_nav.dart';
import 'kyc/main.dart';
import 'parents/main.dart';
import 'personal/main.dart';
import 'provider.dart';
import 'qualification/bottom_sheet.dart';
import 'qualification/item.dart';
import 'qualification/main.dart';

class ProfileAddPage extends ConsumerWidget {
  const ProfileAddPage({super.key});

  static const String pageName = 'add';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstPage =
            ref.read(pageProvider) == ProfileUpdatePageEnum.personal;
        if (!isFirstPage) {
          ref.read(pageDataProvider.notifier).pop(context);
        }
        return isFirstPage;
      },
      child: Scaffold(
        appBar: LightAppBar(
          title: 'Update Profile',
          pop: (context) {
            ref.read(pageDataProvider.notifier).pop(context);
          },
        ),
        body: const _MainContainer(),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}

class _MainContainer extends HookConsumerWidget {
  const _MainContainer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);

    useEffect(() {
      if (page != ProfileUpdatePageEnum.personal) {
        Future.delayed(Duration.zero, () {
          ref.read(pageDataProvider.notifier).reset();
        });
      }
      return null;
    }, []);

    Widget child;
    switch (page) {
      case ProfileUpdatePageEnum.personal:
        child = const ProfileAddPersonal();
        break;
      case ProfileUpdatePageEnum.address:
        child = const ProfileAddAddress();
        break;
      case ProfileUpdatePageEnum.parents:
        child = const ProfileAddParents();
        break;
      case ProfileUpdatePageEnum.qualification:
        child = const ProfileAddQualification();
        break;
      case ProfileUpdatePageEnum.kyc:
        child = const ProfileAddKYC();
        break;
    }

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 24),
              child: child,
            ),
          ),
          if (page == ProfileUpdatePageEnum.qualification)
            Positioned(
              bottom: 29,
              right: 18,
              child: FloatingActionButton(
                onPressed: () async {
                  final detail = await showHandleBarBottomSheet<ProfileQualificationData>(
                    context: context,
                    height: 700,
                    builder: (context) =>
                        const ProfileAddEducationBottomSheet(),
                  );
                  if (detail != null) {
                    final data = ref.read(qualificationDataProvider);
                    ref.read(pageDataProvider.notifier).setQualificationData([...data, detail]);
                  }

                },
                backgroundColor: secondaryColor15,
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              ),
            ),
        ],
      ),
    );
  }
}
