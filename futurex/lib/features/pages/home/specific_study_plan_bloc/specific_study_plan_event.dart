part of 'specific_study_plan_bloc.dart';

abstract class SpecificStudyPlanEvent {}

class ToggleCourseSelection extends SpecificStudyPlanEvent {
  final int courseIndex;
  ToggleCourseSelection(this.courseIndex);
}

class ToggleChapterSelection extends SpecificStudyPlanEvent {
  final int chapterIndex;
  final int courseIndex;
  ToggleChapterSelection(this.chapterIndex, this.courseIndex);
}

class ToggleAllCoursesSelection extends SpecificStudyPlanEvent {
  final bool selectAll;
  ToggleAllCoursesSelection(this.selectAll);
}

class ToggleAllChaptersSelection extends SpecificStudyPlanEvent {
  final bool selectAll;
  final int courseIndex;
  ToggleAllChaptersSelection(this.selectAll, this.courseIndex);
}