import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/core/services/data_service.dart';

class ProductsRepoImpl extends ProductsRepo {
final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
  
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    
    throw UnimplementedError();
  }
}