import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'specific_study_plan_event.dart';
part 'specific_study_plan_state.dart';

class SpecificStudyPlanBloc extends Bloc<SpecificStudyPlanEvent, SpecificStudyPlanState> {
  SpecificStudyPlanBloc() : super(SpecificStudyPlanState.initial()) {
    on<ToggleCourseSelection>(_onToggleCourseSelection);
    on<ToggleChapterSelection>(_onToggleChapterSelection);
    on<ToggleAllCoursesSelection>(_onToggleAllCoursesSelection);
    on<ToggleAllChaptersSelection>(_onToggleAllChaptersSelection);
  }

  void _onToggleCourseSelection(
      ToggleCourseSelection event,
      Emitter<SpecificStudyPlanState> emit,
      ) {
    final newSelectedCourses = Set<int>.from(state.selectedCourses);

    if (newSelectedCourses.contains(event.courseIndex)) {
      newSelectedCourses.remove(event.courseIndex);
      // Remove chapters for this course if deselected
      final newSelectedChapters = Map<int, Set<int>>.from(state.selectedChapters);
      newSelectedChapters.remove(event.courseIndex);
      emit(state.copyWith(
        selectedCourses: newSelectedCourses,
        selectedChapters: newSelectedChapters,
      ));
    } else {
      newSelectedCourses.add(event.courseIndex);
      emit(state.copyWith(selectedCourses: newSelectedCourses));
    }
  }

  void _onToggleChapterSelection(
      ToggleChapterSelection event,
      Emitter<SpecificStudyPlanState> emit,
      ) {
    final newSelectedChapters = Map<int, Set<int>>.from(state.selectedChapters);
    final chaptersForCourse = Set<int>.from(
      newSelectedChapters[event.courseIndex] ?? {},
    );

    if (chaptersForCourse.contains(event.chapterIndex)) {
      chaptersForCourse.remove(event.chapterIndex);
    } else {
      chaptersForCourse.add(event.chapterIndex);
    }

    newSelectedChapters[event.courseIndex] = chaptersForCourse;
    emit(state.copyWith(selectedChapters: newSelectedChapters));
  }

  void _onToggleAllCoursesSelection(
      ToggleAllCoursesSelection event,
      Emitter<SpecificStudyPlanState> emit,
      ) {
    if (event.selectAll) {
      // Select all courses (assuming 5 courses based on your UI)
      emit(state.copyWith(
        selectedCourses: {0, 1, 2, 3, 4},
      ));
    } else {
      // Deselect all courses and chapters
      emit(SpecificStudyPlanState.initial());
    }
  }

  void _onToggleAllChaptersSelection(
      ToggleAllChaptersSelection event,
      Emitter<SpecificStudyPlanState> emit,
      ) {
    final newSelectedChapters = Map<int, Set<int>>.from(state.selectedChapters);

    if (event.selectAll) {
      // Select all chapters (assuming 3 chapters per course)
      newSelectedChapters[event.courseIndex] = {0, 1, 2};
    } else {
      // Deselect all chapters for this course
      newSelectedChapters.remove(event.courseIndex);
    }

    emit(state.copyWith(selectedChapters: newSelectedChapters));
  }
}