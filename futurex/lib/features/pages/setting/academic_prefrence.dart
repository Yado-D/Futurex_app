import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/onboarding%20pages/acadamic_information_bloc/academic_info_bloc.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:intl/intl.dart';

class AcademicPrefrence extends StatefulWidget {
  const AcademicPrefrence({super.key});

  @override
  State<AcademicPrefrence> createState() => _AcademicPrefrenceState();
}

class _AcademicPrefrenceState extends State<AcademicPrefrence> {
  String? selectedValue;
  DateTime? finalDate;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: themeData.background,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
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
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: ColorCollections.PrimaryColor,
                        size: 30,
                      ),
                    ),
                    ReusableText(
                      TextColor: ColorCollections.PrimaryColor,
                      TextString: "Academic Preference",
                      FontSize: 18,
                      FromBottom: 0,
                      FromTop: 0,
                      TextFontWeight: FontWeight.w400,
                      // TextFontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black54,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 20,
                  TextColor: themeData.primary,
                  TextString: "Academic Information",
                  FontSize: 20,
                  TextFontWeight: FontWeight.w900,
                ),
                ReusableText(
                  FromTop: 18,
                  TextColor: themeData.primary,
                  TextString: "What calendar curriculum does your school",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                ReusableText(
                  FromTop: 0,
                  TextColor: themeData.primary,
                  TextString: "use?",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Semesters',
                      groupValue: selectedValue,
                      onChanged: (value) => setState(() => selectedValue = value),
                      activeColor: Colors.blue, // Selected color
                    ),
                    ReusableText(
                      FromTop: 0,
                      TextColor: themeData.primary,
                      TextString: "Semester",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Quarters',
                      groupValue: selectedValue,
                      onChanged: (value) => setState(() => selectedValue = value),
                      activeColor: Colors.blue, // Selected color
                    ),
                    ReusableText(
                      FromTop: 0,
                      TextColor: themeData.primary,
                      TextString: "Quarters",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w400,
                    ),
                  ],
                ),

                ReusableText(
                  FromTop: 10,
                  TextColor: themeData.primary,
                  TextString: "What was your last average score?",
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
                  TextColor: themeData.primary,
                  TextString: "What was your rank in class?",
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
                  TextColor: themeData.primary,
                  TextString: "How many students are there in your class?",
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
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: ColorCollections.SecondaryColor),
                    // color: themeData.primaryContainer,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        FromTop: 50,
                        TextColor: themeData.primary,
                        TextString: "Course Difficulty & Preferences",
                        FontSize: 20,
                        TextFontWeight: FontWeight.w900,
                      ),
                      ReusableText(
                        FromTop: 25,
                        TextColor: themeData.primary,
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
                                          TextColor: themeData.primary,
                                          FontSize: 18,
                                        ),
                                        ReusableText(
                                          TextString:
                                          (state.courseDifficulty?[index] ?? 1.0)
                                              .toStringAsFixed(0),
                                          TextColor: themeData.primary,
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
                        TextColor: themeData.primary,
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
                        TextColor: themeData.primary,
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
                        TextColor: themeData.primary,
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
                    ],
                  ),
                ),
               Container(
                 padding: EdgeInsets.all(5),
                 margin: EdgeInsets.only(top: 10),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     // border: Border.all(color: ColorCollections.SecondaryColor),
                     // color: themeData.primaryContainer
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     ReusableText(
                       FromTop: 20,
                       TextColor: themeData.primary,
                       TextString: "Upcoming Final Exam",
                       FontSize: 20,
                       TextFontWeight: FontWeight.w900,
                     ),

                     ReusableText(
                       // FromLeft: 20,FromRight: 20,
                       FromTop: 30,
                       FromBottom: 0,
                       TextColor: themeData.onPrimary,
                       TextString: "Select the date of your Final Exam this will help us create a study schedule for you.",
                       FontSize: 16,
                       TextFontWeight: FontWeight.w400,
                     ),

                     InkWell(
                       onTap: () => _selectDate(),
                       child: Container(
                         margin: EdgeInsets.only(top: 50),
                         height: 60,
                         decoration: BoxDecoration(
                           color: themeData.primaryContainer,
                           borderRadius: BorderRadius.circular(10),
                           // border: Border.all(color: Colors.grey.shade300),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             ReusableText(
                               // FromTop: 50,
                               TextColor: themeData.primary,
                               TextString: finalDate == null
                                   ? "Select the final date"
                                   : DateFormat.yMMMd().add_jm().format(finalDate!),
                               FontSize: 17,
                               TextFontWeight: FontWeight.w400,
                             ),
                             Icon(Icons.calendar_month),
                           ],
                         ),
                       ),
                     ),

                   ],
                 ),
               ),
                reusableButtonContainer(
                    context, "Save the changes", Colors.blue, Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        finalDate = _picked;
      });
    }
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
              context, '/index_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 40, right: 3, left: 3,bottom: 20),
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
