
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
     on<AddOrRemoveFromFavourites>(addOrRemoveFromFavourites);
     on<SelectAndUnselectItem>(selectAndUnselectItem);
     on<DeleteItems>(deleteItems);
  }
  void fetchList(FetchFavourites event,Emitter<FavouritesState> emit)async{
    list=await favouriteRepository.fetchItem();
     emit(state.copyWith(favourites: list,listStatus: ListStatus.sucess));
  }

  void addOrRemoveFromFavourites(AddOrRemoveFromFavourites event,Emitter<FavouritesState> emit){
    final List<FavouriteItemModel> sectedListTemp=List.from(state.tempItemList);
     list = list.map((item) {
      if (item.id == event.itemModel.id) {
        final favItem=FavouriteItemModel(
          id: item.id,
          value: item.value,
          isFavourite: !item.isFavourite,
        );

        if(state.tempItemList.contains(event.itemModel)){
          final i=state.tempItemList.indexWhere((fav)=>fav.id==item.id);
         sectedListTemp[i]=favItem;

        }

        return favItem;
      }
      return item;
    }).toList();

    // Emit a new state with the updated list
    emit(state.copyWith(favourites: List.from(list),tempItemList: sectedListTemp));

  }
  void selectAndUnselectItem(SelectAndUnselectItem event,Emitter<FavouritesState> emit){
    List<FavouriteItemModel> updatedList = List.from(state.tempItemList);

    if (updatedList.isNotEmpty) {
      if (updatedList.contains(event.item)) {
        updatedList.remove(event.item);
      } else {
        updatedList.add(event.item);
      }
    } else {
      updatedList.add(event.item);
    }
    emit(state.copyWith(tempItemList: updatedList));
  }
  void deleteItems(DeleteItems event,Emitter<FavouritesState> emit){
     final List<FavouriteItemModel> selectedItems=List.from(state.tempItemList);
     for(int i=0;i<selectedItems.length;i++){
       list.remove(selectedItems[i]);
     }
     selectedItems.clear();
     emit(state.copyWith(favourites: List.from(list),tempItemList: List.from(selectedItems)));
  }
}
