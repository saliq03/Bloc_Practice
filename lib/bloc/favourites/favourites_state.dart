import 'package:equatable/equatable.dart';
import 'package:untitled/Model/favourite_item_model.dart';

enum ListStatus{loading,sucess,error}
class FavouritesState extends Equatable{
  final List<FavouriteItemModel> favourites;
  final List<FavouriteItemModel> tempItemList;
  final ListStatus listStatus;

  const FavouritesState({
    this.favourites= const [],
    this.listStatus=ListStatus.loading,
    this.tempItemList=const[]
});

  FavouritesState copyWith({List<FavouriteItemModel>? favourites, ListStatus? listStatus,List<FavouriteItemModel>? tempItemList}){
    print(tempItemList);
    return FavouritesState(
      favourites: favourites?? this.favourites,
      listStatus: listStatus?? this.listStatus,
      tempItemList: tempItemList?? this.tempItemList

    );
  }

  @override
  List<Object?> get props => [favourites, listStatus,tempItemList];

}