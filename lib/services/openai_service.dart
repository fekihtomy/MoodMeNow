import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey;

  OpenAIService(this.apiKey);

  Future<List<String>> generateWellnessTips({
    required Map<String, dynamic> userAnswers,
  }) async {
    final prompt = _buildPrompt(userAnswers);
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'system', 'content': 'Tu es un coach de bien-être bienveillant.'},
          {'role': 'user', 'content': prompt}
        ],
        'max_tokens': 150,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['choices'][0]['message']['content'] as String;

      final tips = text
          .split('\n')
          .where((line) => line.trim().isNotEmpty)
          .map((line) => line.replaceAll(RegExp(r'^[-•\d\.\s]+'), '').trim())
          .toList();
      return tips;
    } else {
      throw Exception('Erreur OpenAI: ${response.body}');
    }
  }

  String _buildPrompt(Map<String, dynamic> answers) {
    return '''
Voici les réponses de l'utilisateur :  
- Niveau de stress : ${answers['stress']}/10  
- Énergie : ${answers['energy']}/10  
- Sommeil : ${answers['sleep']}  
- Alimentation : ${answers['food']}  
- Activité physique : ${answers['activity']}

Génère 3 conseils simples, concrets et positifs à appliquer dans la journée. Évite les conseils médicaux ou trop vagues. Sois bref, motivant et encourageant.
''';
  }
}
