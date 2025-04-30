import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getOpenRouterResponse(String userMessage) async {

  final apiKey = dotenv.env["AICHATBOTAPIKEY"];

  final url = Uri.parse('https://openrouter.ai/api/v1/chat/completions');

  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'model': 'deepseek/deepseek-r1:free', // You can change this model if needed
    'messages': [
      {
        'role': 'user',
        'content': userMessage
      }
    ],
    'data_policy': {
      'allow_train': true // Required to avoid 404 error
    },
  });

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
       print(response.body);
    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseData;
    } else {
      throw Exception('API Error: ${responseData['error']?['message'] ?? response.body}');
    }
  } catch (e) {
    throw Exception('Request failed: $e');
  }
}