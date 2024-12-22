import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:untitled/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:untitled/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{
  final ImagePickerUtils imagePickerUtils=ImagePickerUtils();

  ImagePickerBloc():super(ImagePickerState()){
    on<CaptureImageCamera>(_captureImageCamera);
    on<PickImageGallery>(_pickImageGallery);
  }
  void _captureImageCamera(CaptureImageCamera event,Emitter<ImagePickerState> emit) async {
    XFile? image=await imagePickerUtils.pickImageFromCamera();
    emit(state.copyWith(image: image));

  }
  void _pickImageGallery(PickImageGallery event,Emitter<ImagePickerState> emit)async{
    XFile? image=await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(image: image));
  }
}