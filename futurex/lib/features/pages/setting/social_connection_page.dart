import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class SocialConnection extends StatefulWidget {
  const SocialConnection({super.key});

  @override
  State<SocialConnection> createState() => _SocialConnectionState();
}

class _SocialConnectionState extends State<SocialConnection> {
  String? haveFriend;
  String? competeWithFriend;

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
                        TextString: "Social Connections",
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
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: ColorCollections.SecondaryColor),
                  // color: ColorCollections.PrimaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    FromTop: 30,
                    TextColor: themeData.primary,
                    TextString: "Study with Friends",
                    FontSize: 20,
                    TextFontWeight: FontWeight.w900,
                  ),
                  ReusableText(
                    FromTop: 10,
                    TextColor: themeData.primary,
                    TextString: "Studying with friends can make it even more fun. ",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w400,
                  ),
                  ReusableText(
                    FromTop: 18,
                    TextColor: themeData.primary,
                    TextString: "Let's do this together!",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w400,
                  ),
                  ReusableText(
                    FromTop: 0,
                    TextColor: themeData.primary,
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
                        TextColor: themeData.primary,
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
                        TextColor: themeData.primary,
                        TextString: "No",
                        FontSize: 18,
                        TextFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),

                  ReusableText(
                    FromTop: 10,
                    TextColor: themeData.primary,
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
                    TextColor: themeData.primary,
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
                        TextColor: themeData.primary,
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
                        TextColor: themeData.primary,
                        TextString: "No",
                        FontSize: 18,
                        TextFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //user role choosing page

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: ColorCollections.SecondaryColor),
                  // color: ColorCollections.PrimaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    FromTop: 30,
                    TextColor: themeData.primary,
                    TextString: "Your Role Model",
                    FontSize: 20,
                    TextFontWeight: FontWeight.w900,
                  ),
                  ReusableText(
                    FromTop: 10,
                    TextColor: themeData.primary,
                    TextString: "Getting inspired by others keeps you moving forward. You're almost there!",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w400,
                  ),
                  ReusableText(
                    FromTop: 18,
                    TextColor: themeData.primary,
                    TextString: "Who do you admire the most and want to be like?",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w400,
                  ),
                  ReusableText(
                    FromTop: 10,
                    TextColor: themeData.primary,
                    TextString: "What's your friend's name?",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w400,
                  ),
                  reusableTextField(
                    context: context,
                    FromLeft: 0,
                    FromRight: 25,
                    hintText: "e.g., My mother, Albert Einstein, etc.",
                    textType: "name",
                    onchange: (onchange) {},
                  ),
                  ReusableText(
                    FromTop: 10,
                    TextColor: themeData.primary,
                    TextString: "Why do you admire this person?",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w400,
                  ),
                  reusableTextField(
                    context: context,
                    FromLeft: 0,
                    FromRight: 25,
                    hintText: "Share why this person inspires you",
                    textType: "name",
                    onchange: (onchange) {},
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
