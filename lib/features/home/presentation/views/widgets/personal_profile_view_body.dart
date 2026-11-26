import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/change_password_section.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/personal_info_section.dart';

class PersonalProfileViewBody extends StatelessWidget {
  const PersonalProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PersonalInfoSection(),
            SizedBox(height: 18),
            ChangePasswordSection(),
          ],
        ),
      ),
    );
  }
}
