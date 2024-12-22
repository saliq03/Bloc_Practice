import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable{

  final String id;
  final String value;
  final bool isFavourite;

  const FavouriteItemModel({
    required this.id,required this.value, this.isFavourite=false
  });

  @override
  List<Object?> get props => [id,value,isFavourite];

}