part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}
final class LoginSuccessState extends AuthState {
  final UserCredential? userCredential;

  LoginSuccessState({this.userCredential});
}
final class LoginErrorState extends AuthState {
  final String? error;

  LoginErrorState({ this.error,});
}


final class RegisterLoadingState extends AuthState {}
final class RegisterSuccessState extends AuthState {
  final UserCredential? userCredential;

  RegisterSuccessState({this.userCredential});
}
final class RegisterErrorState extends AuthState {
  final String? error;

  RegisterErrorState({ this.error,});
}
final class UploadUserDataSuccess extends AuthState {
  final String? userName;
  final String? userId;

  UploadUserDataSuccess({this.userId, this.userName});
}
final class UploadUserDataError extends AuthState {
  final String? error;

  UploadUserDataError({ this.error,});
}
