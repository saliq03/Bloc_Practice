import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable{

  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavourites extends FavouriteEvent{}