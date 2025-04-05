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
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: LinearProgressBar(
                maxSteps: 5,
                progressType:
                LinearProgressBar.progressTypeLinear, // Use Linear progress
                currentStep: 4,
                progressColor: Colors.blue,
                backgroundColor: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10), //  NEW
              ),
            ),
            Center(
              child: ReusableText(
                FromTop: 50,
                TextColor: ColorCollections.Black,
                TextString: "Course Difficulty Ranking",
                FontSize: 23,
                TextFontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: ReusableText(
                FromTop: 10,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: "Please rank your courses from most ",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
            ),
            Center(
              child: ReusableText(
                // FromTop: 50,
                TextColor: ColorCollections.Black,
                TextString: "difficult (top) to least difficult (bottom).",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20,),
            ReorderableListView(
              shrinkWrap: true,
              children: [
                for (int i=0;i<courses.length;i++)
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade100)
                    ),
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
                                ),
                              ),
                              ReusableText(
                                FromTop: 0,
                                FromBottom: 0,
                                TextColor: Colors.black54,
                                TextString: "CS401",
                                FontSize: 14,
                                TextFontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 97,
                          child: Row(
                            children: [
                              IconButton(
                                color:Colors.black,
                                onPressed: () {
                                  if(i>0){
                                    updateMySubjectPosition(i,i-1);
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              IconButton(
                                onPressed: (){
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
            reusableButtonContainer(context,"Continue",Colors.blue,Colors.white),
            reusableButtonContainer(context,"Back",Colors.white,Colors.black54),
          ],
        ),
      ),
    );
  }
  final List courses = [
    "Introduction to Computer ",
    "Data Structures and Algorithm ",
    "Database Systems ",
    "Web Development",
    "Artificial Intelligence",
  ];

  void updateMySubjectPosition(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
    });
    final course = courses.removeAt(oldIndex);
    courses.insert(newIndex, course);
  }

  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Back") {
          // Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/welcome_profile_setup_5_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 3, left: 3),
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
