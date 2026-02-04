import 'dart:convert';

import 'package:miniproject/constant/open_ai.dart';
import 'package:miniproject/models/openai_feature/open_ai_chat_models.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GPTChatData> getRecommendation({
    required String height,
    required String weight,
  }) async {
    try {
      // FIX OPSI 2: Gunakan endpoint chat/completions
      var url = Uri.parse("https://api.openai.com/v1/responses");

      Map<String, String> headers = {
        "Authorization": "Bearer $apiKey'",
        "Content-Type": "application/json",
      };

      String userPrompt =
          "Berikan saya 3 rekomendasi workout dengan tinggi badan $height cm dan berat badan $weight kg dengan hitungan setiap rep, yang bisa dilakukan selama 1 minggu. Berikan juga saran ketika melakukan gerakannya. Format jawaban dengan rapi dan mudah dibaca.";

      // FIX: Format untuk chat completion
      final data = jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content":
                "Kamu adalah seorang personal trainer profesional yang memberikan rekomendasi workout yang disesuaikan dengan kondisi fisik pengguna. Berikan jawaban dalam bahasa Indonesia yang mudah dipahami.",
          },
          {"role": "user", "content": userPrompt},
        ],
        "max_tokens": 500,
        "temperature": 0.7,
      });

      print("Sending request to OpenAI...");
      var response = await http.post(url, headers: headers, body: data);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final gptData = gptChatDataFromJson(response.body);

        // Validasi apakah choices tidak kosong
        if (gptData.choices.isEmpty) {
          throw Exception("No recommendation received from API");
        }

        return gptData;
      } else {
        // Parse error response
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error']['message'] ?? 'Unknown error';
        throw Exception("OpenAI API Error: $errorMessage");
      }
    } catch (err) {
      print("Error in getRecommendation: $err");
      rethrow; // Throw error agar bisa ditangkap di UI
    }
  }
}
