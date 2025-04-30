part of 'welcome_page_2_bloc.dart';

@immutable
sealed class WelcomePage2Event {}

class WelcomeProfileSetup2ButtonClickedAddEvent extends WelcomePage2Event {
  int value;
  Color contColor;
  Color txtColor;
  String content;

  WelcomeProfileSetup2ButtonClickedAddEvent({
    required this.value,
    required this.contColor,
    required this.txtColor,
    required this.content
  });
}
  class WelcomeProfileSetup2ButtonClickedDeleteEvent extends WelcomePage2Event{
  List<PreferredSubject> subjects;
  WelcomeProfileSetup2ButtonClickedDeleteEvent({
  required this.subjects,
  });
}

//for subjeect improv

class WelcomeProfileSetup2ImproveButtonClickedAddEvent extends WelcomePage2Event {
  int value;
  Color contColor;
  Color txtColor;
  String content;

  WelcomeProfileSetup2ImproveButtonClickedAddEvent({
    required this.value,
    required this.contColor,
    required this.txtColor,
    required this.content
  });
}
class WelcomeProfileSetup2ImproveButtonClickedDeleteEvent extends WelcomePage2Event{
  List<PreferredSubject> subjects;
  WelcomeProfileSetup2ImproveButtonClickedDeleteEvent({
    required this.subjects,
  });
}
