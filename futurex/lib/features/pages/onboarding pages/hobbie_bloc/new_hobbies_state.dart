part of 'new_hobbies_bloc.dart';

@immutable
sealed class NewHobbiesState {}

class HobbieLoading extends NewHobbiesState {}

class HobbieLoaded extends NewHobbiesState {
  final List<Hobbie> hobbies;

  HobbieLoaded(this.hobbies);
}

class HobbieError extends NewHobbiesState {
  final String message;

  HobbieError(this.message);
}