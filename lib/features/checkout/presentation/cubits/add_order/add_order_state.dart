part of 'add_order_cubit.dart';

abstract class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object> get props => [];
}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderFailure extends AddOrderState {
  final String errMessage;

  const AddOrderFailure({required this.errMessage});
}

final class AddOrderSuccess extends AddOrderState {}
