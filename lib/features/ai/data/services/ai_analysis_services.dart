import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/ai/data/model/ai_analysis_model.dart';
import 'package:smart_university_app/features/ai/data/model/chat_message_model.dart';

class AiAnalysisService {
  final Dio dio = Dio();
  final apiKey = dotenv.env['OPEN_ROUTER_API_KEY'];
  Future<String> getChatResponse(String message) async {
    try {
      final userMessage = ChatMessage(role: "user", content: message);
      final response = await dio.post(
        'https://openrouter.ai/api/v1/chat/completions',
        options: Options(
          headers: {
            "Authorization": "Bearer $apiKey",
            "Content-Type": "application/json",
          },
        ),
        data: {
          "model": "poolside/laguna-m.1:free",
          "messages": [userMessage.toJson()],
        },
      );
      return response.data['choices'][0]['message']['content'].toString();
    } on DioException catch (e) {
      return e.response?.data.toString() ?? e.message ?? "Dio Error";
    } catch (e) {
      return e.toString();
    }
  }

  Future<AiAnalysisModel?> getAnalysis() async {
    final response = await DioHelper.dio.get('/api/student/ai-analysis');
    if (response.data == null) {
      return null;
    }

    if (response.data is String) {
      return null;
    }

    return AiAnalysisModel.fromJson(response.data);
  }
}
