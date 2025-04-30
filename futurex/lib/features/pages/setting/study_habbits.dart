import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class StudyHabbitPage extends StatefulWidget {
  const StudyHabbitPage({super.key});

  @override
  State<StudyHabbitPage> createState() => _StudyHabbitPageState();
}

class _StudyHabbitPageState extends State<StudyHabbitPage> {
  double studyTimeOfDayInHour = 3;
  double studyTimeOfDayInMinute = 3;
  double studyDurationPerWeekend = 3;
  double studyWeekendHour = 3;
  double studyWeekendMinute = 3;
  double wakeupTimeOfDayInHour = 3;
  double wakeupTimeOfDayInMinute = 3;

  String studyTimeOfDayTimeFormat = "PM";
  String restDay = "PM";
  String wakeupTimeOfDayTimeFormat = "PM";

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: themeData.background,
      body: SafeArea(
        child: ListView(
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
                        TextString: "Study Habits",
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
              margin: EdgeInsets.all(10),
              child: ReusableSchedulingInformation(
                  context: context,
                  studyTimeOfDayInHour: studyTimeOfDayInHour,
                  studyTimeOfDayInMinute: studyTimeOfDayInMinute,
                  studyTimeOfDayTimeFormat: studyTimeOfDayTimeFormat,
                  studyDurationPerWeekend: studyDurationPerWeekend,
                  studyWeekendHour: studyWeekendHour,
                  studyWeekendMinute: studyWeekendMinute,
                  restDay: restDay,
                  wakeupTimeOfDayInHour: wakeupTimeOfDayInHour,
                  wakeupTimeOfDayInMinute: wakeupTimeOfDayInMinute,
                  wakeupTimeOfDayTimeFormat: wakeupTimeOfDayTimeFormat,
                  studyTimeOfDayInHourFunction: (value) {
                    setState(() {
                      studyTimeOfDayInHour=value.toDouble();
                    });
                  },
                  studyTimeOfDayInMinuteFunction: (value) {
                    setState(() {
                      studyTimeOfDayInMinute=value.toDouble();
                    });
                  },
                  studyTimeOfDayTimeFormatFunction: () {
                    setState(() {
                      if(studyTimeOfDayTimeFormat=="PM"){
                        studyTimeOfDayTimeFormat="AM";
                      }else{
                        studyTimeOfDayTimeFormat="PM";
                      }
                    });
                  },
                  studyDurationPerWeekendFunction: (value) {
                    setState(() {
                      studyDurationPerWeekend=value;
                    });
                  },
                  studyWeekendHourFunction: (value) {
                    setState(() {
                      studyWeekendHour=value;
                    });
                  },
                  restDayFunction: (value) {
                    setState(() {
                      restDay=value!;
                    });
                  },
                  wakeupTimeOfDayInHourFunction: (value) {
                    setState(() {
                      wakeupTimeOfDayInHour=value.toDouble();
                    });
                  },
                  wakeupTimeOfDayInMinuteFunction: (value) {
                    setState(() {
                      wakeupTimeOfDayInMinute=value.toDouble();
                    });
                  },
                  wakeupTimeOfDayTimeFormatFunction: () {
                    setState(() {
                      if(wakeupTimeOfDayTimeFormat=="PM"){
                        wakeupTimeOfDayTimeFormat="AM";
                      }else{
                        wakeupTimeOfDayTimeFormat="PM";
                      }
                    });
                  }),
            ),
            SizedBox(height: 30),

            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    FromLeft: 15,
                    TextColor: themeData.primary,
                    TextString:"Learning Style",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w700,
                  ),
                  ReorderableListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (int i = 0; i < preferredWay.length; i++)
                        Container(
                          margin: EdgeInsets.only(bottom: 5,top: 5),
                          decoration: BoxDecoration(
                            color: themeData.primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.grey.shade100),
                          ),
                          key: ValueKey(preferredWay[i]),
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 70,
                                child: Icon(
                                  Icons.grid_view,
                                  color: themeData.primary,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 15, left: 10),
                                      child: Icon(
                                        icons[i],
                                        color: ColorCollections.QuaterneryColor,
                                        size: 30,
                                      ),
                                    ),
                                    Container(
                                      // width: 220,
                                      child: ReusableText(
                                        // FromTop: 50,
                                        TextColor: themeData.primary,
                                        TextString: preferredWay[i],
                                        FontSize: 18,
                                        TextFontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 97,
                                child: Row(
                                  children: [
                                    IconButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        if (i > 0) {
                                          updateMySubjectPosition(i, i - 1);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (i < preferredWay.length - 1) {
                                          print("inside arrow down");
                                          updateMySubjectPosition(i, i + 1);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_downward_rounded,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                    onReorder: (oldIndex, newIndex) =>
                        updateMySubjectPosition(oldIndex, newIndex),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            reusableButtonContainer(
                context, "Save Changes", ColorCollections.QuaterneryColor, Colors.white),
          ],
        ),
      ),
    );
  }

  List<IconData> icons = [
    Icons.video_call,
    Icons.event_note_outlined,
    Icons.menu_book
  ];

  final List preferredWay = [
    "Video Lessons ",
    "Short NoteD",
    "Text book",
  ];

  void updateMySubjectPosition(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final course = preferredWay.removeAt(oldIndex);
      final icon = icons.removeAt(oldIndex);

      icons.insert(newIndex, icon);
      preferredWay.insert(newIndex, course);
    });
  }

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
        margin: EdgeInsets.only(top: 10, right: 15, left: 15,bottom: 20),
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
