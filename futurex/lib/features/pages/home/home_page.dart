import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/home/bloc/home_bloc.dart';
import 'package:futurex/models/notificationModel.dart';
import 'package:futurex/services/app_constants.dart';
import 'package:futurex/services/global.dart';
import 'package:futurex/services/theme_mode_provider.dart';
import 'package:futurex/utils/color_collections.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  NotificationsSentObject noObj = NotificationsSentObject(
    content: "content",
    isSent: false,
    date: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;
    final userName = Global.storageServices.getUserData(AppConstants.USER_NAME);

    return Scaffold(
      backgroundColor: themeData.background,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeManager>().toggleTheme();
                  },
                  icon: Icon(Icons.light_mode),
                ),
              ],
            ),
            ReusableText(
              TextColor: themeData.primary,
              FromLeft: 15,
              FromRight: 10,
              FromTop: 0,
              TextString: "Hi,$userName!",
              FontSize: 35,
              TextFontWeight: FontWeight.w900,
            ),
            ReusableText(
              TextColor: themeData.onPrimary,
              FromLeft: 15,
              FromRight: 10,
              // FromTop: 130,
              TextString: "Here's your study plan for today",
              FontSize: 20,
              TextFontWeight: FontWeight.w600,
            ),
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(12),
                  // height: 250,
                  // width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeData.primaryContainer,
                      // border: Border.all(color: Colors.grey.shade100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade200.withOpacity(0.2),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 0),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        TextColor: themeData.primary,
                        TextString: "Today's plan",
                        FontSize: 20,
                        FromBottom: 20,
                        TextFontWeight: FontWeight.w900,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, index) {
                            final planDone = state.todo ?? [];
                            bool? isPlanDone =
                                planDone.any((elm) => elm.index == index);

                            return homePlanRow(context, planTxt[index],
                                isPlanDone ?? false, index, planDone);
                          }),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/study_page');
                        },
                        child: ReusableContainer(context, Icons.timer_outlined,
                            "Start Study Sessions", 20),
                      ),
                    ],
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                //
                Navigator.pushNamed(context, "/study_plan_setup_page");
              },
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(12),
                // height: 250,
                // width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: themeData.primaryContainer,
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
                          TextColor: themeData.primary,
                          TextString: "Change your study plan setup",
                          FontSize: 20,
                          FromBottom: 10,
                          TextFontWeight: FontWeight.w900,
                        ),
                        ReusableText(
                          TextColor: themeData.onPrimary,
                          TextString: "Modify your courses and schedule",
                          FontSize: 16,
                          FromBottom: 10,
                          TextFontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right,
                      size: 30,
                      color: themeData.primary,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(12),
              // height: 250,
              // width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade200.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    TextColor: themeData.primary,
                    TextString: "Quick Morning Questions",
                    FontSize: 20,
                    FromBottom: 10,
                    TextFontWeight: FontWeight.w900,
                  ),
                  ReusableText(
                    TextColor: themeData.onPrimary,
                    TextString: "Test your knowledge with 5 quick questions",
                    FontSize: 16,
                    FromBottom: 10,
                    TextFontWeight: FontWeight.w500,
                  ),
                  ReusableContainer(
                      context, Icons.memory, "Take 5 Quick Question", 15),
                ],
              ),
            ),
            MotivationalReusableContainer(context, Icons.trending_up,
                "Stay Consistent", "You got this!", 10)
          ],
        ),
      ),
    );
  }

  List<String> planTxt = [
    "Math Chapter 5 Review",
    "Science Lab Report",
    "History Essay Research"
  ];

  Widget MotivationalReusableContainer(BuildContext context, IconData icon,
      String title, String subtitle, double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, left: 10, right: 10, bottom: 30),
      height: 90,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.grey.shade50]),
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Icon(
              icon,
              size: 40,
              color: ColorCollections.PrimaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 15,
                  FromBottom: 0,
                  TextString: title,
                  FontSize: 18,
                  TextFontWeight: FontWeight.bold,
                ),
                ReusableText(
                  TextString: subtitle,
                  FontSize: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ReusableContainer(
      BuildContext context, IconData icon, String title, double marginTop) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(left: 15),
            child: Icon(
              icon,
              size: 30,
              color: ColorCollections.PrimaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ReusableText(
              // FromTop: 15,
              FromBottom: 0,
              TextString: title,
              FontSize: 16,
              TextFontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget homePlanRow(BuildContext context, String content, bool is_todo_done,
      int index, List<TodoObject> todo) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              final subjectExists = todo.any((sub) => sub.index == index);

              if (!subjectExists) {
                // Add new subject
                context.read<HomeBloc>().add(
                    HomeTodoButtonClickEvent(is_todo_done: true, index: index));
              } else {
                // Remove existing subject
                final updatedSubjects =
                    todo.where((elm) => elm.index != index).toList();

                context
                    .read<HomeBloc>()
                    .add(HomeTodoButtonClickEvent(todo: updatedSubjects));
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 5, top: 3),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade500),
              ),
              child: is_todo_done
                  ? Icon(
                      Icons.check,
                      color: Colors.blue, // ✅ blue tick
                      size: 20,
                    )
                  : null,
            ),
          ),

          // ✅ Strike through text if done
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Text(
              content,
              style: TextStyle(
                color: is_todo_done
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: is_todo_done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none, // ✅ strike-through when done
              ),
            ),
          ),
        ],
      ),
    );
  }
}
