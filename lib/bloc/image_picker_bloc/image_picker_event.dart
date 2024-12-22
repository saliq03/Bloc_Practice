import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable{
  const ImagePickerEvent();
  @override
  List<Object?> get props => [];
}

class CaptureImageCamera extends ImagePickerEvent{}
class PickImageGallery extends ImagePickerEvent{}