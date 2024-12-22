
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/counter/counter_bloc.dart';
import 'package:untitled/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:untitled/bloc/switch_bloc/switch_bloc.dart';
import 'package:untitled/ui/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> SwitchBloc()),
        BlocProvider(create: (_)=> CounterBloc()),
        BlocProvider(create: (_)=> ImagePickerBloc())
      ],
      child: MaterialApp(
        title: 'Bloc Practice',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}


