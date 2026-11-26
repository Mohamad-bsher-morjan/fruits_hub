import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/home/presentation/cubits/change_password/change_password_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubits/update_profile/update_profile_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/personal_profile_view_bloc_consumer.dart';

class PersonalProfileView extends StatelessWidget {
  const PersonalProfileView({super.key});

  static const routeName = 'personal_profile_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateProfileCubit(authRepo: getIt<AuthRepo>()),
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(authRepo: getIt<AuthRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(context, 'الملف الشخصي', showNotification: false),
        body: const PersonalProfileViewBlocConsumer(),
      ),
    );
  }
}
