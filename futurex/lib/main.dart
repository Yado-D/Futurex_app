import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futurex/features/pages/AI_page/ai_service.dart';
import 'package:futurex/features/pages/home/home_page.dart';
import 'package:futurex/route_handler/pages.dart';
import 'package:futurex/services/global.dart';
import 'package:futurex/services/pomodoro_study_provider.dart';
import 'package:futurex/services/theme_mode_provider.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:futurex/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  AwesomeNotifications().initialize(
    "resource://drawable/res_futurex_notifications_icon",
    [
      NotificationChannel(
        channelKey: 'Basic_channel',
        channelName: 'Basic Notification',
        defaultColor: ColorCollections.TeritiaryColor,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        playSound: true,
        // soundSource: "resource://raw/res_custom_notification",
        channelDescription:
        "Basic notification enables the notification for Basic event like when item matched exists.",
      ),
      NotificationChannel(
        channelKey: 'schedule_channel',
        channelName: 'Schedule Notification',
        defaultColor: ColorCollections.QuaterneryColor,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        locked: true,
        channelDescription:
        "Schedule notification enables the notification for scheduled event like user not respond to the item matched.",
      ),
    ],
  );
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeManager themeManager = ThemeManager();

  @override
  void initState() {
    themeManager.addListener(themeListener);
    // TODO: implement initState
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {

      });
    }
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: RepositoryProvider(
        create: (context) => AIService(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeManager()),
            ChangeNotifierProvider(create: (_) => PomodoroTimerService()),
          ],
          builder: (BuildContext context, child) =>
              MultiBlocProvider(
                providers: [...NamedRouteSettings.allBlocProviders(context)],
                child: MaterialApp(
                  theme: lightMode,
                  darkTheme: darkMode,
                  themeMode: context
                      .watch<ThemeManager>()
                      .themeMode,
                  onGenerateRoute: NamedRouteSettings.GenerateRouteSettings,
                  debugShowCheckedModeBanner: false,
                ),
              ),
        ),
      ),
    );
  }
}
