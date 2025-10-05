import 'package:flutter/material.dart';
import '../services/openai_service.dart';

class ResultsScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const ResultsScreen({super.key, required this.userData});
  
  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late Future<List<String>> _tipsFuture;

  @override
  void initState() {
    super.initState();
    final openAI = OpenAIService('YOUR_OPENAI_API_KEY'); // Remplacer par ta clé API
    _tipsFuture = openAI.generateWellnessTips(userAnswers: widget.userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conseils Bien-être')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<String>>(
          future: _tipsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erreur: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final tips = snapshot.data!;
              if (tips.isEmpty) {
                return const Text('Aucun conseil disponible.');
              }
              return ListView(
                children: tips.map((tip) => ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(tip),
                )).toList(),
              );
            } else {
              return const Text('Pas de données.');
            }
          },
        ),
      ),
    );
  }
}
