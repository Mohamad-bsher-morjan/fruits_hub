import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? address;
  String? city;
  String? phone;
  String? email;

  ShippingAddressModel({
    this.name,
    this.address,
    this.city,
    this.phone,
    this.email,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      address: entity.address,
      city: entity.city,
      phone: entity.phone,
      email: entity.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'phone': phone,
      'email': email,
    };
  }
}
