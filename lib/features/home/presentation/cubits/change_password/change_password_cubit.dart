import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.authRepo}) : super(ChangePasswordInitial());

  final AuthRepo authRepo;

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result = await authRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold(
      (l) => emit(ChangePasswordFailure(errMessage: l.errMessage)),
      (r) => emit(ChangePasswordSuccess()),
    );
  }
}
