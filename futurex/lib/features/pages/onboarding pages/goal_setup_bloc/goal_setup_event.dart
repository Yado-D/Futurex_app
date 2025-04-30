part of 'goal_setup_bloc.dart';

@immutable
sealed class GoalsSetupEvent {}

class GoalsSetupLoadingEvent extends GoalsSetupEvent{
}
class GoalsSetupClickedEvent extends GoalsSetupEvent{
  int index;
  GoalsSetupClickedEvent({
    required this.index,
});

}