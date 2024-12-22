import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable{
  XFile? image;

  ImagePickerState({this.image});

  ImagePickerState copyWith({XFile? image}){
    return ImagePickerState(image: image??this.image);
  }

  @override
  List<Object?> get props => [image];

}