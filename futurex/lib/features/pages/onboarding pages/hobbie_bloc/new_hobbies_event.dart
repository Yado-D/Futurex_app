part of 'new_hobbies_bloc.dart';

@immutable
sealed class NewHobbiesEvent {}

class LoadHobbies extends NewHobbiesEvent {}

class ToggleHobbieSelection extends NewHobbiesEvent {
  final int hobbieIndex;

  ToggleHobbieSelection(this.hobbieIndex);
}

class ToggleSubHobbieSelection extends NewHobbiesEvent {
  final int hobbieIndex;
  final int subHobbieIndex;

  ToggleSubHobbieSelection(this.hobbieIndex, this.subHobbieIndex);
}