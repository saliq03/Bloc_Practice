import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/switch_bloc/switch_bloc.dart';
import 'package:untitled/bloc/switch_bloc/switch_event.dart';
import 'package:untitled/bloc/switch_bloc/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example two"),
        centerTitle: true,
      ),
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                BlocBuilder<SwitchBloc,SwitchState>(
                  buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                  builder: (context,state) {
                    print("switch build");
                    return Switch(value: state.isSwitch, onChanged: (_){
                      context.read<SwitchBloc>().add(EnableOrDisableNotification());
                    });
                  }
                )
              ],
            ),
            const SizedBox(height: 20,),
            BlocBuilder<SwitchBloc,SwitchState>(
                buildWhen: (previous,current)=>previous.slider!=current.slider,
                builder: (context,state) {
                print("slider build");
                return Container(
                  color: Colors.red.withOpacity(state.slider),
                  width: double.infinity,
                  height: 200,
                );
              }
            ),
            SizedBox(height: 20,),

            BlocBuilder<SwitchBloc,SwitchState>(
                buildWhen: (previous,current)=>previous.slider!=current.slider,
                builder: (context,state) {
                return Slider(value: state.slider, onChanged: (value){
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                });
              }
            )
          ],
        ),
      ),
    );
  }
}

