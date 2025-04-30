import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class StudyWithFriend extends StatefulWidget {
  const StudyWithFriend({super.key});

  @override
  State<StudyWithFriend> createState() => _StudyWithFriendState();
}

class _StudyWithFriendState extends State<StudyWithFriend> {
  String? haveFriend;
  String? competeWithFriend;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            buildStepProgressBar(9, 11),
            ReusableText(
              FromTop: 50,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "Study with Friends",
              FontSize: 25,
              TextFontWeight: FontWeight.w900,
            ),
            ReusableText(
              FromTop: 10,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "Studying with friends can make it even more fun. ",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            ReusableText(
              FromTop: 18,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "Let's do this together!",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            ReusableText(
              FromTop: 0,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "Do you have a friend that is a member of Future?",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: haveFriend,
                  onChanged: (value) => setState(() => haveFriend = value),
                  activeColor: Colors.blue, // Selected color
                ),
                ReusableText(
                  FromTop: 0,
                  TextColor: ColorCollections.TeritiaryColor,
                  TextString: "Yes",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'No',
                  groupValue: haveFriend,
                  onChanged: (value) => setState(() => haveFriend = value),
                  activeColor: Colors.blue, // Selected color
                ),
                ReusableText(
                  FromTop: 0,
                  TextColor: ColorCollections.TeritiaryColor,
                  TextString: "No",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
              ],
            ),

            ReusableText(
              FromTop: 10,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "What's your friend's name?",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            reusableTextField(
              context: context,
              FromLeft: 0,
              FromRight: 25,
              hintText: "Enter your friend's name",
              textType: "name",
              onchange: (onchange) {},
            ),
            ReusableText(
              FromTop: 10,
              TextColor: ColorCollections.TeritiaryColor,
              TextString: "Would you like to compete with your friends on study streaks?",
              FontSize: 18,
              TextFontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: competeWithFriend,
                  onChanged: (value) => setState(() => competeWithFriend = value),
                  activeColor: Colors.blue, // Selected color
                ),
                ReusableText(
                  FromTop: 0,
                  TextColor: ColorCollections.TeritiaryColor,
                  TextString: "Yes",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'No',
                  groupValue: competeWithFriend,
                  onChanged: (value) => setState(() => competeWithFriend = value),
                  activeColor: Colors.blue, // Selected color
                ),
                ReusableText(
                  FromTop: 0,
                  TextColor: ColorCollections.TeritiaryColor,
                  TextString: "No",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
              ],
            ),
            reusableButtonContainer(
                context, "Continue", ColorCollections.QuaterneryColor, Colors.white),
            reusableButtonContainer(
                context, "Back", ColorCollections.PrimaryColor, ColorCollections.TeritiaryColor),
          ],
        ),
      )),
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
              context, '/role_model_page', (predicate) => true);
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
