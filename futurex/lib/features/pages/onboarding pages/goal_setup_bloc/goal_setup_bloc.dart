import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'goal_setup_event.dart';
part 'goal_setup_state.dart';

class GoalSetupBloc extends Bloc<GoalsSetupEvent, GoalSetupState> {
  GoalSetupBloc() : super(GoalSetupState(goalsTobe: [])) {
    on<GoalsSetupLoadingEvent>((event, emit) {
      // TODO: implement event handler
      emit(GoalSetupState(goalsTobe: dreamList));
    });

    on<GoalsSetupClickedEvent>((event, emit) {
      // TODO: implement event handler
      emit(GoalSetupState(goalsTobe: dreamList,index: event.index));
    });
  }
}

List<String> dreamList = [
  "Doctor 🩺",
  "Software Engineer 👨‍💻",
  "Artist (Painter, Designer, etc.) 🎨",
  "Pilot ✈️",
  "Lawyer ⚖️",
  "Architect 🏛️",
  "Nurse or Health Worker 👩‍⚕️",
  "Entrepreneur or Business Owner 💼",
  "Musician or Singer 🎤",
  "Actor or Filmmaker 🎬",
  "Teacher or Professor 📚",
  "Athlete or Sports Star ⚽",
  "Writer, Poet, or Journalist ✍️",
  "Fashion Designer 👗",
  "Chef or Baker 🍰",
  "Engineer (Mechanical, Civil",
  "Electrical, etc.) 🛠️",
  "Game Developer 🎮",
  "Scientist or Researcher 🔬",
  "Police Officer or Military 👮",
  "Social Worker or Community Leader🫂",
  "Influencer, YouTuber, or Content Creator 📱",
  "I'm still figuring it out 🤔",
  "Other: _______ ✏️"
];