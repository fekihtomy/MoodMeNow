class UserData {
  final int stress;
  final int energy;
  final String sleep;
  final String food;
  final String activity;

  UserData({
    required this.stress,
    required this.energy,
    required this.sleep,
    required this.food,
    required this.activity,
  });

  Map<String, dynamic> toMap() {
    return {
      'stress': stress,
      'energy': energy,
      'sleep': sleep,
      'food': food,
      'activity': activity,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      stress: map['stress'] ?? 5,
      energy: map['energy'] ?? 5,
      sleep: map['sleep'] ?? 'Bonne',
      food: map['food'] ?? 'Repas normal',
      activity: map['activity'] ?? 'Active',
    );
  }
}
