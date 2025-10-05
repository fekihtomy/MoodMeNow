import 'package:flutter/material.dart';
import 'results_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  int stress = 5;
  int energy = 5;
  String sleep = 'Bonne';
  String food = 'Repas normal';
  String activity = 'Active';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MoodMeNow - Questionnaire')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Niveau de stress (1-10)'),
              Slider(
                min: 1,
                max: 10,
                divisions: 9,
                label: '$stress',
                value: stress.toDouble(),
                onChanged: (v) => setState(() => stress = v.toInt()),
              ),
              const SizedBox(height: 10),
              const Text('Énergie (1-10)'),
              Slider(
                min: 1,
                max: 10,
                divisions: 9,
                label: '$energy',
                value: energy.toDouble(),
                onChanged: (v) => setState(() => energy = v.toInt()),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: sleep,
                items: ['Bonne', 'Mauvaise', 'Moyenne']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => sleep = v ?? sleep),
                decoration: const InputDecoration(labelText: 'Qualité du sommeil'),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: food,
                items: ['Repas normal', 'Repas léger', 'Repas copieux']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => food = v ?? food),
                decoration: const InputDecoration(labelText: 'Alimentation'),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: activity,
                items: ['Active', 'Peu active', 'Sédentaire']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => activity = v ?? activity),
                decoration: const InputDecoration(labelText: 'Activité physique'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final userData = {
                      'stress': stress,
                      'energy': energy,
                      'sleep': sleep,
                      'food': food,
                      'activity': activity,
                    };
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultsScreen(userData: userData),
                      ),
                    );
                  }
                },
                child: const Text('Obtenir mes conseils'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
