import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({required this.authRepo}) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> loginUser(String email, String password) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPasswor(email, password);

    result.fold(
      (failure) => emit(SigninFailure(errMessage: failure.errMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(SigninFailure(errMessage: failure.errMessage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  // Future<void> loginWithFacebook() async {
  //   emit(SigninLoading());
  //   var result = await authRepo.signInWithFacebook();

  //   result.fold(
  //     (failure) => emit(SigninFailure(errMessage: failure.errMessage)),
  //     (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
  //   );
  // }
}
