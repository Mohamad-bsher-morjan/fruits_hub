import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/core/helper_functions/validators.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/edit_icon_button.dart';
import 'package:fruits_hub/core/widgets/form_section_title.dart';
import 'package:fruits_hub/features/home/presentation/cubits/update_profile/update_profile_cubit.dart';

class PersonalInfoSection extends StatefulWidget {
  const PersonalInfoSection({super.key});

  @override
  State<PersonalInfoSection> createState() => _PersonalInfoSectionState();
}

class _PersonalInfoSectionState extends State<PersonalInfoSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String _originalName;
  late String _originalEmail;
  bool _isEditingName = false;
  bool _isEditingEmail = false;

  @override
  void initState() {
    super.initState();
    final user = getUser();
    _originalName = user.name;
    _originalEmail = user.email;
    _nameController.text = user.name;
    _emailController.text = user.email;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.validate()) {
      setState(() => _autovalidateMode = AutovalidateMode.always);
      return;
    }

    final name = _nameController.text.trim();
    final typedEmail = _emailController.text.trim();
    final isEmailUnchanged =
        typedEmail.toLowerCase() == _originalEmail.toLowerCase();
    final email = isEmailUnchanged ? _originalEmail : typedEmail.toLowerCase();

    if (name == _originalName && isEmailUnchanged) {
      CustomSnackBar.showAlert(context, message: 'لا توجد تغييرات لحفظها');
      return;
    }

    context.read<UpdateProfileCubit>().updateUserProfile(
      name: name,
      email: email,
    );
  }

  void _syncWithSavedUser(UpdateProfileSuccess state) {
    setState(() {
      _isEditingName = false;
      _isEditingEmail = false;
      _originalName = state.userEntity.name;
      _originalEmail = state.userEntity.email;
      _nameController.text = state.userEntity.name;
      _emailController.text = state.userEntity.email;
      _autovalidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          _syncWithSavedUser(state);
        }
      },
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FormSectionTitle(title: 'المعلومات الشخصية'),
            const SizedBox(height: 12),
            _buildNameField(),
            const SizedBox(height: 12),
            _buildEmailField(),
            const SizedBox(height: 24),
            CustomButton(title: 'حفظ التغييرات', onPressed: _saveChanges),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return CustomTextFormField(
      controller: _nameController,
      hintText: 'الاسم',
      textInputType: TextInputType.name,
      readOnly: !_isEditingName,
      enableInteractiveSelection: _isEditingName,
      suffixIcon: EditIconButton(
        isEditing: _isEditingName,
        onPressed: () => setState(() => _isEditingName = !_isEditingName),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
      controller: _emailController,
      hintText: 'البريد الإلكتروني',
      textInputType: TextInputType.emailAddress,
      readOnly: !_isEditingEmail,
      enableInteractiveSelection: _isEditingEmail,
      suffixIcon: EditIconButton(
        isEditing: _isEditingEmail,
        onPressed: () => setState(() => _isEditingEmail = !_isEditingEmail),
      ),
      validator: AppValidators.email,
    );
  }
}
