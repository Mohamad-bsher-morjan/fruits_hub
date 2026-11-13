import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currnetPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currnetPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            currentPageIndex: currnetPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          CustomButton(
            backgroundColor: AppColors.primaryColor,
            title: getNextButtonText(currnetPageIndex),
            onPressed: () {
              if (currnetPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currnetPageIndex == 1) {
                _handleAddressValidation();
              } else {
                _processPayment(context);
              }
              //   var orderEntity= context.read<OrderEntity>();
              //  context.read<AddOrderCubit>().addOrder(order:orderEntity);}
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currnetPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      CustomSnackBar.showAlert(context, message: 'يرجى تحديد طريقة الدفع');
    }
  }

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currnetPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'ادفع باستخدام PayPal';
      default:
        return 'التالي';
    }
  }

  void _processPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: "",
          secretKey: "",
          transactions: const [
            {
              "amount": {
                "total": '70',
                "currency": "USD",
                "details": {
                  "subtotal": '70',
                  "shipping": '0',
                  "shipping_discount": 0,
                },
              },
              "description": "The payment transaction description.",
              // "payment_options": {
              //   "allowed_payment_method":
              //       "INSTANT_FUNDING_SOURCE"
              // },
              "item_list": {
                "items": [
                  {
                    "name": "Apple",
                    "quantity": 4,
                    "price": '5',
                    "currency": "USD",
                  },
                  {
                    "name": "Pineapple",
                    "quantity": 5,
                    "price": '10',
                    "currency": "USD",
                  },
                ],

                // shipping address is not required though
                //   "shipping_address": {
                //     "recipient_name": "tharwat",
                //     "line1": "Alexandria",
                //     "line2": "",
                //     "city": "Alexandria",
                //     "country_code": "EG",
                //     "postal_code": "21505",
                //     "phone": "+00000000",
                //     "state": "Alexandria"
                //  },
              },
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}
