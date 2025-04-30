part of 'academic_info_bloc.dart';

@immutable
sealed class AcademicInfoEvent {}

class AcademicDifficultyEvent extends AcademicInfoEvent{
  double difficulty;
  int index;
  AcademicDifficultyEvent({
    required this.difficulty,
    required this.index,
});
}
class AcademicDifficultySubjectLoadingEvent extends AcademicInfoEvent{
}