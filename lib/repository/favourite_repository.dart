import 'package:untitled/Model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.from(_generateList(10));
  }

  List<FavouriteItemModel> _generateList(int length){
    return List.generate(length,
            (index)=>FavouriteItemModel(id: index.toString(), value: "item $index"));
  }
}