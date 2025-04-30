import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'academic_info_event.dart';
part 'academic_info_state.dart';

class AcademicInfoBloc extends Bloc<AcademicInfoEvent, AcademicInfoState> {
  AcademicInfoBloc() : super(AcademicInfoState(courseDifficulty: [])) {
    on<AcademicDifficultyEvent>((event, emit) {
      // Create a new list with the updated difficulty
      final newDifficulties = List<double>.from(state.courseDifficulty);

      // Ensure the index is valid
      if (event.index >= 0 && event.index < newDifficulties.length) {
        newDifficulties[event.index] = event.difficulty;
      }

      emit(AcademicInfoState(courseDifficulty: newDifficulties));
    });


    on<AcademicDifficultySubjectLoadingEvent>((event, emit) {
      // TODO: implement event handler
      List<double> courses=[];
      for(int i=0;i<6;i++){
         courses.add(1.0);
      }
      emit(AcademicInfoState(courseDifficulty: courses));
    });

  }
}
