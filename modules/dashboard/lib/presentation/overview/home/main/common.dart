import "dart:math" as math;

import 'package:flutter/material.dart';

import 'package:dashboard/data/model/course.dart';
import 'package:dashboard/data/model/review.dart';
import 'package:dashboard/presentation/overview/app_bar.dart';
import 'package:dashboard/presentation/overview/home/bottom_box.dart';
import 'package:dashboard/presentation/overview/home/categories/main.dart';
import 'package:dashboard/presentation/overview/home/learning/main.dart';
import 'package:dashboard/presentation/overview/home/library/main.dart';
import 'package:dashboard/presentation/overview/home/popular/main.dart';
import 'package:dashboard/presentation/overview/home/reviews/main.dart';
import 'package:dashboard/presentation/overview/home/top_box/main.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styles/styles.dart';

class CommonContinueLearning extends StatelessWidget {
  const CommonContinueLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 34),
      child: ContinueLearning(),
    );
  }
}

class CommonCategories extends StatelessWidget {
  const CommonCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 34),
      child: Categories(),
    );
  }
}

class CommonPopularCourses extends StatelessWidget {
  const CommonPopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 42),
      child: PopularCourses(
        courses: List.generate(
          2,
          (index) => Course(
            image:
                "https://images.pexels.com/photos/5940838/pexels-photo-5940838.jpeg",
            title: "Ut enim ad minim veniamae",
            rating: 4.5,
            moduleCount: 5,
            duration: 630,
          ),
        ),
      ),
    );
  }
}

class CommonLibraryBanner extends StatelessWidget {
  const CommonLibraryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 49),
      child: LibraryBanner(),
    );
  }
}

class CommonReviews extends StatelessWidget {
  const CommonReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Reviews(
      reviews: List.generate(
        3,
        (index) => Review(
          image: "https://i.ibb.co/5FJ6xjk/profile.png",
          name: "Vishal Kanna S",
          rating: 5,
          review:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        ),
      ),
    );
  }
}

class CommonBottomBox extends StatelessWidget {
  const CommonBottomBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: BottomBox());
  }
}

class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: defaultLightGreyColor,
      height: 0,
      indent: 16,
      endIndent: 16,
      thickness: 1,
    );
  }
}

class CommonListContainer extends SliverList {
  CommonListContainer({super.key, required List<Widget> children, EdgeInsets? padding})
      : super(
          delegate: SliverChildListDelegate.fixed([
            Container(
              padding: padding,
              color: defaultWhiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ]),
        );
}

class CommonHomeAppBar extends SliverPadding {
  CommonHomeAppBar({super.key, ScrollController? controller})
      : super(
            padding: const EdgeInsets.all(0),
            sliver: controller != null
                ? _CommonHomeAppBarWithScrollEffect(controller: controller)
                : const OverviewAppbar());
}

class _CommonHomeAppBarWithScrollEffect extends HookWidget {
  const _CommonHomeAppBarWithScrollEffect({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final showIcon = useState(false);

    void onScroll() {
      showIcon.value = controller.offset > 80;
    }

    useEffect(() {
      controller.addListener(onScroll);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onScroll();
      });
      return () => controller.removeListener(onScroll);
    }, [controller]);
    return OverviewAppbar(showIcon: showIcon.value);
  }
}

class CommonTopBox extends HookWidget {
  const CommonTopBox({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    const initialHeight = 215.0;

    final height = useState(math.max(initialHeight - 50, 0.0));
    void onScroll() {
      height.value = math.max(initialHeight - 50 - controller.offset, 0);
    }

    useEffect(() {
      controller.addListener(onScroll);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onScroll();
      });
      return () => controller.removeListener(onScroll);
    }, [controller]);

    return TopBox(height: height.value);
  }
}
