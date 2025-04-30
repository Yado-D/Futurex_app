import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class Welcome_Page_4 extends StatefulWidget {
  const Welcome_Page_4({super.key});

  @override
  State<Welcome_Page_4> createState() => _Welcome_Page_4State();
}

class _Welcome_Page_4State extends State<Welcome_Page_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [
            buildStepProgressBar(4, 5), // 3 filled steps out of 5
            Center(
              child: ReusableText(
                FromTop: 70,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "Course Difficulty Ranking",
                FontSize: 25,
                TextFontWeight: FontWeight.w900,
              ),
            ),
            Center(
              child: ReusableText(
                FromTop: 10,
                FromBottom: 0,
                TextColor: Colors.grey.shade600,
                TextString: "Please order your courses from most difficult",
                FontSize: 16,
                TextFontWeight: FontWeight.w400,
              ),
            ),
            Center(
              child: ReusableText(
                // FromTop: 50,
                TextColor: Colors.grey.shade600,
                TextString: " (top) to least difficult (bottom).",
                FontSize: 16,
                TextFontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ReorderableListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                for (int i = 0; i < courses.length; i++)
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade100)),
                    key: ValueKey(courses[i]),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 70,
                          child: Icon(
                            Icons.grid_view,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // width: 220,
                                child: ReusableText(
                                  // FromTop: 50,
                                  TextColor: Colors.black54,
                                  TextString: courses[i],
                                  FontSize: 18,
                                  TextFontWeight: FontWeight.w700,
                                  FromLeft: 10,
                                  FromTop: 30,
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
                                  if (i < courses.length - 1) {
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
            SizedBox(height: 20,),
            reusableButtonContainer(
                context, "Continue", ColorCollections.QuaterneryColor, Colors.white),
            SizedBox(height: 20,),
            reusableButtonContainer(
                context, "Back", Colors.white, Colors.black54),
          ],
        ),
      ),
    );
  }

  final List courses = [
    "Mathematics",
    "English",
    "Physics",
    "Chemistry",
    "Biology",
    "Civics and Ethical Education",
    "Geography",
    "History",
    "Information Technology",
    "SAT",
  ];

  void updateMySubjectPosition(int oldIndex, int newIndex) {
    setState(() {
      final course = courses.removeAt(oldIndex);
      courses.insert(newIndex, course);
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
              context, '/welcome_profile_setup_5_page', (predicate) => true);
        }
      },
      child: Container(
        // margin: EdgeInsets.only(top: 20, right: 3, left: 3),
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
