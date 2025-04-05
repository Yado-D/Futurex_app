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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Container(
          margin: EdgeInsets.all(15),
          child: BlocConsumer<QuizBloc, QuizState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              print("state is : ${state}");
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    TextColor: Colors.black,
                    TextString: "Daily Challenge",
                    FontSize: 25,
                    TextFontWeight: FontWeight.w900,
                    // TextFontWeight: FontWeight.bold,
                  ),
                  ReusableText(
                    TextColor: Colors.grey.shade700,
                    TextString: "Question 1 of 5",
                    FontSize: 20,
                    // TextFontWeight: FontWeight.w900,
                    // TextFontWeight: FontWeight.bold,
                  ),
                  ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            QuizReusableChoiceContainer(
                                context,
                                questionChooseContent[index],
                                index,
                                state
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: reusableButtonContainer(
                              context, "Previous", Colors.white, Colors.black)),
                      Expanded(
                          child: reusableButtonContainer(
                              context, "Next", Colors.blue, Colors.white)),
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

  List<String> questionChooseContent = [
    "London",
    "France",
    "Berlin",
    "Paris",
  ];
  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Next") {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizResult()));
        } else {
          // Navigator.pushNamedAndRemoveUntil(
          //     context, '/index_page', (predicate) => true);
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

  Widget QuizReusableChoiceContainer(BuildContext context,String choiceContent,int index,dynamic state) {
    return InkWell(
      onTap: () {
        if(state.content==null){
          print("state is null");
          context.read<QuizBloc>().add(
              QuizAnswerClickedEvent(
                  value: index,
                  contColor: Colors.blue,
                  txtColor: Colors.white,
                  content: choiceContent ));
        }
        print("state is not null");
        print(state);

      },
      child: Container(
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: state.value==index? state.contColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey.shade200),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ReusableText(
              TextColor: state.value==index? state.txtColor:Colors.grey.shade900,
              TextString: choiceContent,
              FontSize: 20,
              // TextFontWeight: FontWeight.w900,
              TextFontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
