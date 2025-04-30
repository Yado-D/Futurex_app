import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

import 'acadamic_information_bloc/academic_info_bloc.dart';

class OnboardingCourseDifficultyAndPrefrence extends StatefulWidget {
  const OnboardingCourseDifficultyAndPrefrence({super.key});

  @override
  State<OnboardingCourseDifficultyAndPrefrence> createState() =>
      _CourseDifficultyAndPrefrenceState();
}

class _CourseDifficultyAndPrefrenceState
    extends State<OnboardingCourseDifficultyAndPrefrence> {
  // List<double>? courseDifficulty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            buildStepProgressBar(5, 11),
            ReusableText(
              FromTop: 50,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "Course Difficulty & Preferences",
              FontSize: 25,
              TextFontWeight: FontWeight.w900,
            ),
            ReusableText(
              FromTop: 10,
              TextColor: ColorCollections.TeritiaryColor,
              TextString:
                  "Great! Now we'll tailor your study plan to focus on what matters most.",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            ReusableText(
              FromTop: 25,
              TextColor: ColorCollections.TeritiaryColor,
              TextString:
                  "Rate these subjects from 1 (easiest) to 5 (most difficult)",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: courses.length,
                itemBuilder: (BuildContext context, index) {
                  return BlocBuilder<AcademicInfoBloc, AcademicInfoState>(
                    builder: (context, state) {
                      if (state.courseDifficulty!.isEmpty) {
                        context
                            .read<AcademicInfoBloc>()
                            .add(AcademicDifficultySubjectLoadingEvent());
                        return Center(child: CircularProgressIndicator());
                      }

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                TextString: courses[index],
                                TextColor: ColorCollections.TeritiaryColor,
                                FontSize: 18,
                              ),
                              ReusableText(
                                TextString:
                                    (state.courseDifficulty?[index] ?? 1.0)
                                        .toStringAsFixed(0),
                                TextColor: ColorCollections.TeritiaryColor,
                                FontSize: 18,
                              ),
                            ],
                          ),
                          CommonSliderWidget(
                            context: context,
                            maxValue: 5,
                            minValue: 1,
                            valuePicked: state.courseDifficulty![index],
                            division: 5,
                            selectedPoint: true,
                            labelText:
                                "Difficulty ${(state.courseDifficulty?[index] ?? 1.0).toStringAsFixed(0)}",
                            onChanged: (value) =>
                                updateSliderValue(value, index),
                          ),
                        ],
                      );
                    },
                  );
                }),
            ReusableText(
              FromTop: 10,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "What subject do you love the most and why?",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            reusableTextField(
              context: context,
              FromLeft: 0,
              FromRight: 25,
              hintText: "e.g.,85.7",
              textType: "name",
              onchange: (onchange) {},
            ),
            ReusableText(
              FromTop: 10,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "Why do you love this subject?",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            reusableTextField(
              context: context,
              FromLeft: 0,
              FromRight: 25,
              hintText: "e.g.,85.7",
              textType: "",
              onchange: (onchange) {},
            ),
            ReusableText(
              FromTop: 10,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "What subject(s) do you want to improve?",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            reusableTextField(
              context: context,
              FromLeft: 0,
              FromRight: 25,
              hintText: "e.g.,50",
              textType: "",
              onchange: (onchange) {},
            ),
            SizedBox(
              height: 20,
            ),
            reusableButtonContainer(context, "Continue",
                ColorCollections.QuaterneryColor, Colors.white),
            reusableButtonContainer(context, "Back",
                ColorCollections.PrimaryColor, ColorCollections.TeritiaryColor),
          ],
        ),
      ),
    );
  }

  void updateSliderValue(double value, int index) {
    context
        .read<AcademicInfoBloc>()
        .add(AcademicDifficultyEvent(difficulty: value, index: index));
  }

  List<String> courses = [
    "Math",
    "Physics",
    "Chemistry",
    "Biology",
    "English",
    "History"
  ];

  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Back") {
          Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/welcome_profile_setup_5_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, right: 3, left: 3),
        height: 55,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: contColor,
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: ReusableText(
            TextColor: txtColor,
            // FromLeft: 15,
            FromRight: 10,
            // FromTop: 50,
            TextString: content,
            FontSize: 18,
            // TextFontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
