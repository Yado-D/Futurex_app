import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/features/pages/home/specific_study_plan_bloc/specific_study_plan_bloc.dart';
import 'package:futurex/utils/color_collections.dart';
import '../../../common_widget/common_widget.dart';

class SpecificStudyPlan extends StatefulWidget {
  const SpecificStudyPlan({super.key});

  @override
  State<SpecificStudyPlan> createState() => _SpecificStudyPlanState();
}

class _SpecificStudyPlanState extends State<SpecificStudyPlan> {
  final List<String> courses = [
    "Mathematics",
    "Physics",
    "Chemistry",
    "Biology",
    "Akababi Science"
  ];

  final List<String> chapters = ["Algebra", "Geometry", "Calculus"];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: themeData.background,
      body: SafeArea(
        child: ListView(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(15),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorCollections.QuaterneryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ReusableText(
                        TextColor: ColorCollections.PrimaryColor,
                        TextString: "Study Plan Setup",
                        FontSize: 18,
                        FromBottom: 0,
                        FromTop: 0,
                        TextFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  ReusableText(
                    TextColor: Colors.white70,
                    TextString: "Let's create your perfect study plan",
                    FontSize: 15,
                    FromBottom: 0,
                    FromTop: 0,
                    FromLeft: 5,
                    TextFontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),

            // Courses Selection Section
            BlocConsumer<SpecificStudyPlanBloc, SpecificStudyPlanState>(
              listener: (context, state) {},
              builder: (context, state) {
                final allCoursesSelected =
                    state.selectedCourses.length == courses.length;
                final selectedCoursesCount = state.selectedCourses.length;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Courses Header with Select All
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                            TextColor: themeData.primary,
                            TextString:
                                "Select Your Courses ($selectedCoursesCount selected)",
                            FontSize: 18,
                            TextFontWeight: FontWeight.w700,
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<SpecificStudyPlanBloc>().add(
                                    ToggleAllCoursesSelection(
                                        !allCoursesSelected),
                                  );
                            },
                            child: ReusableText(
                              TextColor: ColorCollections.QuaterneryColor,
                              TextString: allCoursesSelected
                                  ? "Deselect all"
                                  : "Select all",
                              FontSize: 16,
                              TextFontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Courses List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final isSelected =
                            state.selectedCourses.contains(index);
                        final chapterCount =
                            state.selectedChapters[index]?.length ?? 0;

                        return CommonStudySetupContainer(
                          title: courses[index],
                          subTitle:
                              "$chapterCount of ${chapters.length} Chapters Selected",
                          isSelected: isSelected,
                          onTap: () {
                            context.read<SpecificStudyPlanBloc>().add(
                                  ToggleCourseSelection(index),
                                );
                          },
                          chapterSelect: () {
                            _showChapterSelectionBottomSheet(
                                context, index, state);
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _showChapterSelectionBottomSheet(
      BuildContext context, int courseIndex, SpecificStudyPlanState state) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.background,
      context: context,
      builder: (context) {
        final allChaptersSelected =
            state.selectedChapters[courseIndex]?.length == chapters.length;

        return BlocBuilder<SpecificStudyPlanBloc, SpecificStudyPlanState>(
            builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 400,
            child: Column(
              children: [
                // Chapters Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      TextColor: Theme.of(context).colorScheme.primary,
                      TextString: "${courses[courseIndex]} Chapters",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<SpecificStudyPlanBloc>().add(
                                  ToggleAllChaptersSelection(
                                      !allChaptersSelected, courseIndex),
                                );
                          },
                          child: ReusableText(
                            TextColor: ColorCollections.QuaterneryColor,
                            TextString: allChaptersSelected
                                ? "Deselect all"
                                : "Select all",
                            FontSize: 16,
                            TextFontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ],
                ),

                // Chapters List
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: chapters.length,
                    itemBuilder: (context, chapterIndex) {
                      final isSelected = state.selectedChapters[courseIndex]
                              ?.contains(chapterIndex) ??
                          false;

                      return CommonChapterStudySetupContainer(
                        title: chapters[chapterIndex],
                        isSelected: isSelected,
                        onTap: () {
                          context.read<SpecificStudyPlanBloc>().add(
                                ToggleChapterSelection(
                                    chapterIndex, courseIndex),
                              );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Widget CommonStudySetupContainer({
    required String title,
    required String subTitle,
    required bool isSelected,
    required VoidCallback onTap,
    required VoidCallback chapterSelect,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 13, 15, 0),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? Colors.blue.shade100
              : Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade200.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  TextColor: Theme.of(context).colorScheme.primary,
                  TextString: title,
                  FontSize: 18,
                  TextFontWeight: FontWeight.w900,
                ),
                ReusableText(
                  TextColor: Theme.of(context).colorScheme.primary,
                  TextString: subTitle,
                  FontSize: 16,
                  TextFontWeight: FontWeight.w500,
                ),
              ],
            ),
            if (isSelected)
              TextButton(
                onPressed: chapterSelect,
                child: ReusableText(
                  TextColor: ColorCollections.QuaterneryColor,
                  TextString: "Select Chapters",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w700,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget CommonChapterStudySetupContainer({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 13, 15, 0),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? Colors.blue.shade100
              : Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade200.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            ReusableText(
              TextColor: Theme.of(context).colorScheme.primary,
              TextString: title,
              FontSize: 18,
              TextFontWeight: FontWeight.w900,
            ),
          ],
        ),
      ),
    );
  }
}
