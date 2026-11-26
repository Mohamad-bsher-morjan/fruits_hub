import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/validators.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/form_section_title.dart';
import 'package:fruits_hub/core/widgets/password_visibility_button.dart';
import 'package:fruits_hub/features/home/presentation/cubits/change_password/change_password_cubit.dart';

class ChangePasswordSection extends StatefulWidget {
  const ChangePasswordSection({super.key});

  @override
  State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.validate()) {
      setState(() => _autovalidateMode = AutovalidateMode.always);
      return;
    }

    context.read<ChangePasswordCubit>().changePassword(
      currentPassword: _currentPasswordController.text,
      newPassword: _newPasswordController.text,
    );
  }

  void _clearFieldsAfterSuccess() {
    setState(() {
      _currentPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
      _obscureCurrentPassword = true;
      _obscureNewPassword = true;
      _obscureConfirmPassword = true;
      _autovalidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          _clearFieldsAfterSuccess();
        }
      },
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FormSectionTitle(title: 'تغيير كلمة المرور'),
            const SizedBox(height: 12),
            _buildPasswordField(
              hintText: 'كلمة المرور الحالية',
              controller: _currentPasswordController,
              isObscured: _obscureCurrentPassword,
              onToggleVisibility: () => setState(
                () => _obscureCurrentPassword = !_obscureCurrentPassword,
              ),
            ),
            const SizedBox(height: 12),
            _buildPasswordField(
              hintText: 'كلمة المرور الجديدة',
              controller: _newPasswordController,
              isObscured: _obscureNewPassword,
              onToggleVisibility: () =>
                  setState(() => _obscureNewPassword = !_obscureNewPassword),
              validator: AppValidators.password,
            ),
            const SizedBox(height: 12),
            _buildPasswordField(
              hintText: 'تأكيد كلمة المرور الجديدة',
              controller: _confirmPasswordController,
              isObscured: _obscureConfirmPassword,
              onToggleVisibility: () => setState(
                () => _obscureConfirmPassword = !_obscureConfirmPassword,
              ),
              validator: (value) => AppValidators.confirmPassword(
                value,
                _newPasswordController.text,
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              title: 'تغيير كلمة المرور',
              onPressed: _changePassword,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String hintText,
    required TextEditingController controller,
    required bool isObscured,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return CustomTextFormField(
      controller: controller,
      hintText: hintText,
      textInputType: TextInputType.visiblePassword,
      obscureText: isObscured,
      suffixIcon: PasswordVisibilityButton(
        isObscured: isObscured,
        onPressed: onToggleVisibility,
      ),
      validator: validator,
    );
  }
}
