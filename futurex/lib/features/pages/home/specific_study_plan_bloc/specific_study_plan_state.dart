part of 'specific_study_plan_bloc.dart';

class SpecificStudyPlanState {
  final Set<int> selectedCourses;
  final Map<int, Set<int>> selectedChapters; // courseIndex -> chapterIndices

  SpecificStudyPlanState({
    required this.selectedCourses,
    required this.selectedChapters,
  });

  SpecificStudyPlanState.initial()
      : selectedCourses = {},
        selectedChapters = {};

  SpecificStudyPlanState copyWith({
    Set<int>? selectedCourses,
    Map<int, Set<int>>? selectedChapters,
  }) {
    return SpecificStudyPlanState(
      selectedCourses: selectedCourses ?? this.selectedCourses,
      selectedChapters: selectedChapters ?? this.selectedChapters,
    );
  }
}