import 'package:dashboard/presentation/search/item.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/presentation/search/field.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class SearchPage extends HookWidget {
  const SearchPage({super.key, required this.categoryFromRoute});

  static String pageName = 'search';
  final String? categoryFromRoute;

  @override
  Widget build(BuildContext context) {
    final category = useState<String?>(categoryFromRoute);
    final searchController = useTextEditingController();
    return AnnotatedRegion(
      value: lightStatusBar,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 81,
                padding: const EdgeInsets.only(left: 24, right: 21),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SearchField(
                        category: category.value,
                        controller: searchController,
                        onRemoveCategory: () {
                          category.value = null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("Cancel")
                          .labelLarge(color: defaultBlackColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text: "2",
                    style: type.titleMedium!.copyWith(
                      color: defaultBlackColor,
                    ),
                    children: [
                      TextSpan(
                          text: " total results",
                          style: type.bodyLarge!.copyWith(
                            color: defaultBlackColor,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 21),
              Flexible(
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SearchItem(
                    title: "Google UX Design",
                    subtitle: "Simuchand",
                    image:
                        "https://i.ibb.co/KzmV6Sj/pexels-thirdman-8926544-1.jpg",
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
