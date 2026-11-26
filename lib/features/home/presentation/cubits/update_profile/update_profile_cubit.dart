import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.authRepo}) : super(UpdateProfileInitial());

  final AuthRepo authRepo;

  Future<void> updateUserProfile({
    required String name,
    required String email,
  }) async {
    emit(UpdateProfileLoading());
    final result = await authRepo.updateUserProfile(name: name, email: email);
    result.fold(
      (l) => emit(UpdateProfileFailure(errMessage: l.errMessage)),
      (r) => emit(UpdateProfileSuccess(userEntity: r)),
    );
  }
}
