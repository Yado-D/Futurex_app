import 'dart:math';

import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/welcome%20page/welcome_page_2_bloc/welcome_page_2_bloc.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:numberpicker/numberpicker.dart';

class Welcome_Profile_Setup_Page_2 extends StatefulWidget {
  Welcome_Profile_Setup_Page_2({super.key});

  @override
  State<Welcome_Profile_Setup_Page_2> createState() =>
      _Welcome_Profile_Setup_Page_2State();
}

class _Welcome_Profile_Setup_Page_2State
    extends State<Welcome_Profile_Setup_Page_2> {
  int hour = 1;
  int minute = 0;
  String timeFormat = "AM";
  double weekendStudyHour = 3;
  double StudyDurationHour = 3;
  double _currentValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: LinearProgressBar(
                  maxSteps: 5,
                  progressType: LinearProgressBar
                      .progressTypeLinear, // Use Linear progress
                  currentStep: 2,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10), //  NEW
                ),
              ),
              Center(
                child: ReusableText(
                  FromTop: 50,
                  TextColor: ColorCollections.Black,
                  TextString: "Study Schedule",
                  FontSize: 23,
                  TextFontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                    FromTop: 10,
                    TextColor: ColorCollections.Black,
                    TextString: "Set your preferred study schedule to optimize",
                    FontSize: 16,
                    TextFontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Center(
                child: ReusableText(
                  FromTop: 10,
                  TextColor: Colors.grey.shade700,
                  TextString: "your learning.",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromTop: 10,
                      TextColor: Colors.grey.shade900,
                      TextString: "Preferred study time",
                      FontSize: 20,
                      TextFontWeight: FontWeight.w500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                          value: hour,
                          minValue: 0,
                          maxValue: 100,
                          onChanged: (value) {
                            setState(() {
                              hour = value;
                            });
                          },
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 18),
                          selectedTextStyle: TextStyle(
                              color: Colors.blue.shade500, fontSize: 20),
                          decoration: BoxDecoration(
                              // border: Border(
                              //   top: BorderSide(color: Colors.blue),
                              //   bottom: BorderSide(color: Colors.blue),
                              // ),
                              ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NumberPicker(
                          value: minute,
                          minValue: 0,
                          maxValue: 100,
                          onChanged: (value) {
                            setState(() {
                              minute = value;
                            });
                          },
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 18),
                          selectedTextStyle: TextStyle(
                              color: Colors.blue.shade500, fontSize: 20),
                          decoration: BoxDecoration(
                              // border: Border(
                              //     top: BorderSide(color: Colors.blue),
                              //     bottom: BorderSide(color: Colors.blue),
                              // ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      timeFormat = "AM";
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: timeFormat == "AM"
                                          ? Colors.blue
                                          : Colors.blue.shade300,
                                    ),
                                    child: Center(
                                      child: ReusableText(
                                        TextString: "AM",
                                        FontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      timeFormat = "PM";
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: timeFormat == "PM"
                                          ? Colors.blue
                                          : Colors.blue.shade300,
                                    ),
                                    child: Center(
                                      child: ReusableText(
                                        TextString: "PM",
                                        FontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 20, top: 10,bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromTop: 10,
                      FromBottom: 10,
                      TextColor: ColorCollections.Black,
                      TextString: "Study Duration(hour)",
                      FontSize: 20,
                      TextFontWeight: FontWeight.w600,
                    ),
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 5,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 12,
                                disabledThumbRadius: 12,
                                elevation: 4,
                              ),
                              activeTrackColor: Colors.blue.shade100,
                              inactiveTrackColor: Colors.blue.shade100,
                              thumbColor: Colors.blue,
                              overlayColor: Colors.blue.withOpacity(0.2),
                              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                              valueIndicatorColor: Colors.blue,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Slider(
                              value: StudyDurationHour,
                              min: 0,
                              max: 6,
                              divisions: 7,
                              label: '${StudyDurationHour.round()} Hour',
                              onChanged: (double value) {
                                setState(() {
                                  StudyDurationHour = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) => Text(
                              '$index',
                              style: TextStyle(
                                color: StudyDurationHour.round() == index
                                    ? Colors.blue
                                    : Colors.grey,
                                fontWeight: StudyDurationHour.round() == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 20, top: 10,bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromTop: 10,
                      FromBottom: 10,
                      TextColor: ColorCollections.Black,
                      TextString: "Weekend Study Duration(hour)",
                      FontSize: 20,
                      TextFontWeight: FontWeight.w600,
                    ),
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 5,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 12,
                                disabledThumbRadius: 12,
                                elevation: 4,
                              ),
                              activeTrackColor: Colors.blue.shade100,
                              inactiveTrackColor: Colors.blue.shade100,
                              thumbColor: Colors.blue,
                              overlayColor: Colors.blue.withOpacity(0.2),
                              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                              valueIndicatorColor: Colors.blue,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Slider(
                              value: StudyDurationHour,
                              min: 0,
                              max: 6,
                              divisions: 7,
                              label: '${StudyDurationHour.round()} Hour',
                              onChanged: (double value) {
                                setState(() {
                                  StudyDurationHour = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) => Text(
                              '$index',
                              style: TextStyle(
                                color: StudyDurationHour.round() == index
                                    ? Colors.blue
                                    : Colors.grey,
                                fontWeight: StudyDurationHour.round() == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
               Container(
                 margin: const EdgeInsets.only(top: 20),
                 padding: const EdgeInsets.only(left: 20, top: 10,bottom: 30,right: 20),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     ReusableText(
                             FromTop: 20,
                             FromBottom: 30,
                             TextColor: ColorCollections.Black,
                             TextString: "Rest Day",
                             FontSize: 18,
                             TextFontWeight: FontWeight.w700,
                           ),
                     DropdownMenu(
                         width: double.infinity,
                         onSelected: (value) {
                           setState(() {});
                         },
                         initialSelection: "None",
                         inputDecorationTheme: const InputDecorationTheme(
                           border: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.white), // Border color
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.white), // Unfocused border
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.white), // Focused border
                           ),
                         ),
                         dropdownMenuEntries: const[
                           DropdownMenuEntry(
                             value: "Monday",
                             label: "Monday",
                           ),
                           DropdownMenuEntry(
                             value: "Tuesday",
                             label: "Tuesday",
                           ),
                           DropdownMenuEntry(
                             value: "Wendsday",
                             label: "Wendsday",
                           ),
                           DropdownMenuEntry(
                             value: "Thursday",
                             label: "Thursday",
                           ),
                           DropdownMenuEntry(
                             value: "Friday",
                             label: "Friday",
                           ),
                           DropdownMenuEntry(
                             value: "Saturday",
                             label: "Saturday",
                           ),
                           DropdownMenuEntry(
                             value: "Sunday",
                             label: "Sunday",
                           ),
                           DropdownMenuEntry(
                             value: "None",
                             label: "None",
                           ),
                         ]),
                   ],
                 ),
               ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       width: 5,
              //     ),
              //     NumberPicker(
              //       value: StudyDurationHour,
              //       minValue: 0,
              //       maxValue: 100,
              //       onChanged: (value) {
              //         setState(() {
              //           StudyDurationHour = value;
              //         });
              //       },
              //       textStyle:
              //           TextStyle(color: Colors.grey.shade500, fontSize: 18),
              //       selectedTextStyle:
              //           TextStyle(color: Colors.blue.shade500, fontSize: 20),
              //       decoration: BoxDecoration(
              //           border: Border(
              //               top: BorderSide(color: Colors.blue),
              //               bottom: BorderSide(color: Colors.blue))),
              //     ),

              // Row(
              //   children: [
              //     ReusableText(
              //       FromTop: 20,
              //       FromBottom: 0,
              //       TextColor: ColorCollections.Black,
              //       TextString: "Weekend Study hour",
              //       FontSize: 18,
              //       TextFontWeight: FontWeight.w500,
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 30,
              //     ),
              //     NumberPicker(
              //       value: weekendStudyHour,
              //       minValue: 0,
              //       maxValue: 100,
              //       onChanged: (value) {
              //         setState(() {
              //           weekendStudyHour = value;
              //         });
              //       },
              //       textStyle:
              //           TextStyle(color: Colors.grey.shade500, fontSize: 18),
              //       selectedTextStyle:
              //           TextStyle(color: Colors.blue.shade500, fontSize: 20),
              //       decoration: BoxDecoration(
              //         // border: Border(
              //         //   top: BorderSide(color: Colors.blue),
              //         //   bottom: BorderSide(color: Colors.blue),
              //         // ),
              //       ),
              //     ),
              //   ],
              // ),
              reusableButtonContainer(
                  context, "Continue", Colors.blue, Colors.white),
              reusableButtonContainer(
                  context, "Back", Colors.white, Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  List<String> contentOfButton = [
    "Math",
    "Science",
    "History",
    "English",
    "Language",
    "Art",
  ];

  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Back") {
          Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/welcome_profile_setup_3_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 20),
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
