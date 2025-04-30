import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class OnboardingAcademicInformation extends StatefulWidget {
  const OnboardingAcademicInformation({super.key});

  @override
  State<OnboardingAcademicInformation> createState() =>
      _AcademicInformationState();
}

class _AcademicInformationState extends State<OnboardingAcademicInformation> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCollections.SecondaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              buildStepProgressBar(3, 11),
              ReusableText(
                FromTop: 50,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "Academic Information",
                FontSize: 25,
                TextFontWeight: FontWeight.w900,
              ),
              ReusableText(
                FromTop: 10,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "Now we're learning about your academic system.",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
              ReusableText(
                FromTop: 18,
                TextColor: ColorCollections.TeritiaryColor,
                TextString: "What calendar curriculum does your school",
                FontSize: 18,
                TextFontWeight: FontWeight.w400,
              ),
              ReusableText(
                FromTop: 0,
                TextColor: ColorCollections.TeritiaryColor,
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
                    TextColor: ColorCollections.TeritiaryColor,
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
                    TextColor: ColorCollections.TeritiaryColor,
                    TextString: "Quarters",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w400,
                  ),
                ],
              ),

              ReusableText(
                FromTop: 10,
                TextColor: ColorCollections.TeritiaryColor,
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
                TextColor: ColorCollections.TeritiaryColor,
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
                TextColor: ColorCollections.TeritiaryColor,
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
              SizedBox(height: 20,),
              reusableButtonContainer(
                  context, "Continue", ColorCollections.QuaterneryColor, Colors.white),
              reusableButtonContainer(
                  context, "Back", ColorCollections.PrimaryColor, ColorCollections.TeritiaryColor),
            ],
          ),
        ),
      ),
    );
  }
  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Back") {
          Navigator.pop(context);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/learning_style_page', (predicate) => true);
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
