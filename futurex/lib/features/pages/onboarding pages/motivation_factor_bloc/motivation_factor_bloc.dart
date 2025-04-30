import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'motivation_factor_event.dart';
part 'motivation_factor_state.dart';

class MotivationFactorBloc
    extends Bloc<MotivationFactorEvent, MotivationFactorState> {
  MotivationFactorBloc() : super(MotivationFactorState()) {
    on<MotivationFactorClickedEvent>((event, emit) {
      // Create a new list with the updated difficulty
      final newSelectedValues =
          List<bool>.from(state.selectedMotives as Iterable);

      // Ensure the index is valid
      if (event.index >= 0 && event.index < newSelectedValues.length) {
        newSelectedValues[event.index] = event.isChecked;
      }

      emit(MotivationFactorState().copyWith(
          selectedMotives: newSelectedValues, motiveFactors: motivesList));
    });

    on<MotivationFactorLoadingEvent>((event, emit) {
      // TODO: implement event handler
      List<bool> isChecked = [];
      for (int i = 0; i < motivesList.length; i++) {
        isChecked.add(false);
      }
      emit(MotivationFactorState()
          .copyWith(motiveFactors: motivesList, selectedMotives: isChecked));
    });
  }
}

List<String> motivesList = [
  "My family",
  "Competing with friends",
  "Achieving personal goals 🎯",
  "Making my parents proud ❤️",
  "Wanting to be independent 💪",
  "Setting an example for younger siblings👶",
  "A chance to travel or study abroad ✈️⚕️",
  "Winning scholarships or prizes 🏆",
  "Helping my community 🫂",
  "Getting into a good university 🎓",
  "Being recognized for my hard work 🌟"
];
