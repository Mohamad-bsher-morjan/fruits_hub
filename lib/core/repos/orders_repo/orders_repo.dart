import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_input_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrders({required OrderInputEntity order});
}
