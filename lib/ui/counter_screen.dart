
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/counter/counter_bloc.dart';
import 'package:untitled/bloc/counter/counter_event.dart';
import 'package:untitled/bloc/counter/counter_state.dart';
import 'package:untitled/ui/image_picker_screen.dart';
import 'package:untitled/ui/switch.dart';



class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("whole widget building");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           BlocBuilder<CounterBloc, CounterState>(
             builder: (context,state) {
               return Text(state.counter.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
             }
           ),
          const SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementCounter());
              }, child: const Text("Increment")),
             const SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: const Text("Decrement")),
            ],
          )
        ],
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePickerScreen() ));

      }),
    );
  }
}
