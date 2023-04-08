import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:auth/presentation/button.dart';
import 'package:auth/presentation/wrapper.dart';
import 'package:shared/shared.dart';
import 'package:shared/viewmodel_provider.dart';

class AuthScaffold<T extends ViewModel> extends HookWidget {
  const AuthScaffold({
    super.key,
    required this.header,
    required this.body,
    this.actionLabel,
    this.onAction,
    this.appBar,
    this.footer,
    this.viewModel,
    this.headerPadding = const EdgeInsets.only(top: 81),
    this.center = false,
    this.actionEnabled = true,
  });
  final Widget header;
  final EdgeInsets headerPadding;
  final List<Widget> body;
  final String? actionLabel;
  final AsyncCallback? onAction;
  final Widget? appBar;
  final Widget? footer;
  final bool center;
  final T? viewModel;
  final bool actionEnabled;

  static Logger logger = Logger('AuthScaffold');

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final minHeight = footer != null ? 700.0 : 600.0;
    final checkingHeight = footer != null ? 800.0 : 700.0;
    final screenHeight = MediaQuery.of(context).size.height;
    final navigationPadding = MediaQuery.of(context).viewPadding.bottom +
        MediaQuery.of(context).viewPadding.top;
    final doScroll = screenHeight < checkingHeight;
    final height = screenHeight - navigationPadding - 100;

    final child = AnnotatedRegion<SystemUiOverlayStyle>(
      value: lightStatusBar,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Scrollbar(
            child: SingleChildScrollView(
              primary: true,
              physics: const ClampingScrollPhysics(),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      Wrapper(
                        padding: const EdgeInsets.all(30),
                        child: SizedBox(
                          height: doScroll ? minHeight : height,
                          child: SizedBox(
                            height: doScroll ? minHeight : height,
                            child: Column(
                              crossAxisAlignment: center
                                  ? CrossAxisAlignment.center
                                  : CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ConstraintFlexible(
                                    maxHeight: headerPadding.top,
                                    minHeight: 10),
                                Center(child: header),
                                MaxHeight(headerPadding.bottom),
                                ...body,
                                if (actionLabel != null && onAction != null)
                                  AuthButton(
                                    enabled: !isLoading.value && actionEnabled,
                                    text: actionLabel!,
                                    onPressed: () async {
                                      isLoading.value = true;
                                      try {
                                        await onAction!();
                                      } catch (e) {
                                        logger.warning(e.toString());
                                      }
                                      isLoading.value = false;
                                    },
                                  ),
                                if (footer != null)
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: footer!,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (appBar != null)
                        Positioned(
                          top: 31,
                          left: 24,
                          child: appBar!,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return (viewModel != null)
        ? ViewModelProvider<T>(viewModel: viewModel!, child: child)
        : child;
  }
}
