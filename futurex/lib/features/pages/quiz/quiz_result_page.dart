import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/quiz/quiz_page.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({super.key});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                TextColor: Colors.black,
                TextString: "Quiz Result",
                FontSize: 25,
                TextFontWeight: FontWeight.w900,
                // TextFontWeight: FontWeight.bold,
              ),
              Center(
                child: ReusableText(
                  FromTop: 70,
                  TextColor: Colors.black,
                  TextString: "4/5",
                  FontSize: 48,
                  TextFontWeight: FontWeight.w900,
                  // TextFontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: ReusableText(
                  FromTop: 10,
                  TextColor: Colors.grey.shade700,
                  TextString: "Good job! Keep practicing.",
                  FontSize: 20,
                  TextFontWeight: FontWeight.w700,
                  // TextFontWeight: FontWeight.bold,
                ),
              ),
              reusableButtonContainer(
                  context, "Try Again", Colors.blue, Colors.white),
              reusableButtonContainer(
                  context, "Back To Dashboard", Colors.white, Colors.black)
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
        if (content == "Try Again") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Quiz_Page()));
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/index_page', (predicate) => true);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 30, right: 3, left: 3),
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
