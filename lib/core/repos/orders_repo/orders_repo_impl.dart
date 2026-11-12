import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/checkout/data/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl extends OrdersRepo {
  final DatabaseService databaseService; // مشان تقدر تعمل  switch للخدمة

  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrders({required OrderEntity order}) async {
    try {
      await databaseService.addData(
        BackendEndpoint.addOrders,
        OrderModel.fromEntity(order).toMap(),
        null
      );
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
    return const Right(null);
  }
}
