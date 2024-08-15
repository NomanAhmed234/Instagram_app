import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/storage.dart';
import 'package:instagram_clone/firestore.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageMethod _storageMethod = StorageMethod();
Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
  Future<void> signup({
    required String email,
    required String password,
    required String conPassword,
    required String bio,
    required String username,
    required File profile,
  }) async {
    String? url;
    try {
      if (email.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty &&
          profile.existsSync() &&
          password.isNotEmpty) {
        if (password == conPassword) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
          if (profile != File('')) {
            url = await _storageMethod.uploadImageStorage('profile', profile);
          } else {
            url = '';
          }
          await FirestoreService().createUser(
            email: email,
            username: username,
            bio: bio,
            profile: url == '' ? '' : url,
          );
        } else {
          throw Exception("Password and Confirm password should be the same!");
        }
      } else {
        throw Exception("Enter all the fields");
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message.toString());
    }
  }
}
