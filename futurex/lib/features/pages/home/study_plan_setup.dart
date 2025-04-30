import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class StudyPlanSetup extends StatefulWidget {
  const StudyPlanSetup({super.key});

  @override
  State<StudyPlanSetup> createState() => _StudyPlanSetupState();
}

class _StudyPlanSetupState extends State<StudyPlanSetup> {
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
                    ReusableText(
                      TextColor: ColorCollections.PrimaryColor,
                      TextString: "Study Plan Setup",
                      FontSize: 18,
                      FromBottom: 0,
                      FromTop: 0,
                      TextFontWeight: FontWeight.w400,
                      // TextFontWeight: FontWeight.bold,
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
                  // TextFontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          ReusableText(
            TextColor: themeData.primary,
            TextString: "Choose Your Plan Setup",
            FontSize: 18,
            FromBottom: 0,
            FromTop: 20,
            FromLeft: 15,
            TextFontWeight: FontWeight.w700,
            // TextFontWeight: FontWeight.bold,
          ),
          CommonStudySetupContainer(
            title: "Daily Plan",
            subTitle: "Get organized tasks for each day",
            onTap: () {
              Navigator.pushNamed(context, "/specific_study_plan_setup_page");
            },
          ),
          CommonStudySetupContainer(
            title: "Weekly Plan",
            subTitle: "Plan your study week by week",
            onTap: () {
              Navigator.pushNamed(context, "/specific_study_plan_setup_page");
            },
          ),
          CommonStudySetupContainer(
            title: "Monthly Plan",
            subTitle: "Long-term planning month by month",
            onTap: () {
              Navigator.pushNamed(context, "/specific_study_plan_setup_page");
            },
          ),
          CommonStudySetupContainer(
            title: "Final Exam Plan",
            subTitle: "Prepare until your final exam",
            onTap: () {
              Navigator.pushNamed(context, "/specific_study_plan_setup_page");
            },
          ),

        ],
      )),
    );
  }

  Widget CommonStudySetupContainer(
      {required String title,
      required String subTitle,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 13,left: 15,right: 15),
        padding: EdgeInsets.all(12),
        // height: 250,
        // width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade200.withOpacity(0.2),
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(0, 0),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                ReusableText(
                  TextColor: Theme.of(context).colorScheme.primary,
                  TextString: title,
                  FontSize: 18,
                  FromBottom: 0,
                  TextFontWeight: FontWeight.w900,
                ),
                ReusableText(
                  TextColor: Theme.of(context).colorScheme.primary,
                  TextString: subTitle,
                  FontSize: 16,
                  FromBottom: 10,
                  TextFontWeight: FontWeight.w500,
                ),
              ],
            ),
            Icon(
              Icons.keyboard_double_arrow_right,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
