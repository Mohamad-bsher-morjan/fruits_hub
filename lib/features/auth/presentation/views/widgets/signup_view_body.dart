import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: .symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              TermsAndConditions(),
              SizedBox(height: 16),

              CustomButton(
                title: 'انشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                      email,
                      password,
                      userName,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                backgroundColor: AppColors.primaryColor,
              ),
              SizedBox(height: 26),
              HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

