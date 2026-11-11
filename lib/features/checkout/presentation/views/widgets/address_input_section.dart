import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (p0) {
                  context.read<OrderEntity>().shippingAddressEntity!.name = p0!;
                },
                hintText: 'الاسم الكامل',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (p1) {
                  context.read<OrderEntity>().shippingAddressEntity!.email =
                      p1!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (p2) {
                  context.read<OrderEntity>().shippingAddressEntity!.address =
                      p2!;
                },
                hintText: ' العنوان',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (p3) {
                  context.read<OrderEntity>().shippingAddressEntity!.city = p3!;
                },
                hintText: 'المدينة',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (p4) {
                  context.read<OrderEntity>().shippingAddressEntity!.phone =
                      p4!;
                },
                hintText: ' رقم الهاتف',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
