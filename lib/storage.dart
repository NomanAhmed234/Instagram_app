import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageStorage(String name, File image) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        Reference ref = _storage.ref().child(name).child(user.uid);
        UploadTask uploadTask = ref.putFile(image);
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        throw Exception("No user is currently signed in.");
      }
    } catch (e) {
      throw Exception("Failed to upload image: ${e.toString()}");
    }
  }
}
