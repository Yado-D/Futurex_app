import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';

class RollModel extends StatefulWidget {
  const RollModel({super.key});

  @override
  State<RollModel> createState() => _RollModelState();
}

class _RollModelState extends State<RollModel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCollections.SecondaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
              children: [
                buildStepProgressBar(10, 11),
                ReusableText(
                  FromTop: 50,
                  TextColor: ColorCollections.TeritiaryColor,
                  TextString: "Your Role Model",
                  FontSize: 25,
                  TextFontWeight: FontWeight.w900,
                ),
                ReusableText(
                  FromTop: 10,
                  TextColor: ColorCollections.TeritiaryColor,
                  TextString: "Getting inspired by others keeps you moving forward. You're almost there!",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                ),
                ReusableText(
                  FromTop: 18,
                  TextColor: ColorCollections.TeritiaryColor,
                  TextString: "Who do you admire the most and want to be like?",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
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
                  hintText: "e.g., My mother, Albert Einstein, etc.",
                  textType: "name",
                  onchange: (onchange) {},
                ),
                ReusableText(
                  FromTop: 10,
                  TextColor: ColorCollections.TeritiaryColor,
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
              context, '/hobbies_page', (predicate) => true);
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
