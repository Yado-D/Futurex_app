part of 'welcome_page_2_bloc.dart';

class WelcomePage2State {
  final List<PreferredSubject>? preferredSelectedSubject;
  final List<PreferredSubject>? improvedSelectedSubject;

  const WelcomePage2State({
    this.preferredSelectedSubject,
    this.improvedSelectedSubject,
  });

  WelcomePage2State copyWith({
    List<PreferredSubject>? preferredSelectedSubject,
    List<PreferredSubject>? improvedSelectedSubject,
  }) {
    return WelcomePage2State(
      preferredSelectedSubject: preferredSelectedSubject ?? this.preferredSelectedSubject,
      improvedSelectedSubject: improvedSelectedSubject ?? this.improvedSelectedSubject,
    );
  }
}

class PreferredSubject {
  int value;
  Color contColor;
  Color txtColor;
  String content;
  PreferredSubject(
      {required this.value,
      required this.contColor,
      required this.txtColor,
      required this.content});
}
