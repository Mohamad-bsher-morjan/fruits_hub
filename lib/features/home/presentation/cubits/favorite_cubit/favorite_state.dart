part of 'favorite_cubit.dart';

sealed class FavoriteState {
  const FavoriteState(this.favorites);

  final List<ProductEntity> favorites;
}

final class FavoriteInitial extends FavoriteState {
  const FavoriteInitial() : super(const []);
}

final class FavoriteUpdated extends FavoriteState {
  const FavoriteUpdated(super.favorites);
}
