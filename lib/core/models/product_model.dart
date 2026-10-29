import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/helper_functions/get_avg_rating.dart';
import 'package:fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitAmount;
  final num sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.avgRating,
    required this.isFeatured,
    required this.isOrganic,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.imageUrl,
    this.sellingCount = 0,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    final reviews = (json['reviews'] as List?)
            ?.map(
              (e) => ReviewModel.fromMap(
                Map<String, dynamic>.from(e as Map),
              ),
            )
            .toList() ??
        <ReviewModel>[];

    return ProductModel(
      avgRating: getAvgRating(reviews.map((e) => e.toEntity()).toList()),
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      price: json['price'] as num,
      imageUrl: json['imageUrl'] as String?,
      isFeatured: json['isFeatured'] as bool? ?? false,
      isOrganic: json['isOrganic'] as bool? ?? false,
      expirationsMonths: (json['expirationsMonths'] as num?)?.toInt() ?? 0,
      numberOfCalories: (json['numberOfCalories'] as num?)?.toInt() ?? 0,
      unitAmount: (json['unitAmount'] as num?)?.toInt() ?? 1,
      reviews: reviews,
      sellingCount: json['sellingCount'] as num? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sellingCount': sellingCount,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
}
