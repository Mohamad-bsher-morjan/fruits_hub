import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteInitial());

  void toggleFavorite(ProductEntity product) {
    final favorites = List<ProductEntity>.from(state.favorites);
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
    emit(FavoriteUpdated(List.unmodifiable(favorites)));
  }
}
