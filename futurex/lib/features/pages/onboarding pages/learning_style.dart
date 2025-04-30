import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class OnboardingLearningStyle extends StatefulWidget {
  const OnboardingLearningStyle({super.key});

  @override
  State<OnboardingLearningStyle> createState() => _OnboardingLearningStyleState();
}

class _OnboardingLearningStyleState extends State<OnboardingLearningStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          children: [
            buildStepProgressBar(4, 11), // 2 filled steps out of 5
            Center(
              child: ReusableText(
                FromTop: 70,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "Learning Style",
                FontSize: 25,
                TextFontWeight: FontWeight.w900,
              ),
            ),
            Center(
              child: ReusableText(
                FromTop: 10,
                FromBottom: 0,
                TextColor: Colors.grey.shade700,
                TextString: "Knowing how you learn best will help us support",
                FontSize: 16,
                TextFontWeight: FontWeight.w500,
              ),
            ),
            Center(
              child: ReusableText(
                // FromTop: 50,
                TextColor: Colors.grey.shade700,
                TextString: "you better. You're on the right track!",
                FontSize: 16,
                TextFontWeight: FontWeight.w500,
              ),
            ),

            ReorderableListView(
              shrinkWrap: true,
              children: [
                for (int i = 0; i < preferredWay.length; i++)
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade100)),
                    key: ValueKey(preferredWay[i]),
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
                                  TextColor: Colors.black54,
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

      if (oldIndex < newIndex &&oldIndex+1 != newIndex) {
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
              context, '/onboarding_course_difficulty', (predicate) => true);
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

Widget reusableButtonContainer(
    BuildContext context, String content, Color contColor, Color txtColor) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      splashColor: Colors.white.withOpacity(0.2), // optional: customize splash
      onTap: () {
        if (content == "Back") {
          // Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/welcome_profile_setup_4_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 3, left: 3),
        height: 55,
        decoration: BoxDecoration(
          color: contColor,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: ReusableText(
            TextColor: txtColor,
            FromRight: 10,
            TextString: content,
            FontSize: 18,
          ),
        ),
      ),
    ),
  );
}
