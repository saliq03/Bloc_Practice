import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Model/favourite_item_model.dart';
import 'package:untitled/bloc/favourites/favourites_bloc.dart';
import 'package:untitled/bloc/favourites/favourites_event.dart';
import 'package:untitled/bloc/favourites/favourites_state.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<FavouritesBloc>().add(FetchFavourites());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<FavouritesBloc,FavouritesState>
        (builder: (context,state){
        if(state.listStatus==ListStatus.loading){
          return const  Center(child: CircularProgressIndicator());
        }else if(state.listStatus==ListStatus.sucess){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
               itemCount: state.favourites.length,
                itemBuilder: (context,index){
                  FavouriteItemModel item=state.favourites[index];
                 return Card(
                   child: ListTile(
                     leading: Checkbox(value: true, onChanged: (value){
                     }),
                     title: Text(item.value),
                     trailing: item.isFavourite? const Icon(Icons.favorite,color: Colors.red,):const Icon(Icons.favorite_border),
                   ),
                 );
                }),
          );
        }else{
         return const Center(child: Text("Something went wrong!"));
        }
      }),
    );
  }
}
