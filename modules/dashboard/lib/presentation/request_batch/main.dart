import 'package:flutter/material.dart';

import 'package:dashboard/presentation/request_batch/item.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class Subject {
  final String label;
  final bool isSelected;

  Subject({required this.label, required this.isSelected});
}

class RequestBatchPage extends HookWidget {
  const RequestBatchPage({super.key});

  static String pageName = 'request_batch';

  @override
  Widget build(BuildContext context) {
    final subjects = useState([
      "Urdu",
      "Arabic",
      "Hadith",
      "Tajweed",
      "Aqeedah",
      "Fiqh",
      "Tafseer",
      "Seera",
      "Qasas",
      "Malumate Aama",
      "Riqiya Shariah",
      "Islamic History",
      "Comparative Religion"
    ].map((e) => Subject(label: e, isSelected: false)).toList());

    final feedbackController = useTextEditingController();

    return Scaffold(
      appBar: const DarkAppBar(
        title: 'Request Batch',
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 41, left: 24, right: 23),
            child: const Text("Select Subjects")
                .titleMedium(color: defaultBlackColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 23, right: 23),
            child: _SubjectList(
              subjects: subjects.value,
              onChange: (newSubjects) => subjects.value = newSubjects,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 120,
              ),
              child: TextField(
                maxLines: null,
                minLines: null,
                expands: true,
                controller: feedbackController,
                style: type.bodyLarge!.copyWith(color: defaultBlackColor),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  hintText: "Tell us more about your request",
                  hintStyle:
                      type.bodyLarge!.copyWith(color: defaultDarkGreyColor),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: defaultLightGreyColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isCollapsed: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SecondaryButton(
                width: 160,
                height: 45,
                labelText: "Send Request",
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _SubjectList extends StatelessWidget {
  const _SubjectList({
    Key? key,
    required this.subjects,
    required this.onChange,
  }) : super(key: key);

  final List<Subject> subjects;
  final Function(List<Subject>) onChange;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      runSpacing: 16,
      spacing: 10,
      children: [
        for (var subject in subjects)
          SubjectItem(
            isSelected: subject.isSelected,
            label: subject.label,
            onTap: () {
              onChange(subjects
                  .map((e) => e.label == subject.label
                      ? Subject(label: e.label, isSelected: !e.isSelected)
                      : e)
                  .toList());
            },
          )
      ],
    );
  }
}
