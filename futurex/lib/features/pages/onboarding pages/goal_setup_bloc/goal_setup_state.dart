part of 'goal_setup_bloc.dart';

@immutable
class GoalSetupState {
  final List<String> goalsTobe;
  final int? index;

  const GoalSetupState({required this.goalsTobe,this.index});

}
