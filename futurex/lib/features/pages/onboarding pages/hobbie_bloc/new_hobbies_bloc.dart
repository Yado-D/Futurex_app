import 'package:bloc/bloc.dart';
import 'package:futurex/data/hobbie_list.dart';
import 'package:futurex/models/hobbie_model.dart';
import 'package:meta/meta.dart';

part 'new_hobbies_event.dart';
part 'new_hobbies_state.dart';

class NewHobbiesBloc extends Bloc<NewHobbiesEvent, NewHobbiesState> {
  NewHobbiesBloc() :  super(HobbieLoading()) {
    on<LoadHobbies>(_onLoadHobbies);
    on<ToggleHobbieSelection>(_onToggleHobbieSelection);
    on<ToggleSubHobbieSelection>(_onToggleSubHobbieSelection);
  }

  void _onLoadHobbies(LoadHobbies event, Emitter emit) {
    try {
      final loadedHobbies = hobbiesList.map((json) => Hobbie.fromJson(json)).toList();
      emit(HobbieLoaded(loadedHobbies));
    } catch (e) {
      emit(HobbieError("Failed to load hobbies: ${e.toString()}"));
    }
  }

  void _onToggleHobbieSelection(
      ToggleHobbieSelection event,
      Emitter<NewHobbiesState> emit,
      ) {
    if (state is !HobbieLoaded) return;

    final currentState = state as HobbieLoaded;
    final updatedHobbies = List<Hobbie>.from(currentState.hobbies);
    updatedHobbies[event.hobbieIndex] = updatedHobbies[event.hobbieIndex].copyWith(
      isSelected: !updatedHobbies[event.hobbieIndex].isSelected,
    );

    emit(HobbieLoaded(updatedHobbies));
  }

  void _onToggleSubHobbieSelection(
      ToggleSubHobbieSelection event,
      Emitter<NewHobbiesState> emit,
      ) {
    if (state is! HobbieLoaded) return;

    final currentState = state as HobbieLoaded;
    final updatedHobbies = List<Hobbie>.from(currentState.hobbies);
    final updatedSubHobbies = List<bool>.from(
      updatedHobbies[event.hobbieIndex].subHobbiesSelection,
    );
    updatedSubHobbies[event.subHobbieIndex] = !updatedSubHobbies[event.subHobbieIndex];

    updatedHobbies[event.hobbieIndex] = updatedHobbies[event.hobbieIndex].copyWith(
      subHobbiesSelection: updatedSubHobbies,
    );

    emit(HobbieLoaded(updatedHobbies));
  }
}
