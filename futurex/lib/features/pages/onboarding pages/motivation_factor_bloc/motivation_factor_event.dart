part of 'motivation_factor_bloc.dart';

@immutable
sealed class MotivationFactorEvent {}

class MotivationFactorClickedEvent extends MotivationFactorEvent{
  bool isChecked;
  int index;
  MotivationFactorClickedEvent({
    required this.isChecked,
    required this.index,
  });
}
class MotivationFactorLoadingEvent extends MotivationFactorEvent{
}