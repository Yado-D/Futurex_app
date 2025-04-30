import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/quiz/quiz_bloc/quiz_bloc.dart';
import 'package:futurex/features/pages/quiz/quiz_result_page.dart';

class Quiz_Page extends StatefulWidget {
  const Quiz_Page({super.key});

  @override
  State<Quiz_Page> createState() => _Quiz_PageState();
}

class _Quiz_PageState extends State<Quiz_Page> {
  // int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeData.background,
        body: Container(
          margin: EdgeInsets.all(15),
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state.questions == null) {
                return const Center(child: CircularProgressIndicator());
              }
              final question = state.questions!.quizes[state.currentIndex];
              final totalQuestions = state.questions!.quizes.length;

              return ListView(
                children: [
                  ReusableText(
                    TextColor: themeData.primary,
                    TextString: "Daily Challenge",
                    FontSize: 25,
                    TextFontWeight: FontWeight.w900,
                    // TextFontWeight: FontWeight.bold,
                  ),
                  ReusableText(
                    TextColor: themeData.onPrimary,
                    TextString:
                        'Question ${state.currentIndex + 1} of $totalQuestions',
                    FontSize: 20,
                    // TextFontWeight: FontWeight.w900,
                    // TextFontWeight: FontWeight.bold,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeData.primaryContainer,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          FromLeft: 30,
                          TextColor: themeData.primary,
                          TextString: "${question.text}",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w500,
                          // TextFontWeight: FontWeight.bold,
                        ),
                        ...question.options.asMap().entries.map((entry) {
                          final index = entry.key;
                          final option = entry.value;
                          final isSelected = state.selectedAnswerIndex == index;
                          final isCorrectAnswer = option.correct;
                          final showAnswer = state.isAnswered;

                          Color? bgColor;
                          if (showAnswer) {
                            bgColor = isCorrectAnswer
                                ? Colors.green
                                : isSelected
                                    ? Colors.red
                                    : null;
                          } else if (isSelected) {
                            bgColor = Colors.blue;
                          }

                          return Container(
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: themeData.primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                QuizReusableChoiceContainer(context,
                                    "${option.text}", index, state, bgColor),
                              ],
                            ),
                          );
                        }),
                        state.selectedAnswerIndex != null
                            ? ExpansionTile(
                                title: ReusableText(
                                  TextColor: themeData.primary,
                                  TextString: "Explanation",
                                  FontSize: 18,
                                ),
                                children: [
                                  ReusableText(
                                    FromLeft: 10,
                                    FromRight: 10,
                                    TextColor: themeData.onPrimary,
                                    TextString: question.explanation,
                                    FontSize: 16,
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: reusableButtonContainer(context, "Previous",
                              Colors.white, Colors.black, state)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: reusableButtonContainer(context, "Next",
                              Colors.blue, Colors.white, state)),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget reusableButtonContainer(BuildContext context, String content,
      Color contColor, Color txtColor, dynamic state) {
    return InkWell(
      onTap: () {
        if (content == "Next") {
          if (state.isAnswered && !state.isLastQuestion) {
            context.read<QuizBloc>().add(NextQuestion());
          } else if (state.isLastQuestion) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => QuizResult()));
          }
        } else {
          if (state.currentIndex > 0) {
            context.read<QuizBloc>().add(PreviousQuestion());
          }
        }
      },
      child: Container(
        // margin: EdgeInsets.only(top: 30, right: 3, left: 3),
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

  Widget QuizReusableChoiceContainer(BuildContext context, String choiceContent,
      int index, dynamic state, Color? bgColor) {
    return InkWell(
      onTap: () {
        if (!state.isAnswered) {
          print("before bloc answer selected event");
          context.read<QuizBloc>().add(AnswerSelected(index));
          print("after bloc answer selected event");
        }
        print("answered");
      },
      child: Container(
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.only(left: 15, bottom: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey.shade200),
        ),
        // height: 60,
        width: double.infinity,
        child: ReusableText(
          FromTop: 15,
          TextColor: bgColor != null
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary,
          TextString: choiceContent,
          FontSize: 18,
          // TextFontWeight: FontWeight.w900,
          TextFontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
