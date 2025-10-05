import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> initialize() async {
    // Ajouter ici les initialisations si besoin
  }

  static Future<User?> signInAnonymously() async {
    final result = await auth.signInAnonymously();
    return result.user;
  }

  static Future<void> saveUserData(Map<String, dynamic> data) async {
    final user = auth.currentUser;
    if (user == null) return;
    await firestore.collection('users').doc(user.uid).set(data);
  }
}
