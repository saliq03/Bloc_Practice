import 'package:equatable/equatable.dart';
import 'package:untitled/Model/favourite_item_model.dart';

abstract class FavouriteEvent extends Equatable{

  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavourites extends FavouriteEvent{}
class AddOrRemoveFromFavourites extends FavouriteEvent{
 final FavouriteItemModel itemModel;
  const AddOrRemoveFromFavourites({required this.itemModel});
 @override
 List<Object?> get props => [itemModel];

}
class SelectAndUnselectItem extends FavouriteEvent{
  final FavouriteItemModel item;
  const SelectAndUnselectItem({required this.item});
}
class DeleteItems extends FavouriteEvent{}