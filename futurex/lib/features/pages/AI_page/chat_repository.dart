// repositories/chat_repository.dart
import 'package:futurex/features/pages/AI_page/ai_service.dart';

class ChatRepository {
  final AIService aiService;

  ChatRepository({required this.aiService});

  Future<String> getAIResponse(String message) async {
    return await aiService.getResponse(message);
  }
}