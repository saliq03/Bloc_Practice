
import 'package:bloc/bloc.dart';
import 'package:untitled/Model/favourite_item_model.dart';
import 'package:untitled/bloc/favourites/favourites_event.dart';
import 'package:untitled/bloc/favourites/favourites_state.dart';
import 'package:untitled/repository/favourite_repository.dart';

class FavouritesBloc extends Bloc<FavouriteEvent, FavouritesState> {
  List<FavouriteItemModel> list=[];
  FavouriteRepository favouriteRepository;

   FavouritesBloc(this.favouriteRepository):super(const FavouritesState()){
     on<FetchFavourites>(fetchList);
  }
  void fetchList(FetchFavourites event,Emitter<FavouritesState> emit)async{
    list=await favouriteRepository.fetchItem();
     emit(state.copyWith(favourites: list,listStatus: ListStatus.sucess));
  }
}
