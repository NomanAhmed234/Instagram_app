import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File> uploadImage(String inputSource) async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
        source: inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      throw Exception("No image selected");
    }
  }
}
