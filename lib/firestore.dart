import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUser({
    required String email,
    required String username,
    required String bio,
    required String profile,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firebaseFirestore.collection('users').doc(user.uid).set({
          'name': email,
          'username': username,
          'bio': bio,
          'profile': profile,
          'email': user.email,
          'uid': user.uid,
        });
      } else {
        throw Exception("No user is currently signed in.");
      }
    } catch (e) {
      throw Exception("Failed to create user: ${e.toString()}");
    }
  }
}
