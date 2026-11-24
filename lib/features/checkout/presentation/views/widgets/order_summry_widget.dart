import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_input_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment__item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppStyles.regular13.copyWith(
                  color: context.palette.subtitle,
                ),
              ),
              const Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()} جنيه',
                textAlign: .right,
                style: AppStyles.semiBold16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل :',
                style: AppStyles.regular13.copyWith(
                  color: context.palette.subtitle,
                ),
              ),
              const Spacer(),
              Text(
                '30 جنيه',
                textAlign: .right,
                style: AppStyles.regular13.copyWith(
                  color: context.palette.subtitle,
                ),
              ),
            ],
          ),
          SizedBox(height: 9),
          Divider(thickness: .5, color: context.palette.divider),
          SizedBox(height: 9),
          Row(
            children: [
              Text('الكلي', style: AppStyles.bold16),
              const Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 40} جنيه',
                style: AppStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
