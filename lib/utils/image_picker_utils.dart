import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{
  final picker=ImagePicker();
  Future<XFile?> pickImageFromGallery()async{
    XFile? image=await  picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<XFile?> pickImageFromCamera()async{
    XFile? image=await  picker.pickImage(source: ImageSource.camera);
    return image;
  }
}