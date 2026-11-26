import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductEntity> favoriteProducts = [];

  void toggleFavorite(ProductEntity productEntity) {
    bool isProductExist = favoriteProducts.contains(productEntity);

    if (isProductExist) {
      favoriteProducts.remove(productEntity);
      emit(FavoriteItemRemoved());
    } else {
      favoriteProducts.add(productEntity);
      emit(FavoriteItemAdded());
    }
  }
}
