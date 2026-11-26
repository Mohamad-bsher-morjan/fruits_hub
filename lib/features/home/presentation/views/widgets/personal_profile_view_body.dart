import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/home/presentation/cubits/update_profile/update_profile_cubit.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PersonalProfileViewBody extends StatefulWidget {
  const PersonalProfileViewBody({super.key});

  @override
  State<PersonalProfileViewBody> createState() =>
      _PersonalProfileViewBodyState();
}

class _PersonalProfileViewBodyState extends State<PersonalProfileViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  late String originalName;
  late String originalEmail;
  bool isEditingName = false;
  bool isEditingEmail = false;

  @override
  void initState() {
    super.initState();
    final user = getUser();
    originalName = user.name;
    originalEmail = user.email;
    nameController.text = user.name;
    emailController.text = user.email;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Widget editButton({
    required bool isEditing,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isEditing ? LucideIcons.check : LucideIcons.edit3,
        size: 20,
        color: Colors.grey,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      tooltip: isEditing ? 'تم' : 'تعديل',
    );
  }

  void saveChanges() {
    final formState = formKey.currentState;
    if (formState == null) return;

    if (!formState.validate()) {
      setState(() => autovalidateMode = AutovalidateMode.always);
      return;
    }

    final name = nameController.text.trim();
    final typedEmail = emailController.text.trim();
    final isEmailUnchanged =
        typedEmail.toLowerCase() == originalEmail.toLowerCase();
    final email = isEmailUnchanged ? originalEmail : typedEmail.toLowerCase();

    if (name == originalName && isEmailUnchanged) {
      CustomSnackBar.showAlert(context, message: 'لا توجد تغييرات لحفظها');
      return;
    }

    context.read<UpdateProfileCubit>().updateUserProfile(
      name: name,
      email: email,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          setState(() {
            isEditingName = false;
            isEditingEmail = false;
            originalName = state.userEntity.name;
            originalEmail = state.userEntity.email;
            nameController.text = state.userEntity.name;
            emailController.text = state.userEntity.email;
            autovalidateMode = AutovalidateMode.disabled;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('المعلومات الشخصية', style: AppStyles.bold13),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  controller: nameController,
                  hintText: 'الاسم',
                  textInputType: TextInputType.name,
                  readOnly: !isEditingName,
                  enableInteractiveSelection: isEditingName,
                  suffixIcon: editButton(
                    isEditing: isEditingName,
                    onPressed: () =>
                        setState(() => isEditingName = !isEditingName),
                  ),
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress,
                  readOnly: !isEditingEmail,
                  enableInteractiveSelection: isEditingEmail,
                  suffixIcon: editButton(
                    isEditing: isEditingEmail,
                    onPressed: () =>
                        setState(() => isEditingEmail = !isEditingEmail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'هذا الحقل مطلوب';
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'أدخل بريداً إلكترونياً صحيحاً';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Text('تغيير كلمة المرور', style: AppStyles.bold13),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  hintText: 'كلمة المرور الحالية',
                  textInputType: TextInputType.name,
                  validator: (_) => null,
                  suffixIcon: Icon(
                    LucideIcons.eye,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  hintText: 'كلمة المرور الجديدة',
                  textInputType: TextInputType.name,
                  validator: (_) => null,
                  suffixIcon: Icon(
                    LucideIcons.eye,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                CustomTextFormField(
                  hintText: 'تأكيد كلمة المرور الجديدة',
                  textInputType: TextInputType.name,
                  validator: (_) => null,
                  suffixIcon: Icon(
                    LucideIcons.eye,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 60),
                CustomButton(title: 'حفظ التغييرات', onPressed: saveChanges),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
