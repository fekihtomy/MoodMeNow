import 'package:flutter_test/flutter_test.dart';
import 'package:mood_me_now/services/openai_service.dart';

void main() {
  group('OpenAIService', () {
    test('buildPrompt returns expected string', () {
      final service = OpenAIService('dummy_key');
      final answers = {
        'stress': 5,
        'energy': 7,
        'sleep': 'Bonne',
        'food': 'Repas normal',
        'activity': 'Active',
      };
      final prompt = service._buildPrompt(answers);
      expect(prompt.contains('Niveau de stress : 5/10'), true);
    });
  });
}
