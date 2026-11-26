part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UserEntity userEntity;

  UpdateProfileSuccess({required this.userEntity});
}

class UpdateProfileFailure extends UpdateProfileState {
  final String errMessage;

  UpdateProfileFailure({required this.errMessage});
}
