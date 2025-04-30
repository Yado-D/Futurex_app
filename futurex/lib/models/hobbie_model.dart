import 'package:meta/meta.dart';

@immutable
class Hobbie {
  final String name;
  final String question;
  final List<String> subHobbies;
  final bool isSelected;
  final List<bool> subHobbiesSelection;

   Hobbie({
    required this.name,
    required this.question,
    required this.subHobbies,
    this.isSelected = false,
    List<bool>? subHobbiesSelection,
  }) : subHobbiesSelection = subHobbiesSelection ?? List.filled(subHobbies.length, false);

  factory Hobbie.fromJson(Map<String, dynamic> json) {
    return Hobbie(
      name: json['hobbie'] as String,
      question: json['hobbieQuestion'] as String,
      subHobbies: List<String>.from(json['subHobbie'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hobbie': name,
      'hobbieQuestion': question,
      'subHobbie': subHobbies,
      'isSelected': isSelected,
      'subHobbiesSelection': subHobbiesSelection,
    };
  }

  Hobbie copyWith({
    String? name,
    String? question,
    List<String>? subHobbies,
    bool? isSelected,
    List<bool>? subHobbiesSelection,
  }) {
    return Hobbie(
      name: name ?? this.name,
      question: question ?? this.question,
      subHobbies: subHobbies ?? this.subHobbies,
      isSelected: isSelected ?? this.isSelected,
      subHobbiesSelection: subHobbiesSelection ?? this.subHobbiesSelection,
    );
  }
}