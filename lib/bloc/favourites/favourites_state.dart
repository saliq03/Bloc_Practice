import 'package:equatable/equatable.dart';
import 'package:untitled/Model/favourite_item_model.dart';

enum ListStatus{loading,sucess,error}
class FavouritesState extends Equatable{
  final List<FavouriteItemModel> favourites;
  final ListStatus listStatus;

  const FavouritesState({
    this.favourites= const [],
    this.listStatus=ListStatus.loading
});

  FavouritesState copyWith({List<FavouriteItemModel>? favourites, ListStatus? listStatus}){
    return FavouritesState(
      favourites: favourites?? this.favourites,
      listStatus: listStatus?? this.listStatus
    );
  }

  @override
  List<Object?> get props => [favourites, listStatus];

}