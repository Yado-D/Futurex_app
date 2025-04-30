part of 'motivation_factor_bloc.dart';

@immutable
class MotivationFactorState {
   List<String>? motives =[];
   List<bool>? selectedMotives=[];


   MotivationFactorState({this.motives,this.selectedMotives});

  MotivationFactorState copyWith({
    List<bool>? selectedMotives,
    List<String>? motiveFactors,

  }) {
    return MotivationFactorState(
      selectedMotives: selectedMotives?? this.selectedMotives,
      motives: motiveFactors ?? this.motives,
    );
  }
}