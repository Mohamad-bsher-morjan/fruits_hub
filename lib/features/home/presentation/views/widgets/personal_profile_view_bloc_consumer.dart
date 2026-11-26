import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/features/home/presentation/cubits/change_password/change_password_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubits/update_profile/update_profile_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/personal_profile_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PersonalProfileViewBlocConsumer extends StatelessWidget {
  const PersonalProfileViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              CustomSnackBar.showSuccess(
                context,
                message:
                    'تم حفظ التغييرات بنجاح. إذا غيّرت البريد الإلكتروني، فأكّده من الرابط الذي أرسلناه إليه لتفعيل تسجيل الدخول به.',
              );
            } else if (state is UpdateProfileFailure) {
              CustomSnackBar.showError(context, message: state.errMessage);
            }
          },
        ),
        BlocListener<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccess) {
              CustomSnackBar.showSuccess(
                context,
                message: 'تم تغيير كلمة المرور بنجاح',
              );
            } else if (state is ChangePasswordFailure) {
              CustomSnackBar.showError(context, message: state.errMessage);
            }
          },
        ),
      ],
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, profileState) {
          return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
            builder: (context, passwordState) {
              return ModalProgressHUD(
                inAsyncCall:
                    profileState is UpdateProfileLoading ||
                    passwordState is ChangePasswordLoading,
                child: const PersonalProfileViewBody(),
              );
            },
          );
        },
      ),
    );
  }
}
