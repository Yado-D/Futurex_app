import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:futurex/utils/notifications_utils.dart';

import '../models/notificationModel.dart';

Future<void> createNotification(NotificationsSentObject noObj)async{
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      color: ColorCollections.QuaterneryColor,
      id: createUniqueId(),
      channelKey: 'Basic_channel',
      title: '<b>Futurex</b>',
      body: "✨ Fuck you! 🌟",
      notificationLayout: NotificationLayout.BigPicture,
      // bigPicture: noObj.content ??'resource://drawable/res_tlefli_icon',
      // notificationLayout: NotificationLayout.BigPicture,
      // color: Color(0xFFFFFFFF),
    ),
  );
}
Future<void> createScheduledNotification(NotificationsSentObject noObj,int hour)async{
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'schedule_channel',
      title: 'We found your Item! please go and check it out.',
      body: noObj.content ?? "",
      // customSound: 'resource://raw/res_custom_notification',
      // bigPicture: 'asset://assets/notification_map.png',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: "MARK_DONE",
        label: "Mark Done",
      ),
    ],
    schedule: NotificationCalendar(
      // weekday: notificationSchedule.dayOfTheWeek,
      // hour: hour,
      // minute: notificationSchedule.timeOfDay.minute,
      second: hour,
      millisecond: 0,
      repeats: true,
    ),
  );
}
Future<void> cancelScheduledNotification()async{
  await AwesomeNotifications().cancelAllSchedules();
}