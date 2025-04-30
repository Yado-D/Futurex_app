part of 'academic_info_bloc.dart';


@immutable
class AcademicInfoState {
  final List<double> courseDifficulty;

  const AcademicInfoState({required this.courseDifficulty});

  AcademicInfoState copyWith({List<double>? courseDifficulty}) {
    return AcademicInfoState(
      courseDifficulty: courseDifficulty ?? this.courseDifficulty,
    );
  }
}