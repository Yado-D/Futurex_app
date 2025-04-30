class Quiz {
  String id;
  String text;
  List<Options> options;
  String explanation;
  Quiz(
      {required this.id,
      required this.text,
      required this.options,
      required this.explanation});

  static Quiz fromJson(Map<String, dynamic> json) => Quiz(
      id: json["id"],
      text: json["text"],
      options: Options.fromJson(json["options"]),
      explanation: json["explanation"]);

  Map<String,dynamic> toMap(Quiz quiz){
    return {
      "id": quiz.id,
      "text": quiz.text,
      "options": quiz.options,
      "explanation": quiz.explanation
    };
  }
}

class Options {
  String text;
  bool correct;
  Options({required this.text, required this.correct});

  static List<Options> fromJson(List<Map<String, dynamic>> options) {
    List<Options> op=[];
      for(final option in options){
       op.add(Options(text: option["text"], correct: option["correct"]));
      }
    return op;
  }

  Map<String,dynamic> toMap(Options option){
    return {
      "text": option.text,
      "correct": option.correct,
    };
  }
}
