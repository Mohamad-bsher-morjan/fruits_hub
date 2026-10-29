import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList();

      return right(products);
    } catch (e, stackTrace) {
      log('getBestSellingProducts failed', error: e, stackTrace: stackTrace);
      return left(ServerFailure(errMessage: 'تعذر جلب المنتجات'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList();

      return right(products);
    } catch (e, stackTrace) {
      log('getProducts failed', error: e, stackTrace: stackTrace);
      return left(ServerFailure(errMessage: 'تعذر جلب المنتجات'));
    }
  }
}
