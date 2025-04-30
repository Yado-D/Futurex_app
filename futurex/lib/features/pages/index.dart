import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/AI_page/ai_page.dart';
import 'package:futurex/features/pages/home/home_page.dart';
import 'package:futurex/features/pages/quiz/quiz_page.dart';
import 'package:futurex/features/pages/setting/setting_page.dart';
import 'package:futurex/features/pages/study/study_page.dart';
import 'package:futurex/models/notificationModel.dart';
import 'package:futurex/services/notification_services.dart';
import 'package:futurex/utils/color_collections.dart';

class Index_Page extends StatefulWidget {
  const Index_Page({super.key});

  @override
  State<Index_Page> createState() => _Index_PageState();
}

class _Index_PageState extends State<Index_Page> {
  NotificationsSentObject noObj = NotificationsSentObject(
    content: "content",
    isSent: false,
    date: DateTime.now(),
  );

  int bottom_nav_index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: pages[bottom_nav_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          unselectedItemColor: Colors.grey.shade500,
          selectedItemColor: Colors.blue,
          currentIndex: bottom_nav_index,
          onTap: (index) {
            setState(() {
              bottom_nav_index = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer_outlined), label: "Study"),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "Quiz"),
            BottomNavigationBarItem(icon: Icon(Icons.memory), label: "AI"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }

  List<Widget> pages = [
    Home_Page(),
    PomodoroTimerPage(),
    Quiz_Page(),
    AIPage(),
    Settings_Page()
  ];
}
