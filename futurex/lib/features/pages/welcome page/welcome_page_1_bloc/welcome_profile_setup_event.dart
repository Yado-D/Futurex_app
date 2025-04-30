part of 'welcome_profile_setup_bloc.dart';

@immutable
sealed class WelcomeProfileSetupEvent {}


class WelcomeProfileSetupButtonClickedEvent extends WelcomeProfileSetupEvent{
  int value;
  Color contColor;
  Color txxtColor;
  String content;
  WelcomeProfileSetupButtonClickedEvent({
    required this.value,
    required this.contColor,
    required this.txxtColor,
    required this.content
});
}
