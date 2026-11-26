part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteItemAdded extends FavoriteState {}

final class FavoriteItemRemoved extends FavoriteState {}
