import 'package:dashboard/presentation/overview/app_bar.dart';
import 'package:dashboard/presentation/overview/chats/item.dart';
import 'package:dashboard/presentation/overview/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routes/data/auth/hive.dart';

class DashboardChats extends HookWidget {
  DashboardChats({super.key, required this.controller});

  final ScrollController controller;
  final _bucket = PageStorageBucket();

  static const _keyPrefix = 'dashboard_chat';

  final _customScrollPageKey =
      const PageStorageKey('${_keyPrefix}_custom_scroll_view');

  @override
  Widget build(BuildContext context) {
    final user = AuthBox.useUser();
    return PageStorage(
      bucket: _bucket,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        key: _customScrollPageKey,
        controller: controller,
        slivers: [
          const OverviewAppbar(title: "Chats"),
          SliverFillRemaining(
            hasScrollBody: user.value != null,
            child: user.value != null
                ? const _AuthenticatedContainer()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      NotLoggedInContainer(),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}

class _AuthenticatedContainer extends StatelessWidget {
  const _AuthenticatedContainer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ChatItem(),
      padding: const EdgeInsets.all(0),
    );
  }
}
