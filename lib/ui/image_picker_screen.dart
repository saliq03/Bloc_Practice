import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:untitled/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:untitled/bloc/image_picker_bloc/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget{
  const ImagePickerScreen({super.key});

  @override
  State<StatefulWidget> createState() =>_ImagePickerScreenState();

}
class _ImagePickerScreenState extends State<ImagePickerScreen>{
  @override
  Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
       title: const Text("Image picker"),
       centerTitle: true,
     ),
    body: InkWell(
      onTap: (){
        context.read<ImagePickerBloc>().add(CaptureImageCamera());
      },
      child: BlocBuilder<ImagePickerBloc,ImagePickerState>(
          builder: (context,state){
        if(state.image!=null){
          return Image.file(File(state.image!.path));
        }
        else{
         return const Center(child: Icon(Icons.camera,size: 30,));
        }
      }),
    ),
   ) ;
  }
  }